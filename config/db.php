<?php

use craft\helpers\App;

return [
    'driver' => App::env('DB_DRIVER') ?: 'mysql',
    'server' => App::env('DB_SERVER'),
    'port' => App::env('DB_PORT'),
    'database' => App::env('DB_DATABASE'),
    'user' => App::env('DB_USER'),
    'password' => App::env('DB_PASSWORD'),
    'schema' => App::env('DB_SCHEMA'),
    'tablePrefix' => App::env('DB_TABLE_PREFIX'),
    'charset' => 'utf8mb4',
    'collation' => 'utf8mb4_unicode_ci',
];