#!/usr/bin/env bash
set -euo pipefail

cd /var/www/vhosts/left.codes/httpdocs

PHP="/opt/plesk/php/8.3/bin/php"
DB_DUMP="storage/backups/initial.sql"

echo "Installing Composer dependencies..."
composer install --no-dev --prefer-dist --no-interaction --no-progress --optimize-autoloader

echo "Preparing writable folders..."
mkdir -p storage runtime web/cpresources web/uploads

find . -type d -exec chmod 755 {} ';'
find . -type f -exec chmod 644 {} ';'

chmod -R 775 storage runtime web/cpresources web/uploads

echo "Loading .env..."
if [ ! -f ".env" ]; then
  echo ".env file missing. Cannot check database."
  exit 1
fi

set -a
source .env
set +a

DB_SERVER="${CRAFT_DB_SERVER:-127.0.0.1}"
DB_PORT="${CRAFT_DB_PORT:-3306}"
DB_DATABASE="${CRAFT_DB_DATABASE:-}"
DB_USER="${CRAFT_DB_USER:-}"
DB_PASSWORD="${CRAFT_DB_PASSWORD:-}"

if [ -z "$DB_DATABASE" ] || [ -z "$DB_USER" ]; then
  echo "Database variables missing. Check CRAFT_DB_DATABASE and CRAFT_DB_USER in .env."
  exit 1
fi

MYSQL_BIN="$(command -v mysql || command -v mariadb || true)"

if [ -z "$MYSQL_BIN" ]; then
  echo "Neither mysql nor mariadb CLI was found on the server."
  exit 1
fi

echo "Checking database: $DB_DATABASE"

TABLE_COUNT="$(
  MYSQL_PWD="$DB_PASSWORD" "$MYSQL_BIN" \
    -h "$DB_SERVER" \
    -P "$DB_PORT" \
    -u "$DB_USER" \
    "$DB_DATABASE" \
    -Nse "SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = DATABASE();"
)"

if [ "$TABLE_COUNT" -eq 0 ]; then
  echo "Database is empty."

  if [ -f "$DB_DUMP" ]; then
    echo "Importing initial database dump: $DB_DUMP"
    "$PHP" craft db/restore "$DB_DUMP" --drop-all-tables --interactive=0
  else
    echo "No database dump found at $DB_DUMP. Skipping import."
  fi
else
  echo "Database already has $TABLE_COUNT tables. Skipping database import."
fi

echo "Running Craft migrations and project config..."
"$PHP" craft up --interactive=0 --no-backup

echo "Clearing Craft caches..."
"$PHP" craft clear-caches/all

echo "Deploy finished."