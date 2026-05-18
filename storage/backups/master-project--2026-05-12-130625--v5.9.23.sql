-- MySQL dump 10.13  Distrib 8.0.40, for Linux (x86_64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` int NOT NULL,
  `primaryOwnerId` int DEFAULT NULL,
  `fieldId` int DEFAULT NULL,
  `countryCode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `administrativeArea` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locality` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dependentLocality` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postalCode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sortingCode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addressLine1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addressLine2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addressLine3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `organization` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `organizationTaxId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fullName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ffuoeazyulvuixjicttwnwbiowqrxdlakhur` (`primaryOwnerId`),
  CONSTRAINT `fk_ffuoeazyulvuixjicttwnwbiowqrxdlakhur` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kaukhlbakijyfcgedpzmjzuawxkudkfoatlt` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `pluginId` int DEFAULT NULL,
  `heading` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ezzsosgbrwthnopvbuewdmqwdbizauwvdknz` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `idx_iecoqzynmbgoouajzjedlwhhruquarawsnyt` (`dateRead`),
  KEY `fk_pervowezioybfpvkuhwmxjbkemjfpgwhjdzu` (`pluginId`),
  CONSTRAINT `fk_pervowezioybfpvkuhwmxjbkemjfpgwhjdzu` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zwiphhfjbzsyoproqwqganvcuhitttdowghw` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assetindexdata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sessionId` int NOT NULL,
  `volumeId` int NOT NULL,
  `uri` text COLLATE utf8mb4_unicode_ci,
  `size` bigint unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `isDir` tinyint(1) DEFAULT '0',
  `recordId` int DEFAULT NULL,
  `isSkipped` tinyint(1) DEFAULT '0',
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_eltyubihqhxnxbmhcxfjwwbwwkoiswupdyzm` (`sessionId`,`volumeId`),
  KEY `idx_ojlbzbbergtxjglnyhpqdlzgbbwsyaeokegr` (`volumeId`),
  CONSTRAINT `fk_ignatwzpusnsbhfvtxqlzhbqucjzteipijgg` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_srigpvlwgvkkpjvbndwdakhwbwcpgpvjldok` FOREIGN KEY (`sessionId`) REFERENCES `assetindexingsessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexingsessions`
--

DROP TABLE IF EXISTS `assetindexingsessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assetindexingsessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `indexedVolumes` text COLLATE utf8mb4_unicode_ci,
  `totalEntries` int DEFAULT NULL,
  `processedEntries` int NOT NULL DEFAULT '0',
  `cacheRemoteImages` tinyint(1) DEFAULT NULL,
  `listEmptyFolders` tinyint(1) DEFAULT '0',
  `isCli` tinyint(1) DEFAULT '0',
  `actionRequired` tinyint(1) DEFAULT '0',
  `processIfRootEmpty` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets` (
  `id` int NOT NULL,
  `volumeId` int DEFAULT NULL,
  `folderId` int NOT NULL,
  `uploaderId` int DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mimeType` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kind` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unknown',
  `alt` text COLLATE utf8mb4_unicode_ci,
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `size` bigint unsigned DEFAULT NULL,
  `focalPoint` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_xcdianvmoruiexvixiwlwhdvrwmnaomllbfb` (`filename`,`folderId`),
  KEY `idx_xdoqyoxnflkxrswidcchuvxsnocdbqvegrxn` (`folderId`),
  KEY `idx_laqbdifktoifxhqlcbmszhxsqhwhhrdgxmaj` (`volumeId`),
  KEY `fk_jnxngfdltphzyvcnzgmmfqhaedbtdrrffpfh` (`uploaderId`),
  CONSTRAINT `fk_ecxpbrcdsxravhrdhgwpanztimmzbudpmkly` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_jnxngfdltphzyvcnzgmmfqhaedbtdrrffpfh` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_kmipnjaneuzvbhtqcsezfxnqkhhxzrquaulh` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_odypuivatnlfsooojyzdiufwhinfkzezjxzo` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets_sites`
--

DROP TABLE IF EXISTS `assets_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets_sites` (
  `assetId` int NOT NULL,
  `siteId` int NOT NULL,
  `alt` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`assetId`,`siteId`),
  KEY `fk_amzjminpujxvxnuebjcnxutpucpfpsyufaji` (`siteId`),
  CONSTRAINT `fk_amzjminpujxvxnuebjcnxutpucpfpsyufaji` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ngdpjadyokihtktngjuosflxxkdtygryhhym` FOREIGN KEY (`assetId`) REFERENCES `assets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `authenticator`
--

DROP TABLE IF EXISTS `authenticator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authenticator` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `auth2faSecret` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oldTimestamp` int unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_kvmlcjgzfyzsymcjxetzbygovkdtlcfknqqp` (`userId`),
  CONSTRAINT `fk_kvmlcjgzfyzsymcjxetzbygovkdtlcfknqqp` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bulkopevents`
--

DROP TABLE IF EXISTS `bulkopevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bulkopevents` (
  `key` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `senderClass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `eventName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`key`,`senderClass`,`eventName`),
  KEY `idx_hpttnfcjiahpdgsoinwfyvfujnmttkthqgtl` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_nxqublwgzbymyhksmdmwllnercaosrdcodcx` (`groupId`),
  KEY `fk_lprvdcosnddxikjdsangnuqveitpceiqftgd` (`parentId`),
  CONSTRAINT `fk_lprvdcosnddxikjdsangnuqveitpceiqftgd` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_mybzntttcxdsmxccbfvptlktcsusvrqkcbkm` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_oyphpirujuwdlwuiiphnnczfrvuprnyigvng` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorygroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `defaultPlacement` enum('beginning','end') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_nijcpyftvwidfhjwpfsduurpixuxqlqugdqn` (`name`),
  KEY `idx_qxlseujfbrqedcpkeozsmmepndoejgrgevvx` (`handle`),
  KEY `idx_seudclvqsegvlogracpaqkqgmpirnizjyqmq` (`structureId`),
  KEY `idx_eyksdlvimvwgijogxwbyrdagvstcvvvnkbui` (`fieldLayoutId`),
  KEY `idx_rvjsemghicybbsqqsresfrtcjyosqhusqkjp` (`dateDeleted`),
  CONSTRAINT `fk_saqjdqdxolhvmhmtobaleaybxzofxuodeeuq` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zkuzqcbcauckgyandlwfcacadymcdrpzkqmo` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorygroups_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text COLLATE utf8mb4_unicode_ci,
  `template` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vlyxsogcesypaxstvljsjdjllsyorsblhvnq` (`groupId`,`siteId`),
  KEY `idx_kczjbeyymnrypychcevrzxxcmynrixqnuidz` (`siteId`),
  CONSTRAINT `fk_czonhwoufcfslmzhlawikgnpwapvnvqtqouj` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_gvpjhekswoeeehtayipuetgtaegmhignprvp` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `changedattributes` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `attribute` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_elkffbkxtdhkoxdpemxdwkiatzqiylxogxaf` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_jbpummwupukzivtxpstydksmtjfccoprejig` (`siteId`),
  KEY `fk_yvirvjrkuczbgvjommirolbwuehqhwesfife` (`userId`),
  CONSTRAINT `fk_jbpummwupukzivtxpstydksmtjfccoprejig` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_nyllaaoyltrnlxlcvvsgjwninmwivqctunxr` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_yvirvjrkuczbgvjommirolbwuehqhwesfife` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `changedfields` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `fieldId` int NOT NULL,
  `layoutElementUid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`,`layoutElementUid`),
  KEY `idx_ftpdlidywxbccdccmmfqvpvxpglwbymuskvi` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_nsubzirayoczhbonxlvglpcyesdlbulazaip` (`siteId`),
  KEY `fk_ijcdwplejthrxtddormscsjndggjofouhjuc` (`fieldId`),
  KEY `fk_anekvoqltxznpkrdkphzpvrknrypsojyhcua` (`userId`),
  CONSTRAINT `fk_anekvoqltxznpkrdkphzpvrknrypsojyhcua` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_ijcdwplejthrxtddormscsjndggjofouhjuc` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_nsubzirayoczhbonxlvglpcyesdlbulazaip` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_omhwtxkjriseykghtkekwiztuanebjduyffq` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contentblocks`
--

DROP TABLE IF EXISTS `contentblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contentblocks` (
  `id` int NOT NULL,
  `primaryOwnerId` int DEFAULT NULL,
  `fieldId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_eqmeommunylvtmygpktwhoxljmpnuodwatjt` (`primaryOwnerId`),
  KEY `idx_vkrzizuviwqxelliskjwsoqrhezqrwrhdeyc` (`fieldId`),
  CONSTRAINT `fk_jfipamkrywcuvkvfjgalfpybtkglalfcspoz` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_snqfjitcjpwhenecppccikmwxfexpalpcwzp` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sqktzyvfmmruhhvplkxntbjqiinpezyxzvly` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `craftidtokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `accessToken` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_jajsptqblvojutboginmkooolfzspukompoa` (`userId`),
  CONSTRAINT `fk_jajsptqblvojutboginmkooolfzspukompoa` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deprecationerrors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fingerprint` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `line` smallint unsigned DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `traces` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_iizsnvuqyhzfdyxkcqsspxithikfowggygot` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drafts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `creatorId` int DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_nvhqypxhyxgmwsfoweknfwdvajazxeazwsbn` (`creatorId`,`provisional`),
  KEY `idx_hrxggxphqcadxsvvcemdslgazoumycjkaqpy` (`saved`),
  KEY `fk_tzqpxollmwqwoquwhfofbjtieahkabozdxwz` (`canonicalId`),
  CONSTRAINT `fk_tzqpxollmwqwoquwhfofbjtieahkabozdxwz` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yrbmpypbtccxbvrfbayzfnmqeetzrlhpjciy` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elementactivity`
--

DROP TABLE IF EXISTS `elementactivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elementactivity` (
  `elementId` int NOT NULL,
  `userId` int NOT NULL,
  `siteId` int NOT NULL,
  `draftId` int DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`elementId`,`userId`,`type`),
  KEY `idx_bszfgvkibotfwtmuqlispzsgybjvigxaxmhv` (`elementId`,`timestamp`,`userId`),
  KEY `fk_ncykjaljqgbeskeeoknsgnsndyxtjpuaizad` (`userId`),
  KEY `fk_xyvtfanrqzmfglgtcknpnhxgiyvzvzcsnshm` (`siteId`),
  KEY `fk_ipqkeygtxtmhuarlhgfyqmaaakxrptjjjqyx` (`draftId`),
  CONSTRAINT `fk_ipqkeygtxtmhuarlhgfyqmaaakxrptjjjqyx` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_jtipxyyzfdxwbcnimxlvbctjtnwvfgzyzgsn` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ncykjaljqgbeskeeoknsgnsndyxtjpuaizad` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xyvtfanrqzmfglgtcknpnhxgiyvzvzcsnshm` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `draftId` int DEFAULT NULL,
  `revisionId` int DEFAULT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_iizguzjcdyeqldrnwwxbjclbueghivxrnbgd` (`dateDeleted`),
  KEY `idx_qgncvsxiuyzvorcgstzjicoxgvsxzcxtwtku` (`fieldLayoutId`),
  KEY `idx_ayalvbircuoebfsplkrcmqwxtsyzzqoxnmzb` (`type`),
  KEY `idx_sjnkdpvwfkiklefgybkvpikuqsiuczyhpjzo` (`enabled`),
  KEY `idx_pxfyojjejimhhmgrpzgexmpfmuxhfoksraqf` (`canonicalId`),
  KEY `idx_izrdgiaspvfsfzscjleqnxsvodhpzzhydyrf` (`archived`,`dateCreated`),
  KEY `idx_ehbbpgeplpshgbidjcnvukzfkofavkcxahas` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `idx_cugtywjedboojdlzbhofawpfodjnlpqvulcy` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `fk_wafzryqulaxvonlzxgqiyhbnpqzkpnntyyar` (`draftId`),
  KEY `fk_lysktwkxczhcgumvpaumtoselibfuoevfdqy` (`revisionId`),
  CONSTRAINT `fk_hxmmcbczjeozovhghgynfsvdrwsektijetzd` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_lysktwkxczhcgumvpaumtoselibfuoevfdqy` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wafzryqulaxvonlzxgqiyhbnpqzkpnntyyar` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wcepdbhxsxtgsdxdnhlobjavfuhpjtyvzfnp` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_bulkops`
--

DROP TABLE IF EXISTS `elements_bulkops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements_bulkops` (
  `elementId` int NOT NULL,
  `key` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`elementId`,`key`),
  KEY `idx_btdecuzkepngafcqlnsdctpfitmkzjbaazqw` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_owners`
--

DROP TABLE IF EXISTS `elements_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements_owners` (
  `elementId` int NOT NULL,
  `ownerId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`elementId`,`ownerId`),
  KEY `fk_ptagjfbrobhniesziatamrnsaphkmlrbelsf` (`ownerId`),
  KEY `idx_cmyttyoihvkggfwhjmrrjgnrqnklnczhsdsv` (`sortOrder`),
  CONSTRAINT `fk_ptagjfbrobhniesziatamrnsaphkmlrbelsf` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rkgkkbcrnvlyduwkfmpsoqgukpcnyreryubv` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` json DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_fuebxfkpayngehgfzaffwuwgrkjcdjmljopg` (`elementId`,`siteId`),
  KEY `idx_pjojnjlcmiomxprptzetzcniofehbkfqqktc` (`siteId`),
  KEY `idx_flzkuyapadrltwsuwdptunzugoimozxbzdiv` (`title`,`siteId`),
  KEY `idx_weocdyjsyhfoauxemfowufcfmqmevlbaiabq` (`slug`,`siteId`),
  KEY `idx_jaqwssmuqswyftydtrxqggvcotgtvdkqfvnh` (`enabled`),
  KEY `idx_ubfhqhsbnbnhbvmxdixidsvejcicjuhxblyu` (`uri`,`siteId`),
  CONSTRAINT `fk_chnfsxfuhwritcruzezafjvdelxbsybepkqf` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uxbxcdpxdcqnqcnhjuvfpocfzproyibijegf` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entries` (
  `id` int NOT NULL,
  `sectionId` int DEFAULT NULL,
  `parentId` int DEFAULT NULL,
  `primaryOwnerId` int DEFAULT NULL,
  `fieldId` int DEFAULT NULL,
  `typeId` int NOT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `status` enum('live','pending','expired') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'live',
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `deletedWithSection` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ponduqsyswynetbwtmhdoicvwiyhhmnucxnl` (`postDate`),
  KEY `idx_jcmqrjayznbecqffkrqpxqvqkqdmyhqmkntr` (`expiryDate`),
  KEY `idx_uburpyazaewxokywcyfkewipewgpfjantcln` (`sectionId`),
  KEY `idx_oxydhdtuxrdfwyllkebfzanbmjiyfyvzsagf` (`typeId`),
  KEY `idx_qxmcckanuxzhqxcoyqbjuucqgpaumoxhydje` (`primaryOwnerId`),
  KEY `idx_abvkerghpuoihnopndfgrgbbhbddcnfavuhm` (`fieldId`),
  KEY `fk_qplomafkfvoflbhucrnboicfjhsnwhdccogy` (`parentId`),
  KEY `idx_npsgaplhwkihouxdifsmxgfhqvbghtreqaai` (`status`),
  CONSTRAINT `fk_bbiqvpzjaapdqussrudzazkwxnhhjorgvdyt` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_gsyoqyfcetjuvzgrnitlwxzhrtcqtanhacca` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nrzvcgdazjpaabfeethorqemhjozhmvkvzpa` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_oyyufhkbwkyacsbqeedrbdstwqwagafmyhij` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pijbcrjxapqempzjkjjomvfquoqmnjhmmtky` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qplomafkfvoflbhucrnboicfjhsnwhdccogy` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entries_authors`
--

DROP TABLE IF EXISTS `entries_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entries_authors` (
  `entryId` int NOT NULL,
  `authorId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`entryId`,`authorId`),
  KEY `idx_nwqglcsifwquxkbmmdjfugyxyvhtvarmgysn` (`authorId`),
  KEY `idx_qmdfqmodbjkrmlmzfybqwwiksqpkmrbzccjh` (`entryId`,`sortOrder`),
  CONSTRAINT `fk_mqloeyjudfzxuvonnfludoohkmrouflssjob` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wsbmszggcefirtdxnnnjcjobvwkllfanwwbx` FOREIGN KEY (`entryId`) REFERENCES `entries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrytypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uiLabelFormat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '{title}',
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8mb4_unicode_ci,
  `titleFormat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `showSlugField` tinyint(1) DEFAULT '1',
  `slugTranslationMethod` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'site',
  `slugTranslationKeyFormat` text COLLATE utf8mb4_unicode_ci,
  `showStatusField` tinyint(1) DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `allowLineBreaksInTitles` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ravmxatnzrtninrebgwjigpkqwaojrwuciee` (`fieldLayoutId`),
  KEY `idx_cmcbkekakoynprnnobagxafnmgnnmyirnugz` (`dateDeleted`),
  CONSTRAINT `fk_axjagniywaqzmjpbudpgokqrtccknhgcqzlj` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fieldlayouts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `config` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_bmbqfzwblifnmuwjjadnhpllujhdfdozkgjs` (`dateDeleted`),
  KEY `idx_ooilizaegatyndcspwusvezahqwotnvmxlwl` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `handle` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `context` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instructions` text COLLATE utf8mb4_unicode_ci,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `translationKeyFormat` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gkqeomkkhrymynblemeuuesshzniplxbtqkg` (`handle`,`context`),
  KEY `idx_xmbfmhdlingwxkdtnkkpvotihmqhrknfdwxl` (`context`),
  KEY `idx_sartodftskqompxnmjazhegakwjdvojoszjj` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `globalsets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_vihzwxcuvfpwxclhzlhiuaenolsenuplbidm` (`name`),
  KEY `idx_tlmtdsinzgggnylynwiybwxsedugblncvjtv` (`handle`),
  KEY `idx_ticeawcoaiwinrxvbxntngjqhhsszvbqxuzh` (`fieldLayoutId`),
  KEY `idx_ommlxohbhydazjgucwriwaxaurwladqyitkj` (`sortOrder`),
  CONSTRAINT `fk_oxovoswtfygyqttxaveignhlbvfmggtwlrmf` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_wlavmilybuwbafxumddmhrhnuxrogqzwpxjb` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gqlschemas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scope` json DEFAULT NULL,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gqltokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `accessToken` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qldscbjrxitcwejajfrfjvpqhsviamznoifh` (`accessToken`),
  UNIQUE KEY `idx_lrgglyfdnwpvvuqliinzshhigxpgckunyclg` (`name`),
  KEY `fk_exdbsvoatcfhqunybicdguszoeanlfdkgwbi` (`schemaId`),
  CONSTRAINT `fk_exdbsvoatcfhqunybicdguszoeanlfdkgwbi` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransformindex`
--

DROP TABLE IF EXISTS `imagetransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagetransformindex` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assetId` int NOT NULL,
  `transformer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `format` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transformString` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ymscuzdvqpcinitlqejqsyztivqegzywmgfz` (`assetId`,`transformString`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransforms`
--

DROP TABLE IF EXISTS `imagetransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagetransforms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mode` enum('stretch','fit','crop','letterbox') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'center-center',
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `format` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quality` int DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `fill` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upscale` tinyint(1) NOT NULL DEFAULT '1',
  `parameterChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_zsepjppvskntdenttfnjacsvieljlyefumfj` (`name`),
  KEY `idx_nistottsmismerryqpqczpeagafotqxqubrg` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `version` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `schemaVersion` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `track` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_rvbmowzrnslxsqsakjdnjogzfhbrzfeymgmv` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plugins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `schemaVersion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vvecnsfktxhatgphtyujvlxciypjcyaohzeu` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `queue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `timePushed` int NOT NULL,
  `ttr` int NOT NULL,
  `delay` int NOT NULL DEFAULT '0',
  `priority` int unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int DEFAULT NULL,
  `progress` smallint NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attempt` int DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_ckqhwucsvhgmmuflgbucwaauclrijgebukar` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_hmrqbwulhujpcpmwvmadvxygprhbbtxdevjc` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recoverycodes`
--

DROP TABLE IF EXISTS `recoverycodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recoverycodes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `recoveryCodes` text COLLATE utf8mb4_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `sourceId` int NOT NULL,
  `sourceSiteId` int DEFAULT NULL,
  `targetId` int NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_grlzasfskdnljpkanjmdgdeaaxwcargfwbvv` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_lcmddailgjiyrjugmrybuptkwfdugwcgnxpg` (`sourceId`),
  KEY `idx_gnrfijlkpvzsggupunxngjqptiptwgimqscp` (`targetId`),
  KEY `idx_ievbbpibzipzkilscrrsecrzjthypeisxfda` (`sourceSiteId`),
  CONSTRAINT `fk_gwnzykzpqzajaxhimykokuthowdunoqzwkbs` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_nylqhmgvhbyvokznbkjtdjdguggjvfsvpfsx` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pubgpbmedzxydlhpnsrdehtnopzynfosuuvc` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revisions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int NOT NULL,
  `creatorId` int DEFAULT NULL,
  `num` int NOT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_iqwiipldlkoldpovzjzqtsvpulvoywdryeeq` (`canonicalId`,`num`),
  KEY `fk_uegtfhyvnktcuddizsepxidqadgkhoeonnrb` (`creatorId`),
  CONSTRAINT `fk_npexwpbegprennzcxavqhvbrzvqnmnizcyzi` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uegtfhyvnktcuddizsepxidqadgkhoeonnrb` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `searchindex` (
  `elementId` int NOT NULL,
  `attribute` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fieldId` int NOT NULL,
  `siteId` int NOT NULL,
  `keywords` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_sjqullcjlqggzrnggwfuvwdtqqwbejwvvgxq` (`keywords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchindexqueue`
--

DROP TABLE IF EXISTS `searchindexqueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `searchindexqueue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `reserved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rtbaanerwztemjnrpzgyqbhwsyjfolfaxgdw` (`elementId`,`siteId`,`reserved`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchindexqueue_fields`
--

DROP TABLE IF EXISTS `searchindexqueue_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `searchindexqueue_fields` (
  `jobId` int NOT NULL,
  `fieldHandle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`jobId`,`fieldHandle`),
  UNIQUE KEY `idx_dldglyxfopjzavbspuyjwqboabwvmbihyzkh` (`jobId`,`fieldHandle`),
  CONSTRAINT `fk_hxxvuapkaxllcadgmiqdveltclviadtmymxc` FOREIGN KEY (`jobId`) REFERENCES `searchindexqueue` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('single','channel','structure') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `maxAuthors` smallint unsigned DEFAULT NULL,
  `propagationMethod` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'end',
  `previewTargets` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_bswnwsvxdfwuxecaktyyckqucssjtgdjszkc` (`handle`),
  KEY `idx_hplutnqdopnqbauyrxrpdcifpwgthuqsjdra` (`name`),
  KEY `idx_tlwrdkdsyxidrktisrjhzgrrbtiumsdiaaba` (`structureId`),
  KEY `idx_ocdpilrcubgayklihrynpcxeedydkznvnlmy` (`dateDeleted`),
  CONSTRAINT `fk_oghshqmeiognmkbgrpbtphshgwbqqarfrcdg` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections_entrytypes`
--

DROP TABLE IF EXISTS `sections_entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections_entrytypes` (
  `sectionId` int NOT NULL,
  `typeId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`sectionId`,`typeId`),
  KEY `fk_ziqrlbypwmiadmtcmypygoggtuiklavnqfoy` (`typeId`),
  CONSTRAINT `fk_bbimlrkuahohyexsusxwmbuyzulljfxrqdfk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ziqrlbypwmiadmtcmypygoggtuiklavnqfoy` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sectionId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text COLLATE utf8mb4_unicode_ci,
  `template` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_prtnwojdlcungarbyjfgctjhzchswjosczlc` (`sectionId`,`siteId`),
  KEY `idx_uxamxesywpaeqtxuveupdmnqhenusxrhwqfj` (`siteId`),
  CONSTRAINT `fk_dtssoderxrkkpusivwonsqyzusewynhwejxx` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_leidewffvkpolsysvffdnpksuqjiorkpncgw` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequences` (
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `next` int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `token` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ozyyxveydcqmgxrlzuckokfwodzqtcmuktgb` (`uid`),
  KEY `idx_elosvdzuefkdvokugafbesurxjoamgcqjotp` (`token`),
  KEY `idx_tmtjnxzjjwzovvofzmtydungieieqymutkzz` (`dateUpdated`),
  KEY `idx_ljltdhjhrrrsazkftaxunhdpxyhcxsecequa` (`userId`),
  CONSTRAINT `fk_ruvyhecgabyderpadjknuvejctyzslpxwhhy` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shunnedmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_rzrfrcvhqgiubagadbrpdtktrqvxqmjjtqvw` (`userId`,`message`),
  CONSTRAINT `fk_xmnpapiatbxnlesvhrnlpkgjhapaiiqwvquc` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sitegroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_kvymytyymnylrztoxotokbtjqdauqjiwwcap` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'true',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_vjrjarcsrbbdwdmzgumbsmrndelaxmqytwrm` (`dateDeleted`),
  KEY `idx_muzaaktmqurvxkxxdnthsezonivuougjcrrl` (`handle`),
  KEY `idx_zukwfwawnnzvetnxxzmaaqkosmizpjuvooek` (`sortOrder`),
  KEY `fk_avvzqjvyxelomaxgexzhwsmckafjuqwlqwhi` (`groupId`),
  CONSTRAINT `fk_avvzqjvyxelomaxgexzhwsmckafjuqwlqwhi` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sso_identities`
--

DROP TABLE IF EXISTS `sso_identities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sso_identities` (
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identityId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`provider`,`identityId`,`userId`),
  KEY `fk_ygwdupliqmrrmpeluzhwapljlzkysvyjagmo` (`userId`),
  CONSTRAINT `fk_ygwdupliqmrrmpeluzhwapljlzkysvyjagmo` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `structureelements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `elementId` int DEFAULT NULL,
  `root` int unsigned DEFAULT NULL,
  `lft` int unsigned NOT NULL,
  `rgt` int unsigned NOT NULL,
  `level` smallint unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dbqlmaqdhrypjyuruboezeptapdhjqxvhjii` (`structureId`,`elementId`),
  KEY `idx_zlnxvhqroxjgylbtzqinkpuubilefekcrkuo` (`root`),
  KEY `idx_hbxbtpigynfdgfatqnbborxdafevagvzbngl` (`lft`),
  KEY `idx_nysqiidxekftuttbibhcuxyxxqcwwubsxspd` (`rgt`),
  KEY `idx_uemzktgnlrqulhbapwjfoytzlaufmkayqvgm` (`level`),
  KEY `idx_upxgtijhccxwrvgquykdcvktqndehxgrelez` (`elementId`),
  CONSTRAINT `fk_yggscfovamtwypqwrxcecxlujtsntybmfnmq` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `structures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_pelpawgraetzhhpewjxvamqhamvkbqfchsgb` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `systemmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `language` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vjrnxzfydblpglfqllynrvfcofkggjetappe` (`key`,`language`),
  KEY `idx_mwyrsbyevgywowgkiruidgsxrfzgpvdpfaen` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taggroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_spdgsldfxfvjdbmwexjargzqeocmmbjkdeba` (`name`),
  KEY `idx_ezssveldwcyhjbddjxzyoeiqckhgaecfngdf` (`handle`),
  KEY `idx_akcmfhzriwpoggcdoenpbfvwnjdxeshjryqa` (`dateDeleted`),
  KEY `fk_gbtwyamhaykihmgguvcoyhmxlurneefvzhsc` (`fieldLayoutId`),
  CONSTRAINT `fk_gbtwyamhaykihmgguvcoyhmxlurneefvzhsc` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_zhslocucvbibokirxbnhsplbntpnzybgaeuv` (`groupId`),
  CONSTRAINT `fk_trrgrylbgolpsjqoldsvzbfiopqjqbggzuuj` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yctpxsulvbyhnxunoeqrraexkqvxqkhyffyz` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `route` text COLLATE utf8mb4_unicode_ci,
  `usageLimit` tinyint unsigned DEFAULT NULL,
  `usageCount` tinyint unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_zodhujhhzmceyrhwjlsjnljwlgknzoahxrdp` (`token`),
  KEY `idx_bajvfimucuoagsoyaxqotvtdsglfcoagjtoy` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ilrckogctijqahqtjviunymnmuexzoaiqicq` (`handle`),
  KEY `idx_exiplpzkjdhsxovylmnbevqkzibsicqdoksl` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usergroups_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_gaoflzepdsuhducyosfuxuptcbyphuynclwu` (`groupId`,`userId`),
  KEY `idx_jktobyeogcpmzaflmcpldahlvbmiyxzpwxob` (`userId`),
  CONSTRAINT `fk_ddxdyhsxaajpuiphymshpjbvbaihbqtzaqrb` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_psprikkbqddnsrqzewtkykfesesizroqfhho` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ojubrizzitjlnstyanpayiuikqvghoaavzmq` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions_usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `groupId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_wsonelbqkezddhbtqhwlfphvvgpowkhfdskr` (`permissionId`,`groupId`),
  KEY `idx_cqkqerxdzrtzdpanxkojqljjyckenxphuhux` (`groupId`),
  CONSTRAINT `fk_hcnnropkuwzwfdilfvicaborgtlytfcfsvgr` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kureqttdclzeozmgozpojbadutmzfhkdizfw` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_bdiqmluqejnlusbdducyuqjgzakksnlhkomx` (`permissionId`,`userId`),
  KEY `idx_vkqsieuaropgitmjsqyeviejgonpujiauhup` (`userId`),
  CONSTRAINT `fk_mkmbrkfmixatljuxkyejhllmfppflmjasrkc` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_snvfqwmgwoqcxptjhasujlbaemhfpaxehncj` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpreferences` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `preferences` json DEFAULT NULL,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_rtmoyxkkmnkesincjwladdcmxqccrpepethb` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL,
  `photoId` int DEFAULT NULL,
  `affiliatedSiteId` int DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fullName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_stptpmxrqqadevlrecahhrfrkhmwmtltfgxv` (`active`),
  KEY `idx_gibwhasmdxlrcemkipufazwcfghdeguoswhc` (`locked`),
  KEY `idx_cqpfzegkgoqrqdehmwlytqktjwlulqdtjsvm` (`pending`),
  KEY `idx_nrwntnvhzholdlttyupserxxmpnfomqvkhbn` (`suspended`),
  KEY `idx_iocsocmrfoozjjegmialaewmhgqfrnmqmiwl` (`verificationCode`),
  KEY `idx_cpnsemsioeycbbursagrblvlnseajlhlmazw` (`email`),
  KEY `idx_bsmxpqlcaoclbnrcgixbljrfjokvtvpnxfwk` (`username`),
  KEY `fk_pdcruepmpamlnjmautwxvyarszthvayabcqz` (`photoId`),
  KEY `fk_cdgncurqixhbrbwknsjzoxhhvrmgudowpovz` (`affiliatedSiteId`),
  CONSTRAINT `fk_cdgncurqixhbrbwknsjzoxhhvrmgudowpovz` FOREIGN KEY (`affiliatedSiteId`) REFERENCES `sites` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_miljdtzauzdczgbxqrlbzulxlhbwdkcaharo` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pdcruepmpamlnjmautwxvyarszthvayabcqz` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volumefolders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentId` int DEFAULT NULL,
  `volumeId` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_meyarawcmjuivpxblhamrtqumroccquhbsyd` (`name`,`parentId`,`volumeId`),
  KEY `idx_wbozsqqssygmwdpzjfofumrnsccdeamewxti` (`parentId`),
  KEY `idx_gbnswxbsgdageaicxfvamilnmuwcshqvrphx` (`volumeId`),
  CONSTRAINT `fk_jonpsgisfkrntgtuqoeihwcwiubaxcxvbzkb` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yxhlzecivtglxjzvjezdmyymnibezwhhjcur` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volumes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fs` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subpath` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transformFs` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transformSubpath` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `titleTranslationMethod` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8mb4_unicode_ci,
  `altTranslationMethod` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'site',
  `altTranslationKeyFormat` text COLLATE utf8mb4_unicode_ci,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_srpxvqaozzdctodhleuqtmlodmmkkirpiztf` (`name`),
  KEY `idx_muoqrkkoavbeigftftcvmputeujblponfgte` (`handle`),
  KEY `idx_msegrdymhoqcntpenpwpigvhmbemrdhwgctl` (`fieldLayoutId`),
  KEY `idx_zlxumcijotwusylwweczhjbtfrnmlgqcvcwz` (`dateDeleted`),
  CONSTRAINT `fk_yhialbeibbjwkfqlmbveofhjxgxzmisqurwc` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `webauthn`
--

DROP TABLE IF EXISTS `webauthn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webauthn` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `credentialId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credential` text COLLATE utf8mb4_unicode_ci,
  `credentialName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dateLastUsed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_vqmhklmcveodqmivsxyzsqhudfevdqjrlgtg` (`userId`),
  CONSTRAINT `fk_vqmhklmcveodqmivsxyzsqhudfevdqjrlgtg` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widgets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `colspan` tinyint DEFAULT NULL,
  `settings` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_dctppdqliustmrikaidxbhnsxzgdfoaffgta` (`userId`),
  CONSTRAINT `fk_wevtrhntyxuxhstnpsxmkiajzfluncdumnkn` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-12 15:06:25
-- MySQL dump 10.13  Distrib 8.0.40, for Linux (x86_64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assetindexingsessions`
--

LOCK TABLES `assetindexingsessions` WRITE;
/*!40000 ALTER TABLE `assetindexingsessions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assetindexingsessions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `assets` VALUES (21,1,1,1,'Screenshot-2024-11-04-at-17.55.44.png',NULL,'image',NULL,2810,1724,88985,NULL,0,0,'2024-11-21 11:39:19','2024-11-21 11:39:19','2024-11-21 11:39:19'),(46,1,1,1,'52513fbc48c692f008ba2c82ec87bce4c03b17c5.jpg','image/jpeg','image',NULL,4096,2731,11295353,NULL,NULL,NULL,'2025-09-02 10:55:46','2025-09-02 10:55:46','2025-09-02 10:55:46');
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assets_sites`
--

LOCK TABLES `assets_sites` WRITE;
/*!40000 ALTER TABLE `assets_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `assets_sites` VALUES (21,1,NULL),(46,1,NULL);
/*!40000 ALTER TABLE `assets_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `authenticator`
--

LOCK TABLES `authenticator` WRITE;
/*!40000 ALTER TABLE `authenticator` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `authenticator` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `bulkopevents`
--

LOCK TABLES `bulkopevents` WRITE;
/*!40000 ALTER TABLE `bulkopevents` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `bulkopevents` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `categories` VALUES (57,1,NULL,NULL,'2026-05-12 09:11:47','2026-05-12 09:11:47'),(58,1,NULL,NULL,'2026-05-12 09:11:53','2026-05-12 09:11:53');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `categorygroups` VALUES (1,1,16,'Example Category','exampleCategory','end','2026-05-12 09:11:38','2026-05-12 09:11:38',NULL,'ed370231-a5e5-4af1-bd6a-98735fcda9fb');
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `categorygroups_sites` VALUES (1,1,1,1,'example-category/{slug}','example-category/_category.twig','2026-05-12 09:11:38','2026-05-12 09:11:38','5dda174e-34e9-446a-933c-45c3bc037a07');
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedattributes` VALUES (1,1,'lastPasswordChangeDate','2025-09-02 08:19:43',0,NULL),(1,1,'password','2025-09-02 08:19:43',0,NULL),(2,1,'title','2024-11-25 09:17:20',0,1),(20,1,'postDate','2024-11-21 11:39:30',0,1),(20,1,'slug','2024-11-21 11:39:04',0,1),(20,1,'title','2024-11-21 11:39:04',0,1),(20,1,'uri','2024-11-21 11:39:04',0,1),(55,1,'postDate','2026-05-12 09:08:16',0,1),(55,1,'slug','2026-05-12 09:08:08',0,1),(55,1,'title','2026-05-12 09:08:08',0,1),(55,1,'uri','2026-05-12 09:08:08',0,1),(57,1,'slug','2026-05-12 09:11:51',0,1),(57,1,'title','2026-05-12 09:11:51',0,1),(57,1,'uri','2026-05-12 09:11:51',0,1),(58,1,'slug','2026-05-12 09:11:57',0,1),(58,1,'title','2026-05-12 09:11:57',0,1),(58,1,'uri','2026-05-12 09:11:57',0,1),(61,1,'postDate','2026-05-12 09:13:06',0,1),(61,1,'slug','2026-05-12 09:12:54',0,1),(61,1,'title','2026-05-12 09:12:54',0,1),(61,1,'uri','2026-05-12 09:12:54',0,1);
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedfields` VALUES (2,1,10,'aea2e3a1-f259-4a56-89d0-0bbc20358da2','2025-09-02 10:56:04',0,1),(6,1,25,'07be3ad1-46e1-4a12-96fd-d4b0f171daf8','2025-09-30 10:24:53',0,1),(20,1,10,'12496b7a-492c-49d2-920f-70ed92cae716','2024-11-21 11:39:30',0,1),(20,1,18,'caf879af-32f8-4f98-bd3a-8f41982b1435','2024-11-21 11:39:30',0,1),(37,1,25,'f028c411-13cc-469e-b3c7-1d284796f4b7','2025-09-30 10:24:57',0,1),(40,1,25,'5f0c8aa2-c460-4b4b-8cc0-a8dd646b4e38','2025-09-30 10:24:48',0,1),(55,1,10,'12496b7a-492c-49d2-920f-70ed92cae716','2026-05-12 09:08:11',0,1),(55,1,18,'caf879af-32f8-4f98-bd3a-8f41982b1435','2026-05-12 09:08:16',0,1),(55,1,27,'561bc70a-8092-49ef-b0ec-2a5eb6f7759f','2026-05-12 09:12:44',0,1),(61,1,10,'12496b7a-492c-49d2-920f-70ed92cae716','2026-05-12 09:13:00',0,1),(61,1,18,'caf879af-32f8-4f98-bd3a-8f41982b1435','2026-05-12 09:13:05',0,1),(61,1,27,'561bc70a-8092-49ef-b0ec-2a5eb6f7759f','2026-05-12 09:12:56',0,1);
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `contentblocks`
--

LOCK TABLES `contentblocks` WRITE;
/*!40000 ALTER TABLE `contentblocks` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `contentblocks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elementactivity`
--

LOCK TABLES `elementactivity` WRITE;
/*!40000 ALTER TABLE `elementactivity` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elementactivity` VALUES (2,1,1,NULL,'edit','2025-09-02 10:56:03'),(2,1,1,NULL,'save','2025-09-02 10:56:04'),(6,1,1,NULL,'edit','2025-09-30 10:24:53'),(6,1,1,NULL,'save','2025-09-30 10:24:53'),(13,1,1,NULL,'save','2024-11-21 11:41:01'),(20,1,1,NULL,'save','2024-11-21 11:39:30'),(21,1,1,NULL,'save','2024-11-27 10:29:10'),(37,1,1,NULL,'edit','2025-09-30 10:24:57'),(37,1,1,NULL,'save','2025-09-30 10:24:57'),(40,1,1,NULL,'edit','2025-09-30 10:24:48'),(40,1,1,NULL,'save','2025-09-30 10:24:48'),(55,1,1,NULL,'edit','2026-05-12 09:12:44'),(55,1,1,NULL,'save','2026-05-12 09:12:44'),(57,1,1,NULL,'save','2026-05-12 09:11:52'),(58,1,1,NULL,'save','2026-05-12 09:11:57'),(61,1,1,NULL,'save','2026-05-12 09:13:06');
/*!40000 ALTER TABLE `elementactivity` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2024-11-20 15:56:41','2025-09-02 08:19:43',NULL,NULL,NULL,'d4c2664a-0ff4-421f-ba8f-9674b5b84c78'),(2,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2024-11-21 08:48:14','2025-09-02 10:56:04',NULL,NULL,NULL,'bae7b153-4cb3-4dd5-98e9-f27622b3ae78'),(3,2,NULL,1,1,'craft\\elements\\Entry',1,0,'2024-11-21 08:48:14','2024-11-21 08:48:14',NULL,NULL,NULL,'855f41b6-2a5d-4736-9142-9e5c01a220dd'),(4,2,NULL,2,1,'craft\\elements\\Entry',1,0,'2024-11-21 10:04:58','2024-11-21 10:04:58',NULL,NULL,NULL,'06abd1f1-cf84-4670-8963-9664aaed2a41'),(5,2,NULL,3,1,'craft\\elements\\Entry',1,0,'2024-11-21 10:04:59','2024-11-21 10:04:59',NULL,NULL,NULL,'1ebd4f63-106d-4151-ae3c-1b78c72ca002'),(6,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2024-11-21 10:07:47','2025-09-30 10:24:53',NULL,NULL,NULL,'8a7bb246-aaf6-4378-8973-4a13dd7684c5'),(7,6,NULL,4,3,'craft\\elements\\Entry',1,0,'2024-11-21 10:07:47','2024-11-21 10:07:47',NULL,NULL,NULL,'91d07427-4388-435a-b4ec-f1538527da29'),(8,6,NULL,5,3,'craft\\elements\\Entry',1,0,'2024-11-21 10:09:37','2024-11-21 10:09:37',NULL,NULL,NULL,'492164fc-db5f-4ed0-95fb-79088d811e09'),(9,2,NULL,6,1,'craft\\elements\\Entry',1,0,'2024-11-21 10:47:31','2024-11-21 10:47:31',NULL,NULL,NULL,'70d5b3af-ecad-493b-9514-71f2a123b0e9'),(10,2,NULL,7,1,'craft\\elements\\Entry',1,0,'2024-11-21 10:47:50','2024-11-21 10:47:50',NULL,NULL,NULL,'db444248-7142-4e03-b0f7-b63005ed5279'),(11,6,NULL,8,3,'craft\\elements\\Entry',1,0,'2024-11-21 10:48:05','2024-11-21 10:48:05',NULL,NULL,NULL,'8d0bd6b9-d75b-419e-8c6e-9f11b058f2d7'),(12,2,NULL,9,1,'craft\\elements\\Entry',1,0,'2024-11-21 10:54:45','2024-11-21 10:54:45',NULL,NULL,NULL,'ca580089-888b-4537-a983-3ce91dd78457'),(13,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2024-11-21 10:55:34','2025-09-02 09:02:06',NULL,NULL,NULL,'0966cba5-7611-4b55-ab3b-520058c47cb0'),(14,13,NULL,10,2,'craft\\elements\\Entry',1,0,'2024-11-21 10:55:34','2024-11-21 10:55:34',NULL,NULL,NULL,'05915a63-1a70-4818-8c9a-4868cca89fb8'),(15,2,NULL,11,1,'craft\\elements\\Entry',1,0,'2024-11-21 10:55:42','2024-11-21 10:55:42',NULL,NULL,NULL,'838991c9-4f75-4f9d-9547-f2102d0daacd'),(16,6,NULL,12,3,'craft\\elements\\Entry',1,0,'2024-11-21 10:55:48','2024-11-21 10:55:48',NULL,NULL,NULL,'37526c79-3e26-483a-8793-52fdc5ddd74d'),(17,NULL,NULL,NULL,7,'craft\\elements\\GlobalSet',1,0,'2024-11-21 11:00:12','2024-11-25 15:06:26',NULL,NULL,NULL,'c68104aa-08f5-44a5-a8c0-8aca3fba89eb'),(18,NULL,NULL,NULL,8,'craft\\elements\\GlobalSet',1,0,'2024-11-21 11:01:01','2025-09-02 09:11:50',NULL,NULL,NULL,'3a3779ad-ff4a-43ac-9875-963dca20b4b7'),(19,NULL,NULL,NULL,9,'craft\\elements\\GlobalSet',1,0,'2024-11-21 11:01:11','2025-09-02 09:19:04',NULL,'2025-09-02 09:19:04',NULL,'5a93054a-9a30-4b95-873b-9ebec3115909'),(20,NULL,NULL,NULL,10,'craft\\elements\\Entry',1,0,'2024-11-21 11:38:54','2026-05-12 09:08:22',NULL,'2026-05-12 09:08:22',NULL,'251e32f1-6319-46e9-8666-d27708099ac6'),(21,NULL,NULL,NULL,4,'craft\\elements\\Asset',1,0,'2024-11-21 11:39:18','2025-09-02 10:55:54',NULL,'2025-09-02 10:55:54',NULL,'14470ec1-5ddc-47c8-9b16-85643d9c62ad'),(22,20,NULL,13,10,'craft\\elements\\Entry',1,0,'2024-11-21 11:39:30','2024-11-21 11:39:30',NULL,'2026-05-12 09:08:22',NULL,'bacaa676-d735-44ea-aa39-cc5756f4d93b'),(24,2,NULL,14,1,'craft\\elements\\Entry',1,0,'2024-11-21 11:40:16','2024-11-21 11:40:16',NULL,NULL,NULL,'e8ee2b6a-2c0a-4e5b-ac84-6b7d64a1b81c'),(25,13,NULL,15,2,'craft\\elements\\Entry',1,0,'2024-11-21 11:41:01','2024-11-21 11:41:01',NULL,NULL,NULL,'9687ee9c-de0e-4062-99e9-5f80625a4a85'),(26,6,NULL,16,3,'craft\\elements\\Entry',1,0,'2024-11-21 11:41:05','2024-11-21 11:41:05',NULL,NULL,NULL,'27e476b8-3066-4ef5-ba04-c22fa1704e8f'),(27,6,NULL,17,3,'craft\\elements\\Entry',1,0,'2024-11-21 11:41:37','2024-11-21 11:41:37',NULL,NULL,NULL,'8571f483-c98d-48a2-ae54-0c319ac608d5'),(29,2,NULL,18,1,'craft\\elements\\Entry',1,0,'2024-11-25 09:17:20','2024-11-25 09:17:20',NULL,NULL,NULL,'79e607c9-76d9-4c35-9108-0fdce3f02326'),(30,2,NULL,19,1,'craft\\elements\\Entry',1,0,'2024-11-25 09:17:37','2024-11-25 09:17:37',NULL,NULL,NULL,'20acfc6f-a7e0-41b0-9afd-94470978d662'),(31,2,NULL,20,1,'craft\\elements\\Entry',1,0,'2025-09-02 08:21:39','2025-09-02 08:21:39',NULL,NULL,NULL,'b92ec6b3-faab-4ad1-a395-c073b6c21d67'),(32,NULL,NULL,NULL,11,'craft\\elements\\GlobalSet',1,0,'2025-09-02 08:30:17','2025-09-02 09:19:07',NULL,'2025-09-02 09:19:07',NULL,'0bf332b5-a3c2-4fac-9a98-0a76f6bf2cc3'),(33,NULL,NULL,NULL,12,'craft\\elements\\GlobalSet',1,0,'2025-09-02 08:36:03','2025-09-02 08:37:06',NULL,NULL,NULL,'973845f1-1777-4565-9b1f-44ad04497aba'),(34,2,NULL,21,1,'craft\\elements\\Entry',1,0,'2025-09-02 09:01:22','2025-09-02 09:01:22',NULL,NULL,NULL,'8592f649-f5bb-4ff7-ac55-45413e0eaba1'),(35,13,NULL,22,2,'craft\\elements\\Entry',1,0,'2025-09-02 09:02:06','2025-09-02 09:02:06',NULL,NULL,NULL,'ca530f9f-e53f-4c2d-a7bc-27d864a86051'),(36,6,NULL,23,3,'craft\\elements\\Entry',1,0,'2025-09-02 09:05:23','2025-09-02 09:05:23',NULL,NULL,NULL,'451d1943-044f-49b0-8744-dbac6abdaeeb'),(37,NULL,NULL,NULL,13,'craft\\elements\\Entry',1,0,'2025-09-02 09:06:44','2025-09-30 10:24:57',NULL,NULL,NULL,'3a8fccf5-5c6b-4dc0-972b-4d394fd8e74c'),(38,37,NULL,24,13,'craft\\elements\\Entry',1,0,'2025-09-02 09:06:44','2025-09-02 09:06:44',NULL,NULL,NULL,'d37bf1e6-5d1a-4b4e-8077-a5e949d8e60c'),(39,37,NULL,25,13,'craft\\elements\\Entry',1,0,'2025-09-02 09:07:47','2025-09-02 09:07:47',NULL,NULL,NULL,'71efa377-eea6-4efd-8054-f41ce3cb8ec4'),(40,NULL,NULL,NULL,14,'craft\\elements\\Entry',1,0,'2025-09-02 09:10:18','2025-09-30 10:24:48',NULL,NULL,NULL,'2acdcc5c-0d6f-47bd-bed8-8ee841684e3d'),(41,40,NULL,26,14,'craft\\elements\\Entry',1,0,'2025-09-02 09:10:18','2025-09-02 09:10:18',NULL,NULL,NULL,'8165e3b3-ff3b-49ce-82ea-95d5060f88ce'),(42,NULL,NULL,NULL,15,'craft\\elements\\GlobalSet',1,0,'2025-09-02 09:11:42','2025-09-02 09:17:04',NULL,NULL,NULL,'329399c3-cf0b-4184-b8cf-111844590e07'),(44,2,NULL,27,1,'craft\\elements\\Entry',1,0,'2025-09-02 10:52:22','2025-09-02 10:52:22',NULL,NULL,NULL,'012d8685-8b00-43ba-babf-cab72e2f7a68'),(45,2,NULL,28,1,'craft\\elements\\Entry',1,0,'2025-09-02 10:54:43','2025-09-02 10:54:43',NULL,NULL,NULL,'19518010-529d-4118-91cd-5967736343e8'),(46,NULL,NULL,NULL,4,'craft\\elements\\Asset',1,0,'2025-09-02 10:55:45','2025-09-02 10:55:45',NULL,NULL,NULL,'ac024163-4fe4-4551-b23e-4c76af230f1b'),(48,2,NULL,29,1,'craft\\elements\\Entry',1,0,'2025-09-02 10:56:04','2025-09-02 10:56:04',NULL,NULL,NULL,'c68a48a0-5cbc-44fc-9852-ce634f092e07'),(50,40,NULL,30,14,'craft\\elements\\Entry',1,0,'2025-09-30 10:24:48','2025-09-30 10:24:48',NULL,NULL,NULL,'05012b7b-a596-42b5-bdbe-cbca37562aed'),(52,6,NULL,31,3,'craft\\elements\\Entry',1,0,'2025-09-30 10:24:53','2025-09-30 10:24:53',NULL,NULL,NULL,'ecedbd98-79bf-4401-bf3c-eca921b59fe6'),(54,37,NULL,32,13,'craft\\elements\\Entry',1,0,'2025-09-30 10:24:57','2025-09-30 10:24:57',NULL,NULL,NULL,'6161415e-af85-499a-933e-14caec0ad2e0'),(55,NULL,NULL,NULL,10,'craft\\elements\\Entry',1,0,'2026-05-12 09:08:01','2026-05-12 09:12:44',NULL,NULL,NULL,'a9345a0b-3661-4d97-b3f6-deff37962648'),(56,55,NULL,33,10,'craft\\elements\\Entry',1,0,'2026-05-12 09:08:16','2026-05-12 09:08:16',NULL,NULL,NULL,'f6de714b-8360-42a8-b1cf-580c2a830b02'),(57,NULL,NULL,NULL,16,'craft\\elements\\Category',1,0,'2026-05-12 09:11:47','2026-05-12 09:11:52',NULL,NULL,NULL,'8aee68de-7edd-40a7-9577-a14ad07189a4'),(58,NULL,NULL,NULL,16,'craft\\elements\\Category',1,0,'2026-05-12 09:11:53','2026-05-12 09:11:57',NULL,NULL,NULL,'6be11b88-8513-4c74-b823-9950dd45bc08'),(60,55,NULL,34,10,'craft\\elements\\Entry',1,0,'2026-05-12 09:12:44','2026-05-12 09:12:44',NULL,NULL,NULL,'52fca271-cbdc-403f-b4e4-6ce4b42d968b'),(61,NULL,NULL,NULL,10,'craft\\elements\\Entry',1,0,'2026-05-12 09:12:47','2026-05-12 09:13:06',NULL,NULL,NULL,'4ea6b684-9267-450d-bb6d-2f5414636710'),(62,61,NULL,35,10,'craft\\elements\\Entry',1,0,'2026-05-12 09:13:06','2026-05-12 09:13:06',NULL,NULL,NULL,'3cea5920-7b55-4c6a-a08c-d0b9bbe25a38');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_bulkops`
--

LOCK TABLES `elements_bulkops` WRITE;
/*!40000 ALTER TABLE `elements_bulkops` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `elements_bulkops` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_owners`
--

LOCK TABLES `elements_owners` WRITE;
/*!40000 ALTER TABLE `elements_owners` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `elements_owners` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,NULL,NULL,1,'2024-11-20 15:56:41','2024-11-20 15:56:41','8f07f550-f15a-4f8f-8cb9-7e692c1d286f'),(2,2,1,'Home','home','__home__','{\"aea2e3a1-f259-4a56-89d0-0bbc20358da2\": [46], \"d81f5d4c-1c3d-444a-8dc4-2d064470323a\": []}',1,'2024-11-21 08:48:14','2025-09-02 10:56:04','c5e3188d-efc1-44bb-9fdd-442a1a7c12be'),(3,3,1,'Home','home','__home__',NULL,1,'2024-11-21 08:48:14','2024-11-21 08:48:14','70575afa-71db-4e0e-962b-3e1112f17cfd'),(4,4,1,'Home','home','__home__',NULL,1,'2024-11-21 10:04:58','2024-11-21 10:04:58','00d0aadc-9a10-478d-a91e-5b2fdfe43f3c'),(5,5,1,'Home','home','__home__',NULL,1,'2024-11-21 10:04:59','2024-11-21 10:04:59','ff42d519-b7b6-4883-bef7-f8d26427d9c2'),(6,6,1,'Imprint','imprint','imprint','{\"07be3ad1-46e1-4a12-96fd-d4b0f171daf8\": \"<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>\", \"6599e9a6-4feb-473a-bdfc-2fe6e245ffef\": []}',1,'2024-11-21 10:07:47','2025-09-30 10:24:53','627c396e-9596-4569-bae7-03dfc7503176'),(7,7,1,'Imprint','imprint','imprint',NULL,1,'2024-11-21 10:07:47','2024-11-21 10:07:47','8227676b-c652-425a-86ed-1a2d6f5f12c0'),(8,8,1,'Imprint','imprint','imprint',NULL,1,'2024-11-21 10:09:37','2024-11-21 10:09:37','aaa48c9b-8dc8-4731-af3c-7311d4be7931'),(9,9,1,'Home','home','__home__',NULL,1,'2024-11-21 10:47:31','2024-11-21 10:47:31','0fd2901c-9ec1-4574-ae83-0000bbcffb35'),(10,10,1,'Home','home','__home__',NULL,1,'2024-11-21 10:47:50','2024-11-21 10:47:50','80f0beed-c209-4650-b4f2-ad5f73abb4b7'),(11,11,1,'Imprint','imprint','imprint',NULL,1,'2024-11-21 10:48:05','2024-11-21 10:48:05','42df9cac-8519-4a86-b4e2-fa969b7640cf'),(12,12,1,'Home','home','__home__',NULL,1,'2024-11-21 10:54:45','2024-11-21 10:54:45','fd66a434-e79e-4f01-bcee-59d398545cbb'),(13,13,1,'About','about','about','{\"8bea23f5-953a-4887-b3a1-544104109492\": []}',1,'2024-11-21 10:55:34','2025-09-02 09:02:06','75265ff6-4d1e-4700-9111-afca4c5b4ac8'),(14,14,1,'About','about','about',NULL,1,'2024-11-21 10:55:34','2024-11-21 10:55:34','0f877449-0eda-40c0-a5b7-e352eca47d66'),(15,15,1,'Home','home','__home__',NULL,1,'2024-11-21 10:55:42','2024-11-21 10:55:42','a29e9da3-4f42-45e0-a2dc-a7d85355cfd2'),(16,16,1,'Imprint','imprint','imprint',NULL,1,'2024-11-21 10:55:48','2024-11-21 10:55:48','ad688948-386f-4924-80a3-349df6b70040'),(17,17,1,NULL,NULL,NULL,'{\"770aaba7-94ae-43cd-8198-e39de09db72f\": \"<p>Here goes the website description.</p>\", \"990b998d-ec7a-4037-bb58-7b4d0b0632f8\": \"Website Title\", \"a4ffc670-f936-4954-acc3-2dee26459ad0\": \"<p>Company Name</p><p>Street Name 123, 1220 City<br />+43 1234567890<br />example@email.com</p>\", \"f69c1926-c263-487e-b4bb-384847319ff3\": [{\"col2\": \"Twitter\", \"col3\": \"https://x.com/?logout=1732525376019\"}, {\"col2\": \"Youtube\", \"col3\": \"https://www.youtube.com/\"}]}',1,'2024-11-21 11:00:12','2024-11-25 09:05:17','837f90df-0a82-4697-8fc8-4f9af89edca5'),(18,18,1,NULL,NULL,NULL,'{\"455c744a-e4a5-4d7d-8d52-5520b80f7261\": [6, 37, 40], \"dee3fe35-01d3-436c-87ad-8f066b34c4e2\": [2, 13]}',1,'2024-11-21 11:01:01','2025-09-02 09:10:55','1db549a4-8c30-4c86-a766-f60679f75614'),(19,19,1,NULL,NULL,NULL,'{\"64fb395e-4c26-4cb7-a276-d74762f52393\": \"<p>Example Privacy Policy Test.</p>\"}',1,'2024-11-21 11:01:11','2024-11-25 09:05:41','f596d2de-37ae-4d76-9a02-6e8d609f0bf4'),(20,20,1,'Card Example','card-example','card-example/card-example','{\"12496b7a-492c-49d2-920f-70ed92cae716\": [], \"caf879af-32f8-4f98-bd3a-8f41982b1435\": \"<p>This is example Text</p>\"}',1,'2024-11-21 11:38:54','2026-05-12 09:07:44','3129ae4d-4993-431d-8f20-119c17c5c670'),(21,21,1,'Screenshot 2024 11 04 at 17 55 44',NULL,NULL,NULL,1,'2024-11-21 11:39:18','2024-11-21 11:39:18','914af0eb-20d2-4b3f-b0e8-4b9003288060'),(22,22,1,'Card Example','card-example','card-example/card-example','{\"12496b7a-492c-49d2-920f-70ed92cae716\": [], \"caf879af-32f8-4f98-bd3a-8f41982b1435\": \"<p>This is example Text</p>\"}',1,'2024-11-21 11:39:30','2026-05-12 09:07:45','5cd2ce8d-f43a-483d-96a1-a83afd55acdf'),(24,24,1,'Landing page','home','__home__',NULL,1,'2024-11-21 11:40:16','2024-11-21 11:40:16','69212ba8-6c47-40b4-a2e3-417a4c4b3253'),(25,25,1,'About','about','about',NULL,1,'2024-11-21 11:41:01','2024-11-21 11:41:01','f67cc16b-93d6-4390-9dad-389f3b050168'),(26,26,1,'Imprint','imprint','imprint',NULL,1,'2024-11-21 11:41:05','2024-11-21 11:41:05','1670ff9c-7096-42a1-b980-afcd6d0b1907'),(27,27,1,'Imprint','imprint','imprint',NULL,1,'2024-11-21 11:41:37','2024-11-21 11:41:37','adcd544f-d26a-44bd-852d-47f3fe4c7738'),(29,29,1,'Home','home','__home__',NULL,1,'2024-11-25 09:17:20','2024-11-25 09:17:20','9f32eae7-0aba-49fb-ba92-b7ce77f42d26'),(30,30,1,'Home','home','__home__',NULL,1,'2024-11-25 09:17:37','2024-11-25 09:17:37','8bae5ba2-1866-4167-a53d-777ab8b252e5'),(31,31,1,'Home','home','__home__',NULL,1,'2025-09-02 08:21:39','2025-09-02 08:21:39','c61a172c-0bf8-48b7-b877-6bfcad61d231'),(32,32,1,NULL,NULL,NULL,NULL,1,'2025-09-02 08:30:17','2025-09-02 08:30:17','1fe58d47-972e-44f1-8058-33ae43a20d0d'),(33,33,1,NULL,NULL,NULL,'{\"47590d60-13b0-48b2-b2e3-e83d6a93858d\": \"Website Title\", \"56664950-d907-4b02-9d03-9add295aef7b\": [{\"col1\": null, \"col2\": \"\", \"col3\": \"\"}], \"8ab09fc4-330f-42c1-a257-bfe6aeca67ab\": \"<p>Here goes the website description.</p>\", \"fce27730-a622-4dac-823e-8a4a2c45b335\": []}',1,'2025-09-02 08:36:03','2025-09-02 08:37:06','90ab5f03-4c26-45bd-bd1a-a616137d8b23'),(34,34,1,'Home','home','__home__',NULL,1,'2025-09-02 09:01:22','2025-09-02 09:01:22','fe2e4980-ded3-4e72-b64a-084f74ec34f7'),(35,35,1,'About','about','about',NULL,1,'2025-09-02 09:02:06','2025-09-02 09:02:06','601a5a3b-9450-4a73-a2c1-e9f352911118'),(36,36,1,'Imprint','imprint','imprint',NULL,1,'2025-09-02 09:05:23','2025-09-02 09:05:23','27b43a88-5eea-45bc-8e18-cd349c24035d'),(37,37,1,'Privacy','privacy','privacy','{\"f028c411-13cc-469e-b3c7-1d284796f4b7\": \"<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>\"}',1,'2025-09-02 09:06:44','2025-09-30 10:24:57','746ab9b5-43dc-4b9f-94d3-0cbadb7f30b7'),(38,38,1,'Privacy','privacy','privacy',NULL,1,'2025-09-02 09:06:44','2025-09-02 09:06:44','5137b2ed-461a-4e11-b58f-7400ce8b1d25'),(39,39,1,'Privacy','privacy','privacy',NULL,1,'2025-09-02 09:07:47','2025-09-02 09:07:47','79bce2f9-2dd3-48cf-a332-cd7378198612'),(40,40,1,'Accessibility','accessibility','accessibility','{\"5f0c8aa2-c460-4b4b-8cc0-a8dd646b4e38\": \"<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>\"}',1,'2025-09-02 09:10:18','2025-09-30 10:24:48','4d1e3733-6649-4d54-9348-674e333250a4'),(41,41,1,'Accessibility','accessibility','accessibility',NULL,1,'2025-09-02 09:10:18','2025-09-02 09:10:18','637519a3-a035-4aa7-bcff-7a5bf82aeb1f'),(42,42,1,NULL,NULL,NULL,'{\"43f8ef0d-e0a1-4b93-a1bb-4b4b60bddbae\": [40, 6, 37]}',1,'2025-09-02 09:11:42','2025-09-02 09:17:04','9775ae6a-1eff-46a7-bd79-fb25f2ea2da1'),(44,44,1,'Home','home','__home__','{\"aea2e3a1-f259-4a56-89d0-0bbc20358da2\": [21]}',1,'2025-09-02 10:52:22','2025-09-02 10:52:22','096c05c3-1dce-4c4d-9183-75d12cc2fe94'),(45,45,1,'Home','home','__home__','{\"aea2e3a1-f259-4a56-89d0-0bbc20358da2\": [21]}',1,'2025-09-02 10:54:43','2025-09-02 10:54:43','9ae91b11-94ff-464d-854c-03270c4ac452'),(46,46,1,'52513fbc48c692f008ba2c82ec87bce4c03b17c5',NULL,NULL,NULL,1,'2025-09-02 10:55:45','2025-09-02 10:55:45','91f9bcfa-a401-4bb2-b24d-f2f1ac218557'),(48,48,1,'Home','home','__home__','{\"aea2e3a1-f259-4a56-89d0-0bbc20358da2\": [46]}',1,'2025-09-02 10:56:04','2025-09-02 10:56:04','f14d407d-4622-4fa2-94da-35fa3570ffba'),(50,50,1,'Accessibility','accessibility','accessibility','{\"5f0c8aa2-c460-4b4b-8cc0-a8dd646b4e38\": \"<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>\"}',1,'2025-09-30 10:24:48','2025-09-30 10:24:48','c13b12bd-b00d-4a67-93f0-b9a8b88a4b63'),(52,52,1,'Imprint','imprint','imprint','{\"07be3ad1-46e1-4a12-96fd-d4b0f171daf8\": \"<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>\"}',1,'2025-09-30 10:24:53','2025-09-30 10:24:53','3aa0ddea-615f-472f-9ff3-357daf73337b'),(54,54,1,'Privacy','privacy','privacy','{\"f028c411-13cc-469e-b3c7-1d284796f4b7\": \"<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>\"}',1,'2025-09-30 10:24:57','2025-09-30 10:24:57','88837302-aedd-40c9-83bf-a887042dd2ef'),(55,55,1,'Example Entry','example-entry','card-example/example-entry','{\"12496b7a-492c-49d2-920f-70ed92cae716\": [46], \"561bc70a-8092-49ef-b0ec-2a5eb6f7759f\": [57], \"caf879af-32f8-4f98-bd3a-8f41982b1435\": \"<p>textfield</p>\"}',1,'2026-05-12 09:08:01','2026-05-12 09:12:44','55df4b24-3c36-4555-8f43-9d305d6f2de2'),(56,56,1,'Example Entry','example-entry','card-example/example-entry','{\"12496b7a-492c-49d2-920f-70ed92cae716\": [46], \"caf879af-32f8-4f98-bd3a-8f41982b1435\": \"<p>textfield</p>\"}',1,'2026-05-12 09:08:16','2026-05-12 09:08:16','1f1f010e-a589-4171-a299-64db02d0f1b4'),(57,57,1,'type 1','type-1','example-category/type-1',NULL,1,'2026-05-12 09:11:47','2026-05-12 09:11:51','afa7518c-5dc7-4109-8df8-65bec326ddcc'),(58,58,1,'type 2','type-2','example-category/type-2',NULL,1,'2026-05-12 09:11:53','2026-05-12 09:11:57','207da6ea-aabd-4c98-8124-6a542c4783e1'),(60,60,1,'Example Entry','example-entry','card-example/example-entry','{\"12496b7a-492c-49d2-920f-70ed92cae716\": [46], \"561bc70a-8092-49ef-b0ec-2a5eb6f7759f\": [57], \"caf879af-32f8-4f98-bd3a-8f41982b1435\": \"<p>textfield</p>\"}',1,'2026-05-12 09:12:44','2026-05-12 09:12:44','a80cb320-2ede-47ee-a966-2746f96c5740'),(61,61,1,'Example Entry 2','example-entry-2','card-example/example-entry-2','{\"12496b7a-492c-49d2-920f-70ed92cae716\": [46], \"561bc70a-8092-49ef-b0ec-2a5eb6f7759f\": [58], \"caf879af-32f8-4f98-bd3a-8f41982b1435\": \"<p>type 2</p>\"}',1,'2026-05-12 09:12:47','2026-05-12 09:13:05','9f964a5c-bc16-4c7d-9127-77ccb552bfeb'),(62,62,1,'Example Entry 2','example-entry-2','card-example/example-entry-2','{\"12496b7a-492c-49d2-920f-70ed92cae716\": [46], \"561bc70a-8092-49ef-b0ec-2a5eb6f7759f\": [58], \"caf879af-32f8-4f98-bd3a-8f41982b1435\": \"<p>type 2</p>\"}',1,'2026-05-12 09:13:06','2026-05-12 09:13:06','06c0cfae-2e6d-4de0-a78b-c48807e8000b');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries` VALUES (2,1,NULL,NULL,NULL,1,'2024-11-21 08:48:00',NULL,'live',NULL,NULL,'2024-11-21 08:48:14','2024-11-21 08:48:14'),(3,1,NULL,NULL,NULL,1,'2024-11-21 08:48:00',NULL,'live',NULL,NULL,'2024-11-21 08:48:14','2024-11-21 08:48:14'),(4,1,NULL,NULL,NULL,1,'2024-11-21 08:48:00',NULL,'live',NULL,NULL,'2024-11-21 10:04:58','2024-11-21 10:04:58'),(5,1,NULL,NULL,NULL,1,'2024-11-21 08:48:00',NULL,'live',NULL,NULL,'2024-11-21 10:04:59','2024-11-21 10:04:59'),(6,3,NULL,NULL,NULL,3,'2024-11-21 10:07:00',NULL,'live',NULL,NULL,'2024-11-21 10:07:47','2024-11-21 10:07:47'),(7,3,NULL,NULL,NULL,3,'2024-11-21 10:07:00',NULL,'live',NULL,NULL,'2024-11-21 10:07:47','2024-11-21 10:07:47'),(8,3,NULL,NULL,NULL,3,'2024-11-21 10:07:00',NULL,'live',NULL,NULL,'2024-11-21 10:09:37','2024-11-21 10:09:37'),(9,1,NULL,NULL,NULL,1,'2024-11-21 08:48:00',NULL,'live',NULL,NULL,'2024-11-21 10:47:31','2024-11-21 10:47:31'),(10,1,NULL,NULL,NULL,1,'2024-11-21 08:48:00',NULL,'live',NULL,NULL,'2024-11-21 10:47:50','2024-11-21 10:47:50'),(11,3,NULL,NULL,NULL,3,'2024-11-21 10:07:00',NULL,'live',NULL,NULL,'2024-11-21 10:48:05','2024-11-21 10:48:05'),(12,1,NULL,NULL,NULL,1,'2024-11-21 08:48:00',NULL,'live',NULL,NULL,'2024-11-21 10:54:45','2024-11-21 10:54:45'),(13,2,NULL,NULL,NULL,2,'2024-11-21 10:55:00',NULL,'live',NULL,NULL,'2024-11-21 10:55:34','2024-11-21 10:55:34'),(14,2,NULL,NULL,NULL,2,'2024-11-21 10:55:00',NULL,'live',NULL,NULL,'2024-11-21 10:55:34','2024-11-21 10:55:34'),(15,1,NULL,NULL,NULL,1,'2024-11-21 08:48:00',NULL,'live',NULL,NULL,'2024-11-21 10:55:42','2024-11-21 10:55:42'),(16,3,NULL,NULL,NULL,3,'2024-11-21 10:07:00',NULL,'live',NULL,NULL,'2024-11-21 10:55:48','2024-11-21 10:55:48'),(20,4,NULL,NULL,NULL,4,'2024-11-21 11:39:00',NULL,'live',0,0,'2024-11-21 11:38:54','2024-11-21 11:39:29'),(22,4,NULL,NULL,NULL,4,'2024-11-21 11:39:00',NULL,'live',NULL,NULL,'2024-11-21 11:39:30','2024-11-21 11:39:30'),(24,1,NULL,NULL,NULL,1,'2024-11-21 08:48:00',NULL,'live',NULL,NULL,'2024-11-21 11:40:16','2024-11-21 11:40:16'),(25,2,NULL,NULL,NULL,2,'2024-11-21 10:55:00',NULL,'live',NULL,NULL,'2024-11-21 11:41:01','2024-11-21 11:41:01'),(26,3,NULL,NULL,NULL,3,'2024-11-21 10:07:00',NULL,'live',NULL,NULL,'2024-11-21 11:41:05','2024-11-21 11:41:05'),(27,3,NULL,NULL,NULL,3,'2024-11-21 10:07:00',NULL,'live',NULL,NULL,'2024-11-21 11:41:37','2024-11-21 11:41:37'),(29,1,NULL,NULL,NULL,1,'2024-11-21 08:48:00',NULL,'live',NULL,NULL,'2024-11-25 09:17:20','2024-11-25 09:17:20'),(30,1,NULL,NULL,NULL,1,'2024-11-21 08:48:00',NULL,'live',NULL,NULL,'2024-11-25 09:17:37','2024-11-25 09:17:37'),(31,1,NULL,NULL,NULL,1,'2024-11-21 08:48:00',NULL,'live',NULL,NULL,'2025-09-02 08:21:39','2025-09-02 08:21:39'),(34,1,NULL,NULL,NULL,1,'2024-11-21 08:48:00',NULL,'live',NULL,NULL,'2025-09-02 09:01:22','2025-09-02 09:01:22'),(35,2,NULL,NULL,NULL,2,'2024-11-21 10:55:00',NULL,'live',NULL,NULL,'2025-09-02 09:02:06','2025-09-02 09:02:06'),(36,3,NULL,NULL,NULL,3,'2024-11-21 10:07:00',NULL,'live',NULL,NULL,'2025-09-02 09:05:23','2025-09-02 09:05:23'),(37,5,NULL,NULL,NULL,5,'2025-09-02 09:06:00',NULL,'live',NULL,NULL,'2025-09-02 09:06:44','2025-09-02 09:06:44'),(38,5,NULL,NULL,NULL,5,'2025-09-02 09:06:00',NULL,'live',NULL,NULL,'2025-09-02 09:06:44','2025-09-02 09:06:44'),(39,5,NULL,NULL,NULL,5,'2025-09-02 09:06:00',NULL,'live',NULL,NULL,'2025-09-02 09:07:47','2025-09-02 09:07:47'),(40,6,NULL,NULL,NULL,6,'2025-09-02 09:10:00',NULL,'live',NULL,NULL,'2025-09-02 09:10:18','2025-09-02 09:10:18'),(41,6,NULL,NULL,NULL,6,'2025-09-02 09:10:00',NULL,'live',NULL,NULL,'2025-09-02 09:10:18','2025-09-02 09:10:18'),(44,1,NULL,NULL,NULL,1,'2024-11-21 08:48:00',NULL,'live',NULL,NULL,'2025-09-02 10:52:22','2025-09-02 10:52:22'),(45,1,NULL,NULL,NULL,1,'2024-11-21 08:48:00',NULL,'live',NULL,NULL,'2025-09-02 10:54:43','2025-09-02 10:54:43'),(48,1,NULL,NULL,NULL,1,'2024-11-21 08:48:00',NULL,'live',NULL,NULL,'2025-09-02 10:56:04','2025-09-02 10:56:04'),(50,6,NULL,NULL,NULL,6,'2025-09-02 09:10:00',NULL,'live',NULL,NULL,'2025-09-30 10:24:48','2025-09-30 10:24:48'),(52,3,NULL,NULL,NULL,3,'2024-11-21 10:07:00',NULL,'live',NULL,NULL,'2025-09-30 10:24:53','2025-09-30 10:24:53'),(54,5,NULL,NULL,NULL,5,'2025-09-02 09:06:00',NULL,'live',NULL,NULL,'2025-09-30 10:24:57','2025-09-30 10:24:57'),(55,4,NULL,NULL,NULL,4,'2026-05-12 09:08:00',NULL,'live',NULL,NULL,'2026-05-12 09:08:01','2026-05-12 09:08:16'),(56,4,NULL,NULL,NULL,4,'2026-05-12 09:08:00',NULL,'live',NULL,NULL,'2026-05-12 09:08:16','2026-05-12 09:08:16'),(60,4,NULL,NULL,NULL,4,'2026-05-12 09:08:00',NULL,'live',NULL,NULL,'2026-05-12 09:12:44','2026-05-12 09:12:44'),(61,4,NULL,NULL,NULL,4,'2026-05-12 09:13:00',NULL,'live',NULL,NULL,'2026-05-12 09:12:47','2026-05-12 09:13:06'),(62,4,NULL,NULL,NULL,4,'2026-05-12 09:13:00',NULL,'live',NULL,NULL,'2026-05-12 09:13:06','2026-05-12 09:13:06');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries_authors`
--

LOCK TABLES `entries_authors` WRITE;
/*!40000 ALTER TABLE `entries_authors` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries_authors` VALUES (20,1,1),(22,1,1),(55,1,1),(56,1,1),(60,1,1),(61,1,1),(62,1,1);
/*!40000 ALTER TABLE `entries_authors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entrytypes` VALUES (1,1,'Home','home',NULL,'house','yellow','{title}',1,'site',NULL,NULL,1,'site',NULL,1,'2024-11-21 08:47:46','2025-09-02 09:01:16',NULL,'43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c',0),(2,2,'About','about',NULL,'address-card','yellow','{title}',1,'site',NULL,NULL,1,'site',NULL,1,'2024-11-21 10:04:33','2025-09-02 09:02:03',NULL,'50a058af-57fd-4784-a532-cdf609d93221',0),(3,3,'Imprint','imprint',NULL,'align-justify','yellow','{title}',1,'site',NULL,NULL,1,'site',NULL,1,'2024-11-21 10:07:45','2025-09-02 09:05:20',NULL,'c69f0277-c48d-451a-84c1-2b4423aff544',0),(4,10,'Example Entry','exampleEntry',NULL,'layer-group','yellow','{title}',1,'site',NULL,NULL,1,'site',NULL,1,'2024-11-21 11:37:30','2026-05-12 09:07:40',NULL,'9cc3eba1-d7d2-478f-ab6d-57505ecbcd66',0),(5,13,'Privacy','privacy',NULL,'lock-keyhole','yellow','{title}',1,'site',NULL,NULL,1,'site',NULL,1,'2025-09-02 09:06:38','2025-09-02 09:09:04',NULL,'77a9e634-565d-4610-8aea-d10dd619f000',0),(6,14,'Accessibility','accessibility',NULL,NULL,NULL,'{title}',1,'site',NULL,NULL,1,'site',NULL,1,'2025-09-02 09:10:16','2025-09-02 09:10:16',NULL,'11dedd21-c9e4-4490-8ed2-ee30e10e3b4d',0);
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouts` VALUES (1,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"4089e5fa-0548-470f-af78-6869077d0bee\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"d064bb6b-411a-445e-8963-e534101aff68\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2024-11-21T08:46:07+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"aea2e3a1-f259-4a56-89d0-0bbc20358da2\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"36dca454-5bf3-422e-b397-abb58dda5bbc\", \"required\": false, \"dateAdded\": \"2025-09-02T10:52:13+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}, {\"uid\": \"6c9360f5-2470-4ca5-a51c-89103d6bd141\", \"name\": \"Metadata\", \"elements\": [{\"tip\": null, \"uid\": \"447cc733-a9dc-4a8b-b7bb-4b4feeba8417\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"9fa6c3db-85f7-4431-831a-05a8249b0e26\", \"required\": false, \"dateAdded\": \"2025-09-02T09:01:16+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"78ccbef4-564b-4987-a3ab-e55f4216f88b\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"614813c6-21cb-4c1a-bb3b-f1373d4c80fe\", \"required\": false, \"dateAdded\": \"2025-09-02T09:01:16+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"d81f5d4c-1c3d-444a-8dc4-2d064470323a\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"e344ac15-6d4b-4dca-a3e3-a23af0036956\", \"required\": false, \"dateAdded\": \"2025-09-02T09:01:16+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2024-11-21 08:47:46','2026-05-12 13:06:05',NULL,'b0893f20-109c-4ca6-9b40-68c5ac163c89'),(2,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"f34748c2-8f26-49e5-aa35-2d1aa16a7efa\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"c49fb476-8c8a-423c-b0c6-318157367d8d\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2024-11-21T10:03:00+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}, {\"uid\": \"76860177-3311-4c72-b12a-f898cfe9ba64\", \"name\": \"Metadata\", \"elements\": [{\"tip\": null, \"uid\": \"9b3d4d3c-3151-4ff9-8976-b80ea18b19ca\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"9fa6c3db-85f7-4431-831a-05a8249b0e26\", \"required\": false, \"dateAdded\": \"2025-09-02T09:02:03+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"aafb0fa6-cbd6-4c36-9fa2-f4c71effceaf\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"614813c6-21cb-4c1a-bb3b-f1373d4c80fe\", \"required\": false, \"dateAdded\": \"2025-09-02T09:02:03+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"8bea23f5-953a-4887-b3a1-544104109492\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"e344ac15-6d4b-4dca-a3e3-a23af0036956\", \"required\": false, \"dateAdded\": \"2025-09-02T09:02:03+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2024-11-21 10:04:33','2026-05-12 13:06:05',NULL,'94475cef-751b-484e-91b9-4113d94c86f3'),(3,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"39f38808-3305-4ff0-9e0a-6b3748da4678\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"fda1bacd-92aa-4d24-bbac-f3510fcbd4a2\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2024-11-21T10:05:26+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"07be3ad1-46e1-4a12-96fd-d4b0f171daf8\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"4e467547-468e-4edb-9dcb-04801550f11d\", \"required\": false, \"dateAdded\": \"2025-09-30T10:24:03+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}, {\"uid\": \"f6923d7b-4e5b-4324-aff3-5a9cc7d3cd44\", \"name\": \"Metadata\", \"elements\": [{\"tip\": null, \"uid\": \"d48415f8-48a5-45ec-aac8-8a3a0199f4de\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"9fa6c3db-85f7-4431-831a-05a8249b0e26\", \"required\": false, \"dateAdded\": \"2025-09-02T09:05:20+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"1fcdaea1-461f-4eb6-b0f0-8d9f5db30e6c\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"614813c6-21cb-4c1a-bb3b-f1373d4c80fe\", \"required\": false, \"dateAdded\": \"2025-09-02T09:05:20+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"6599e9a6-4feb-473a-bdfc-2fe6e245ffef\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"e344ac15-6d4b-4dca-a3e3-a23af0036956\", \"required\": false, \"dateAdded\": \"2025-09-02T09:05:20+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2024-11-21 10:07:45','2026-05-12 13:06:05',NULL,'273181ee-c034-4747-bed3-46045cfb92e1'),(4,'craft\\elements\\Asset','{\"tabs\": [{\"uid\": \"0b29a64e-8d30-4835-af4a-9ee754f3953b\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"c9e37db9-6937-4f12-8931-b098c093626d\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"dateAdded\": \"2024-11-21T10:19:42+00:00\", \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"95ffa6d5-64d3-489c-893d-f553c73f5c94\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"da87989f-6fba-4fb3-afae-2501b651f019\", \"required\": false, \"dateAdded\": \"2024-11-21T10:25:49+00:00\", \"instructions\": null, \"userCondition\": null, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"0cfaaaf1-5973-4c8f-a91a-3a42edaef851\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"bebc23d5-2d50-4499-ae0d-6aa66437be5e\", \"required\": false, \"dateAdded\": \"2024-11-21T10:25:49+00:00\", \"instructions\": null, \"userCondition\": null, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [\"filename\", \"height\", \"width\", \"uid\", \"layoutElement:0cfaaaf1-5973-4c8f-a91a-3a42edaef851\", \"layoutElement:95ffa6d5-64d3-489c-893d-f553c73f5c94\"]}','2024-11-21 10:25:49','2026-05-12 13:06:05',NULL,'f76322d0-ef05-49f6-aaf4-09267ebb69fc'),(5,'craft\\elements\\Asset','{\"tabs\": [{\"uid\": \"f8fb2343-8f1f-47d5-921f-a343417f756d\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"71c4720c-007f-4805-8b33-90f4112b489e\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"dateAdded\": \"2024-11-21T10:25:38+00:00\", \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [\"filename\", \"kind\", \"size\", \"uid\"]}','2024-11-21 10:27:49','2026-05-12 13:06:05',NULL,'498553a1-729c-49ac-8cf3-ab0676a8ac94'),(6,'craft\\elements\\Asset','{\"tabs\": [{\"uid\": \"cf98a92a-ce1f-44aa-9838-cc81be93a79f\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"57ea13c3-c50c-4ee5-935a-af163dc2a06a\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"dateAdded\": \"2024-11-21T10:30:16+00:00\", \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"7faa717f-5193-45ec-8af5-f11a27e3aa1b\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"da87989f-6fba-4fb3-afae-2501b651f019\", \"required\": false, \"dateAdded\": \"2024-11-21T10:32:15+00:00\", \"instructions\": null, \"userCondition\": null, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"d39e6aff-b748-48f1-bd17-da6d454be74b\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"bebc23d5-2d50-4499-ae0d-6aa66437be5e\", \"required\": false, \"dateAdded\": \"2024-11-21T10:32:15+00:00\", \"instructions\": null, \"userCondition\": null, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [\"filename\", \"height\", \"width\", \"layoutElement:7faa717f-5193-45ec-8af5-f11a27e3aa1b\", \"layoutElement:d39e6aff-b748-48f1-bd17-da6d454be74b\", \"uid\"]}','2024-11-21 10:32:15','2026-05-12 13:06:05',NULL,'fac307ad-c2f8-40e5-8998-c13af8ba3d21'),(7,'craft\\elements\\GlobalSet','{\"tabs\": [{\"uid\": \"115383f2-0dcb-4df5-a864-749255a73a4f\", \"name\": \"General\", \"elements\": [{\"tip\": null, \"uid\": \"990b998d-ec7a-4037-bb58-7b4d0b0632f8\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"5365ef59-c050-4702-82ab-876962749a48\", \"required\": false, \"dateAdded\": \"2024-11-21T11:17:22+00:00\", \"instructions\": null, \"userCondition\": null, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"770aaba7-94ae-43cd-8198-e39de09db72f\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"5228acaf-dbbf-4aac-b0b0-0c1c55e94b4a\", \"required\": false, \"dateAdded\": \"2024-11-21T11:17:22+00:00\", \"instructions\": null, \"userCondition\": null, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"a4ffc670-f936-4954-acc3-2dee26459ad0\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"e65df9b6-f654-4750-b847-46e355ec1c39\", \"required\": false, \"dateAdded\": \"2024-11-21T11:17:22+00:00\", \"instructions\": null, \"userCondition\": null, \"elementCondition\": null}, {\"uid\": \"c5cecdf0-5e26-4073-a6b3-778909af5e23\", \"type\": \"craft\\\\fieldlayoutelements\\\\HorizontalRule\", \"dateAdded\": \"2024-11-21T11:17:22+00:00\", \"userCondition\": null, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"f69c1926-c263-487e-b4bb-384847319ff3\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"89a65ca6-59b1-4161-a8ca-e27dc33a1765\", \"required\": false, \"dateAdded\": \"2024-11-21T11:17:22+00:00\", \"instructions\": null, \"userCondition\": null, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": []}','2024-11-21 11:00:12','2026-05-12 13:06:05',NULL,'ed58fa35-c52e-4401-a717-a6d7812046e2'),(8,'craft\\elements\\GlobalSet','{\"tabs\": [{\"uid\": \"cc5723ba-7c84-4da6-a5b8-68e5697736bb\", \"name\": \"Navigation\", \"elements\": [{\"tip\": null, \"uid\": \"dee3fe35-01d3-436c-87ad-8f066b34c4e2\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"1d1e70bf-a278-465e-a64d-dfaa1661e193\", \"required\": false, \"dateAdded\": \"2024-11-21T11:16:13+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2024-11-21 11:01:01','2026-05-12 13:06:05',NULL,'2caa2653-3e02-4c78-a3d6-1d35a060249c'),(9,'craft\\elements\\GlobalSet','{\"tabs\": [{\"uid\": \"cab63d02-41ef-4960-a069-c92a1bba0e60\", \"name\": \"Cookies\", \"elements\": [{\"tip\": null, \"uid\": \"64fb395e-4c26-4cb7-a276-d74762f52393\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"f0d61459-f155-4f36-a8ba-74cafea22385\", \"required\": false, \"dateAdded\": \"2024-11-21T11:21:15+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": []}','2024-11-21 11:01:11','2024-11-21 11:21:15','2025-09-02 09:19:04','ce560dbe-3fac-488d-ae0d-a4d4e591a846'),(10,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"6f167188-2895-4059-b531-5cd128731cec\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"049215a6-0809-4ded-8628-d744442ba388\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2024-11-21T11:34:05+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"12496b7a-492c-49d2-920f-70ed92cae716\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"36dca454-5bf3-422e-b397-abb58dda5bbc\", \"required\": false, \"dateAdded\": \"2024-11-21T11:37:30+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"caf879af-32f8-4f98-bd3a-8f41982b1435\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"7104f57b-112f-4c96-84cf-eda1c75fe796\", \"required\": false, \"dateAdded\": \"2024-11-21T11:37:30+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"561bc70a-8092-49ef-b0ec-2a5eb6f7759f\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"67df4def-30b8-4e8b-82b0-b01e4b5b783a\", \"required\": false, \"dateAdded\": \"2026-05-12T09:12:39+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2024-11-21 11:37:30','2026-05-12 13:06:05',NULL,'c0d92897-db22-49be-974c-56ec3017caa1'),(11,'craft\\elements\\GlobalSet','{\"tabs\": [{\"uid\": \"52127a3f-d4bd-4aa4-88f8-2ef32f651e08\", \"name\": \"Content\", \"elements\": [{\"tip\": null, \"uid\": \"ad881dfe-42ec-48be-97a8-2f77e41836bb\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"7104f57b-112f-4c96-84cf-eda1c75fe796\", \"required\": false, \"dateAdded\": \"2025-09-02T08:30:17+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"da78d877-afba-4dc3-856d-5168a43c9963\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"aa2ef690-cdae-4baa-882a-4ff5431f482e\", \"required\": false, \"dateAdded\": \"2025-09-02T08:30:17+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": []}','2025-09-02 08:30:17','2025-09-02 08:30:17','2025-09-02 09:19:07','2b7c3023-8847-4cb5-ada4-88fa46109ca2'),(12,'craft\\elements\\GlobalSet','{\"tabs\": [{\"uid\": \"510aec73-2133-4191-971a-f8148b6107b2\", \"name\": \"Content\", \"elements\": [{\"tip\": null, \"uid\": \"47590d60-13b0-48b2-b2e3-e83d6a93858d\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"5365ef59-c050-4702-82ab-876962749a48\", \"required\": false, \"dateAdded\": \"2025-09-02T08:36:03+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"8ab09fc4-330f-42c1-a257-bfe6aeca67ab\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"5228acaf-dbbf-4aac-b0b0-0c1c55e94b4a\", \"required\": false, \"dateAdded\": \"2025-09-02T08:36:03+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"fce27730-a622-4dac-823e-8a4a2c45b335\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"e344ac15-6d4b-4dca-a3e3-a23af0036956\", \"required\": false, \"dateAdded\": \"2025-09-02T08:36:03+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"56664950-d907-4b02-9d03-9add295aef7b\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"e9bcbfad-06b8-466d-b605-34bb3a34f00f\", \"required\": false, \"dateAdded\": \"2025-09-02T08:36:03+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": []}','2025-09-02 08:36:03','2026-05-12 13:06:05',NULL,'cfcc9c1e-793c-4d63-863f-774b22317379'),(13,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"b16db417-39ca-4608-a520-89d6c033925f\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"59c70d7a-4ba5-4ecd-a46a-1e51e61a6f67\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2025-09-02T09:05:00+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"f028c411-13cc-469e-b3c7-1d284796f4b7\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"4e467547-468e-4edb-9dcb-04801550f11d\", \"required\": false, \"dateAdded\": \"2025-09-02T09:06:38+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2025-09-02 09:06:38','2026-05-12 13:06:05',NULL,'cd476df0-d237-4f52-b074-ea68a5decf87'),(14,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"8476b04f-d837-4bc7-b09a-85bc9046958e\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"d616998c-2bcc-44fa-8f48-f7ab2b140706\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2025-09-02T09:08:44+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"5f0c8aa2-c460-4b4b-8cc0-a8dd646b4e38\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"4e467547-468e-4edb-9dcb-04801550f11d\", \"required\": false, \"dateAdded\": \"2025-09-30T10:24:22+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2025-09-02 09:10:16','2026-05-12 13:06:05',NULL,'f20851c3-dece-4efd-bc02-56b6ef744885'),(15,'craft\\elements\\GlobalSet','{\"tabs\": [{\"uid\": \"52fd3633-c17f-428b-a3ca-cf9dd86c0933\", \"name\": \"Content\", \"elements\": [{\"tip\": null, \"uid\": \"43f8ef0d-e0a1-4b93-a1bb-4b4b60bddbae\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"8319de11-8b0e-487f-83c2-5032ef70e346\", \"required\": false, \"dateAdded\": \"2025-09-02T09:11:42+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2025-09-02 09:11:42','2026-05-12 13:06:05',NULL,'aafd35a5-c763-4a8d-a028-6b8b617cae7e'),(16,'craft\\elements\\Category','{\"tabs\": [{\"uid\": \"c237bf8e-5a87-4740-99fc-55829ebdabcc\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"d488161b-c6d2-4746-b86b-866d5d5d3abd\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\TitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"dateAdded\": \"2026-05-12T09:10:27+00:00\", \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-05-12 09:11:38','2026-05-12 13:06:05',NULL,'6d886ceb-2d36-47f5-b949-0fc0c63ec58c');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fields` VALUES (1,'Alt Text','altText','global',NULL,NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2024-11-21 10:23:01','2024-11-21 10:23:01',NULL,'da87989f-6fba-4fb3-afae-2501b651f019'),(2,'Copyright','copyright','global',NULL,NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2024-11-21 10:23:28','2024-11-21 10:23:28',NULL,'bebc23d5-2d50-4499-ae0d-6aa66437be5e'),(3,'Website Title','websiteTitle','global',NULL,NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2024-11-21 11:07:17','2024-11-21 11:07:17',NULL,'5365ef59-c050-4702-82ab-876962749a48'),(4,'Website Description','websiteDescription','global',NULL,NULL,0,'none',NULL,'craft\\ckeditor\\Field','{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"ckeConfig\":\"05c6e9dc-1fc7-46a8-bbee-2c8138640bd8\",\"createButtonLabel\":null,\"defaultTransform\":null,\"enableSourceEditingForNonAdmins\":false,\"purifierConfig\":null,\"purifyHtml\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"showWordCount\":false,\"wordLimit\":null}','2024-11-21 11:07:29','2024-11-21 11:42:15',NULL,'5228acaf-dbbf-4aac-b0b0-0c1c55e94b4a'),(5,'Website Contact','websiteContact','global',NULL,NULL,0,'none',NULL,'craft\\ckeditor\\Field','{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"ckeConfig\":\"5e0d7bb4-8904-49ac-ac02-07a8b46945db\",\"createButtonLabel\":null,\"defaultTransform\":null,\"enableSourceEditingForNonAdmins\":false,\"purifierConfig\":null,\"purifyHtml\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"showWordCount\":false,\"wordLimit\":null}','2024-11-21 11:09:11','2024-11-21 11:09:11',NULL,'e65df9b6-f654-4750-b847-46e355ec1c39'),(6,'Website Social Links','websiteSocialLinks','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Table','{\"staticRows\":false,\"addRowLabel\":\"Add a row\",\"maxRows\":null,\"minRows\":null,\"columns\":{\"col2\":{\"heading\":\"Name\",\"handle\":\"name\",\"width\":\"\",\"type\":\"singleline\"},\"col3\":{\"heading\":\"URL\",\"handle\":\"url\",\"width\":\"\",\"type\":\"url\"}},\"defaults\":null}','2024-11-21 11:11:21','2024-11-25 13:46:00',NULL,'89a65ca6-59b1-4161-a8ca-e27dc33a1765'),(7,'Navigation','navigation','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Entries','{\"allowSelfRelations\":false,\"branchLimit\":null,\"maintainHierarchy\":false,\"maxRelations\":null,\"minRelations\":null,\"selectionLabel\":null,\"showCardsInGrid\":false,\"showSiteMenu\":false,\"sources\":[\"singles\"],\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2024-11-21 11:15:27','2024-11-21 11:15:27',NULL,'1d1e70bf-a278-465e-a64d-dfaa1661e193'),(8,'Footer','footer','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Entries','{\"allowSelfRelations\":false,\"branchLimit\":null,\"maintainHierarchy\":false,\"maxRelations\":null,\"minRelations\":null,\"selectionLabel\":null,\"showCardsInGrid\":false,\"showSiteMenu\":true,\"sources\":[\"singles\"],\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2024-11-21 11:15:50','2024-11-25 09:02:22',NULL,'8319de11-8b0e-487f-83c2-5032ef70e346'),(9,'Website Privacy Policy','websitePrivacyPolicy','global',NULL,NULL,0,'none',NULL,'craft\\ckeditor\\Field','{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"ckeConfig\":\"5e0d7bb4-8904-49ac-ac02-07a8b46945db\",\"createButtonLabel\":null,\"defaultTransform\":null,\"enableSourceEditingForNonAdmins\":false,\"purifierConfig\":null,\"purifyHtml\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"showWordCount\":false,\"wordLimit\":null}','2024-11-21 11:20:50','2024-11-21 11:20:50',NULL,'f0d61459-f155-4f36-a8ba-74cafea22385'),(10,'Image','image','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Assets','{\"restrictLocation\":false,\"restrictedLocationSource\":\"volume:21950e08-1320-46dd-b9f3-8ddae1b3aa50\",\"restrictedLocationSubpath\":null,\"allowSubfolders\":false,\"restrictedDefaultUploadSubpath\":null,\"defaultUploadLocationSource\":\"volume:21950e08-1320-46dd-b9f3-8ddae1b3aa50\",\"defaultUploadLocationSubpath\":null,\"allowUploads\":true,\"restrictFiles\":true,\"allowedKinds\":[\"image\"],\"showUnpermittedVolumes\":false,\"showUnpermittedFiles\":false,\"previewMode\":\"full\",\"allowSelfRelations\":false,\"maxRelations\":1,\"minRelations\":null,\"selectionLabel\":null,\"showSiteMenu\":true,\"sources\":[\"volume:21950e08-1320-46dd-b9f3-8ddae1b3aa50\"],\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"large\",\"showCardsInGrid\":false,\"maintainHierarchy\":false,\"branchLimit\":null}','2024-11-21 11:23:49','2024-11-27 09:24:00',NULL,'36dca454-5bf3-422e-b397-abb58dda5bbc'),(11,'Image Gallery','imageGallery','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":[\"image\"],\"branchLimit\":null,\"defaultUploadLocationSource\":\"volume:21950e08-1320-46dd-b9f3-8ddae1b3aa50\",\"defaultUploadLocationSubpath\":null,\"maintainHierarchy\":false,\"maxRelations\":null,\"minRelations\":null,\"previewMode\":\"thumbs\",\"restrictFiles\":true,\"restrictLocation\":false,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:21950e08-1320-46dd-b9f3-8ddae1b3aa50\",\"restrictedLocationSubpath\":null,\"selectionLabel\":null,\"showCardsInGrid\":false,\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"sources\":[\"volume:21950e08-1320-46dd-b9f3-8ddae1b3aa50\"],\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"large\"}','2024-11-21 11:25:46','2024-11-21 11:25:46',NULL,'94105fd8-47a5-4c58-9ac1-b9bdc86ac4e4'),(12,'Email','email','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Email','{\"placeholder\":\"example@email.com\"}','2024-11-21 11:26:27','2024-11-21 11:27:32',NULL,'5416109a-5864-4bdf-9179-ee951c51cfd8'),(13,'Phone Number','phoneNumber','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Link','{\"maxLength\":255,\"showLabelField\":false,\"showTargetField\":false,\"types\":[\"tel\"]}','2024-11-21 11:27:10','2024-11-21 11:27:10',NULL,'4f9ce81c-6377-48f1-8b5b-b5b2daefb9c1'),(14,'External Link URL','externalLinkUrl','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Link','{\"maxLength\":255,\"showLabelField\":false,\"showTargetField\":true,\"typeSettings\":{\"url\":{\"allowRootRelativeUrls\":\"\",\"allowAnchors\":\"\"}},\"types\":[\"url\"]}','2024-11-21 11:28:14','2024-11-21 11:30:50',NULL,'1795220b-e9cf-41e2-814d-8c93f5dd0e30'),(15,'External Link Name','externalLinkName','global',NULL,NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2024-11-21 11:31:25','2024-11-21 11:31:25',NULL,'59142390-27d0-4780-8543-5bcfbef4549e'),(16,'Textfield with Links','textfieldWithLinks','global',NULL,NULL,0,'none',NULL,'craft\\ckeditor\\Field','{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"ckeConfig\":\"861c6252-90ad-422d-b3bc-8eb31c71d798\",\"createButtonLabel\":null,\"defaultTransform\":null,\"enableSourceEditingForNonAdmins\":false,\"purifierConfig\":null,\"purifyHtml\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"showWordCount\":false,\"wordLimit\":null}','2024-11-21 11:32:32','2024-11-21 11:33:40',NULL,'599c2594-7f7c-47e8-ab7f-5f15ea9d8f90'),(17,'Text','text','global',NULL,NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2024-11-21 11:33:01','2024-11-21 11:33:01',NULL,'a2cae9f8-a8d7-4405-bb16-8546f16f6e4c'),(18,'Textfield','textfield','global',NULL,NULL,0,'none',NULL,'craft\\ckeditor\\Field','{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"ckeConfig\":\"becfe5ca-3a1d-4962-8fc7-30c4caf3a387\",\"createButtonLabel\":null,\"defaultTransform\":null,\"enableSourceEditingForNonAdmins\":false,\"purifierConfig\":null,\"purifyHtml\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"showWordCount\":false,\"wordLimit\":null}','2024-11-21 11:33:22','2024-11-21 11:33:22',NULL,'7104f57b-112f-4c96-84cf-eda1c75fe796'),(19,'MA Card Title','maCardTitle','global',NULL,NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2024-11-21 11:36:48','2024-11-21 11:36:48',NULL,'4c70ff1a-21c6-4f84-81e5-b339b02e6f0d'),(20,'Imprint Textfield','imprintTextfield','global',NULL,NULL,0,'none',NULL,'craft\\ckeditor\\Field','{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"characterLimit\":null,\"ckeConfig\":\"f1f84e81-4f8a-443b-acac-309e7aac4ee4\",\"createButtonLabel\":null,\"defaultTransform\":null,\"expandEntryButtons\":false,\"fullGraphqlData\":true,\"parseEmbeds\":false,\"purifierConfig\":null,\"purifyHtml\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"showWordCount\":false,\"sourceEditingGroups\":[\"__ADMINS__\"],\"wordLimit\":null}','2025-09-02 08:30:05','2025-09-02 08:30:05',NULL,'aa2ef690-cdae-4baa-882a-4ff5431f482e'),(21,'Metadata Image','metadataImage','global',NULL,'Preview image (1200×630) shown when the page link is shared',0,'none',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":null,\"branchLimit\":null,\"defaultPlacement\":\"end\",\"defaultUploadLocationSource\":\"volume:21950e08-1320-46dd-b9f3-8ddae1b3aa50\",\"defaultUploadLocationSubpath\":null,\"maintainHierarchy\":false,\"maxRelations\":1,\"minRelations\":0,\"previewMode\":\"full\",\"restrictFiles\":false,\"restrictLocation\":false,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:21950e08-1320-46dd-b9f3-8ddae1b3aa50\",\"restrictedLocationSubpath\":null,\"selectionLabel\":null,\"showCardsInGrid\":false,\"showSearchInput\":true,\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"sources\":[\"volume:21950e08-1320-46dd-b9f3-8ddae1b3aa50\"],\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"large\"}','2025-09-02 08:33:12','2025-09-02 09:02:41',NULL,'e344ac15-6d4b-4dca-a3e3-a23af0036956'),(22,'Metadata List','metadataList','global',NULL,'Only add additional global meta tags here. Page-specific title and description tags are automatically pulled from each page, and adding them here can cause conflicts. Default global values can be set in the fields above',0,'none',NULL,'craft\\fields\\Table','{\"addRowLabel\":\"Add a row\",\"columns\":{\"col1\":{\"heading\":\"Type\",\"handle\":\"type\",\"width\":\"\",\"type\":\"select\"},\"col2\":{\"heading\":\"Description\",\"handle\":\"description\",\"width\":\"\",\"type\":\"singleline\"},\"col3\":{\"heading\":\"Content\",\"handle\":\"content\",\"width\":\"\",\"type\":\"singleline\"}},\"defaults\":[{\"col2\":\"\",\"col3\":\"\"}],\"maxRows\":null,\"minRows\":null,\"staticRows\":false}','2025-09-02 08:35:56','2025-09-02 08:35:56',NULL,'e9bcbfad-06b8-466d-b605-34bb3a34f00f'),(23,'Metadata Title','metadataTitle','global',NULL,NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2025-09-02 08:59:08','2025-09-02 08:59:08',NULL,'9fa6c3db-85f7-4431-831a-05a8249b0e26'),(24,'Metadata Description','metadataDescription','global',NULL,NULL,0,'none',NULL,'craft\\ckeditor\\Field','{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"characterLimit\":null,\"ckeConfig\":\"4c6e825a-41ed-4b29-b9e6-13d83e2d675d\",\"createButtonLabel\":null,\"defaultTransform\":null,\"expandEntryButtons\":false,\"fullGraphqlData\":true,\"parseEmbeds\":false,\"purifierConfig\":null,\"purifyHtml\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"showWordCount\":false,\"sourceEditingGroups\":[\"__ADMINS__\"],\"wordLimit\":null}','2025-09-02 09:00:07','2025-09-02 09:00:07',NULL,'614813c6-21cb-4c1a-bb3b-f1373d4c80fe'),(25,'Large Textfield','largeTextfield','global',NULL,NULL,0,'none',NULL,'craft\\ckeditor\\Field','{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"characterLimit\":null,\"ckeConfig\":\"f1f84e81-4f8a-443b-acac-309e7aac4ee4\",\"createButtonLabel\":null,\"defaultTransform\":null,\"expandEntryButtons\":false,\"fullGraphqlData\":true,\"parseEmbeds\":false,\"purifierConfig\":null,\"purifyHtml\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"showWordCount\":false,\"sourceEditingGroups\":[\"__ADMINS__\"],\"wordLimit\":null}','2025-09-02 09:06:34','2025-09-30 10:23:21',NULL,'4e467547-468e-4edb-9dcb-04801550f11d'),(26,'Accessibility Textfield','accessibilityTextfield','global',NULL,NULL,0,'none',NULL,'craft\\ckeditor\\Field','{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"characterLimit\":null,\"ckeConfig\":\"f1f84e81-4f8a-443b-acac-309e7aac4ee4\",\"createButtonLabel\":null,\"defaultTransform\":null,\"expandEntryButtons\":false,\"fullGraphqlData\":true,\"parseEmbeds\":false,\"purifierConfig\":null,\"purifyHtml\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"showWordCount\":false,\"sourceEditingGroups\":[\"__ADMINS__\"],\"wordLimit\":null}','2025-09-02 09:10:13','2025-09-02 09:10:13',NULL,'58523f1c-677f-41b7-8aa2-d44d638c8cfa'),(27,'Category Selection','categorySelection','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Categories','{\"allowSelfRelations\":false,\"branchLimit\":null,\"defaultPlacement\":\"end\",\"maintainHierarchy\":false,\"maxRelations\":1,\"minRelations\":1,\"selectionLabel\":null,\"showCardsInGrid\":false,\"showSearchInput\":true,\"showSiteMenu\":false,\"source\":\"group:ed370231-a5e5-4af1-bd6a-98735fcda9fb\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2026-05-12 09:12:37','2026-05-12 09:12:37',NULL,'67df4def-30b8-4e8b-82b0-b01e4b5b783a');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `globalsets` VALUES (17,'General','general',7,1,'2024-11-21 11:00:12','2024-11-21 11:00:48','c68104aa-08f5-44a5-a8c0-8aca3fba89eb'),(18,'Navigation','navigation',8,2,'2024-11-21 11:01:01','2024-11-21 11:01:01','3a3779ad-ff4a-43ac-9875-963dca20b4b7'),(19,'Privacy Policy','privacyPolicy',9,3,'2024-11-21 11:01:11','2024-11-21 11:21:15','5a93054a-9a30-4b95-873b-9ebec3115909'),(32,'Imprint','imprint',11,4,'2025-09-02 08:30:17','2025-09-02 08:30:17','3317591f-153a-44e1-921e-d5564fa7b492'),(33,'Metadata','metadata',12,5,'2025-09-02 08:36:03','2025-09-02 08:36:03','973845f1-1777-4565-9b1f-44ad04497aba'),(42,'Footer','footer',15,6,'2025-09-02 09:11:42','2025-09-02 09:11:42','329399c3-cf0b-4184-b8cf-111844590e07');
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `gqlschemas` VALUES (1,'Public Schema','[\"sites.731c4afc-3bf9-4c58-a826-7db0350cadfd:read\", \"sections.c3b49286-4ca2-4801-9d33-2a3e31e1807d:read\", \"sections.84547fdc-05c1-4c3c-a280-9b7fb6166e32:read\", \"categorygroups.ed370231-a5e5-4af1-bd6a-98735fcda9fb:read\", \"directive:parseRefs\", \"directive:transform\"]',1,'2026-05-12 09:22:38','2026-05-12 13:06:05','6f2accc6-1408-427b-9915-bf88cae559ae'),(2,'Private Schema','[\"sites.731c4afc-3bf9-4c58-a826-7db0350cadfd:read\", \"sections.c3b49286-4ca2-4801-9d33-2a3e31e1807d:read\", \"sections.84547fdc-05c1-4c3c-a280-9b7fb6166e32:read\", \"volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50:read\", \"categorygroups.ed370231-a5e5-4af1-bd6a-98735fcda9fb:read\", \"directive:parseRefs\", \"directive:transform\"]',0,'2026-05-12 12:37:50','2026-05-12 13:06:05','d14c53ef-ea52-463d-8c32-236dacabbc40');
/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqltokens`
--

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `gqltokens` VALUES (1,'Public Token','__PUBLIC__',0,NULL,NULL,NULL,'2026-05-12 10:13:38','2026-05-12 10:13:38','dc8702fd-e20f-4b91-8d1a-16ca5e3003d5'),(2,'Private Token','VcKuymGUzPRR7H615BKi3EiNcdXynq0h',1,NULL,'2026-05-12 12:39:22',2,'2026-05-12 12:38:27','2026-05-12 12:39:22','144bd476-ad3b-42fc-9289-17086993654e');
/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `imagetransforms`
--

LOCK TABLES `imagetransforms` WRITE;
/*!40000 ALTER TABLE `imagetransforms` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `imagetransforms` VALUES (1,'Image 1600x','image1600x','fit','center-center',1600,1600,'webp',35,'none',NULL,1,'2024-11-21 10:57:12','2024-11-21 10:34:00','2024-11-21 10:57:12','c26a36f0-36c6-42c0-99e0-aa0b4303441c'),(2,'Image 800x','image800x','fit','center-center',800,800,'webp',35,'none',NULL,1,'2024-11-21 10:34:51','2024-11-21 10:34:51','2024-11-21 10:34:51','69307dd8-eb06-43e3-8188-b4df5b23d2e1'),(3,'Thumbnail','thumbnail','fit','center-center',400,400,'webp',35,'none',NULL,1,'2024-11-21 10:56:49','2024-11-21 10:56:49','2024-11-21 10:56:49','c24954e3-8320-487b-87ac-8923abad84c2');
/*!40000 ALTER TABLE `imagetransforms` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `info` VALUES (1,'5.9.23','5.9.0.8',1,'kqelvxcsuvfs','3@zpuhsfcere','2024-11-20 15:56:40','2026-05-12 13:06:18','8bd8e83d-29b5-44f2-835d-174e8d6c711b');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `migrations` VALUES (1,'craft','Install','2024-11-20 15:56:41','2024-11-20 15:56:41','2024-11-20 15:56:41','fe1f3845-665e-41ac-a5d6-bac326aca940'),(2,'craft','m221101_115859_create_entries_authors_table','2024-11-20 15:56:41','2024-11-20 15:56:41','2024-11-20 15:56:41','89f9df81-0a8e-448f-9dde-6ec950dfe4e4'),(3,'craft','m221107_112121_add_max_authors_to_sections','2024-11-20 15:56:41','2024-11-20 15:56:41','2024-11-20 15:56:41','aa3fe9f0-69ba-4c47-9870-31412b5dbf47'),(4,'craft','m221205_082005_translatable_asset_alt_text','2024-11-20 15:56:41','2024-11-20 15:56:41','2024-11-20 15:56:41','d4df6e2c-44a8-4098-8b87-363c81623f66'),(5,'craft','m230314_110309_add_authenticator_table','2024-11-20 15:56:41','2024-11-20 15:56:41','2024-11-20 15:56:41','8d3f7afa-cecc-4378-9b8f-68054669f150'),(6,'craft','m230314_111234_add_webauthn_table','2024-11-20 15:56:41','2024-11-20 15:56:41','2024-11-20 15:56:41','a5ff9ccf-e740-48df-a942-daf921704f7c'),(7,'craft','m230503_120303_add_recoverycodes_table','2024-11-20 15:56:41','2024-11-20 15:56:41','2024-11-20 15:56:41','2a1edfb2-d96b-4522-ae3b-6e5c88e2b700'),(8,'craft','m230511_000000_field_layout_configs','2024-11-20 15:56:41','2024-11-20 15:56:41','2024-11-20 15:56:41','fff62a5a-9108-49c3-9020-f7b8ad100ae7'),(9,'craft','m230511_215903_content_refactor','2024-11-20 15:56:41','2024-11-20 15:56:41','2024-11-20 15:56:41','c0970fb3-c664-4f25-8b4e-6b46c616df3b'),(10,'craft','m230524_000000_add_entry_type_show_slug_field','2024-11-20 15:56:41','2024-11-20 15:56:41','2024-11-20 15:56:41','049f3543-48ba-4e10-ac76-2043030a3390'),(11,'craft','m230524_000001_entry_type_icons','2024-11-20 15:56:41','2024-11-20 15:56:41','2024-11-20 15:56:41','f3e4caec-a7b5-4733-8067-ef65e0fb682f'),(12,'craft','m230524_000002_entry_type_colors','2024-11-20 15:56:41','2024-11-20 15:56:41','2024-11-20 15:56:41','421afc45-4817-41a1-b259-fc06cefff34a'),(13,'craft','m230524_220029_global_entry_types','2024-11-20 15:56:41','2024-11-20 15:56:41','2024-11-20 15:56:41','c139fed5-5901-4323-abb8-572966b7a742'),(14,'craft','m230531_123004_add_entry_type_show_status_field','2024-11-20 15:56:41','2024-11-20 15:56:41','2024-11-20 15:56:41','18abedf2-4fd1-4a46-96ef-c515b05ef38f'),(15,'craft','m230607_102049_add_entrytype_slug_translation_columns','2024-11-20 15:56:41','2024-11-20 15:56:41','2024-11-20 15:56:41','24222f55-e8dd-4dac-85bd-6175fdad693d'),(16,'craft','m230616_173810_kill_field_groups','2024-11-20 15:56:41','2024-11-20 15:56:41','2024-11-20 15:56:41','cf3ed0cb-6552-4c5f-9773-9758289e2eca'),(17,'craft','m230616_183820_remove_field_name_limit','2024-11-20 15:56:41','2024-11-20 15:56:41','2024-11-20 15:56:41','b907772b-4fae-441b-a384-7a2d6cf939ed'),(18,'craft','m230617_070415_entrify_matrix_blocks','2024-11-20 15:56:41','2024-11-20 15:56:41','2024-11-20 15:56:41','0a1dee3c-d288-4824-90b9-27e6b1387949'),(19,'craft','m230710_162700_element_activity','2024-11-20 15:56:41','2024-11-20 15:56:41','2024-11-20 15:56:41','2c2db5c0-b616-466d-ae7a-5468766f1e65'),(20,'craft','m230820_162023_fix_cache_id_type','2024-11-20 15:56:41','2024-11-20 15:56:41','2024-11-20 15:56:41','118296a2-0ae6-4307-b97d-c62f3b86f3ae'),(21,'craft','m230826_094050_fix_session_id_type','2024-11-20 15:56:41','2024-11-20 15:56:41','2024-11-20 15:56:41','7b345b43-c74f-48a0-8133-3c5834035576'),(22,'craft','m230904_190356_address_fields','2024-11-20 15:56:41','2024-11-20 15:56:41','2024-11-20 15:56:41','7b08389c-c64a-4489-9c54-fabb9fffecb5'),(23,'craft','m230928_144045_add_subpath_to_volumes','2024-11-20 15:56:41','2024-11-20 15:56:41','2024-11-20 15:56:41','fe19b4bb-a4ad-4bcb-ae39-ab31ae506180'),(24,'craft','m231013_185640_changedfields_amend_primary_key','2024-11-20 15:56:41','2024-11-20 15:56:41','2024-11-20 15:56:41','54cd1b0c-b909-4362-86ec-ae31e43682e3'),(25,'craft','m231213_030600_element_bulk_ops','2024-11-20 15:56:41','2024-11-20 15:56:41','2024-11-20 15:56:41','a8edf914-1b27-425a-8504-3a6f6035e657'),(26,'craft','m240129_150719_sites_language_amend_length','2024-11-20 15:56:41','2024-11-20 15:56:41','2024-11-20 15:56:41','32dab9c0-5f4d-4ef2-8ff5-a0b9d1cb4b93'),(27,'craft','m240206_035135_convert_json_columns','2024-11-20 15:56:41','2024-11-20 15:56:41','2024-11-20 15:56:41','09bbac4e-9250-4788-a088-03c4a8859eb0'),(28,'craft','m240207_182452_address_line_3','2024-11-20 15:56:41','2024-11-20 15:56:41','2024-11-20 15:56:41','8370e201-2c7c-4a19-bb02-8c262e069b44'),(29,'craft','m240302_212719_solo_preview_targets','2024-11-20 15:56:41','2024-11-20 15:56:41','2024-11-20 15:56:41','656c8c6b-dfbe-4565-9928-4364fd0028e0'),(30,'craft','m240619_091352_add_auth_2fa_timestamp','2024-11-20 15:56:41','2024-11-20 15:56:41','2024-11-20 15:56:41','838d450b-78d1-4758-9a15-b402ece2eec8'),(31,'craft','m240723_214330_drop_bulkop_fk','2024-11-20 15:56:41','2024-11-20 15:56:41','2024-11-20 15:56:41','0062c406-8b90-458c-b151-367cb3ef8dba'),(32,'craft','m240731_053543_soft_delete_fields','2024-11-20 15:56:41','2024-11-20 15:56:41','2024-11-20 15:56:41','ecd9c45d-e5e0-475f-b849-289e802b98ee'),(33,'craft','m240805_154041_sso_identities','2024-11-20 15:56:41','2024-11-20 15:56:41','2024-11-20 15:56:41','9875cb59-b39c-4989-ae5e-d32fe58316dc'),(34,'craft','m240926_202248_track_entries_deleted_with_section','2024-11-20 15:56:41','2024-11-20 15:56:41','2024-11-20 15:56:41','53ce12d6-d20f-402e-bfb2-1bee2d99111b'),(35,'plugin:ckeditor','Install','2024-11-21 08:42:28','2024-11-21 08:42:28','2024-11-21 08:42:28','1b9a4987-8d68-4585-b793-68a0879bef51'),(36,'plugin:ckeditor','m230408_163704_v3_upgrade','2024-11-21 08:42:28','2024-11-21 08:42:28','2024-11-21 08:42:28','86c11179-816d-4f94-9a13-3d8f5fd27286'),(37,'craft','m241120_190905_user_affiliated_sites','2025-09-02 08:14:37','2025-09-02 08:14:37','2025-09-02 08:14:37','b83944de-337d-4b93-a815-4f6ff716d993'),(38,'craft','m241125_122914_add_viewUsers_permission','2025-09-02 08:14:37','2025-09-02 08:14:37','2025-09-02 08:14:37','cecd899d-ab9d-409c-b263-d305458e5cf7'),(39,'craft','m250119_135304_entry_type_overrides','2025-09-02 08:14:37','2025-09-02 08:14:37','2025-09-02 08:14:37','35369180-1805-440b-9369-4af1ee35a0ab'),(40,'craft','m250206_135036_search_index_queue','2025-09-02 08:14:37','2025-09-02 08:14:37','2025-09-02 08:14:37','fd07812f-d5cf-4de3-b36e-0b457e4d43fa'),(41,'craft','m250207_172349_bulkop_events','2025-09-02 08:14:37','2025-09-02 08:14:37','2025-09-02 08:14:37','c9cea209-a589-47e9-bd2d-b7a8182bb7a2'),(42,'craft','m250315_131608_unlimited_authors','2025-09-02 08:14:37','2025-09-02 08:14:37','2025-09-02 08:14:37','e439bf18-c062-4a73-859b-708bba0234de'),(43,'craft','m250403_171253_static_statuses','2025-09-02 08:14:37','2025-09-02 08:14:37','2025-09-02 08:14:37','9dc85e4f-aa3f-4ceb-9195-370295d9d040'),(44,'craft','m250512_164202_asset_mime_types','2025-09-02 08:46:12','2025-09-02 08:46:12','2025-09-02 08:46:12','d80ef81e-a3be-4cd5-8960-e4bb5f8658dd'),(45,'craft','m250522_090843_add_deleteEntriesForSite_and_deletePeerEntriesForSite_permissions','2025-09-02 08:46:12','2025-09-02 08:46:12','2025-09-02 08:46:12','a425ab4c-3b4b-4936-a2b1-f79bd3116d33'),(46,'craft','m250531_183058_content_blocks','2025-09-02 08:46:12','2025-09-02 08:46:12','2025-09-02 08:46:12','85e00169-6379-4326-ad62-ea635b831834'),(47,'craft','m250623_105031_entry_type_descriptions','2025-09-02 08:46:12','2025-09-02 08:46:12','2025-09-02 08:46:12','a49337ec-c7f6-432a-b968-bacce96a0b32'),(48,'craft','m250910_144630_add_elements_owners_sort_order_index','2026-05-12 13:06:05','2026-05-12 13:06:05','2026-05-12 13:06:05','352a7c56-cc7a-459c-829e-69b06e525405'),(49,'craft','m251030_203440_drop_widgets_enabled_column','2026-05-12 13:06:05','2026-05-12 13:06:05','2026-05-12 13:06:05','7d14642b-af69-48ec-982a-cd9999e3c9ed'),(50,'craft','m251110_192405_entry_type_ui_label_formats','2026-05-12 13:06:05','2026-05-12 13:06:05','2026-05-12 13:06:05','9cbd39f5-f148-4614-81d1-2b6a3107696f'),(51,'craft','m251205_190131_drop_searchindexqueue_fk','2026-05-12 13:06:05','2026-05-12 13:06:05','2026-05-12 13:06:05','d870b0dd-8263-4177-902b-5ec92ae16083'),(52,'craft','m251230_192239_update_field_layouts','2026-05-12 13:06:05','2026-05-12 13:06:05','2026-05-12 13:06:05','e069283f-a966-4523-8b83-2e4c35df37ae'),(53,'craft','m260106_130629_directive_schema_components','2026-05-12 13:06:05','2026-05-12 13:06:05','2026-05-12 13:06:05','4b832ba2-0ac3-4b26-8c8f-fdb423a32b99'),(54,'craft','m260120_120907_line_breaks_in_titles','2026-05-12 13:06:05','2026-05-12 13:06:05','2026-05-12 13:06:05','5ba6db5a-570b-41fa-a3af-4568f31915bb'),(55,'craft','m260125_233614_changeAuthorForPeerEntries_permission','2026-05-12 13:06:05','2026-05-12 13:06:05','2026-05-12 13:06:05','7a0d700b-1bc6-45bf-96e0-1a7102f4c1ef');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `plugins` VALUES (1,'ckeditor','4.9.0','3.0.0.0','2024-11-21 08:42:28','2024-11-21 08:42:28','2025-09-02 08:05:46','dec4b1e1-ab6a-4580-a27d-207d4624ab39'),(2,'cp-field-inspect','2.0.4','1.0.0','2024-11-21 08:43:09','2024-11-21 08:43:09','2025-09-02 08:05:46','d25940f4-56d5-4906-a4e8-b6f76eb7adf6');
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `projectconfig` VALUES ('categoryGroups.ed370231-a5e5-4af1-bd6a-98735fcda9fb.defaultPlacement','\"end\"'),('categoryGroups.ed370231-a5e5-4af1-bd6a-98735fcda9fb.fieldLayouts.6d886ceb-2d36-47f5-b949-0fc0c63ec58c.cardThumbAlignment','\"end\"'),('categoryGroups.ed370231-a5e5-4af1-bd6a-98735fcda9fb.fieldLayouts.6d886ceb-2d36-47f5-b949-0fc0c63ec58c.tabs.0.elementCondition','null'),('categoryGroups.ed370231-a5e5-4af1-bd6a-98735fcda9fb.fieldLayouts.6d886ceb-2d36-47f5-b949-0fc0c63ec58c.tabs.0.elements.0.autocapitalize','true'),('categoryGroups.ed370231-a5e5-4af1-bd6a-98735fcda9fb.fieldLayouts.6d886ceb-2d36-47f5-b949-0fc0c63ec58c.tabs.0.elements.0.autocomplete','false'),('categoryGroups.ed370231-a5e5-4af1-bd6a-98735fcda9fb.fieldLayouts.6d886ceb-2d36-47f5-b949-0fc0c63ec58c.tabs.0.elements.0.autocorrect','true'),('categoryGroups.ed370231-a5e5-4af1-bd6a-98735fcda9fb.fieldLayouts.6d886ceb-2d36-47f5-b949-0fc0c63ec58c.tabs.0.elements.0.class','null'),('categoryGroups.ed370231-a5e5-4af1-bd6a-98735fcda9fb.fieldLayouts.6d886ceb-2d36-47f5-b949-0fc0c63ec58c.tabs.0.elements.0.dateAdded','\"2026-05-12T09:10:27+00:00\"'),('categoryGroups.ed370231-a5e5-4af1-bd6a-98735fcda9fb.fieldLayouts.6d886ceb-2d36-47f5-b949-0fc0c63ec58c.tabs.0.elements.0.disabled','false'),('categoryGroups.ed370231-a5e5-4af1-bd6a-98735fcda9fb.fieldLayouts.6d886ceb-2d36-47f5-b949-0fc0c63ec58c.tabs.0.elements.0.elementCondition','null'),('categoryGroups.ed370231-a5e5-4af1-bd6a-98735fcda9fb.fieldLayouts.6d886ceb-2d36-47f5-b949-0fc0c63ec58c.tabs.0.elements.0.id','null'),('categoryGroups.ed370231-a5e5-4af1-bd6a-98735fcda9fb.fieldLayouts.6d886ceb-2d36-47f5-b949-0fc0c63ec58c.tabs.0.elements.0.inputType','null'),('categoryGroups.ed370231-a5e5-4af1-bd6a-98735fcda9fb.fieldLayouts.6d886ceb-2d36-47f5-b949-0fc0c63ec58c.tabs.0.elements.0.instructions','null'),('categoryGroups.ed370231-a5e5-4af1-bd6a-98735fcda9fb.fieldLayouts.6d886ceb-2d36-47f5-b949-0fc0c63ec58c.tabs.0.elements.0.label','null'),('categoryGroups.ed370231-a5e5-4af1-bd6a-98735fcda9fb.fieldLayouts.6d886ceb-2d36-47f5-b949-0fc0c63ec58c.tabs.0.elements.0.max','null'),('categoryGroups.ed370231-a5e5-4af1-bd6a-98735fcda9fb.fieldLayouts.6d886ceb-2d36-47f5-b949-0fc0c63ec58c.tabs.0.elements.0.min','null'),('categoryGroups.ed370231-a5e5-4af1-bd6a-98735fcda9fb.fieldLayouts.6d886ceb-2d36-47f5-b949-0fc0c63ec58c.tabs.0.elements.0.name','null'),('categoryGroups.ed370231-a5e5-4af1-bd6a-98735fcda9fb.fieldLayouts.6d886ceb-2d36-47f5-b949-0fc0c63ec58c.tabs.0.elements.0.orientation','null'),('categoryGroups.ed370231-a5e5-4af1-bd6a-98735fcda9fb.fieldLayouts.6d886ceb-2d36-47f5-b949-0fc0c63ec58c.tabs.0.elements.0.placeholder','null'),('categoryGroups.ed370231-a5e5-4af1-bd6a-98735fcda9fb.fieldLayouts.6d886ceb-2d36-47f5-b949-0fc0c63ec58c.tabs.0.elements.0.readonly','false'),('categoryGroups.ed370231-a5e5-4af1-bd6a-98735fcda9fb.fieldLayouts.6d886ceb-2d36-47f5-b949-0fc0c63ec58c.tabs.0.elements.0.requirable','false'),('categoryGroups.ed370231-a5e5-4af1-bd6a-98735fcda9fb.fieldLayouts.6d886ceb-2d36-47f5-b949-0fc0c63ec58c.tabs.0.elements.0.size','null'),('categoryGroups.ed370231-a5e5-4af1-bd6a-98735fcda9fb.fieldLayouts.6d886ceb-2d36-47f5-b949-0fc0c63ec58c.tabs.0.elements.0.step','null'),('categoryGroups.ed370231-a5e5-4af1-bd6a-98735fcda9fb.fieldLayouts.6d886ceb-2d36-47f5-b949-0fc0c63ec58c.tabs.0.elements.0.tip','null'),('categoryGroups.ed370231-a5e5-4af1-bd6a-98735fcda9fb.fieldLayouts.6d886ceb-2d36-47f5-b949-0fc0c63ec58c.tabs.0.elements.0.title','null'),('categoryGroups.ed370231-a5e5-4af1-bd6a-98735fcda9fb.fieldLayouts.6d886ceb-2d36-47f5-b949-0fc0c63ec58c.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\TitleField\"'),('categoryGroups.ed370231-a5e5-4af1-bd6a-98735fcda9fb.fieldLayouts.6d886ceb-2d36-47f5-b949-0fc0c63ec58c.tabs.0.elements.0.uid','\"d488161b-c6d2-4746-b86b-866d5d5d3abd\"'),('categoryGroups.ed370231-a5e5-4af1-bd6a-98735fcda9fb.fieldLayouts.6d886ceb-2d36-47f5-b949-0fc0c63ec58c.tabs.0.elements.0.userCondition','null'),('categoryGroups.ed370231-a5e5-4af1-bd6a-98735fcda9fb.fieldLayouts.6d886ceb-2d36-47f5-b949-0fc0c63ec58c.tabs.0.elements.0.warning','null'),('categoryGroups.ed370231-a5e5-4af1-bd6a-98735fcda9fb.fieldLayouts.6d886ceb-2d36-47f5-b949-0fc0c63ec58c.tabs.0.elements.0.width','100'),('categoryGroups.ed370231-a5e5-4af1-bd6a-98735fcda9fb.fieldLayouts.6d886ceb-2d36-47f5-b949-0fc0c63ec58c.tabs.0.name','\"Content\"'),('categoryGroups.ed370231-a5e5-4af1-bd6a-98735fcda9fb.fieldLayouts.6d886ceb-2d36-47f5-b949-0fc0c63ec58c.tabs.0.uid','\"c237bf8e-5a87-4740-99fc-55829ebdabcc\"'),('categoryGroups.ed370231-a5e5-4af1-bd6a-98735fcda9fb.fieldLayouts.6d886ceb-2d36-47f5-b949-0fc0c63ec58c.tabs.0.userCondition','null'),('categoryGroups.ed370231-a5e5-4af1-bd6a-98735fcda9fb.handle','\"exampleCategory\"'),('categoryGroups.ed370231-a5e5-4af1-bd6a-98735fcda9fb.name','\"Example Category\"'),('categoryGroups.ed370231-a5e5-4af1-bd6a-98735fcda9fb.siteSettings.731c4afc-3bf9-4c58-a826-7db0350cadfd.hasUrls','true'),('categoryGroups.ed370231-a5e5-4af1-bd6a-98735fcda9fb.siteSettings.731c4afc-3bf9-4c58-a826-7db0350cadfd.template','\"example-category/_category.twig\"'),('categoryGroups.ed370231-a5e5-4af1-bd6a-98735fcda9fb.siteSettings.731c4afc-3bf9-4c58-a826-7db0350cadfd.uriFormat','\"example-category/{slug}\"'),('categoryGroups.ed370231-a5e5-4af1-bd6a-98735fcda9fb.structure.maxLevels','null'),('categoryGroups.ed370231-a5e5-4af1-bd6a-98735fcda9fb.structure.uid','\"ca744c8a-dd4b-4521-939c-6a2f4083e003\"'),('ckeditor.configs.05c6e9dc-1fc7-46a8-bbee-2c8138640bd8.headingLevels','false'),('ckeditor.configs.05c6e9dc-1fc7-46a8-bbee-2c8138640bd8.name','\"Bold\"'),('ckeditor.configs.05c6e9dc-1fc7-46a8-bbee-2c8138640bd8.toolbar.0','\"bold\"'),('ckeditor.configs.05c6e9dc-1fc7-46a8-bbee-2c8138640bd8.toolbar.1','\"sourceEditing\"'),('ckeditor.configs.4c6e825a-41ed-4b29-b9e6-13d83e2d675d.headingLevels.0','1'),('ckeditor.configs.4c6e825a-41ed-4b29-b9e6-13d83e2d675d.headingLevels.1','2'),('ckeditor.configs.4c6e825a-41ed-4b29-b9e6-13d83e2d675d.headingLevels.2','3'),('ckeditor.configs.4c6e825a-41ed-4b29-b9e6-13d83e2d675d.headingLevels.3','4'),('ckeditor.configs.4c6e825a-41ed-4b29-b9e6-13d83e2d675d.headingLevels.4','5'),('ckeditor.configs.4c6e825a-41ed-4b29-b9e6-13d83e2d675d.headingLevels.5','6'),('ckeditor.configs.4c6e825a-41ed-4b29-b9e6-13d83e2d675d.name','\"plain\"'),('ckeditor.configs.4c6e825a-41ed-4b29-b9e6-13d83e2d675d.toolbar.0','\"code\"'),('ckeditor.configs.5e0d7bb4-8904-49ac-ac02-07a8b46945db.headingLevels','false'),('ckeditor.configs.5e0d7bb4-8904-49ac-ac02-07a8b46945db.name','\"Bold Italic\"'),('ckeditor.configs.5e0d7bb4-8904-49ac-ac02-07a8b46945db.toolbar.0','\"bold\"'),('ckeditor.configs.5e0d7bb4-8904-49ac-ac02-07a8b46945db.toolbar.1','\"italic\"'),('ckeditor.configs.5e0d7bb4-8904-49ac-ac02-07a8b46945db.toolbar.2','\"sourceEditing\"'),('ckeditor.configs.861c6252-90ad-422d-b3bc-8eb31c71d798.headingLevels','false'),('ckeditor.configs.861c6252-90ad-422d-b3bc-8eb31c71d798.name','\"Link\"'),('ckeditor.configs.861c6252-90ad-422d-b3bc-8eb31c71d798.toolbar.0','\"link\"'),('ckeditor.configs.861c6252-90ad-422d-b3bc-8eb31c71d798.toolbar.1','\"sourceEditing\"'),('ckeditor.configs.becfe5ca-3a1d-4962-8fc7-30c4caf3a387.headingLevels.0','1'),('ckeditor.configs.becfe5ca-3a1d-4962-8fc7-30c4caf3a387.headingLevels.1','2'),('ckeditor.configs.becfe5ca-3a1d-4962-8fc7-30c4caf3a387.headingLevels.2','3'),('ckeditor.configs.becfe5ca-3a1d-4962-8fc7-30c4caf3a387.headingLevels.3','4'),('ckeditor.configs.becfe5ca-3a1d-4962-8fc7-30c4caf3a387.headingLevels.4','5'),('ckeditor.configs.becfe5ca-3a1d-4962-8fc7-30c4caf3a387.headingLevels.5','6'),('ckeditor.configs.becfe5ca-3a1d-4962-8fc7-30c4caf3a387.name','\"Bold Link\"'),('ckeditor.configs.becfe5ca-3a1d-4962-8fc7-30c4caf3a387.toolbar.0','\"bold\"'),('ckeditor.configs.becfe5ca-3a1d-4962-8fc7-30c4caf3a387.toolbar.1','\"link\"'),('ckeditor.configs.becfe5ca-3a1d-4962-8fc7-30c4caf3a387.toolbar.2','\"sourceEditing\"'),('ckeditor.configs.ccff5e66-8f82-4233-a6da-2adaf6c97ced.headingLevels','false'),('ckeditor.configs.ccff5e66-8f82-4233-a6da-2adaf6c97ced.name','\"Italic\"'),('ckeditor.configs.ccff5e66-8f82-4233-a6da-2adaf6c97ced.toolbar.0','\"italic\"'),('ckeditor.configs.ccff5e66-8f82-4233-a6da-2adaf6c97ced.toolbar.1','\"sourceEditing\"'),('ckeditor.configs.f1f84e81-4f8a-443b-acac-309e7aac4ee4.headingLevels.0','5'),('ckeditor.configs.f1f84e81-4f8a-443b-acac-309e7aac4ee4.name','\"Bold Italic Link Bullets Headline\"'),('ckeditor.configs.f1f84e81-4f8a-443b-acac-309e7aac4ee4.toolbar.0','\"heading\"'),('ckeditor.configs.f1f84e81-4f8a-443b-acac-309e7aac4ee4.toolbar.1','\"bold\"'),('ckeditor.configs.f1f84e81-4f8a-443b-acac-309e7aac4ee4.toolbar.2','\"italic\"'),('ckeditor.configs.f1f84e81-4f8a-443b-acac-309e7aac4ee4.toolbar.3','\"bulletedList\"'),('ckeditor.configs.f1f84e81-4f8a-443b-acac-309e7aac4ee4.toolbar.4','\"link\"'),('ckeditor.configs.f1f84e81-4f8a-443b-acac-309e7aac4ee4.toolbar.5','\"|\"'),('ckeditor.configs.f1f84e81-4f8a-443b-acac-309e7aac4ee4.toolbar.6','\"code\"'),('dateModified','1778591165'),('email.fromEmail','\"base@left.studio\"'),('email.fromName','\"master-project\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('entryTypes.11dedd21-c9e4-4490-8ed2-ee30e10e3b4d.color','null'),('entryTypes.11dedd21-c9e4-4490-8ed2-ee30e10e3b4d.description','null'),('entryTypes.11dedd21-c9e4-4490-8ed2-ee30e10e3b4d.fieldLayouts.f20851c3-dece-4efd-bc02-56b6ef744885.cardThumbAlignment','\"end\"'),('entryTypes.11dedd21-c9e4-4490-8ed2-ee30e10e3b4d.fieldLayouts.f20851c3-dece-4efd-bc02-56b6ef744885.tabs.0.elementCondition','null'),('entryTypes.11dedd21-c9e4-4490-8ed2-ee30e10e3b4d.fieldLayouts.f20851c3-dece-4efd-bc02-56b6ef744885.tabs.0.elements.0.autocapitalize','true'),('entryTypes.11dedd21-c9e4-4490-8ed2-ee30e10e3b4d.fieldLayouts.f20851c3-dece-4efd-bc02-56b6ef744885.tabs.0.elements.0.autocomplete','false'),('entryTypes.11dedd21-c9e4-4490-8ed2-ee30e10e3b4d.fieldLayouts.f20851c3-dece-4efd-bc02-56b6ef744885.tabs.0.elements.0.autocorrect','true'),('entryTypes.11dedd21-c9e4-4490-8ed2-ee30e10e3b4d.fieldLayouts.f20851c3-dece-4efd-bc02-56b6ef744885.tabs.0.elements.0.class','null'),('entryTypes.11dedd21-c9e4-4490-8ed2-ee30e10e3b4d.fieldLayouts.f20851c3-dece-4efd-bc02-56b6ef744885.tabs.0.elements.0.dateAdded','\"2025-09-02T09:08:44+00:00\"'),('entryTypes.11dedd21-c9e4-4490-8ed2-ee30e10e3b4d.fieldLayouts.f20851c3-dece-4efd-bc02-56b6ef744885.tabs.0.elements.0.disabled','false'),('entryTypes.11dedd21-c9e4-4490-8ed2-ee30e10e3b4d.fieldLayouts.f20851c3-dece-4efd-bc02-56b6ef744885.tabs.0.elements.0.elementCondition','null'),('entryTypes.11dedd21-c9e4-4490-8ed2-ee30e10e3b4d.fieldLayouts.f20851c3-dece-4efd-bc02-56b6ef744885.tabs.0.elements.0.id','null'),('entryTypes.11dedd21-c9e4-4490-8ed2-ee30e10e3b4d.fieldLayouts.f20851c3-dece-4efd-bc02-56b6ef744885.tabs.0.elements.0.inputType','null'),('entryTypes.11dedd21-c9e4-4490-8ed2-ee30e10e3b4d.fieldLayouts.f20851c3-dece-4efd-bc02-56b6ef744885.tabs.0.elements.0.instructions','null'),('entryTypes.11dedd21-c9e4-4490-8ed2-ee30e10e3b4d.fieldLayouts.f20851c3-dece-4efd-bc02-56b6ef744885.tabs.0.elements.0.label','null'),('entryTypes.11dedd21-c9e4-4490-8ed2-ee30e10e3b4d.fieldLayouts.f20851c3-dece-4efd-bc02-56b6ef744885.tabs.0.elements.0.max','null'),('entryTypes.11dedd21-c9e4-4490-8ed2-ee30e10e3b4d.fieldLayouts.f20851c3-dece-4efd-bc02-56b6ef744885.tabs.0.elements.0.min','null'),('entryTypes.11dedd21-c9e4-4490-8ed2-ee30e10e3b4d.fieldLayouts.f20851c3-dece-4efd-bc02-56b6ef744885.tabs.0.elements.0.name','null'),('entryTypes.11dedd21-c9e4-4490-8ed2-ee30e10e3b4d.fieldLayouts.f20851c3-dece-4efd-bc02-56b6ef744885.tabs.0.elements.0.orientation','null'),('entryTypes.11dedd21-c9e4-4490-8ed2-ee30e10e3b4d.fieldLayouts.f20851c3-dece-4efd-bc02-56b6ef744885.tabs.0.elements.0.placeholder','null'),('entryTypes.11dedd21-c9e4-4490-8ed2-ee30e10e3b4d.fieldLayouts.f20851c3-dece-4efd-bc02-56b6ef744885.tabs.0.elements.0.readonly','false'),('entryTypes.11dedd21-c9e4-4490-8ed2-ee30e10e3b4d.fieldLayouts.f20851c3-dece-4efd-bc02-56b6ef744885.tabs.0.elements.0.required','true'),('entryTypes.11dedd21-c9e4-4490-8ed2-ee30e10e3b4d.fieldLayouts.f20851c3-dece-4efd-bc02-56b6ef744885.tabs.0.elements.0.size','null'),('entryTypes.11dedd21-c9e4-4490-8ed2-ee30e10e3b4d.fieldLayouts.f20851c3-dece-4efd-bc02-56b6ef744885.tabs.0.elements.0.step','null'),('entryTypes.11dedd21-c9e4-4490-8ed2-ee30e10e3b4d.fieldLayouts.f20851c3-dece-4efd-bc02-56b6ef744885.tabs.0.elements.0.tip','null'),('entryTypes.11dedd21-c9e4-4490-8ed2-ee30e10e3b4d.fieldLayouts.f20851c3-dece-4efd-bc02-56b6ef744885.tabs.0.elements.0.title','null'),('entryTypes.11dedd21-c9e4-4490-8ed2-ee30e10e3b4d.fieldLayouts.f20851c3-dece-4efd-bc02-56b6ef744885.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.11dedd21-c9e4-4490-8ed2-ee30e10e3b4d.fieldLayouts.f20851c3-dece-4efd-bc02-56b6ef744885.tabs.0.elements.0.uid','\"d616998c-2bcc-44fa-8f48-f7ab2b140706\"'),('entryTypes.11dedd21-c9e4-4490-8ed2-ee30e10e3b4d.fieldLayouts.f20851c3-dece-4efd-bc02-56b6ef744885.tabs.0.elements.0.userCondition','null'),('entryTypes.11dedd21-c9e4-4490-8ed2-ee30e10e3b4d.fieldLayouts.f20851c3-dece-4efd-bc02-56b6ef744885.tabs.0.elements.0.warning','null'),('entryTypes.11dedd21-c9e4-4490-8ed2-ee30e10e3b4d.fieldLayouts.f20851c3-dece-4efd-bc02-56b6ef744885.tabs.0.elements.0.width','100'),('entryTypes.11dedd21-c9e4-4490-8ed2-ee30e10e3b4d.fieldLayouts.f20851c3-dece-4efd-bc02-56b6ef744885.tabs.0.elements.1.dateAdded','\"2025-09-30T10:24:22+00:00\"'),('entryTypes.11dedd21-c9e4-4490-8ed2-ee30e10e3b4d.fieldLayouts.f20851c3-dece-4efd-bc02-56b6ef744885.tabs.0.elements.1.editCondition','null'),('entryTypes.11dedd21-c9e4-4490-8ed2-ee30e10e3b4d.fieldLayouts.f20851c3-dece-4efd-bc02-56b6ef744885.tabs.0.elements.1.elementCondition','null'),('entryTypes.11dedd21-c9e4-4490-8ed2-ee30e10e3b4d.fieldLayouts.f20851c3-dece-4efd-bc02-56b6ef744885.tabs.0.elements.1.fieldUid','\"4e467547-468e-4edb-9dcb-04801550f11d\"'),('entryTypes.11dedd21-c9e4-4490-8ed2-ee30e10e3b4d.fieldLayouts.f20851c3-dece-4efd-bc02-56b6ef744885.tabs.0.elements.1.handle','null'),('entryTypes.11dedd21-c9e4-4490-8ed2-ee30e10e3b4d.fieldLayouts.f20851c3-dece-4efd-bc02-56b6ef744885.tabs.0.elements.1.instructions','null'),('entryTypes.11dedd21-c9e4-4490-8ed2-ee30e10e3b4d.fieldLayouts.f20851c3-dece-4efd-bc02-56b6ef744885.tabs.0.elements.1.label','null'),('entryTypes.11dedd21-c9e4-4490-8ed2-ee30e10e3b4d.fieldLayouts.f20851c3-dece-4efd-bc02-56b6ef744885.tabs.0.elements.1.required','false'),('entryTypes.11dedd21-c9e4-4490-8ed2-ee30e10e3b4d.fieldLayouts.f20851c3-dece-4efd-bc02-56b6ef744885.tabs.0.elements.1.tip','null'),('entryTypes.11dedd21-c9e4-4490-8ed2-ee30e10e3b4d.fieldLayouts.f20851c3-dece-4efd-bc02-56b6ef744885.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.11dedd21-c9e4-4490-8ed2-ee30e10e3b4d.fieldLayouts.f20851c3-dece-4efd-bc02-56b6ef744885.tabs.0.elements.1.uid','\"5f0c8aa2-c460-4b4b-8cc0-a8dd646b4e38\"'),('entryTypes.11dedd21-c9e4-4490-8ed2-ee30e10e3b4d.fieldLayouts.f20851c3-dece-4efd-bc02-56b6ef744885.tabs.0.elements.1.userCondition','null'),('entryTypes.11dedd21-c9e4-4490-8ed2-ee30e10e3b4d.fieldLayouts.f20851c3-dece-4efd-bc02-56b6ef744885.tabs.0.elements.1.warning','null'),('entryTypes.11dedd21-c9e4-4490-8ed2-ee30e10e3b4d.fieldLayouts.f20851c3-dece-4efd-bc02-56b6ef744885.tabs.0.elements.1.width','100'),('entryTypes.11dedd21-c9e4-4490-8ed2-ee30e10e3b4d.fieldLayouts.f20851c3-dece-4efd-bc02-56b6ef744885.tabs.0.name','\"Content\"'),('entryTypes.11dedd21-c9e4-4490-8ed2-ee30e10e3b4d.fieldLayouts.f20851c3-dece-4efd-bc02-56b6ef744885.tabs.0.uid','\"8476b04f-d837-4bc7-b09a-85bc9046958e\"'),('entryTypes.11dedd21-c9e4-4490-8ed2-ee30e10e3b4d.fieldLayouts.f20851c3-dece-4efd-bc02-56b6ef744885.tabs.0.userCondition','null'),('entryTypes.11dedd21-c9e4-4490-8ed2-ee30e10e3b4d.handle','\"accessibility\"'),('entryTypes.11dedd21-c9e4-4490-8ed2-ee30e10e3b4d.hasTitleField','true'),('entryTypes.11dedd21-c9e4-4490-8ed2-ee30e10e3b4d.icon','null'),('entryTypes.11dedd21-c9e4-4490-8ed2-ee30e10e3b4d.name','\"Accessibility\"'),('entryTypes.11dedd21-c9e4-4490-8ed2-ee30e10e3b4d.showSlugField','true'),('entryTypes.11dedd21-c9e4-4490-8ed2-ee30e10e3b4d.showStatusField','true'),('entryTypes.11dedd21-c9e4-4490-8ed2-ee30e10e3b4d.slugTranslationKeyFormat','null'),('entryTypes.11dedd21-c9e4-4490-8ed2-ee30e10e3b4d.slugTranslationMethod','\"site\"'),('entryTypes.11dedd21-c9e4-4490-8ed2-ee30e10e3b4d.titleFormat','null'),('entryTypes.11dedd21-c9e4-4490-8ed2-ee30e10e3b4d.titleTranslationKeyFormat','null'),('entryTypes.11dedd21-c9e4-4490-8ed2-ee30e10e3b4d.titleTranslationMethod','\"site\"'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.color','\"yellow\"'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.description','null'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.cardThumbAlignment','\"end\"'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.0.elementCondition','null'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.0.elements.0.autocapitalize','true'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.0.elements.0.autocomplete','false'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.0.elements.0.autocorrect','true'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.0.elements.0.class','null'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.0.elements.0.dateAdded','\"2024-11-21T08:46:07+00:00\"'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.0.elements.0.disabled','false'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.0.elements.0.elementCondition','null'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.0.elements.0.id','null'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.0.elements.0.inputType','null'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.0.elements.0.instructions','null'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.0.elements.0.label','null'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.0.elements.0.max','null'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.0.elements.0.min','null'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.0.elements.0.name','null'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.0.elements.0.orientation','null'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.0.elements.0.placeholder','null'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.0.elements.0.readonly','false'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.0.elements.0.required','true'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.0.elements.0.size','null'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.0.elements.0.step','null'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.0.elements.0.tip','null'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.0.elements.0.title','null'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.0.elements.0.uid','\"d064bb6b-411a-445e-8963-e534101aff68\"'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.0.elements.0.userCondition','null'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.0.elements.0.warning','null'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.0.elements.0.width','100'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.0.elements.1.dateAdded','\"2025-09-02T10:52:13+00:00\"'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.0.elements.1.editCondition','null'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.0.elements.1.elementCondition','null'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.0.elements.1.fieldUid','\"36dca454-5bf3-422e-b397-abb58dda5bbc\"'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.0.elements.1.handle','null'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.0.elements.1.instructions','null'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.0.elements.1.label','null'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.0.elements.1.required','false'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.0.elements.1.tip','null'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.0.elements.1.uid','\"aea2e3a1-f259-4a56-89d0-0bbc20358da2\"'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.0.elements.1.userCondition','null'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.0.elements.1.warning','null'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.0.elements.1.width','100'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.0.name','\"Content\"'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.0.uid','\"4089e5fa-0548-470f-af78-6869077d0bee\"'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.0.userCondition','null'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.1.elementCondition','null'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.1.elements.0.dateAdded','\"2025-09-02T09:01:16+00:00\"'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.1.elements.0.editCondition','null'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.1.elements.0.elementCondition','null'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.1.elements.0.fieldUid','\"9fa6c3db-85f7-4431-831a-05a8249b0e26\"'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.1.elements.0.handle','null'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.1.elements.0.instructions','null'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.1.elements.0.label','null'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.1.elements.0.required','false'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.1.elements.0.tip','null'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.1.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.1.elements.0.uid','\"447cc733-a9dc-4a8b-b7bb-4b4feeba8417\"'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.1.elements.0.userCondition','null'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.1.elements.0.warning','null'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.1.elements.0.width','100'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.1.elements.1.dateAdded','\"2025-09-02T09:01:16+00:00\"'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.1.elements.1.editCondition','null'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.1.elements.1.elementCondition','null'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.1.elements.1.fieldUid','\"614813c6-21cb-4c1a-bb3b-f1373d4c80fe\"'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.1.elements.1.handle','null'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.1.elements.1.instructions','null'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.1.elements.1.label','null'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.1.elements.1.required','false'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.1.elements.1.tip','null'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.1.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.1.elements.1.uid','\"78ccbef4-564b-4987-a3ab-e55f4216f88b\"'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.1.elements.1.userCondition','null'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.1.elements.1.warning','null'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.1.elements.1.width','100'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.1.elements.2.dateAdded','\"2025-09-02T09:01:16+00:00\"'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.1.elements.2.editCondition','null'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.1.elements.2.elementCondition','null'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.1.elements.2.fieldUid','\"e344ac15-6d4b-4dca-a3e3-a23af0036956\"'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.1.elements.2.handle','null'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.1.elements.2.instructions','null'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.1.elements.2.label','null'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.1.elements.2.required','false'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.1.elements.2.tip','null'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.1.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.1.elements.2.uid','\"d81f5d4c-1c3d-444a-8dc4-2d064470323a\"'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.1.elements.2.userCondition','null'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.1.elements.2.warning','null'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.1.elements.2.width','100'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.1.name','\"Metadata\"'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.1.uid','\"6c9360f5-2470-4ca5-a51c-89103d6bd141\"'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.fieldLayouts.b0893f20-109c-4ca6-9b40-68c5ac163c89.tabs.1.userCondition','null'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.handle','\"home\"'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.hasTitleField','true'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.icon','\"house\"'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.name','\"Home\"'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.showSlugField','true'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.showStatusField','true'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.slugTranslationKeyFormat','null'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.slugTranslationMethod','\"site\"'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.titleFormat','null'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.titleTranslationKeyFormat','null'),('entryTypes.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c.titleTranslationMethod','\"site\"'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.color','\"yellow\"'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.description','null'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.cardThumbAlignment','\"end\"'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.0.elementCondition','null'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.0.elements.0.autocapitalize','true'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.0.elements.0.autocomplete','false'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.0.elements.0.autocorrect','true'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.0.elements.0.class','null'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.0.elements.0.dateAdded','\"2024-11-21T10:03:00+00:00\"'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.0.elements.0.disabled','false'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.0.elements.0.elementCondition','null'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.0.elements.0.id','null'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.0.elements.0.inputType','null'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.0.elements.0.instructions','null'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.0.elements.0.label','null'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.0.elements.0.max','null'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.0.elements.0.min','null'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.0.elements.0.name','null'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.0.elements.0.orientation','null'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.0.elements.0.placeholder','null'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.0.elements.0.readonly','false'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.0.elements.0.required','true'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.0.elements.0.size','null'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.0.elements.0.step','null'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.0.elements.0.tip','null'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.0.elements.0.title','null'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.0.elements.0.uid','\"c49fb476-8c8a-423c-b0c6-318157367d8d\"'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.0.elements.0.userCondition','null'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.0.elements.0.warning','null'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.0.elements.0.width','100'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.0.name','\"Content\"'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.0.uid','\"f34748c2-8f26-49e5-aa35-2d1aa16a7efa\"'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.0.userCondition','null'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.1.elementCondition','null'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.1.elements.0.dateAdded','\"2025-09-02T09:02:03+00:00\"'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.1.elements.0.editCondition','null'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.1.elements.0.elementCondition','null'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.1.elements.0.fieldUid','\"9fa6c3db-85f7-4431-831a-05a8249b0e26\"'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.1.elements.0.handle','null'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.1.elements.0.instructions','null'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.1.elements.0.label','null'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.1.elements.0.required','false'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.1.elements.0.tip','null'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.1.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.1.elements.0.uid','\"9b3d4d3c-3151-4ff9-8976-b80ea18b19ca\"'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.1.elements.0.userCondition','null'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.1.elements.0.warning','null'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.1.elements.0.width','100'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.1.elements.1.dateAdded','\"2025-09-02T09:02:03+00:00\"'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.1.elements.1.editCondition','null'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.1.elements.1.elementCondition','null'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.1.elements.1.fieldUid','\"614813c6-21cb-4c1a-bb3b-f1373d4c80fe\"'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.1.elements.1.handle','null'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.1.elements.1.instructions','null'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.1.elements.1.label','null'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.1.elements.1.required','false'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.1.elements.1.tip','null'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.1.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.1.elements.1.uid','\"aafb0fa6-cbd6-4c36-9fa2-f4c71effceaf\"'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.1.elements.1.userCondition','null'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.1.elements.1.warning','null'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.1.elements.1.width','100'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.1.elements.2.dateAdded','\"2025-09-02T09:02:03+00:00\"'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.1.elements.2.editCondition','null'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.1.elements.2.elementCondition','null'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.1.elements.2.fieldUid','\"e344ac15-6d4b-4dca-a3e3-a23af0036956\"'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.1.elements.2.handle','null'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.1.elements.2.instructions','null'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.1.elements.2.label','null'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.1.elements.2.required','false'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.1.elements.2.tip','null'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.1.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.1.elements.2.uid','\"8bea23f5-953a-4887-b3a1-544104109492\"'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.1.elements.2.userCondition','null'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.1.elements.2.warning','null'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.1.elements.2.width','100'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.1.name','\"Metadata\"'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.1.uid','\"76860177-3311-4c72-b12a-f898cfe9ba64\"'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.fieldLayouts.94475cef-751b-484e-91b9-4113d94c86f3.tabs.1.userCondition','null'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.handle','\"about\"'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.hasTitleField','true'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.icon','\"address-card\"'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.name','\"About\"'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.showSlugField','true'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.showStatusField','true'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.slugTranslationKeyFormat','null'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.slugTranslationMethod','\"site\"'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.titleFormat','null'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.titleTranslationKeyFormat','null'),('entryTypes.50a058af-57fd-4784-a532-cdf609d93221.titleTranslationMethod','\"site\"'),('entryTypes.77a9e634-565d-4610-8aea-d10dd619f000.color','\"yellow\"'),('entryTypes.77a9e634-565d-4610-8aea-d10dd619f000.description','null'),('entryTypes.77a9e634-565d-4610-8aea-d10dd619f000.fieldLayouts.cd476df0-d237-4f52-b074-ea68a5decf87.cardThumbAlignment','\"end\"'),('entryTypes.77a9e634-565d-4610-8aea-d10dd619f000.fieldLayouts.cd476df0-d237-4f52-b074-ea68a5decf87.tabs.0.elementCondition','null'),('entryTypes.77a9e634-565d-4610-8aea-d10dd619f000.fieldLayouts.cd476df0-d237-4f52-b074-ea68a5decf87.tabs.0.elements.0.autocapitalize','true'),('entryTypes.77a9e634-565d-4610-8aea-d10dd619f000.fieldLayouts.cd476df0-d237-4f52-b074-ea68a5decf87.tabs.0.elements.0.autocomplete','false'),('entryTypes.77a9e634-565d-4610-8aea-d10dd619f000.fieldLayouts.cd476df0-d237-4f52-b074-ea68a5decf87.tabs.0.elements.0.autocorrect','true'),('entryTypes.77a9e634-565d-4610-8aea-d10dd619f000.fieldLayouts.cd476df0-d237-4f52-b074-ea68a5decf87.tabs.0.elements.0.class','null'),('entryTypes.77a9e634-565d-4610-8aea-d10dd619f000.fieldLayouts.cd476df0-d237-4f52-b074-ea68a5decf87.tabs.0.elements.0.dateAdded','\"2025-09-02T09:05:00+00:00\"'),('entryTypes.77a9e634-565d-4610-8aea-d10dd619f000.fieldLayouts.cd476df0-d237-4f52-b074-ea68a5decf87.tabs.0.elements.0.disabled','false'),('entryTypes.77a9e634-565d-4610-8aea-d10dd619f000.fieldLayouts.cd476df0-d237-4f52-b074-ea68a5decf87.tabs.0.elements.0.elementCondition','null'),('entryTypes.77a9e634-565d-4610-8aea-d10dd619f000.fieldLayouts.cd476df0-d237-4f52-b074-ea68a5decf87.tabs.0.elements.0.id','null'),('entryTypes.77a9e634-565d-4610-8aea-d10dd619f000.fieldLayouts.cd476df0-d237-4f52-b074-ea68a5decf87.tabs.0.elements.0.inputType','null'),('entryTypes.77a9e634-565d-4610-8aea-d10dd619f000.fieldLayouts.cd476df0-d237-4f52-b074-ea68a5decf87.tabs.0.elements.0.instructions','null'),('entryTypes.77a9e634-565d-4610-8aea-d10dd619f000.fieldLayouts.cd476df0-d237-4f52-b074-ea68a5decf87.tabs.0.elements.0.label','null'),('entryTypes.77a9e634-565d-4610-8aea-d10dd619f000.fieldLayouts.cd476df0-d237-4f52-b074-ea68a5decf87.tabs.0.elements.0.max','null'),('entryTypes.77a9e634-565d-4610-8aea-d10dd619f000.fieldLayouts.cd476df0-d237-4f52-b074-ea68a5decf87.tabs.0.elements.0.min','null'),('entryTypes.77a9e634-565d-4610-8aea-d10dd619f000.fieldLayouts.cd476df0-d237-4f52-b074-ea68a5decf87.tabs.0.elements.0.name','null'),('entryTypes.77a9e634-565d-4610-8aea-d10dd619f000.fieldLayouts.cd476df0-d237-4f52-b074-ea68a5decf87.tabs.0.elements.0.orientation','null'),('entryTypes.77a9e634-565d-4610-8aea-d10dd619f000.fieldLayouts.cd476df0-d237-4f52-b074-ea68a5decf87.tabs.0.elements.0.placeholder','null'),('entryTypes.77a9e634-565d-4610-8aea-d10dd619f000.fieldLayouts.cd476df0-d237-4f52-b074-ea68a5decf87.tabs.0.elements.0.readonly','false'),('entryTypes.77a9e634-565d-4610-8aea-d10dd619f000.fieldLayouts.cd476df0-d237-4f52-b074-ea68a5decf87.tabs.0.elements.0.required','true'),('entryTypes.77a9e634-565d-4610-8aea-d10dd619f000.fieldLayouts.cd476df0-d237-4f52-b074-ea68a5decf87.tabs.0.elements.0.size','null'),('entryTypes.77a9e634-565d-4610-8aea-d10dd619f000.fieldLayouts.cd476df0-d237-4f52-b074-ea68a5decf87.tabs.0.elements.0.step','null'),('entryTypes.77a9e634-565d-4610-8aea-d10dd619f000.fieldLayouts.cd476df0-d237-4f52-b074-ea68a5decf87.tabs.0.elements.0.tip','null'),('entryTypes.77a9e634-565d-4610-8aea-d10dd619f000.fieldLayouts.cd476df0-d237-4f52-b074-ea68a5decf87.tabs.0.elements.0.title','null'),('entryTypes.77a9e634-565d-4610-8aea-d10dd619f000.fieldLayouts.cd476df0-d237-4f52-b074-ea68a5decf87.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.77a9e634-565d-4610-8aea-d10dd619f000.fieldLayouts.cd476df0-d237-4f52-b074-ea68a5decf87.tabs.0.elements.0.uid','\"59c70d7a-4ba5-4ecd-a46a-1e51e61a6f67\"'),('entryTypes.77a9e634-565d-4610-8aea-d10dd619f000.fieldLayouts.cd476df0-d237-4f52-b074-ea68a5decf87.tabs.0.elements.0.userCondition','null'),('entryTypes.77a9e634-565d-4610-8aea-d10dd619f000.fieldLayouts.cd476df0-d237-4f52-b074-ea68a5decf87.tabs.0.elements.0.warning','null'),('entryTypes.77a9e634-565d-4610-8aea-d10dd619f000.fieldLayouts.cd476df0-d237-4f52-b074-ea68a5decf87.tabs.0.elements.0.width','100'),('entryTypes.77a9e634-565d-4610-8aea-d10dd619f000.fieldLayouts.cd476df0-d237-4f52-b074-ea68a5decf87.tabs.0.elements.1.dateAdded','\"2025-09-02T09:06:38+00:00\"'),('entryTypes.77a9e634-565d-4610-8aea-d10dd619f000.fieldLayouts.cd476df0-d237-4f52-b074-ea68a5decf87.tabs.0.elements.1.editCondition','null'),('entryTypes.77a9e634-565d-4610-8aea-d10dd619f000.fieldLayouts.cd476df0-d237-4f52-b074-ea68a5decf87.tabs.0.elements.1.elementCondition','null'),('entryTypes.77a9e634-565d-4610-8aea-d10dd619f000.fieldLayouts.cd476df0-d237-4f52-b074-ea68a5decf87.tabs.0.elements.1.fieldUid','\"4e467547-468e-4edb-9dcb-04801550f11d\"'),('entryTypes.77a9e634-565d-4610-8aea-d10dd619f000.fieldLayouts.cd476df0-d237-4f52-b074-ea68a5decf87.tabs.0.elements.1.handle','null'),('entryTypes.77a9e634-565d-4610-8aea-d10dd619f000.fieldLayouts.cd476df0-d237-4f52-b074-ea68a5decf87.tabs.0.elements.1.instructions','null'),('entryTypes.77a9e634-565d-4610-8aea-d10dd619f000.fieldLayouts.cd476df0-d237-4f52-b074-ea68a5decf87.tabs.0.elements.1.label','null'),('entryTypes.77a9e634-565d-4610-8aea-d10dd619f000.fieldLayouts.cd476df0-d237-4f52-b074-ea68a5decf87.tabs.0.elements.1.required','false'),('entryTypes.77a9e634-565d-4610-8aea-d10dd619f000.fieldLayouts.cd476df0-d237-4f52-b074-ea68a5decf87.tabs.0.elements.1.tip','null'),('entryTypes.77a9e634-565d-4610-8aea-d10dd619f000.fieldLayouts.cd476df0-d237-4f52-b074-ea68a5decf87.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.77a9e634-565d-4610-8aea-d10dd619f000.fieldLayouts.cd476df0-d237-4f52-b074-ea68a5decf87.tabs.0.elements.1.uid','\"f028c411-13cc-469e-b3c7-1d284796f4b7\"'),('entryTypes.77a9e634-565d-4610-8aea-d10dd619f000.fieldLayouts.cd476df0-d237-4f52-b074-ea68a5decf87.tabs.0.elements.1.userCondition','null'),('entryTypes.77a9e634-565d-4610-8aea-d10dd619f000.fieldLayouts.cd476df0-d237-4f52-b074-ea68a5decf87.tabs.0.elements.1.warning','null'),('entryTypes.77a9e634-565d-4610-8aea-d10dd619f000.fieldLayouts.cd476df0-d237-4f52-b074-ea68a5decf87.tabs.0.elements.1.width','100'),('entryTypes.77a9e634-565d-4610-8aea-d10dd619f000.fieldLayouts.cd476df0-d237-4f52-b074-ea68a5decf87.tabs.0.name','\"Content\"'),('entryTypes.77a9e634-565d-4610-8aea-d10dd619f000.fieldLayouts.cd476df0-d237-4f52-b074-ea68a5decf87.tabs.0.uid','\"b16db417-39ca-4608-a520-89d6c033925f\"'),('entryTypes.77a9e634-565d-4610-8aea-d10dd619f000.fieldLayouts.cd476df0-d237-4f52-b074-ea68a5decf87.tabs.0.userCondition','null'),('entryTypes.77a9e634-565d-4610-8aea-d10dd619f000.handle','\"privacy\"'),('entryTypes.77a9e634-565d-4610-8aea-d10dd619f000.hasTitleField','true'),('entryTypes.77a9e634-565d-4610-8aea-d10dd619f000.icon','\"lock-keyhole\"'),('entryTypes.77a9e634-565d-4610-8aea-d10dd619f000.name','\"Privacy\"'),('entryTypes.77a9e634-565d-4610-8aea-d10dd619f000.showSlugField','true'),('entryTypes.77a9e634-565d-4610-8aea-d10dd619f000.showStatusField','true'),('entryTypes.77a9e634-565d-4610-8aea-d10dd619f000.slugTranslationKeyFormat','null'),('entryTypes.77a9e634-565d-4610-8aea-d10dd619f000.slugTranslationMethod','\"site\"'),('entryTypes.77a9e634-565d-4610-8aea-d10dd619f000.titleFormat','null'),('entryTypes.77a9e634-565d-4610-8aea-d10dd619f000.titleTranslationKeyFormat','null'),('entryTypes.77a9e634-565d-4610-8aea-d10dd619f000.titleTranslationMethod','\"site\"'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.color','\"yellow\"'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.description','null'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.cardThumbAlignment','\"end\"'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elementCondition','null'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.0.autocapitalize','true'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.0.autocomplete','false'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.0.autocorrect','true'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.0.class','null'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.0.dateAdded','\"2024-11-21T11:34:05+00:00\"'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.0.disabled','false'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.0.elementCondition','null'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.0.id','null'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.0.inputType','null'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.0.instructions','null'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.0.label','null'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.0.max','null'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.0.min','null'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.0.name','null'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.0.orientation','null'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.0.placeholder','null'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.0.readonly','false'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.0.required','true'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.0.size','null'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.0.step','null'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.0.tip','null'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.0.title','null'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.0.uid','\"049215a6-0809-4ded-8628-d744442ba388\"'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.0.userCondition','null'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.0.warning','null'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.0.width','100'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.1.dateAdded','\"2024-11-21T11:37:30+00:00\"'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.1.editCondition','null'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.1.elementCondition','null'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.1.fieldUid','\"36dca454-5bf3-422e-b397-abb58dda5bbc\"'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.1.handle','null'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.1.instructions','null'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.1.label','null'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.1.required','false'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.1.tip','null'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.1.uid','\"12496b7a-492c-49d2-920f-70ed92cae716\"'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.1.userCondition','null'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.1.warning','null'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.1.width','100'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.2.dateAdded','\"2024-11-21T11:37:30+00:00\"'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.2.editCondition','null'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.2.elementCondition','null'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.2.fieldUid','\"7104f57b-112f-4c96-84cf-eda1c75fe796\"'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.2.handle','null'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.2.instructions','null'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.2.label','null'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.2.required','false'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.2.tip','null'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.2.uid','\"caf879af-32f8-4f98-bd3a-8f41982b1435\"'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.2.userCondition','null'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.2.warning','null'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.2.width','100'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.3.dateAdded','\"2026-05-12T09:12:39+00:00\"'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.3.editCondition','null'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.3.elementCondition','null'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.3.fieldUid','\"67df4def-30b8-4e8b-82b0-b01e4b5b783a\"'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.3.handle','null'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.3.instructions','null'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.3.label','null'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.3.required','false'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.3.tip','null'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.3.uid','\"561bc70a-8092-49ef-b0ec-2a5eb6f7759f\"'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.3.userCondition','null'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.3.warning','null'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.elements.3.width','100'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.name','\"Content\"'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.uid','\"6f167188-2895-4059-b531-5cd128731cec\"'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.fieldLayouts.c0d92897-db22-49be-974c-56ec3017caa1.tabs.0.userCondition','null'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.handle','\"exampleEntry\"'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.hasTitleField','true'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.icon','\"layer-group\"'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.name','\"Example Entry\"'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.showSlugField','true'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.showStatusField','true'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.slugTranslationKeyFormat','null'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.slugTranslationMethod','\"site\"'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.titleFormat','null'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.titleTranslationKeyFormat','null'),('entryTypes.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66.titleTranslationMethod','\"site\"'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.color','\"yellow\"'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.description','null'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.cardThumbAlignment','\"end\"'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.0.elementCondition','null'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.0.elements.0.autocapitalize','true'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.0.elements.0.autocomplete','false'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.0.elements.0.autocorrect','true'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.0.elements.0.class','null'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.0.elements.0.dateAdded','\"2024-11-21T10:05:26+00:00\"'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.0.elements.0.disabled','false'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.0.elements.0.elementCondition','null'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.0.elements.0.id','null'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.0.elements.0.inputType','null'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.0.elements.0.instructions','null'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.0.elements.0.label','null'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.0.elements.0.max','null'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.0.elements.0.min','null'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.0.elements.0.name','null'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.0.elements.0.orientation','null'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.0.elements.0.placeholder','null'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.0.elements.0.readonly','false'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.0.elements.0.required','true'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.0.elements.0.size','null'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.0.elements.0.step','null'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.0.elements.0.tip','null'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.0.elements.0.title','null'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.0.elements.0.uid','\"fda1bacd-92aa-4d24-bbac-f3510fcbd4a2\"'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.0.elements.0.userCondition','null'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.0.elements.0.warning','null'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.0.elements.0.width','100'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.0.elements.1.dateAdded','\"2025-09-30T10:24:03+00:00\"'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.0.elements.1.editCondition','null'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.0.elements.1.elementCondition','null'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.0.elements.1.fieldUid','\"4e467547-468e-4edb-9dcb-04801550f11d\"'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.0.elements.1.handle','null'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.0.elements.1.instructions','null'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.0.elements.1.label','null'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.0.elements.1.required','false'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.0.elements.1.tip','null'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.0.elements.1.uid','\"07be3ad1-46e1-4a12-96fd-d4b0f171daf8\"'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.0.elements.1.userCondition','null'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.0.elements.1.warning','null'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.0.elements.1.width','100'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.0.name','\"Content\"'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.0.uid','\"39f38808-3305-4ff0-9e0a-6b3748da4678\"'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.0.userCondition','null'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.1.elementCondition','null'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.1.elements.0.dateAdded','\"2025-09-02T09:05:20+00:00\"'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.1.elements.0.editCondition','null'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.1.elements.0.elementCondition','null'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.1.elements.0.fieldUid','\"9fa6c3db-85f7-4431-831a-05a8249b0e26\"'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.1.elements.0.handle','null'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.1.elements.0.instructions','null'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.1.elements.0.label','null'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.1.elements.0.required','false'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.1.elements.0.tip','null'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.1.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.1.elements.0.uid','\"d48415f8-48a5-45ec-aac8-8a3a0199f4de\"'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.1.elements.0.userCondition','null'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.1.elements.0.warning','null'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.1.elements.0.width','100'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.1.elements.1.dateAdded','\"2025-09-02T09:05:20+00:00\"'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.1.elements.1.editCondition','null'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.1.elements.1.elementCondition','null'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.1.elements.1.fieldUid','\"614813c6-21cb-4c1a-bb3b-f1373d4c80fe\"'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.1.elements.1.handle','null'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.1.elements.1.instructions','null'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.1.elements.1.label','null'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.1.elements.1.required','false'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.1.elements.1.tip','null'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.1.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.1.elements.1.uid','\"1fcdaea1-461f-4eb6-b0f0-8d9f5db30e6c\"'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.1.elements.1.userCondition','null'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.1.elements.1.warning','null'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.1.elements.1.width','100'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.1.elements.2.dateAdded','\"2025-09-02T09:05:20+00:00\"'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.1.elements.2.editCondition','null'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.1.elements.2.elementCondition','null'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.1.elements.2.fieldUid','\"e344ac15-6d4b-4dca-a3e3-a23af0036956\"'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.1.elements.2.handle','null'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.1.elements.2.instructions','null'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.1.elements.2.label','null'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.1.elements.2.required','false'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.1.elements.2.tip','null'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.1.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.1.elements.2.uid','\"6599e9a6-4feb-473a-bdfc-2fe6e245ffef\"'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.1.elements.2.userCondition','null'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.1.elements.2.warning','null'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.1.elements.2.width','100'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.1.name','\"Metadata\"'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.1.uid','\"f6923d7b-4e5b-4324-aff3-5a9cc7d3cd44\"'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.fieldLayouts.273181ee-c034-4747-bed3-46045cfb92e1.tabs.1.userCondition','null'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.handle','\"imprint\"'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.hasTitleField','true'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.icon','\"align-justify\"'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.name','\"Imprint\"'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.showSlugField','true'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.showStatusField','true'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.slugTranslationKeyFormat','null'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.slugTranslationMethod','\"site\"'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.titleFormat','null'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.titleTranslationKeyFormat','null'),('entryTypes.c69f0277-c48d-451a-84c1-2b4423aff544.titleTranslationMethod','\"site\"'),('fields.1795220b-e9cf-41e2-814d-8c93f5dd0e30.columnSuffix','null'),('fields.1795220b-e9cf-41e2-814d-8c93f5dd0e30.handle','\"externalLinkUrl\"'),('fields.1795220b-e9cf-41e2-814d-8c93f5dd0e30.instructions','null'),('fields.1795220b-e9cf-41e2-814d-8c93f5dd0e30.name','\"External Link URL\"'),('fields.1795220b-e9cf-41e2-814d-8c93f5dd0e30.searchable','false'),('fields.1795220b-e9cf-41e2-814d-8c93f5dd0e30.settings.maxLength','255'),('fields.1795220b-e9cf-41e2-814d-8c93f5dd0e30.settings.showLabelField','false'),('fields.1795220b-e9cf-41e2-814d-8c93f5dd0e30.settings.showTargetField','true'),('fields.1795220b-e9cf-41e2-814d-8c93f5dd0e30.settings.types.0','\"url\"'),('fields.1795220b-e9cf-41e2-814d-8c93f5dd0e30.settings.typeSettings.__assoc__.0.0','\"url\"'),('fields.1795220b-e9cf-41e2-814d-8c93f5dd0e30.settings.typeSettings.__assoc__.0.1.__assoc__.0.0','\"allowRootRelativeUrls\"'),('fields.1795220b-e9cf-41e2-814d-8c93f5dd0e30.settings.typeSettings.__assoc__.0.1.__assoc__.0.1','\"\"'),('fields.1795220b-e9cf-41e2-814d-8c93f5dd0e30.settings.typeSettings.__assoc__.0.1.__assoc__.1.0','\"allowAnchors\"'),('fields.1795220b-e9cf-41e2-814d-8c93f5dd0e30.settings.typeSettings.__assoc__.0.1.__assoc__.1.1','\"\"'),('fields.1795220b-e9cf-41e2-814d-8c93f5dd0e30.translationKeyFormat','null'),('fields.1795220b-e9cf-41e2-814d-8c93f5dd0e30.translationMethod','\"none\"'),('fields.1795220b-e9cf-41e2-814d-8c93f5dd0e30.type','\"craft\\\\fields\\\\Link\"'),('fields.1d1e70bf-a278-465e-a64d-dfaa1661e193.columnSuffix','null'),('fields.1d1e70bf-a278-465e-a64d-dfaa1661e193.handle','\"navigation\"'),('fields.1d1e70bf-a278-465e-a64d-dfaa1661e193.instructions','null'),('fields.1d1e70bf-a278-465e-a64d-dfaa1661e193.name','\"Navigation\"'),('fields.1d1e70bf-a278-465e-a64d-dfaa1661e193.searchable','false'),('fields.1d1e70bf-a278-465e-a64d-dfaa1661e193.settings.allowSelfRelations','false'),('fields.1d1e70bf-a278-465e-a64d-dfaa1661e193.settings.branchLimit','null'),('fields.1d1e70bf-a278-465e-a64d-dfaa1661e193.settings.maintainHierarchy','false'),('fields.1d1e70bf-a278-465e-a64d-dfaa1661e193.settings.maxRelations','null'),('fields.1d1e70bf-a278-465e-a64d-dfaa1661e193.settings.minRelations','null'),('fields.1d1e70bf-a278-465e-a64d-dfaa1661e193.settings.selectionLabel','null'),('fields.1d1e70bf-a278-465e-a64d-dfaa1661e193.settings.showCardsInGrid','false'),('fields.1d1e70bf-a278-465e-a64d-dfaa1661e193.settings.showSiteMenu','false'),('fields.1d1e70bf-a278-465e-a64d-dfaa1661e193.settings.sources.0','\"singles\"'),('fields.1d1e70bf-a278-465e-a64d-dfaa1661e193.settings.targetSiteId','null'),('fields.1d1e70bf-a278-465e-a64d-dfaa1661e193.settings.validateRelatedElements','false'),('fields.1d1e70bf-a278-465e-a64d-dfaa1661e193.settings.viewMode','\"list\"'),('fields.1d1e70bf-a278-465e-a64d-dfaa1661e193.translationKeyFormat','null'),('fields.1d1e70bf-a278-465e-a64d-dfaa1661e193.translationMethod','\"none\"'),('fields.1d1e70bf-a278-465e-a64d-dfaa1661e193.type','\"craft\\\\fields\\\\Entries\"'),('fields.36dca454-5bf3-422e-b397-abb58dda5bbc.columnSuffix','null'),('fields.36dca454-5bf3-422e-b397-abb58dda5bbc.handle','\"image\"'),('fields.36dca454-5bf3-422e-b397-abb58dda5bbc.instructions','null'),('fields.36dca454-5bf3-422e-b397-abb58dda5bbc.name','\"Image\"'),('fields.36dca454-5bf3-422e-b397-abb58dda5bbc.searchable','false'),('fields.36dca454-5bf3-422e-b397-abb58dda5bbc.settings.allowedKinds.0','\"image\"'),('fields.36dca454-5bf3-422e-b397-abb58dda5bbc.settings.allowSelfRelations','false'),('fields.36dca454-5bf3-422e-b397-abb58dda5bbc.settings.allowSubfolders','false'),('fields.36dca454-5bf3-422e-b397-abb58dda5bbc.settings.allowUploads','true'),('fields.36dca454-5bf3-422e-b397-abb58dda5bbc.settings.branchLimit','null'),('fields.36dca454-5bf3-422e-b397-abb58dda5bbc.settings.defaultUploadLocationSource','\"volume:21950e08-1320-46dd-b9f3-8ddae1b3aa50\"'),('fields.36dca454-5bf3-422e-b397-abb58dda5bbc.settings.defaultUploadLocationSubpath','null'),('fields.36dca454-5bf3-422e-b397-abb58dda5bbc.settings.maintainHierarchy','false'),('fields.36dca454-5bf3-422e-b397-abb58dda5bbc.settings.maxRelations','1'),('fields.36dca454-5bf3-422e-b397-abb58dda5bbc.settings.minRelations','null'),('fields.36dca454-5bf3-422e-b397-abb58dda5bbc.settings.previewMode','\"full\"'),('fields.36dca454-5bf3-422e-b397-abb58dda5bbc.settings.restrictedDefaultUploadSubpath','null'),('fields.36dca454-5bf3-422e-b397-abb58dda5bbc.settings.restrictedLocationSource','\"volume:21950e08-1320-46dd-b9f3-8ddae1b3aa50\"'),('fields.36dca454-5bf3-422e-b397-abb58dda5bbc.settings.restrictedLocationSubpath','null'),('fields.36dca454-5bf3-422e-b397-abb58dda5bbc.settings.restrictFiles','true'),('fields.36dca454-5bf3-422e-b397-abb58dda5bbc.settings.restrictLocation','false'),('fields.36dca454-5bf3-422e-b397-abb58dda5bbc.settings.selectionLabel','null'),('fields.36dca454-5bf3-422e-b397-abb58dda5bbc.settings.showCardsInGrid','false'),('fields.36dca454-5bf3-422e-b397-abb58dda5bbc.settings.showSiteMenu','true'),('fields.36dca454-5bf3-422e-b397-abb58dda5bbc.settings.showUnpermittedFiles','false'),('fields.36dca454-5bf3-422e-b397-abb58dda5bbc.settings.showUnpermittedVolumes','false'),('fields.36dca454-5bf3-422e-b397-abb58dda5bbc.settings.sources.0','\"volume:21950e08-1320-46dd-b9f3-8ddae1b3aa50\"'),('fields.36dca454-5bf3-422e-b397-abb58dda5bbc.settings.targetSiteId','null'),('fields.36dca454-5bf3-422e-b397-abb58dda5bbc.settings.validateRelatedElements','false'),('fields.36dca454-5bf3-422e-b397-abb58dda5bbc.settings.viewMode','\"large\"'),('fields.36dca454-5bf3-422e-b397-abb58dda5bbc.translationKeyFormat','null'),('fields.36dca454-5bf3-422e-b397-abb58dda5bbc.translationMethod','\"none\"'),('fields.36dca454-5bf3-422e-b397-abb58dda5bbc.type','\"craft\\\\fields\\\\Assets\"'),('fields.4c70ff1a-21c6-4f84-81e5-b339b02e6f0d.columnSuffix','null'),('fields.4c70ff1a-21c6-4f84-81e5-b339b02e6f0d.handle','\"maCardTitle\"'),('fields.4c70ff1a-21c6-4f84-81e5-b339b02e6f0d.instructions','null'),('fields.4c70ff1a-21c6-4f84-81e5-b339b02e6f0d.name','\"MA Card Title\"'),('fields.4c70ff1a-21c6-4f84-81e5-b339b02e6f0d.searchable','false'),('fields.4c70ff1a-21c6-4f84-81e5-b339b02e6f0d.settings.byteLimit','null'),('fields.4c70ff1a-21c6-4f84-81e5-b339b02e6f0d.settings.charLimit','null'),('fields.4c70ff1a-21c6-4f84-81e5-b339b02e6f0d.settings.code','false'),('fields.4c70ff1a-21c6-4f84-81e5-b339b02e6f0d.settings.initialRows','4'),('fields.4c70ff1a-21c6-4f84-81e5-b339b02e6f0d.settings.multiline','false'),('fields.4c70ff1a-21c6-4f84-81e5-b339b02e6f0d.settings.placeholder','null'),('fields.4c70ff1a-21c6-4f84-81e5-b339b02e6f0d.settings.uiMode','\"normal\"'),('fields.4c70ff1a-21c6-4f84-81e5-b339b02e6f0d.translationKeyFormat','null'),('fields.4c70ff1a-21c6-4f84-81e5-b339b02e6f0d.translationMethod','\"none\"'),('fields.4c70ff1a-21c6-4f84-81e5-b339b02e6f0d.type','\"craft\\\\fields\\\\PlainText\"'),('fields.4e467547-468e-4edb-9dcb-04801550f11d.columnSuffix','null'),('fields.4e467547-468e-4edb-9dcb-04801550f11d.handle','\"largeTextfield\"'),('fields.4e467547-468e-4edb-9dcb-04801550f11d.instructions','null'),('fields.4e467547-468e-4edb-9dcb-04801550f11d.name','\"Large Textfield\"'),('fields.4e467547-468e-4edb-9dcb-04801550f11d.searchable','false'),('fields.4e467547-468e-4edb-9dcb-04801550f11d.settings.availableTransforms','\"*\"'),('fields.4e467547-468e-4edb-9dcb-04801550f11d.settings.availableVolumes','\"*\"'),('fields.4e467547-468e-4edb-9dcb-04801550f11d.settings.characterLimit','null'),('fields.4e467547-468e-4edb-9dcb-04801550f11d.settings.ckeConfig','\"f1f84e81-4f8a-443b-acac-309e7aac4ee4\"'),('fields.4e467547-468e-4edb-9dcb-04801550f11d.settings.createButtonLabel','null'),('fields.4e467547-468e-4edb-9dcb-04801550f11d.settings.defaultTransform','null'),('fields.4e467547-468e-4edb-9dcb-04801550f11d.settings.expandEntryButtons','false'),('fields.4e467547-468e-4edb-9dcb-04801550f11d.settings.fullGraphqlData','true'),('fields.4e467547-468e-4edb-9dcb-04801550f11d.settings.parseEmbeds','false'),('fields.4e467547-468e-4edb-9dcb-04801550f11d.settings.purifierConfig','null'),('fields.4e467547-468e-4edb-9dcb-04801550f11d.settings.purifyHtml','true'),('fields.4e467547-468e-4edb-9dcb-04801550f11d.settings.showUnpermittedFiles','false'),('fields.4e467547-468e-4edb-9dcb-04801550f11d.settings.showUnpermittedVolumes','false'),('fields.4e467547-468e-4edb-9dcb-04801550f11d.settings.showWordCount','false'),('fields.4e467547-468e-4edb-9dcb-04801550f11d.settings.sourceEditingGroups.0','\"__ADMINS__\"'),('fields.4e467547-468e-4edb-9dcb-04801550f11d.settings.wordLimit','null'),('fields.4e467547-468e-4edb-9dcb-04801550f11d.translationKeyFormat','null'),('fields.4e467547-468e-4edb-9dcb-04801550f11d.translationMethod','\"none\"'),('fields.4e467547-468e-4edb-9dcb-04801550f11d.type','\"craft\\\\ckeditor\\\\Field\"'),('fields.4f9ce81c-6377-48f1-8b5b-b5b2daefb9c1.columnSuffix','null'),('fields.4f9ce81c-6377-48f1-8b5b-b5b2daefb9c1.handle','\"phoneNumber\"'),('fields.4f9ce81c-6377-48f1-8b5b-b5b2daefb9c1.instructions','null'),('fields.4f9ce81c-6377-48f1-8b5b-b5b2daefb9c1.name','\"Phone Number\"'),('fields.4f9ce81c-6377-48f1-8b5b-b5b2daefb9c1.searchable','false'),('fields.4f9ce81c-6377-48f1-8b5b-b5b2daefb9c1.settings.maxLength','255'),('fields.4f9ce81c-6377-48f1-8b5b-b5b2daefb9c1.settings.showLabelField','false'),('fields.4f9ce81c-6377-48f1-8b5b-b5b2daefb9c1.settings.showTargetField','false'),('fields.4f9ce81c-6377-48f1-8b5b-b5b2daefb9c1.settings.types.0','\"tel\"'),('fields.4f9ce81c-6377-48f1-8b5b-b5b2daefb9c1.translationKeyFormat','null'),('fields.4f9ce81c-6377-48f1-8b5b-b5b2daefb9c1.translationMethod','\"none\"'),('fields.4f9ce81c-6377-48f1-8b5b-b5b2daefb9c1.type','\"craft\\\\fields\\\\Link\"'),('fields.5228acaf-dbbf-4aac-b0b0-0c1c55e94b4a.columnSuffix','null'),('fields.5228acaf-dbbf-4aac-b0b0-0c1c55e94b4a.handle','\"websiteDescription\"'),('fields.5228acaf-dbbf-4aac-b0b0-0c1c55e94b4a.instructions','null'),('fields.5228acaf-dbbf-4aac-b0b0-0c1c55e94b4a.name','\"Website Description\"'),('fields.5228acaf-dbbf-4aac-b0b0-0c1c55e94b4a.searchable','false'),('fields.5228acaf-dbbf-4aac-b0b0-0c1c55e94b4a.settings.availableTransforms','\"*\"'),('fields.5228acaf-dbbf-4aac-b0b0-0c1c55e94b4a.settings.availableVolumes','\"*\"'),('fields.5228acaf-dbbf-4aac-b0b0-0c1c55e94b4a.settings.ckeConfig','\"05c6e9dc-1fc7-46a8-bbee-2c8138640bd8\"'),('fields.5228acaf-dbbf-4aac-b0b0-0c1c55e94b4a.settings.createButtonLabel','null'),('fields.5228acaf-dbbf-4aac-b0b0-0c1c55e94b4a.settings.defaultTransform','null'),('fields.5228acaf-dbbf-4aac-b0b0-0c1c55e94b4a.settings.enableSourceEditingForNonAdmins','false'),('fields.5228acaf-dbbf-4aac-b0b0-0c1c55e94b4a.settings.purifierConfig','null'),('fields.5228acaf-dbbf-4aac-b0b0-0c1c55e94b4a.settings.purifyHtml','true'),('fields.5228acaf-dbbf-4aac-b0b0-0c1c55e94b4a.settings.showUnpermittedFiles','false'),('fields.5228acaf-dbbf-4aac-b0b0-0c1c55e94b4a.settings.showUnpermittedVolumes','false'),('fields.5228acaf-dbbf-4aac-b0b0-0c1c55e94b4a.settings.showWordCount','false'),('fields.5228acaf-dbbf-4aac-b0b0-0c1c55e94b4a.settings.wordLimit','null'),('fields.5228acaf-dbbf-4aac-b0b0-0c1c55e94b4a.translationKeyFormat','null'),('fields.5228acaf-dbbf-4aac-b0b0-0c1c55e94b4a.translationMethod','\"none\"'),('fields.5228acaf-dbbf-4aac-b0b0-0c1c55e94b4a.type','\"craft\\\\ckeditor\\\\Field\"'),('fields.5365ef59-c050-4702-82ab-876962749a48.columnSuffix','null'),('fields.5365ef59-c050-4702-82ab-876962749a48.handle','\"websiteTitle\"'),('fields.5365ef59-c050-4702-82ab-876962749a48.instructions','null'),('fields.5365ef59-c050-4702-82ab-876962749a48.name','\"Website Title\"'),('fields.5365ef59-c050-4702-82ab-876962749a48.searchable','false'),('fields.5365ef59-c050-4702-82ab-876962749a48.settings.byteLimit','null'),('fields.5365ef59-c050-4702-82ab-876962749a48.settings.charLimit','null'),('fields.5365ef59-c050-4702-82ab-876962749a48.settings.code','false'),('fields.5365ef59-c050-4702-82ab-876962749a48.settings.initialRows','4'),('fields.5365ef59-c050-4702-82ab-876962749a48.settings.multiline','false'),('fields.5365ef59-c050-4702-82ab-876962749a48.settings.placeholder','null'),('fields.5365ef59-c050-4702-82ab-876962749a48.settings.uiMode','\"normal\"'),('fields.5365ef59-c050-4702-82ab-876962749a48.translationKeyFormat','null'),('fields.5365ef59-c050-4702-82ab-876962749a48.translationMethod','\"none\"'),('fields.5365ef59-c050-4702-82ab-876962749a48.type','\"craft\\\\fields\\\\PlainText\"'),('fields.5416109a-5864-4bdf-9179-ee951c51cfd8.columnSuffix','null'),('fields.5416109a-5864-4bdf-9179-ee951c51cfd8.handle','\"email\"'),('fields.5416109a-5864-4bdf-9179-ee951c51cfd8.instructions','null'),('fields.5416109a-5864-4bdf-9179-ee951c51cfd8.name','\"Email\"'),('fields.5416109a-5864-4bdf-9179-ee951c51cfd8.searchable','false'),('fields.5416109a-5864-4bdf-9179-ee951c51cfd8.settings.placeholder','\"example@email.com\"'),('fields.5416109a-5864-4bdf-9179-ee951c51cfd8.translationKeyFormat','null'),('fields.5416109a-5864-4bdf-9179-ee951c51cfd8.translationMethod','\"none\"'),('fields.5416109a-5864-4bdf-9179-ee951c51cfd8.type','\"craft\\\\fields\\\\Email\"'),('fields.58523f1c-677f-41b7-8aa2-d44d638c8cfa.columnSuffix','null'),('fields.58523f1c-677f-41b7-8aa2-d44d638c8cfa.handle','\"accessibilityTextfield\"'),('fields.58523f1c-677f-41b7-8aa2-d44d638c8cfa.instructions','null'),('fields.58523f1c-677f-41b7-8aa2-d44d638c8cfa.name','\"Accessibility Textfield\"'),('fields.58523f1c-677f-41b7-8aa2-d44d638c8cfa.searchable','false'),('fields.58523f1c-677f-41b7-8aa2-d44d638c8cfa.settings.availableTransforms','\"*\"'),('fields.58523f1c-677f-41b7-8aa2-d44d638c8cfa.settings.availableVolumes','\"*\"'),('fields.58523f1c-677f-41b7-8aa2-d44d638c8cfa.settings.characterLimit','null'),('fields.58523f1c-677f-41b7-8aa2-d44d638c8cfa.settings.ckeConfig','\"f1f84e81-4f8a-443b-acac-309e7aac4ee4\"'),('fields.58523f1c-677f-41b7-8aa2-d44d638c8cfa.settings.createButtonLabel','null'),('fields.58523f1c-677f-41b7-8aa2-d44d638c8cfa.settings.defaultTransform','null'),('fields.58523f1c-677f-41b7-8aa2-d44d638c8cfa.settings.expandEntryButtons','false'),('fields.58523f1c-677f-41b7-8aa2-d44d638c8cfa.settings.fullGraphqlData','true'),('fields.58523f1c-677f-41b7-8aa2-d44d638c8cfa.settings.parseEmbeds','false'),('fields.58523f1c-677f-41b7-8aa2-d44d638c8cfa.settings.purifierConfig','null'),('fields.58523f1c-677f-41b7-8aa2-d44d638c8cfa.settings.purifyHtml','true'),('fields.58523f1c-677f-41b7-8aa2-d44d638c8cfa.settings.showUnpermittedFiles','false'),('fields.58523f1c-677f-41b7-8aa2-d44d638c8cfa.settings.showUnpermittedVolumes','false'),('fields.58523f1c-677f-41b7-8aa2-d44d638c8cfa.settings.showWordCount','false'),('fields.58523f1c-677f-41b7-8aa2-d44d638c8cfa.settings.sourceEditingGroups.0','\"__ADMINS__\"'),('fields.58523f1c-677f-41b7-8aa2-d44d638c8cfa.settings.wordLimit','null'),('fields.58523f1c-677f-41b7-8aa2-d44d638c8cfa.translationKeyFormat','null'),('fields.58523f1c-677f-41b7-8aa2-d44d638c8cfa.translationMethod','\"none\"'),('fields.58523f1c-677f-41b7-8aa2-d44d638c8cfa.type','\"craft\\\\ckeditor\\\\Field\"'),('fields.59142390-27d0-4780-8543-5bcfbef4549e.columnSuffix','null'),('fields.59142390-27d0-4780-8543-5bcfbef4549e.handle','\"externalLinkName\"'),('fields.59142390-27d0-4780-8543-5bcfbef4549e.instructions','null'),('fields.59142390-27d0-4780-8543-5bcfbef4549e.name','\"External Link Name\"'),('fields.59142390-27d0-4780-8543-5bcfbef4549e.searchable','false'),('fields.59142390-27d0-4780-8543-5bcfbef4549e.settings.byteLimit','null'),('fields.59142390-27d0-4780-8543-5bcfbef4549e.settings.charLimit','null'),('fields.59142390-27d0-4780-8543-5bcfbef4549e.settings.code','false'),('fields.59142390-27d0-4780-8543-5bcfbef4549e.settings.initialRows','4'),('fields.59142390-27d0-4780-8543-5bcfbef4549e.settings.multiline','false'),('fields.59142390-27d0-4780-8543-5bcfbef4549e.settings.placeholder','null'),('fields.59142390-27d0-4780-8543-5bcfbef4549e.settings.uiMode','\"normal\"'),('fields.59142390-27d0-4780-8543-5bcfbef4549e.translationKeyFormat','null'),('fields.59142390-27d0-4780-8543-5bcfbef4549e.translationMethod','\"none\"'),('fields.59142390-27d0-4780-8543-5bcfbef4549e.type','\"craft\\\\fields\\\\PlainText\"'),('fields.599c2594-7f7c-47e8-ab7f-5f15ea9d8f90.columnSuffix','null'),('fields.599c2594-7f7c-47e8-ab7f-5f15ea9d8f90.handle','\"textfieldWithLinks\"'),('fields.599c2594-7f7c-47e8-ab7f-5f15ea9d8f90.instructions','null'),('fields.599c2594-7f7c-47e8-ab7f-5f15ea9d8f90.name','\"Textfield with Links\"'),('fields.599c2594-7f7c-47e8-ab7f-5f15ea9d8f90.searchable','false'),('fields.599c2594-7f7c-47e8-ab7f-5f15ea9d8f90.settings.availableTransforms','\"*\"'),('fields.599c2594-7f7c-47e8-ab7f-5f15ea9d8f90.settings.availableVolumes','\"*\"'),('fields.599c2594-7f7c-47e8-ab7f-5f15ea9d8f90.settings.ckeConfig','\"861c6252-90ad-422d-b3bc-8eb31c71d798\"'),('fields.599c2594-7f7c-47e8-ab7f-5f15ea9d8f90.settings.createButtonLabel','null'),('fields.599c2594-7f7c-47e8-ab7f-5f15ea9d8f90.settings.defaultTransform','null'),('fields.599c2594-7f7c-47e8-ab7f-5f15ea9d8f90.settings.enableSourceEditingForNonAdmins','false'),('fields.599c2594-7f7c-47e8-ab7f-5f15ea9d8f90.settings.purifierConfig','null'),('fields.599c2594-7f7c-47e8-ab7f-5f15ea9d8f90.settings.purifyHtml','true'),('fields.599c2594-7f7c-47e8-ab7f-5f15ea9d8f90.settings.showUnpermittedFiles','false'),('fields.599c2594-7f7c-47e8-ab7f-5f15ea9d8f90.settings.showUnpermittedVolumes','false'),('fields.599c2594-7f7c-47e8-ab7f-5f15ea9d8f90.settings.showWordCount','false'),('fields.599c2594-7f7c-47e8-ab7f-5f15ea9d8f90.settings.wordLimit','null'),('fields.599c2594-7f7c-47e8-ab7f-5f15ea9d8f90.translationKeyFormat','null'),('fields.599c2594-7f7c-47e8-ab7f-5f15ea9d8f90.translationMethod','\"none\"'),('fields.599c2594-7f7c-47e8-ab7f-5f15ea9d8f90.type','\"craft\\\\ckeditor\\\\Field\"'),('fields.614813c6-21cb-4c1a-bb3b-f1373d4c80fe.columnSuffix','null'),('fields.614813c6-21cb-4c1a-bb3b-f1373d4c80fe.handle','\"metadataDescription\"'),('fields.614813c6-21cb-4c1a-bb3b-f1373d4c80fe.instructions','null'),('fields.614813c6-21cb-4c1a-bb3b-f1373d4c80fe.name','\"Metadata Description\"'),('fields.614813c6-21cb-4c1a-bb3b-f1373d4c80fe.searchable','false'),('fields.614813c6-21cb-4c1a-bb3b-f1373d4c80fe.settings.availableTransforms','\"*\"'),('fields.614813c6-21cb-4c1a-bb3b-f1373d4c80fe.settings.availableVolumes','\"*\"'),('fields.614813c6-21cb-4c1a-bb3b-f1373d4c80fe.settings.characterLimit','null'),('fields.614813c6-21cb-4c1a-bb3b-f1373d4c80fe.settings.ckeConfig','\"4c6e825a-41ed-4b29-b9e6-13d83e2d675d\"'),('fields.614813c6-21cb-4c1a-bb3b-f1373d4c80fe.settings.createButtonLabel','null'),('fields.614813c6-21cb-4c1a-bb3b-f1373d4c80fe.settings.defaultTransform','null'),('fields.614813c6-21cb-4c1a-bb3b-f1373d4c80fe.settings.expandEntryButtons','false'),('fields.614813c6-21cb-4c1a-bb3b-f1373d4c80fe.settings.fullGraphqlData','true'),('fields.614813c6-21cb-4c1a-bb3b-f1373d4c80fe.settings.parseEmbeds','false'),('fields.614813c6-21cb-4c1a-bb3b-f1373d4c80fe.settings.purifierConfig','null'),('fields.614813c6-21cb-4c1a-bb3b-f1373d4c80fe.settings.purifyHtml','true'),('fields.614813c6-21cb-4c1a-bb3b-f1373d4c80fe.settings.showUnpermittedFiles','false'),('fields.614813c6-21cb-4c1a-bb3b-f1373d4c80fe.settings.showUnpermittedVolumes','false'),('fields.614813c6-21cb-4c1a-bb3b-f1373d4c80fe.settings.showWordCount','false'),('fields.614813c6-21cb-4c1a-bb3b-f1373d4c80fe.settings.sourceEditingGroups.0','\"__ADMINS__\"'),('fields.614813c6-21cb-4c1a-bb3b-f1373d4c80fe.settings.wordLimit','null'),('fields.614813c6-21cb-4c1a-bb3b-f1373d4c80fe.translationKeyFormat','null'),('fields.614813c6-21cb-4c1a-bb3b-f1373d4c80fe.translationMethod','\"none\"'),('fields.614813c6-21cb-4c1a-bb3b-f1373d4c80fe.type','\"craft\\\\ckeditor\\\\Field\"'),('fields.67df4def-30b8-4e8b-82b0-b01e4b5b783a.columnSuffix','null'),('fields.67df4def-30b8-4e8b-82b0-b01e4b5b783a.handle','\"categorySelection\"'),('fields.67df4def-30b8-4e8b-82b0-b01e4b5b783a.instructions','null'),('fields.67df4def-30b8-4e8b-82b0-b01e4b5b783a.name','\"Category Selection\"'),('fields.67df4def-30b8-4e8b-82b0-b01e4b5b783a.searchable','false'),('fields.67df4def-30b8-4e8b-82b0-b01e4b5b783a.settings.allowSelfRelations','false'),('fields.67df4def-30b8-4e8b-82b0-b01e4b5b783a.settings.branchLimit','null'),('fields.67df4def-30b8-4e8b-82b0-b01e4b5b783a.settings.defaultPlacement','\"end\"'),('fields.67df4def-30b8-4e8b-82b0-b01e4b5b783a.settings.maintainHierarchy','false'),('fields.67df4def-30b8-4e8b-82b0-b01e4b5b783a.settings.maxRelations','1'),('fields.67df4def-30b8-4e8b-82b0-b01e4b5b783a.settings.minRelations','1'),('fields.67df4def-30b8-4e8b-82b0-b01e4b5b783a.settings.selectionLabel','null'),('fields.67df4def-30b8-4e8b-82b0-b01e4b5b783a.settings.showCardsInGrid','false'),('fields.67df4def-30b8-4e8b-82b0-b01e4b5b783a.settings.showSearchInput','true'),('fields.67df4def-30b8-4e8b-82b0-b01e4b5b783a.settings.showSiteMenu','false'),('fields.67df4def-30b8-4e8b-82b0-b01e4b5b783a.settings.source','\"group:ed370231-a5e5-4af1-bd6a-98735fcda9fb\"'),('fields.67df4def-30b8-4e8b-82b0-b01e4b5b783a.settings.targetSiteId','null'),('fields.67df4def-30b8-4e8b-82b0-b01e4b5b783a.settings.validateRelatedElements','false'),('fields.67df4def-30b8-4e8b-82b0-b01e4b5b783a.settings.viewMode','\"list\"'),('fields.67df4def-30b8-4e8b-82b0-b01e4b5b783a.translationKeyFormat','null'),('fields.67df4def-30b8-4e8b-82b0-b01e4b5b783a.translationMethod','\"none\"'),('fields.67df4def-30b8-4e8b-82b0-b01e4b5b783a.type','\"craft\\\\fields\\\\Categories\"'),('fields.7104f57b-112f-4c96-84cf-eda1c75fe796.columnSuffix','null'),('fields.7104f57b-112f-4c96-84cf-eda1c75fe796.handle','\"textfield\"'),('fields.7104f57b-112f-4c96-84cf-eda1c75fe796.instructions','null'),('fields.7104f57b-112f-4c96-84cf-eda1c75fe796.name','\"Textfield\"'),('fields.7104f57b-112f-4c96-84cf-eda1c75fe796.searchable','false'),('fields.7104f57b-112f-4c96-84cf-eda1c75fe796.settings.availableTransforms','\"*\"'),('fields.7104f57b-112f-4c96-84cf-eda1c75fe796.settings.availableVolumes','\"*\"'),('fields.7104f57b-112f-4c96-84cf-eda1c75fe796.settings.ckeConfig','\"becfe5ca-3a1d-4962-8fc7-30c4caf3a387\"'),('fields.7104f57b-112f-4c96-84cf-eda1c75fe796.settings.createButtonLabel','null'),('fields.7104f57b-112f-4c96-84cf-eda1c75fe796.settings.defaultTransform','null'),('fields.7104f57b-112f-4c96-84cf-eda1c75fe796.settings.enableSourceEditingForNonAdmins','false'),('fields.7104f57b-112f-4c96-84cf-eda1c75fe796.settings.purifierConfig','null'),('fields.7104f57b-112f-4c96-84cf-eda1c75fe796.settings.purifyHtml','true'),('fields.7104f57b-112f-4c96-84cf-eda1c75fe796.settings.showUnpermittedFiles','false'),('fields.7104f57b-112f-4c96-84cf-eda1c75fe796.settings.showUnpermittedVolumes','false'),('fields.7104f57b-112f-4c96-84cf-eda1c75fe796.settings.showWordCount','false'),('fields.7104f57b-112f-4c96-84cf-eda1c75fe796.settings.wordLimit','null'),('fields.7104f57b-112f-4c96-84cf-eda1c75fe796.translationKeyFormat','null'),('fields.7104f57b-112f-4c96-84cf-eda1c75fe796.translationMethod','\"none\"'),('fields.7104f57b-112f-4c96-84cf-eda1c75fe796.type','\"craft\\\\ckeditor\\\\Field\"'),('fields.8319de11-8b0e-487f-83c2-5032ef70e346.columnSuffix','null'),('fields.8319de11-8b0e-487f-83c2-5032ef70e346.handle','\"footer\"'),('fields.8319de11-8b0e-487f-83c2-5032ef70e346.instructions','null'),('fields.8319de11-8b0e-487f-83c2-5032ef70e346.name','\"Footer\"'),('fields.8319de11-8b0e-487f-83c2-5032ef70e346.searchable','false'),('fields.8319de11-8b0e-487f-83c2-5032ef70e346.settings.allowSelfRelations','false'),('fields.8319de11-8b0e-487f-83c2-5032ef70e346.settings.branchLimit','null'),('fields.8319de11-8b0e-487f-83c2-5032ef70e346.settings.maintainHierarchy','false'),('fields.8319de11-8b0e-487f-83c2-5032ef70e346.settings.maxRelations','null'),('fields.8319de11-8b0e-487f-83c2-5032ef70e346.settings.minRelations','null'),('fields.8319de11-8b0e-487f-83c2-5032ef70e346.settings.selectionLabel','null'),('fields.8319de11-8b0e-487f-83c2-5032ef70e346.settings.showCardsInGrid','false'),('fields.8319de11-8b0e-487f-83c2-5032ef70e346.settings.showSiteMenu','true'),('fields.8319de11-8b0e-487f-83c2-5032ef70e346.settings.sources.0','\"singles\"'),('fields.8319de11-8b0e-487f-83c2-5032ef70e346.settings.targetSiteId','null'),('fields.8319de11-8b0e-487f-83c2-5032ef70e346.settings.validateRelatedElements','false'),('fields.8319de11-8b0e-487f-83c2-5032ef70e346.settings.viewMode','\"list\"'),('fields.8319de11-8b0e-487f-83c2-5032ef70e346.translationKeyFormat','null'),('fields.8319de11-8b0e-487f-83c2-5032ef70e346.translationMethod','\"none\"'),('fields.8319de11-8b0e-487f-83c2-5032ef70e346.type','\"craft\\\\fields\\\\Entries\"'),('fields.89a65ca6-59b1-4161-a8ca-e27dc33a1765.columnSuffix','null'),('fields.89a65ca6-59b1-4161-a8ca-e27dc33a1765.handle','\"websiteSocialLinks\"'),('fields.89a65ca6-59b1-4161-a8ca-e27dc33a1765.instructions','null'),('fields.89a65ca6-59b1-4161-a8ca-e27dc33a1765.name','\"Website Social Links\"'),('fields.89a65ca6-59b1-4161-a8ca-e27dc33a1765.searchable','false'),('fields.89a65ca6-59b1-4161-a8ca-e27dc33a1765.settings.addRowLabel','\"Add a row\"'),('fields.89a65ca6-59b1-4161-a8ca-e27dc33a1765.settings.columns.__assoc__.0.0','\"col2\"'),('fields.89a65ca6-59b1-4161-a8ca-e27dc33a1765.settings.columns.__assoc__.0.1.__assoc__.0.0','\"heading\"'),('fields.89a65ca6-59b1-4161-a8ca-e27dc33a1765.settings.columns.__assoc__.0.1.__assoc__.0.1','\"Name\"'),('fields.89a65ca6-59b1-4161-a8ca-e27dc33a1765.settings.columns.__assoc__.0.1.__assoc__.1.0','\"handle\"'),('fields.89a65ca6-59b1-4161-a8ca-e27dc33a1765.settings.columns.__assoc__.0.1.__assoc__.1.1','\"name\"'),('fields.89a65ca6-59b1-4161-a8ca-e27dc33a1765.settings.columns.__assoc__.0.1.__assoc__.2.0','\"width\"'),('fields.89a65ca6-59b1-4161-a8ca-e27dc33a1765.settings.columns.__assoc__.0.1.__assoc__.2.1','\"\"'),('fields.89a65ca6-59b1-4161-a8ca-e27dc33a1765.settings.columns.__assoc__.0.1.__assoc__.3.0','\"type\"'),('fields.89a65ca6-59b1-4161-a8ca-e27dc33a1765.settings.columns.__assoc__.0.1.__assoc__.3.1','\"singleline\"'),('fields.89a65ca6-59b1-4161-a8ca-e27dc33a1765.settings.columns.__assoc__.1.0','\"col3\"'),('fields.89a65ca6-59b1-4161-a8ca-e27dc33a1765.settings.columns.__assoc__.1.1.__assoc__.0.0','\"heading\"'),('fields.89a65ca6-59b1-4161-a8ca-e27dc33a1765.settings.columns.__assoc__.1.1.__assoc__.0.1','\"URL\"'),('fields.89a65ca6-59b1-4161-a8ca-e27dc33a1765.settings.columns.__assoc__.1.1.__assoc__.1.0','\"handle\"'),('fields.89a65ca6-59b1-4161-a8ca-e27dc33a1765.settings.columns.__assoc__.1.1.__assoc__.1.1','\"url\"'),('fields.89a65ca6-59b1-4161-a8ca-e27dc33a1765.settings.columns.__assoc__.1.1.__assoc__.2.0','\"width\"'),('fields.89a65ca6-59b1-4161-a8ca-e27dc33a1765.settings.columns.__assoc__.1.1.__assoc__.2.1','\"\"'),('fields.89a65ca6-59b1-4161-a8ca-e27dc33a1765.settings.columns.__assoc__.1.1.__assoc__.3.0','\"type\"'),('fields.89a65ca6-59b1-4161-a8ca-e27dc33a1765.settings.columns.__assoc__.1.1.__assoc__.3.1','\"url\"'),('fields.89a65ca6-59b1-4161-a8ca-e27dc33a1765.settings.defaults','null'),('fields.89a65ca6-59b1-4161-a8ca-e27dc33a1765.settings.maxRows','null'),('fields.89a65ca6-59b1-4161-a8ca-e27dc33a1765.settings.minRows','null'),('fields.89a65ca6-59b1-4161-a8ca-e27dc33a1765.settings.staticRows','false'),('fields.89a65ca6-59b1-4161-a8ca-e27dc33a1765.translationKeyFormat','null'),('fields.89a65ca6-59b1-4161-a8ca-e27dc33a1765.translationMethod','\"none\"'),('fields.89a65ca6-59b1-4161-a8ca-e27dc33a1765.type','\"craft\\\\fields\\\\Table\"'),('fields.94105fd8-47a5-4c58-9ac1-b9bdc86ac4e4.columnSuffix','null'),('fields.94105fd8-47a5-4c58-9ac1-b9bdc86ac4e4.handle','\"imageGallery\"'),('fields.94105fd8-47a5-4c58-9ac1-b9bdc86ac4e4.instructions','null'),('fields.94105fd8-47a5-4c58-9ac1-b9bdc86ac4e4.name','\"Image Gallery\"'),('fields.94105fd8-47a5-4c58-9ac1-b9bdc86ac4e4.searchable','false'),('fields.94105fd8-47a5-4c58-9ac1-b9bdc86ac4e4.settings.allowedKinds.0','\"image\"'),('fields.94105fd8-47a5-4c58-9ac1-b9bdc86ac4e4.settings.allowSelfRelations','false'),('fields.94105fd8-47a5-4c58-9ac1-b9bdc86ac4e4.settings.allowSubfolders','false'),('fields.94105fd8-47a5-4c58-9ac1-b9bdc86ac4e4.settings.allowUploads','true'),('fields.94105fd8-47a5-4c58-9ac1-b9bdc86ac4e4.settings.branchLimit','null'),('fields.94105fd8-47a5-4c58-9ac1-b9bdc86ac4e4.settings.defaultUploadLocationSource','\"volume:21950e08-1320-46dd-b9f3-8ddae1b3aa50\"'),('fields.94105fd8-47a5-4c58-9ac1-b9bdc86ac4e4.settings.defaultUploadLocationSubpath','null'),('fields.94105fd8-47a5-4c58-9ac1-b9bdc86ac4e4.settings.maintainHierarchy','false'),('fields.94105fd8-47a5-4c58-9ac1-b9bdc86ac4e4.settings.maxRelations','null'),('fields.94105fd8-47a5-4c58-9ac1-b9bdc86ac4e4.settings.minRelations','null'),('fields.94105fd8-47a5-4c58-9ac1-b9bdc86ac4e4.settings.previewMode','\"thumbs\"'),('fields.94105fd8-47a5-4c58-9ac1-b9bdc86ac4e4.settings.restrictedDefaultUploadSubpath','null'),('fields.94105fd8-47a5-4c58-9ac1-b9bdc86ac4e4.settings.restrictedLocationSource','\"volume:21950e08-1320-46dd-b9f3-8ddae1b3aa50\"'),('fields.94105fd8-47a5-4c58-9ac1-b9bdc86ac4e4.settings.restrictedLocationSubpath','null'),('fields.94105fd8-47a5-4c58-9ac1-b9bdc86ac4e4.settings.restrictFiles','true'),('fields.94105fd8-47a5-4c58-9ac1-b9bdc86ac4e4.settings.restrictLocation','false'),('fields.94105fd8-47a5-4c58-9ac1-b9bdc86ac4e4.settings.selectionLabel','null'),('fields.94105fd8-47a5-4c58-9ac1-b9bdc86ac4e4.settings.showCardsInGrid','false'),('fields.94105fd8-47a5-4c58-9ac1-b9bdc86ac4e4.settings.showSiteMenu','false'),('fields.94105fd8-47a5-4c58-9ac1-b9bdc86ac4e4.settings.showUnpermittedFiles','false'),('fields.94105fd8-47a5-4c58-9ac1-b9bdc86ac4e4.settings.showUnpermittedVolumes','false'),('fields.94105fd8-47a5-4c58-9ac1-b9bdc86ac4e4.settings.sources.0','\"volume:21950e08-1320-46dd-b9f3-8ddae1b3aa50\"'),('fields.94105fd8-47a5-4c58-9ac1-b9bdc86ac4e4.settings.targetSiteId','null'),('fields.94105fd8-47a5-4c58-9ac1-b9bdc86ac4e4.settings.validateRelatedElements','false'),('fields.94105fd8-47a5-4c58-9ac1-b9bdc86ac4e4.settings.viewMode','\"large\"'),('fields.94105fd8-47a5-4c58-9ac1-b9bdc86ac4e4.translationKeyFormat','null'),('fields.94105fd8-47a5-4c58-9ac1-b9bdc86ac4e4.translationMethod','\"none\"'),('fields.94105fd8-47a5-4c58-9ac1-b9bdc86ac4e4.type','\"craft\\\\fields\\\\Assets\"'),('fields.9fa6c3db-85f7-4431-831a-05a8249b0e26.columnSuffix','null'),('fields.9fa6c3db-85f7-4431-831a-05a8249b0e26.handle','\"metadataTitle\"'),('fields.9fa6c3db-85f7-4431-831a-05a8249b0e26.instructions','null'),('fields.9fa6c3db-85f7-4431-831a-05a8249b0e26.name','\"Metadata Title\"'),('fields.9fa6c3db-85f7-4431-831a-05a8249b0e26.searchable','false'),('fields.9fa6c3db-85f7-4431-831a-05a8249b0e26.settings.byteLimit','null'),('fields.9fa6c3db-85f7-4431-831a-05a8249b0e26.settings.charLimit','null'),('fields.9fa6c3db-85f7-4431-831a-05a8249b0e26.settings.code','false'),('fields.9fa6c3db-85f7-4431-831a-05a8249b0e26.settings.initialRows','4'),('fields.9fa6c3db-85f7-4431-831a-05a8249b0e26.settings.multiline','false'),('fields.9fa6c3db-85f7-4431-831a-05a8249b0e26.settings.placeholder','null'),('fields.9fa6c3db-85f7-4431-831a-05a8249b0e26.settings.uiMode','\"normal\"'),('fields.9fa6c3db-85f7-4431-831a-05a8249b0e26.translationKeyFormat','null'),('fields.9fa6c3db-85f7-4431-831a-05a8249b0e26.translationMethod','\"none\"'),('fields.9fa6c3db-85f7-4431-831a-05a8249b0e26.type','\"craft\\\\fields\\\\PlainText\"'),('fields.a2cae9f8-a8d7-4405-bb16-8546f16f6e4c.columnSuffix','null'),('fields.a2cae9f8-a8d7-4405-bb16-8546f16f6e4c.handle','\"text\"'),('fields.a2cae9f8-a8d7-4405-bb16-8546f16f6e4c.instructions','null'),('fields.a2cae9f8-a8d7-4405-bb16-8546f16f6e4c.name','\"Text\"'),('fields.a2cae9f8-a8d7-4405-bb16-8546f16f6e4c.searchable','false'),('fields.a2cae9f8-a8d7-4405-bb16-8546f16f6e4c.settings.byteLimit','null'),('fields.a2cae9f8-a8d7-4405-bb16-8546f16f6e4c.settings.charLimit','null'),('fields.a2cae9f8-a8d7-4405-bb16-8546f16f6e4c.settings.code','false'),('fields.a2cae9f8-a8d7-4405-bb16-8546f16f6e4c.settings.initialRows','4'),('fields.a2cae9f8-a8d7-4405-bb16-8546f16f6e4c.settings.multiline','false'),('fields.a2cae9f8-a8d7-4405-bb16-8546f16f6e4c.settings.placeholder','null'),('fields.a2cae9f8-a8d7-4405-bb16-8546f16f6e4c.settings.uiMode','\"normal\"'),('fields.a2cae9f8-a8d7-4405-bb16-8546f16f6e4c.translationKeyFormat','null'),('fields.a2cae9f8-a8d7-4405-bb16-8546f16f6e4c.translationMethod','\"none\"'),('fields.a2cae9f8-a8d7-4405-bb16-8546f16f6e4c.type','\"craft\\\\fields\\\\PlainText\"'),('fields.aa2ef690-cdae-4baa-882a-4ff5431f482e.columnSuffix','null'),('fields.aa2ef690-cdae-4baa-882a-4ff5431f482e.handle','\"imprintTextfield\"'),('fields.aa2ef690-cdae-4baa-882a-4ff5431f482e.instructions','null'),('fields.aa2ef690-cdae-4baa-882a-4ff5431f482e.name','\"Imprint Textfield\"'),('fields.aa2ef690-cdae-4baa-882a-4ff5431f482e.searchable','false'),('fields.aa2ef690-cdae-4baa-882a-4ff5431f482e.settings.availableTransforms','\"*\"'),('fields.aa2ef690-cdae-4baa-882a-4ff5431f482e.settings.availableVolumes','\"*\"'),('fields.aa2ef690-cdae-4baa-882a-4ff5431f482e.settings.characterLimit','null'),('fields.aa2ef690-cdae-4baa-882a-4ff5431f482e.settings.ckeConfig','\"f1f84e81-4f8a-443b-acac-309e7aac4ee4\"'),('fields.aa2ef690-cdae-4baa-882a-4ff5431f482e.settings.createButtonLabel','null'),('fields.aa2ef690-cdae-4baa-882a-4ff5431f482e.settings.defaultTransform','null'),('fields.aa2ef690-cdae-4baa-882a-4ff5431f482e.settings.expandEntryButtons','false'),('fields.aa2ef690-cdae-4baa-882a-4ff5431f482e.settings.fullGraphqlData','true'),('fields.aa2ef690-cdae-4baa-882a-4ff5431f482e.settings.parseEmbeds','false'),('fields.aa2ef690-cdae-4baa-882a-4ff5431f482e.settings.purifierConfig','null'),('fields.aa2ef690-cdae-4baa-882a-4ff5431f482e.settings.purifyHtml','true'),('fields.aa2ef690-cdae-4baa-882a-4ff5431f482e.settings.showUnpermittedFiles','false'),('fields.aa2ef690-cdae-4baa-882a-4ff5431f482e.settings.showUnpermittedVolumes','false'),('fields.aa2ef690-cdae-4baa-882a-4ff5431f482e.settings.showWordCount','false'),('fields.aa2ef690-cdae-4baa-882a-4ff5431f482e.settings.sourceEditingGroups.0','\"__ADMINS__\"'),('fields.aa2ef690-cdae-4baa-882a-4ff5431f482e.settings.wordLimit','null'),('fields.aa2ef690-cdae-4baa-882a-4ff5431f482e.translationKeyFormat','null'),('fields.aa2ef690-cdae-4baa-882a-4ff5431f482e.translationMethod','\"none\"'),('fields.aa2ef690-cdae-4baa-882a-4ff5431f482e.type','\"craft\\\\ckeditor\\\\Field\"'),('fields.bebc23d5-2d50-4499-ae0d-6aa66437be5e.columnSuffix','null'),('fields.bebc23d5-2d50-4499-ae0d-6aa66437be5e.handle','\"copyright\"'),('fields.bebc23d5-2d50-4499-ae0d-6aa66437be5e.instructions','null'),('fields.bebc23d5-2d50-4499-ae0d-6aa66437be5e.name','\"Copyright\"'),('fields.bebc23d5-2d50-4499-ae0d-6aa66437be5e.searchable','false'),('fields.bebc23d5-2d50-4499-ae0d-6aa66437be5e.settings.byteLimit','null'),('fields.bebc23d5-2d50-4499-ae0d-6aa66437be5e.settings.charLimit','null'),('fields.bebc23d5-2d50-4499-ae0d-6aa66437be5e.settings.code','false'),('fields.bebc23d5-2d50-4499-ae0d-6aa66437be5e.settings.initialRows','4'),('fields.bebc23d5-2d50-4499-ae0d-6aa66437be5e.settings.multiline','false'),('fields.bebc23d5-2d50-4499-ae0d-6aa66437be5e.settings.placeholder','null'),('fields.bebc23d5-2d50-4499-ae0d-6aa66437be5e.settings.uiMode','\"normal\"'),('fields.bebc23d5-2d50-4499-ae0d-6aa66437be5e.translationKeyFormat','null'),('fields.bebc23d5-2d50-4499-ae0d-6aa66437be5e.translationMethod','\"none\"'),('fields.bebc23d5-2d50-4499-ae0d-6aa66437be5e.type','\"craft\\\\fields\\\\PlainText\"'),('fields.da87989f-6fba-4fb3-afae-2501b651f019.columnSuffix','null'),('fields.da87989f-6fba-4fb3-afae-2501b651f019.handle','\"altText\"'),('fields.da87989f-6fba-4fb3-afae-2501b651f019.instructions','null'),('fields.da87989f-6fba-4fb3-afae-2501b651f019.name','\"Alt Text\"'),('fields.da87989f-6fba-4fb3-afae-2501b651f019.searchable','false'),('fields.da87989f-6fba-4fb3-afae-2501b651f019.settings.byteLimit','null'),('fields.da87989f-6fba-4fb3-afae-2501b651f019.settings.charLimit','null'),('fields.da87989f-6fba-4fb3-afae-2501b651f019.settings.code','false'),('fields.da87989f-6fba-4fb3-afae-2501b651f019.settings.initialRows','4'),('fields.da87989f-6fba-4fb3-afae-2501b651f019.settings.multiline','false'),('fields.da87989f-6fba-4fb3-afae-2501b651f019.settings.placeholder','null'),('fields.da87989f-6fba-4fb3-afae-2501b651f019.settings.uiMode','\"normal\"'),('fields.da87989f-6fba-4fb3-afae-2501b651f019.translationKeyFormat','null'),('fields.da87989f-6fba-4fb3-afae-2501b651f019.translationMethod','\"none\"'),('fields.da87989f-6fba-4fb3-afae-2501b651f019.type','\"craft\\\\fields\\\\PlainText\"'),('fields.e344ac15-6d4b-4dca-a3e3-a23af0036956.columnSuffix','null'),('fields.e344ac15-6d4b-4dca-a3e3-a23af0036956.handle','\"metadataImage\"'),('fields.e344ac15-6d4b-4dca-a3e3-a23af0036956.instructions','\"Preview image (1200×630) shown when the page link is shared\"'),('fields.e344ac15-6d4b-4dca-a3e3-a23af0036956.name','\"Metadata Image\"'),('fields.e344ac15-6d4b-4dca-a3e3-a23af0036956.searchable','false'),('fields.e344ac15-6d4b-4dca-a3e3-a23af0036956.settings.allowedKinds','null'),('fields.e344ac15-6d4b-4dca-a3e3-a23af0036956.settings.allowSelfRelations','false'),('fields.e344ac15-6d4b-4dca-a3e3-a23af0036956.settings.allowSubfolders','false'),('fields.e344ac15-6d4b-4dca-a3e3-a23af0036956.settings.allowUploads','true'),('fields.e344ac15-6d4b-4dca-a3e3-a23af0036956.settings.branchLimit','null'),('fields.e344ac15-6d4b-4dca-a3e3-a23af0036956.settings.defaultPlacement','\"end\"'),('fields.e344ac15-6d4b-4dca-a3e3-a23af0036956.settings.defaultUploadLocationSource','\"volume:21950e08-1320-46dd-b9f3-8ddae1b3aa50\"'),('fields.e344ac15-6d4b-4dca-a3e3-a23af0036956.settings.defaultUploadLocationSubpath','null'),('fields.e344ac15-6d4b-4dca-a3e3-a23af0036956.settings.maintainHierarchy','false'),('fields.e344ac15-6d4b-4dca-a3e3-a23af0036956.settings.maxRelations','1'),('fields.e344ac15-6d4b-4dca-a3e3-a23af0036956.settings.minRelations','0'),('fields.e344ac15-6d4b-4dca-a3e3-a23af0036956.settings.previewMode','\"full\"'),('fields.e344ac15-6d4b-4dca-a3e3-a23af0036956.settings.restrictedDefaultUploadSubpath','null'),('fields.e344ac15-6d4b-4dca-a3e3-a23af0036956.settings.restrictedLocationSource','\"volume:21950e08-1320-46dd-b9f3-8ddae1b3aa50\"'),('fields.e344ac15-6d4b-4dca-a3e3-a23af0036956.settings.restrictedLocationSubpath','null'),('fields.e344ac15-6d4b-4dca-a3e3-a23af0036956.settings.restrictFiles','false'),('fields.e344ac15-6d4b-4dca-a3e3-a23af0036956.settings.restrictLocation','false'),('fields.e344ac15-6d4b-4dca-a3e3-a23af0036956.settings.selectionLabel','null'),('fields.e344ac15-6d4b-4dca-a3e3-a23af0036956.settings.showCardsInGrid','false'),('fields.e344ac15-6d4b-4dca-a3e3-a23af0036956.settings.showSearchInput','true'),('fields.e344ac15-6d4b-4dca-a3e3-a23af0036956.settings.showSiteMenu','true'),('fields.e344ac15-6d4b-4dca-a3e3-a23af0036956.settings.showUnpermittedFiles','false'),('fields.e344ac15-6d4b-4dca-a3e3-a23af0036956.settings.showUnpermittedVolumes','false'),('fields.e344ac15-6d4b-4dca-a3e3-a23af0036956.settings.sources.0','\"volume:21950e08-1320-46dd-b9f3-8ddae1b3aa50\"'),('fields.e344ac15-6d4b-4dca-a3e3-a23af0036956.settings.targetSiteId','null'),('fields.e344ac15-6d4b-4dca-a3e3-a23af0036956.settings.validateRelatedElements','false'),('fields.e344ac15-6d4b-4dca-a3e3-a23af0036956.settings.viewMode','\"large\"'),('fields.e344ac15-6d4b-4dca-a3e3-a23af0036956.translationKeyFormat','null'),('fields.e344ac15-6d4b-4dca-a3e3-a23af0036956.translationMethod','\"none\"'),('fields.e344ac15-6d4b-4dca-a3e3-a23af0036956.type','\"craft\\\\fields\\\\Assets\"'),('fields.e65df9b6-f654-4750-b847-46e355ec1c39.columnSuffix','null'),('fields.e65df9b6-f654-4750-b847-46e355ec1c39.handle','\"websiteContact\"'),('fields.e65df9b6-f654-4750-b847-46e355ec1c39.instructions','null'),('fields.e65df9b6-f654-4750-b847-46e355ec1c39.name','\"Website Contact\"'),('fields.e65df9b6-f654-4750-b847-46e355ec1c39.searchable','false'),('fields.e65df9b6-f654-4750-b847-46e355ec1c39.settings.availableTransforms','\"*\"'),('fields.e65df9b6-f654-4750-b847-46e355ec1c39.settings.availableVolumes','\"*\"'),('fields.e65df9b6-f654-4750-b847-46e355ec1c39.settings.ckeConfig','\"5e0d7bb4-8904-49ac-ac02-07a8b46945db\"'),('fields.e65df9b6-f654-4750-b847-46e355ec1c39.settings.createButtonLabel','null'),('fields.e65df9b6-f654-4750-b847-46e355ec1c39.settings.defaultTransform','null'),('fields.e65df9b6-f654-4750-b847-46e355ec1c39.settings.enableSourceEditingForNonAdmins','false'),('fields.e65df9b6-f654-4750-b847-46e355ec1c39.settings.purifierConfig','null'),('fields.e65df9b6-f654-4750-b847-46e355ec1c39.settings.purifyHtml','true'),('fields.e65df9b6-f654-4750-b847-46e355ec1c39.settings.showUnpermittedFiles','false'),('fields.e65df9b6-f654-4750-b847-46e355ec1c39.settings.showUnpermittedVolumes','false'),('fields.e65df9b6-f654-4750-b847-46e355ec1c39.settings.showWordCount','false'),('fields.e65df9b6-f654-4750-b847-46e355ec1c39.settings.wordLimit','null'),('fields.e65df9b6-f654-4750-b847-46e355ec1c39.translationKeyFormat','null'),('fields.e65df9b6-f654-4750-b847-46e355ec1c39.translationMethod','\"none\"'),('fields.e65df9b6-f654-4750-b847-46e355ec1c39.type','\"craft\\\\ckeditor\\\\Field\"'),('fields.e9bcbfad-06b8-466d-b605-34bb3a34f00f.columnSuffix','null'),('fields.e9bcbfad-06b8-466d-b605-34bb3a34f00f.handle','\"metadataList\"'),('fields.e9bcbfad-06b8-466d-b605-34bb3a34f00f.instructions','\"Only add additional global meta tags here. Page-specific title and description tags are automatically pulled from each page, and adding them here can cause conflicts. Default global values can be set in the fields above\"'),('fields.e9bcbfad-06b8-466d-b605-34bb3a34f00f.name','\"Metadata List\"'),('fields.e9bcbfad-06b8-466d-b605-34bb3a34f00f.searchable','false'),('fields.e9bcbfad-06b8-466d-b605-34bb3a34f00f.settings.addRowLabel','\"Add a row\"'),('fields.e9bcbfad-06b8-466d-b605-34bb3a34f00f.settings.columns.__assoc__.0.0','\"col1\"'),('fields.e9bcbfad-06b8-466d-b605-34bb3a34f00f.settings.columns.__assoc__.0.1.__assoc__.0.0','\"heading\"'),('fields.e9bcbfad-06b8-466d-b605-34bb3a34f00f.settings.columns.__assoc__.0.1.__assoc__.0.1','\"Type\"'),('fields.e9bcbfad-06b8-466d-b605-34bb3a34f00f.settings.columns.__assoc__.0.1.__assoc__.1.0','\"handle\"'),('fields.e9bcbfad-06b8-466d-b605-34bb3a34f00f.settings.columns.__assoc__.0.1.__assoc__.1.1','\"type\"'),('fields.e9bcbfad-06b8-466d-b605-34bb3a34f00f.settings.columns.__assoc__.0.1.__assoc__.2.0','\"width\"'),('fields.e9bcbfad-06b8-466d-b605-34bb3a34f00f.settings.columns.__assoc__.0.1.__assoc__.2.1','\"\"'),('fields.e9bcbfad-06b8-466d-b605-34bb3a34f00f.settings.columns.__assoc__.0.1.__assoc__.3.0','\"type\"'),('fields.e9bcbfad-06b8-466d-b605-34bb3a34f00f.settings.columns.__assoc__.0.1.__assoc__.3.1','\"select\"'),('fields.e9bcbfad-06b8-466d-b605-34bb3a34f00f.settings.columns.__assoc__.1.0','\"col2\"'),('fields.e9bcbfad-06b8-466d-b605-34bb3a34f00f.settings.columns.__assoc__.1.1.__assoc__.0.0','\"heading\"'),('fields.e9bcbfad-06b8-466d-b605-34bb3a34f00f.settings.columns.__assoc__.1.1.__assoc__.0.1','\"Description\"'),('fields.e9bcbfad-06b8-466d-b605-34bb3a34f00f.settings.columns.__assoc__.1.1.__assoc__.1.0','\"handle\"'),('fields.e9bcbfad-06b8-466d-b605-34bb3a34f00f.settings.columns.__assoc__.1.1.__assoc__.1.1','\"description\"'),('fields.e9bcbfad-06b8-466d-b605-34bb3a34f00f.settings.columns.__assoc__.1.1.__assoc__.2.0','\"width\"'),('fields.e9bcbfad-06b8-466d-b605-34bb3a34f00f.settings.columns.__assoc__.1.1.__assoc__.2.1','\"\"'),('fields.e9bcbfad-06b8-466d-b605-34bb3a34f00f.settings.columns.__assoc__.1.1.__assoc__.3.0','\"type\"'),('fields.e9bcbfad-06b8-466d-b605-34bb3a34f00f.settings.columns.__assoc__.1.1.__assoc__.3.1','\"singleline\"'),('fields.e9bcbfad-06b8-466d-b605-34bb3a34f00f.settings.columns.__assoc__.2.0','\"col3\"'),('fields.e9bcbfad-06b8-466d-b605-34bb3a34f00f.settings.columns.__assoc__.2.1.__assoc__.0.0','\"heading\"'),('fields.e9bcbfad-06b8-466d-b605-34bb3a34f00f.settings.columns.__assoc__.2.1.__assoc__.0.1','\"Content\"'),('fields.e9bcbfad-06b8-466d-b605-34bb3a34f00f.settings.columns.__assoc__.2.1.__assoc__.1.0','\"handle\"'),('fields.e9bcbfad-06b8-466d-b605-34bb3a34f00f.settings.columns.__assoc__.2.1.__assoc__.1.1','\"content\"'),('fields.e9bcbfad-06b8-466d-b605-34bb3a34f00f.settings.columns.__assoc__.2.1.__assoc__.2.0','\"width\"'),('fields.e9bcbfad-06b8-466d-b605-34bb3a34f00f.settings.columns.__assoc__.2.1.__assoc__.2.1','\"\"'),('fields.e9bcbfad-06b8-466d-b605-34bb3a34f00f.settings.columns.__assoc__.2.1.__assoc__.3.0','\"type\"'),('fields.e9bcbfad-06b8-466d-b605-34bb3a34f00f.settings.columns.__assoc__.2.1.__assoc__.3.1','\"singleline\"'),('fields.e9bcbfad-06b8-466d-b605-34bb3a34f00f.settings.defaults.0.__assoc__.0.0','\"col2\"'),('fields.e9bcbfad-06b8-466d-b605-34bb3a34f00f.settings.defaults.0.__assoc__.0.1','\"\"'),('fields.e9bcbfad-06b8-466d-b605-34bb3a34f00f.settings.defaults.0.__assoc__.1.0','\"col3\"'),('fields.e9bcbfad-06b8-466d-b605-34bb3a34f00f.settings.defaults.0.__assoc__.1.1','\"\"'),('fields.e9bcbfad-06b8-466d-b605-34bb3a34f00f.settings.maxRows','null'),('fields.e9bcbfad-06b8-466d-b605-34bb3a34f00f.settings.minRows','null'),('fields.e9bcbfad-06b8-466d-b605-34bb3a34f00f.settings.staticRows','false'),('fields.e9bcbfad-06b8-466d-b605-34bb3a34f00f.translationKeyFormat','null'),('fields.e9bcbfad-06b8-466d-b605-34bb3a34f00f.translationMethod','\"none\"'),('fields.e9bcbfad-06b8-466d-b605-34bb3a34f00f.type','\"craft\\\\fields\\\\Table\"'),('fields.f0d61459-f155-4f36-a8ba-74cafea22385.columnSuffix','null'),('fields.f0d61459-f155-4f36-a8ba-74cafea22385.handle','\"websitePrivacyPolicy\"'),('fields.f0d61459-f155-4f36-a8ba-74cafea22385.instructions','null'),('fields.f0d61459-f155-4f36-a8ba-74cafea22385.name','\"Website Privacy Policy\"'),('fields.f0d61459-f155-4f36-a8ba-74cafea22385.searchable','false'),('fields.f0d61459-f155-4f36-a8ba-74cafea22385.settings.availableTransforms','\"*\"'),('fields.f0d61459-f155-4f36-a8ba-74cafea22385.settings.availableVolumes','\"*\"'),('fields.f0d61459-f155-4f36-a8ba-74cafea22385.settings.ckeConfig','\"5e0d7bb4-8904-49ac-ac02-07a8b46945db\"'),('fields.f0d61459-f155-4f36-a8ba-74cafea22385.settings.createButtonLabel','null'),('fields.f0d61459-f155-4f36-a8ba-74cafea22385.settings.defaultTransform','null'),('fields.f0d61459-f155-4f36-a8ba-74cafea22385.settings.enableSourceEditingForNonAdmins','false'),('fields.f0d61459-f155-4f36-a8ba-74cafea22385.settings.purifierConfig','null'),('fields.f0d61459-f155-4f36-a8ba-74cafea22385.settings.purifyHtml','true'),('fields.f0d61459-f155-4f36-a8ba-74cafea22385.settings.showUnpermittedFiles','false'),('fields.f0d61459-f155-4f36-a8ba-74cafea22385.settings.showUnpermittedVolumes','false'),('fields.f0d61459-f155-4f36-a8ba-74cafea22385.settings.showWordCount','false'),('fields.f0d61459-f155-4f36-a8ba-74cafea22385.settings.wordLimit','null'),('fields.f0d61459-f155-4f36-a8ba-74cafea22385.translationKeyFormat','null'),('fields.f0d61459-f155-4f36-a8ba-74cafea22385.translationMethod','\"none\"'),('fields.f0d61459-f155-4f36-a8ba-74cafea22385.type','\"craft\\\\ckeditor\\\\Field\"'),('fs.data.hasUrls','true'),('fs.data.name','\"Data\"'),('fs.data.settings.path','\"volumes/data\"'),('fs.data.type','\"craft\\\\fs\\\\Local\"'),('fs.data.url','\"@web/volumes/data\"'),('fs.images.hasUrls','true'),('fs.images.name','\"Images\"'),('fs.images.settings.path','\"volumes/images\"'),('fs.images.type','\"craft\\\\fs\\\\Local\"'),('fs.images.url','\"@web/volumes/images\"'),('fs.transforms.hasUrls','true'),('fs.transforms.name','\"Transforms\"'),('fs.transforms.settings.path','\"volumes/transforms\"'),('fs.transforms.type','\"craft\\\\fs\\\\Local\"'),('fs.transforms.url','\"@web/volumes/transforms\"'),('fs.videos.hasUrls','true'),('fs.videos.name','\"Videos\"'),('fs.videos.settings.path','\"volumes/videos\"'),('fs.videos.type','\"craft\\\\fs\\\\Local\"'),('fs.videos.url','\"@web/volumes/videos\"'),('globalSets.329399c3-cf0b-4184-b8cf-111844590e07.fieldLayouts.aafd35a5-c763-4a8d-a028-6b8b617cae7e.cardThumbAlignment','\"end\"'),('globalSets.329399c3-cf0b-4184-b8cf-111844590e07.fieldLayouts.aafd35a5-c763-4a8d-a028-6b8b617cae7e.tabs.0.elementCondition','null'),('globalSets.329399c3-cf0b-4184-b8cf-111844590e07.fieldLayouts.aafd35a5-c763-4a8d-a028-6b8b617cae7e.tabs.0.elements.0.dateAdded','\"2025-09-02T09:11:42+00:00\"'),('globalSets.329399c3-cf0b-4184-b8cf-111844590e07.fieldLayouts.aafd35a5-c763-4a8d-a028-6b8b617cae7e.tabs.0.elements.0.editCondition','null'),('globalSets.329399c3-cf0b-4184-b8cf-111844590e07.fieldLayouts.aafd35a5-c763-4a8d-a028-6b8b617cae7e.tabs.0.elements.0.elementCondition','null'),('globalSets.329399c3-cf0b-4184-b8cf-111844590e07.fieldLayouts.aafd35a5-c763-4a8d-a028-6b8b617cae7e.tabs.0.elements.0.fieldUid','\"8319de11-8b0e-487f-83c2-5032ef70e346\"'),('globalSets.329399c3-cf0b-4184-b8cf-111844590e07.fieldLayouts.aafd35a5-c763-4a8d-a028-6b8b617cae7e.tabs.0.elements.0.handle','null'),('globalSets.329399c3-cf0b-4184-b8cf-111844590e07.fieldLayouts.aafd35a5-c763-4a8d-a028-6b8b617cae7e.tabs.0.elements.0.instructions','null'),('globalSets.329399c3-cf0b-4184-b8cf-111844590e07.fieldLayouts.aafd35a5-c763-4a8d-a028-6b8b617cae7e.tabs.0.elements.0.label','null'),('globalSets.329399c3-cf0b-4184-b8cf-111844590e07.fieldLayouts.aafd35a5-c763-4a8d-a028-6b8b617cae7e.tabs.0.elements.0.required','false'),('globalSets.329399c3-cf0b-4184-b8cf-111844590e07.fieldLayouts.aafd35a5-c763-4a8d-a028-6b8b617cae7e.tabs.0.elements.0.tip','null'),('globalSets.329399c3-cf0b-4184-b8cf-111844590e07.fieldLayouts.aafd35a5-c763-4a8d-a028-6b8b617cae7e.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.329399c3-cf0b-4184-b8cf-111844590e07.fieldLayouts.aafd35a5-c763-4a8d-a028-6b8b617cae7e.tabs.0.elements.0.uid','\"43f8ef0d-e0a1-4b93-a1bb-4b4b60bddbae\"'),('globalSets.329399c3-cf0b-4184-b8cf-111844590e07.fieldLayouts.aafd35a5-c763-4a8d-a028-6b8b617cae7e.tabs.0.elements.0.userCondition','null'),('globalSets.329399c3-cf0b-4184-b8cf-111844590e07.fieldLayouts.aafd35a5-c763-4a8d-a028-6b8b617cae7e.tabs.0.elements.0.warning','null'),('globalSets.329399c3-cf0b-4184-b8cf-111844590e07.fieldLayouts.aafd35a5-c763-4a8d-a028-6b8b617cae7e.tabs.0.elements.0.width','100'),('globalSets.329399c3-cf0b-4184-b8cf-111844590e07.fieldLayouts.aafd35a5-c763-4a8d-a028-6b8b617cae7e.tabs.0.name','\"Content\"'),('globalSets.329399c3-cf0b-4184-b8cf-111844590e07.fieldLayouts.aafd35a5-c763-4a8d-a028-6b8b617cae7e.tabs.0.uid','\"52fd3633-c17f-428b-a3ca-cf9dd86c0933\"'),('globalSets.329399c3-cf0b-4184-b8cf-111844590e07.fieldLayouts.aafd35a5-c763-4a8d-a028-6b8b617cae7e.tabs.0.userCondition','null'),('globalSets.329399c3-cf0b-4184-b8cf-111844590e07.handle','\"footer\"'),('globalSets.329399c3-cf0b-4184-b8cf-111844590e07.name','\"Footer\"'),('globalSets.329399c3-cf0b-4184-b8cf-111844590e07.sortOrder','6'),('globalSets.3a3779ad-ff4a-43ac-9875-963dca20b4b7.fieldLayouts.2caa2653-3e02-4c78-a3d6-1d35a060249c.cardThumbAlignment','\"end\"'),('globalSets.3a3779ad-ff4a-43ac-9875-963dca20b4b7.fieldLayouts.2caa2653-3e02-4c78-a3d6-1d35a060249c.tabs.0.elementCondition','null'),('globalSets.3a3779ad-ff4a-43ac-9875-963dca20b4b7.fieldLayouts.2caa2653-3e02-4c78-a3d6-1d35a060249c.tabs.0.elements.0.dateAdded','\"2024-11-21T11:16:13+00:00\"'),('globalSets.3a3779ad-ff4a-43ac-9875-963dca20b4b7.fieldLayouts.2caa2653-3e02-4c78-a3d6-1d35a060249c.tabs.0.elements.0.editCondition','null'),('globalSets.3a3779ad-ff4a-43ac-9875-963dca20b4b7.fieldLayouts.2caa2653-3e02-4c78-a3d6-1d35a060249c.tabs.0.elements.0.elementCondition','null'),('globalSets.3a3779ad-ff4a-43ac-9875-963dca20b4b7.fieldLayouts.2caa2653-3e02-4c78-a3d6-1d35a060249c.tabs.0.elements.0.fieldUid','\"1d1e70bf-a278-465e-a64d-dfaa1661e193\"'),('globalSets.3a3779ad-ff4a-43ac-9875-963dca20b4b7.fieldLayouts.2caa2653-3e02-4c78-a3d6-1d35a060249c.tabs.0.elements.0.handle','null'),('globalSets.3a3779ad-ff4a-43ac-9875-963dca20b4b7.fieldLayouts.2caa2653-3e02-4c78-a3d6-1d35a060249c.tabs.0.elements.0.instructions','null'),('globalSets.3a3779ad-ff4a-43ac-9875-963dca20b4b7.fieldLayouts.2caa2653-3e02-4c78-a3d6-1d35a060249c.tabs.0.elements.0.label','null'),('globalSets.3a3779ad-ff4a-43ac-9875-963dca20b4b7.fieldLayouts.2caa2653-3e02-4c78-a3d6-1d35a060249c.tabs.0.elements.0.required','false'),('globalSets.3a3779ad-ff4a-43ac-9875-963dca20b4b7.fieldLayouts.2caa2653-3e02-4c78-a3d6-1d35a060249c.tabs.0.elements.0.tip','null'),('globalSets.3a3779ad-ff4a-43ac-9875-963dca20b4b7.fieldLayouts.2caa2653-3e02-4c78-a3d6-1d35a060249c.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.3a3779ad-ff4a-43ac-9875-963dca20b4b7.fieldLayouts.2caa2653-3e02-4c78-a3d6-1d35a060249c.tabs.0.elements.0.uid','\"dee3fe35-01d3-436c-87ad-8f066b34c4e2\"'),('globalSets.3a3779ad-ff4a-43ac-9875-963dca20b4b7.fieldLayouts.2caa2653-3e02-4c78-a3d6-1d35a060249c.tabs.0.elements.0.userCondition','null'),('globalSets.3a3779ad-ff4a-43ac-9875-963dca20b4b7.fieldLayouts.2caa2653-3e02-4c78-a3d6-1d35a060249c.tabs.0.elements.0.warning','null'),('globalSets.3a3779ad-ff4a-43ac-9875-963dca20b4b7.fieldLayouts.2caa2653-3e02-4c78-a3d6-1d35a060249c.tabs.0.elements.0.width','100'),('globalSets.3a3779ad-ff4a-43ac-9875-963dca20b4b7.fieldLayouts.2caa2653-3e02-4c78-a3d6-1d35a060249c.tabs.0.name','\"Navigation\"'),('globalSets.3a3779ad-ff4a-43ac-9875-963dca20b4b7.fieldLayouts.2caa2653-3e02-4c78-a3d6-1d35a060249c.tabs.0.uid','\"cc5723ba-7c84-4da6-a5b8-68e5697736bb\"'),('globalSets.3a3779ad-ff4a-43ac-9875-963dca20b4b7.fieldLayouts.2caa2653-3e02-4c78-a3d6-1d35a060249c.tabs.0.userCondition','null'),('globalSets.3a3779ad-ff4a-43ac-9875-963dca20b4b7.handle','\"navigation\"'),('globalSets.3a3779ad-ff4a-43ac-9875-963dca20b4b7.name','\"Navigation\"'),('globalSets.3a3779ad-ff4a-43ac-9875-963dca20b4b7.sortOrder','2'),('globalSets.973845f1-1777-4565-9b1f-44ad04497aba.fieldLayouts.cfcc9c1e-793c-4d63-863f-774b22317379.tabs.0.elementCondition','null'),('globalSets.973845f1-1777-4565-9b1f-44ad04497aba.fieldLayouts.cfcc9c1e-793c-4d63-863f-774b22317379.tabs.0.elements.0.dateAdded','\"2025-09-02T08:36:03+00:00\"'),('globalSets.973845f1-1777-4565-9b1f-44ad04497aba.fieldLayouts.cfcc9c1e-793c-4d63-863f-774b22317379.tabs.0.elements.0.editCondition','null'),('globalSets.973845f1-1777-4565-9b1f-44ad04497aba.fieldLayouts.cfcc9c1e-793c-4d63-863f-774b22317379.tabs.0.elements.0.elementCondition','null'),('globalSets.973845f1-1777-4565-9b1f-44ad04497aba.fieldLayouts.cfcc9c1e-793c-4d63-863f-774b22317379.tabs.0.elements.0.fieldUid','\"5365ef59-c050-4702-82ab-876962749a48\"'),('globalSets.973845f1-1777-4565-9b1f-44ad04497aba.fieldLayouts.cfcc9c1e-793c-4d63-863f-774b22317379.tabs.0.elements.0.handle','null'),('globalSets.973845f1-1777-4565-9b1f-44ad04497aba.fieldLayouts.cfcc9c1e-793c-4d63-863f-774b22317379.tabs.0.elements.0.instructions','null'),('globalSets.973845f1-1777-4565-9b1f-44ad04497aba.fieldLayouts.cfcc9c1e-793c-4d63-863f-774b22317379.tabs.0.elements.0.label','null'),('globalSets.973845f1-1777-4565-9b1f-44ad04497aba.fieldLayouts.cfcc9c1e-793c-4d63-863f-774b22317379.tabs.0.elements.0.required','false'),('globalSets.973845f1-1777-4565-9b1f-44ad04497aba.fieldLayouts.cfcc9c1e-793c-4d63-863f-774b22317379.tabs.0.elements.0.tip','null'),('globalSets.973845f1-1777-4565-9b1f-44ad04497aba.fieldLayouts.cfcc9c1e-793c-4d63-863f-774b22317379.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.973845f1-1777-4565-9b1f-44ad04497aba.fieldLayouts.cfcc9c1e-793c-4d63-863f-774b22317379.tabs.0.elements.0.uid','\"47590d60-13b0-48b2-b2e3-e83d6a93858d\"'),('globalSets.973845f1-1777-4565-9b1f-44ad04497aba.fieldLayouts.cfcc9c1e-793c-4d63-863f-774b22317379.tabs.0.elements.0.userCondition','null'),('globalSets.973845f1-1777-4565-9b1f-44ad04497aba.fieldLayouts.cfcc9c1e-793c-4d63-863f-774b22317379.tabs.0.elements.0.warning','null'),('globalSets.973845f1-1777-4565-9b1f-44ad04497aba.fieldLayouts.cfcc9c1e-793c-4d63-863f-774b22317379.tabs.0.elements.0.width','100'),('globalSets.973845f1-1777-4565-9b1f-44ad04497aba.fieldLayouts.cfcc9c1e-793c-4d63-863f-774b22317379.tabs.0.elements.1.dateAdded','\"2025-09-02T08:36:03+00:00\"'),('globalSets.973845f1-1777-4565-9b1f-44ad04497aba.fieldLayouts.cfcc9c1e-793c-4d63-863f-774b22317379.tabs.0.elements.1.editCondition','null'),('globalSets.973845f1-1777-4565-9b1f-44ad04497aba.fieldLayouts.cfcc9c1e-793c-4d63-863f-774b22317379.tabs.0.elements.1.elementCondition','null'),('globalSets.973845f1-1777-4565-9b1f-44ad04497aba.fieldLayouts.cfcc9c1e-793c-4d63-863f-774b22317379.tabs.0.elements.1.fieldUid','\"5228acaf-dbbf-4aac-b0b0-0c1c55e94b4a\"'),('globalSets.973845f1-1777-4565-9b1f-44ad04497aba.fieldLayouts.cfcc9c1e-793c-4d63-863f-774b22317379.tabs.0.elements.1.handle','null'),('globalSets.973845f1-1777-4565-9b1f-44ad04497aba.fieldLayouts.cfcc9c1e-793c-4d63-863f-774b22317379.tabs.0.elements.1.instructions','null'),('globalSets.973845f1-1777-4565-9b1f-44ad04497aba.fieldLayouts.cfcc9c1e-793c-4d63-863f-774b22317379.tabs.0.elements.1.label','null'),('globalSets.973845f1-1777-4565-9b1f-44ad04497aba.fieldLayouts.cfcc9c1e-793c-4d63-863f-774b22317379.tabs.0.elements.1.required','false'),('globalSets.973845f1-1777-4565-9b1f-44ad04497aba.fieldLayouts.cfcc9c1e-793c-4d63-863f-774b22317379.tabs.0.elements.1.tip','null'),('globalSets.973845f1-1777-4565-9b1f-44ad04497aba.fieldLayouts.cfcc9c1e-793c-4d63-863f-774b22317379.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.973845f1-1777-4565-9b1f-44ad04497aba.fieldLayouts.cfcc9c1e-793c-4d63-863f-774b22317379.tabs.0.elements.1.uid','\"8ab09fc4-330f-42c1-a257-bfe6aeca67ab\"'),('globalSets.973845f1-1777-4565-9b1f-44ad04497aba.fieldLayouts.cfcc9c1e-793c-4d63-863f-774b22317379.tabs.0.elements.1.userCondition','null'),('globalSets.973845f1-1777-4565-9b1f-44ad04497aba.fieldLayouts.cfcc9c1e-793c-4d63-863f-774b22317379.tabs.0.elements.1.warning','null'),('globalSets.973845f1-1777-4565-9b1f-44ad04497aba.fieldLayouts.cfcc9c1e-793c-4d63-863f-774b22317379.tabs.0.elements.1.width','100'),('globalSets.973845f1-1777-4565-9b1f-44ad04497aba.fieldLayouts.cfcc9c1e-793c-4d63-863f-774b22317379.tabs.0.elements.2.dateAdded','\"2025-09-02T08:36:03+00:00\"'),('globalSets.973845f1-1777-4565-9b1f-44ad04497aba.fieldLayouts.cfcc9c1e-793c-4d63-863f-774b22317379.tabs.0.elements.2.editCondition','null'),('globalSets.973845f1-1777-4565-9b1f-44ad04497aba.fieldLayouts.cfcc9c1e-793c-4d63-863f-774b22317379.tabs.0.elements.2.elementCondition','null'),('globalSets.973845f1-1777-4565-9b1f-44ad04497aba.fieldLayouts.cfcc9c1e-793c-4d63-863f-774b22317379.tabs.0.elements.2.fieldUid','\"e344ac15-6d4b-4dca-a3e3-a23af0036956\"'),('globalSets.973845f1-1777-4565-9b1f-44ad04497aba.fieldLayouts.cfcc9c1e-793c-4d63-863f-774b22317379.tabs.0.elements.2.handle','null'),('globalSets.973845f1-1777-4565-9b1f-44ad04497aba.fieldLayouts.cfcc9c1e-793c-4d63-863f-774b22317379.tabs.0.elements.2.instructions','null'),('globalSets.973845f1-1777-4565-9b1f-44ad04497aba.fieldLayouts.cfcc9c1e-793c-4d63-863f-774b22317379.tabs.0.elements.2.label','null'),('globalSets.973845f1-1777-4565-9b1f-44ad04497aba.fieldLayouts.cfcc9c1e-793c-4d63-863f-774b22317379.tabs.0.elements.2.required','false'),('globalSets.973845f1-1777-4565-9b1f-44ad04497aba.fieldLayouts.cfcc9c1e-793c-4d63-863f-774b22317379.tabs.0.elements.2.tip','null'),('globalSets.973845f1-1777-4565-9b1f-44ad04497aba.fieldLayouts.cfcc9c1e-793c-4d63-863f-774b22317379.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.973845f1-1777-4565-9b1f-44ad04497aba.fieldLayouts.cfcc9c1e-793c-4d63-863f-774b22317379.tabs.0.elements.2.uid','\"fce27730-a622-4dac-823e-8a4a2c45b335\"'),('globalSets.973845f1-1777-4565-9b1f-44ad04497aba.fieldLayouts.cfcc9c1e-793c-4d63-863f-774b22317379.tabs.0.elements.2.userCondition','null'),('globalSets.973845f1-1777-4565-9b1f-44ad04497aba.fieldLayouts.cfcc9c1e-793c-4d63-863f-774b22317379.tabs.0.elements.2.warning','null'),('globalSets.973845f1-1777-4565-9b1f-44ad04497aba.fieldLayouts.cfcc9c1e-793c-4d63-863f-774b22317379.tabs.0.elements.2.width','100'),('globalSets.973845f1-1777-4565-9b1f-44ad04497aba.fieldLayouts.cfcc9c1e-793c-4d63-863f-774b22317379.tabs.0.elements.3.dateAdded','\"2025-09-02T08:36:03+00:00\"'),('globalSets.973845f1-1777-4565-9b1f-44ad04497aba.fieldLayouts.cfcc9c1e-793c-4d63-863f-774b22317379.tabs.0.elements.3.editCondition','null'),('globalSets.973845f1-1777-4565-9b1f-44ad04497aba.fieldLayouts.cfcc9c1e-793c-4d63-863f-774b22317379.tabs.0.elements.3.elementCondition','null'),('globalSets.973845f1-1777-4565-9b1f-44ad04497aba.fieldLayouts.cfcc9c1e-793c-4d63-863f-774b22317379.tabs.0.elements.3.fieldUid','\"e9bcbfad-06b8-466d-b605-34bb3a34f00f\"'),('globalSets.973845f1-1777-4565-9b1f-44ad04497aba.fieldLayouts.cfcc9c1e-793c-4d63-863f-774b22317379.tabs.0.elements.3.handle','null'),('globalSets.973845f1-1777-4565-9b1f-44ad04497aba.fieldLayouts.cfcc9c1e-793c-4d63-863f-774b22317379.tabs.0.elements.3.instructions','null'),('globalSets.973845f1-1777-4565-9b1f-44ad04497aba.fieldLayouts.cfcc9c1e-793c-4d63-863f-774b22317379.tabs.0.elements.3.label','null'),('globalSets.973845f1-1777-4565-9b1f-44ad04497aba.fieldLayouts.cfcc9c1e-793c-4d63-863f-774b22317379.tabs.0.elements.3.required','false'),('globalSets.973845f1-1777-4565-9b1f-44ad04497aba.fieldLayouts.cfcc9c1e-793c-4d63-863f-774b22317379.tabs.0.elements.3.tip','null'),('globalSets.973845f1-1777-4565-9b1f-44ad04497aba.fieldLayouts.cfcc9c1e-793c-4d63-863f-774b22317379.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.973845f1-1777-4565-9b1f-44ad04497aba.fieldLayouts.cfcc9c1e-793c-4d63-863f-774b22317379.tabs.0.elements.3.uid','\"56664950-d907-4b02-9d03-9add295aef7b\"'),('globalSets.973845f1-1777-4565-9b1f-44ad04497aba.fieldLayouts.cfcc9c1e-793c-4d63-863f-774b22317379.tabs.0.elements.3.userCondition','null'),('globalSets.973845f1-1777-4565-9b1f-44ad04497aba.fieldLayouts.cfcc9c1e-793c-4d63-863f-774b22317379.tabs.0.elements.3.warning','null'),('globalSets.973845f1-1777-4565-9b1f-44ad04497aba.fieldLayouts.cfcc9c1e-793c-4d63-863f-774b22317379.tabs.0.elements.3.width','100'),('globalSets.973845f1-1777-4565-9b1f-44ad04497aba.fieldLayouts.cfcc9c1e-793c-4d63-863f-774b22317379.tabs.0.name','\"Content\"'),('globalSets.973845f1-1777-4565-9b1f-44ad04497aba.fieldLayouts.cfcc9c1e-793c-4d63-863f-774b22317379.tabs.0.uid','\"510aec73-2133-4191-971a-f8148b6107b2\"'),('globalSets.973845f1-1777-4565-9b1f-44ad04497aba.fieldLayouts.cfcc9c1e-793c-4d63-863f-774b22317379.tabs.0.userCondition','null'),('globalSets.973845f1-1777-4565-9b1f-44ad04497aba.handle','\"metadata\"'),('globalSets.973845f1-1777-4565-9b1f-44ad04497aba.name','\"Metadata\"'),('globalSets.973845f1-1777-4565-9b1f-44ad04497aba.sortOrder','5'),('globalSets.c68104aa-08f5-44a5-a8c0-8aca3fba89eb.fieldLayouts.ed58fa35-c52e-4401-a717-a6d7812046e2.tabs.0.elementCondition','null'),('globalSets.c68104aa-08f5-44a5-a8c0-8aca3fba89eb.fieldLayouts.ed58fa35-c52e-4401-a717-a6d7812046e2.tabs.0.elements.0.dateAdded','\"2024-11-21T11:17:22+00:00\"'),('globalSets.c68104aa-08f5-44a5-a8c0-8aca3fba89eb.fieldLayouts.ed58fa35-c52e-4401-a717-a6d7812046e2.tabs.0.elements.0.elementCondition','null'),('globalSets.c68104aa-08f5-44a5-a8c0-8aca3fba89eb.fieldLayouts.ed58fa35-c52e-4401-a717-a6d7812046e2.tabs.0.elements.0.fieldUid','\"5365ef59-c050-4702-82ab-876962749a48\"'),('globalSets.c68104aa-08f5-44a5-a8c0-8aca3fba89eb.fieldLayouts.ed58fa35-c52e-4401-a717-a6d7812046e2.tabs.0.elements.0.handle','null'),('globalSets.c68104aa-08f5-44a5-a8c0-8aca3fba89eb.fieldLayouts.ed58fa35-c52e-4401-a717-a6d7812046e2.tabs.0.elements.0.instructions','null'),('globalSets.c68104aa-08f5-44a5-a8c0-8aca3fba89eb.fieldLayouts.ed58fa35-c52e-4401-a717-a6d7812046e2.tabs.0.elements.0.label','null'),('globalSets.c68104aa-08f5-44a5-a8c0-8aca3fba89eb.fieldLayouts.ed58fa35-c52e-4401-a717-a6d7812046e2.tabs.0.elements.0.required','false'),('globalSets.c68104aa-08f5-44a5-a8c0-8aca3fba89eb.fieldLayouts.ed58fa35-c52e-4401-a717-a6d7812046e2.tabs.0.elements.0.tip','null'),('globalSets.c68104aa-08f5-44a5-a8c0-8aca3fba89eb.fieldLayouts.ed58fa35-c52e-4401-a717-a6d7812046e2.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.c68104aa-08f5-44a5-a8c0-8aca3fba89eb.fieldLayouts.ed58fa35-c52e-4401-a717-a6d7812046e2.tabs.0.elements.0.uid','\"990b998d-ec7a-4037-bb58-7b4d0b0632f8\"'),('globalSets.c68104aa-08f5-44a5-a8c0-8aca3fba89eb.fieldLayouts.ed58fa35-c52e-4401-a717-a6d7812046e2.tabs.0.elements.0.userCondition','null'),('globalSets.c68104aa-08f5-44a5-a8c0-8aca3fba89eb.fieldLayouts.ed58fa35-c52e-4401-a717-a6d7812046e2.tabs.0.elements.0.warning','null'),('globalSets.c68104aa-08f5-44a5-a8c0-8aca3fba89eb.fieldLayouts.ed58fa35-c52e-4401-a717-a6d7812046e2.tabs.0.elements.0.width','100'),('globalSets.c68104aa-08f5-44a5-a8c0-8aca3fba89eb.fieldLayouts.ed58fa35-c52e-4401-a717-a6d7812046e2.tabs.0.elements.1.dateAdded','\"2024-11-21T11:17:22+00:00\"'),('globalSets.c68104aa-08f5-44a5-a8c0-8aca3fba89eb.fieldLayouts.ed58fa35-c52e-4401-a717-a6d7812046e2.tabs.0.elements.1.elementCondition','null'),('globalSets.c68104aa-08f5-44a5-a8c0-8aca3fba89eb.fieldLayouts.ed58fa35-c52e-4401-a717-a6d7812046e2.tabs.0.elements.1.fieldUid','\"5228acaf-dbbf-4aac-b0b0-0c1c55e94b4a\"'),('globalSets.c68104aa-08f5-44a5-a8c0-8aca3fba89eb.fieldLayouts.ed58fa35-c52e-4401-a717-a6d7812046e2.tabs.0.elements.1.handle','null'),('globalSets.c68104aa-08f5-44a5-a8c0-8aca3fba89eb.fieldLayouts.ed58fa35-c52e-4401-a717-a6d7812046e2.tabs.0.elements.1.instructions','null'),('globalSets.c68104aa-08f5-44a5-a8c0-8aca3fba89eb.fieldLayouts.ed58fa35-c52e-4401-a717-a6d7812046e2.tabs.0.elements.1.label','null'),('globalSets.c68104aa-08f5-44a5-a8c0-8aca3fba89eb.fieldLayouts.ed58fa35-c52e-4401-a717-a6d7812046e2.tabs.0.elements.1.required','false'),('globalSets.c68104aa-08f5-44a5-a8c0-8aca3fba89eb.fieldLayouts.ed58fa35-c52e-4401-a717-a6d7812046e2.tabs.0.elements.1.tip','null'),('globalSets.c68104aa-08f5-44a5-a8c0-8aca3fba89eb.fieldLayouts.ed58fa35-c52e-4401-a717-a6d7812046e2.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.c68104aa-08f5-44a5-a8c0-8aca3fba89eb.fieldLayouts.ed58fa35-c52e-4401-a717-a6d7812046e2.tabs.0.elements.1.uid','\"770aaba7-94ae-43cd-8198-e39de09db72f\"'),('globalSets.c68104aa-08f5-44a5-a8c0-8aca3fba89eb.fieldLayouts.ed58fa35-c52e-4401-a717-a6d7812046e2.tabs.0.elements.1.userCondition','null'),('globalSets.c68104aa-08f5-44a5-a8c0-8aca3fba89eb.fieldLayouts.ed58fa35-c52e-4401-a717-a6d7812046e2.tabs.0.elements.1.warning','null'),('globalSets.c68104aa-08f5-44a5-a8c0-8aca3fba89eb.fieldLayouts.ed58fa35-c52e-4401-a717-a6d7812046e2.tabs.0.elements.1.width','100'),('globalSets.c68104aa-08f5-44a5-a8c0-8aca3fba89eb.fieldLayouts.ed58fa35-c52e-4401-a717-a6d7812046e2.tabs.0.elements.2.dateAdded','\"2024-11-21T11:17:22+00:00\"'),('globalSets.c68104aa-08f5-44a5-a8c0-8aca3fba89eb.fieldLayouts.ed58fa35-c52e-4401-a717-a6d7812046e2.tabs.0.elements.2.elementCondition','null'),('globalSets.c68104aa-08f5-44a5-a8c0-8aca3fba89eb.fieldLayouts.ed58fa35-c52e-4401-a717-a6d7812046e2.tabs.0.elements.2.fieldUid','\"e65df9b6-f654-4750-b847-46e355ec1c39\"'),('globalSets.c68104aa-08f5-44a5-a8c0-8aca3fba89eb.fieldLayouts.ed58fa35-c52e-4401-a717-a6d7812046e2.tabs.0.elements.2.handle','null'),('globalSets.c68104aa-08f5-44a5-a8c0-8aca3fba89eb.fieldLayouts.ed58fa35-c52e-4401-a717-a6d7812046e2.tabs.0.elements.2.instructions','null'),('globalSets.c68104aa-08f5-44a5-a8c0-8aca3fba89eb.fieldLayouts.ed58fa35-c52e-4401-a717-a6d7812046e2.tabs.0.elements.2.label','null'),('globalSets.c68104aa-08f5-44a5-a8c0-8aca3fba89eb.fieldLayouts.ed58fa35-c52e-4401-a717-a6d7812046e2.tabs.0.elements.2.required','false'),('globalSets.c68104aa-08f5-44a5-a8c0-8aca3fba89eb.fieldLayouts.ed58fa35-c52e-4401-a717-a6d7812046e2.tabs.0.elements.2.tip','null'),('globalSets.c68104aa-08f5-44a5-a8c0-8aca3fba89eb.fieldLayouts.ed58fa35-c52e-4401-a717-a6d7812046e2.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.c68104aa-08f5-44a5-a8c0-8aca3fba89eb.fieldLayouts.ed58fa35-c52e-4401-a717-a6d7812046e2.tabs.0.elements.2.uid','\"a4ffc670-f936-4954-acc3-2dee26459ad0\"'),('globalSets.c68104aa-08f5-44a5-a8c0-8aca3fba89eb.fieldLayouts.ed58fa35-c52e-4401-a717-a6d7812046e2.tabs.0.elements.2.userCondition','null'),('globalSets.c68104aa-08f5-44a5-a8c0-8aca3fba89eb.fieldLayouts.ed58fa35-c52e-4401-a717-a6d7812046e2.tabs.0.elements.2.warning','null'),('globalSets.c68104aa-08f5-44a5-a8c0-8aca3fba89eb.fieldLayouts.ed58fa35-c52e-4401-a717-a6d7812046e2.tabs.0.elements.2.width','100'),('globalSets.c68104aa-08f5-44a5-a8c0-8aca3fba89eb.fieldLayouts.ed58fa35-c52e-4401-a717-a6d7812046e2.tabs.0.elements.3.dateAdded','\"2024-11-21T11:17:22+00:00\"'),('globalSets.c68104aa-08f5-44a5-a8c0-8aca3fba89eb.fieldLayouts.ed58fa35-c52e-4401-a717-a6d7812046e2.tabs.0.elements.3.elementCondition','null'),('globalSets.c68104aa-08f5-44a5-a8c0-8aca3fba89eb.fieldLayouts.ed58fa35-c52e-4401-a717-a6d7812046e2.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\HorizontalRule\"'),('globalSets.c68104aa-08f5-44a5-a8c0-8aca3fba89eb.fieldLayouts.ed58fa35-c52e-4401-a717-a6d7812046e2.tabs.0.elements.3.uid','\"c5cecdf0-5e26-4073-a6b3-778909af5e23\"'),('globalSets.c68104aa-08f5-44a5-a8c0-8aca3fba89eb.fieldLayouts.ed58fa35-c52e-4401-a717-a6d7812046e2.tabs.0.elements.3.userCondition','null'),('globalSets.c68104aa-08f5-44a5-a8c0-8aca3fba89eb.fieldLayouts.ed58fa35-c52e-4401-a717-a6d7812046e2.tabs.0.elements.4.dateAdded','\"2024-11-21T11:17:22+00:00\"'),('globalSets.c68104aa-08f5-44a5-a8c0-8aca3fba89eb.fieldLayouts.ed58fa35-c52e-4401-a717-a6d7812046e2.tabs.0.elements.4.elementCondition','null'),('globalSets.c68104aa-08f5-44a5-a8c0-8aca3fba89eb.fieldLayouts.ed58fa35-c52e-4401-a717-a6d7812046e2.tabs.0.elements.4.fieldUid','\"89a65ca6-59b1-4161-a8ca-e27dc33a1765\"'),('globalSets.c68104aa-08f5-44a5-a8c0-8aca3fba89eb.fieldLayouts.ed58fa35-c52e-4401-a717-a6d7812046e2.tabs.0.elements.4.handle','null'),('globalSets.c68104aa-08f5-44a5-a8c0-8aca3fba89eb.fieldLayouts.ed58fa35-c52e-4401-a717-a6d7812046e2.tabs.0.elements.4.instructions','null'),('globalSets.c68104aa-08f5-44a5-a8c0-8aca3fba89eb.fieldLayouts.ed58fa35-c52e-4401-a717-a6d7812046e2.tabs.0.elements.4.label','null'),('globalSets.c68104aa-08f5-44a5-a8c0-8aca3fba89eb.fieldLayouts.ed58fa35-c52e-4401-a717-a6d7812046e2.tabs.0.elements.4.required','false'),('globalSets.c68104aa-08f5-44a5-a8c0-8aca3fba89eb.fieldLayouts.ed58fa35-c52e-4401-a717-a6d7812046e2.tabs.0.elements.4.tip','null'),('globalSets.c68104aa-08f5-44a5-a8c0-8aca3fba89eb.fieldLayouts.ed58fa35-c52e-4401-a717-a6d7812046e2.tabs.0.elements.4.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.c68104aa-08f5-44a5-a8c0-8aca3fba89eb.fieldLayouts.ed58fa35-c52e-4401-a717-a6d7812046e2.tabs.0.elements.4.uid','\"f69c1926-c263-487e-b4bb-384847319ff3\"'),('globalSets.c68104aa-08f5-44a5-a8c0-8aca3fba89eb.fieldLayouts.ed58fa35-c52e-4401-a717-a6d7812046e2.tabs.0.elements.4.userCondition','null'),('globalSets.c68104aa-08f5-44a5-a8c0-8aca3fba89eb.fieldLayouts.ed58fa35-c52e-4401-a717-a6d7812046e2.tabs.0.elements.4.warning','null'),('globalSets.c68104aa-08f5-44a5-a8c0-8aca3fba89eb.fieldLayouts.ed58fa35-c52e-4401-a717-a6d7812046e2.tabs.0.elements.4.width','100'),('globalSets.c68104aa-08f5-44a5-a8c0-8aca3fba89eb.fieldLayouts.ed58fa35-c52e-4401-a717-a6d7812046e2.tabs.0.name','\"General\"'),('globalSets.c68104aa-08f5-44a5-a8c0-8aca3fba89eb.fieldLayouts.ed58fa35-c52e-4401-a717-a6d7812046e2.tabs.0.uid','\"115383f2-0dcb-4df5-a864-749255a73a4f\"'),('globalSets.c68104aa-08f5-44a5-a8c0-8aca3fba89eb.fieldLayouts.ed58fa35-c52e-4401-a717-a6d7812046e2.tabs.0.userCondition','null'),('globalSets.c68104aa-08f5-44a5-a8c0-8aca3fba89eb.handle','\"general\"'),('globalSets.c68104aa-08f5-44a5-a8c0-8aca3fba89eb.name','\"General\"'),('globalSets.c68104aa-08f5-44a5-a8c0-8aca3fba89eb.sortOrder','1'),('graphql.publicToken.enabled','false'),('graphql.publicToken.expiryDate','null'),('graphql.schemas.6f2accc6-1408-427b-9915-bf88cae559ae.isPublic','true'),('graphql.schemas.6f2accc6-1408-427b-9915-bf88cae559ae.name','\"Public Schema\"'),('graphql.schemas.6f2accc6-1408-427b-9915-bf88cae559ae.scope.0','\"sites.731c4afc-3bf9-4c58-a826-7db0350cadfd:read\"'),('graphql.schemas.6f2accc6-1408-427b-9915-bf88cae559ae.scope.1','\"sections.c3b49286-4ca2-4801-9d33-2a3e31e1807d:read\"'),('graphql.schemas.6f2accc6-1408-427b-9915-bf88cae559ae.scope.2','\"sections.84547fdc-05c1-4c3c-a280-9b7fb6166e32:read\"'),('graphql.schemas.6f2accc6-1408-427b-9915-bf88cae559ae.scope.3','\"categorygroups.ed370231-a5e5-4af1-bd6a-98735fcda9fb:read\"'),('graphql.schemas.6f2accc6-1408-427b-9915-bf88cae559ae.scope.4','\"directive:parseRefs\"'),('graphql.schemas.6f2accc6-1408-427b-9915-bf88cae559ae.scope.5','\"directive:transform\"'),('graphql.schemas.d14c53ef-ea52-463d-8c32-236dacabbc40.isPublic','false'),('graphql.schemas.d14c53ef-ea52-463d-8c32-236dacabbc40.name','\"Private Schema\"'),('graphql.schemas.d14c53ef-ea52-463d-8c32-236dacabbc40.scope.0','\"sites.731c4afc-3bf9-4c58-a826-7db0350cadfd:read\"'),('graphql.schemas.d14c53ef-ea52-463d-8c32-236dacabbc40.scope.1','\"sections.c3b49286-4ca2-4801-9d33-2a3e31e1807d:read\"'),('graphql.schemas.d14c53ef-ea52-463d-8c32-236dacabbc40.scope.2','\"sections.84547fdc-05c1-4c3c-a280-9b7fb6166e32:read\"'),('graphql.schemas.d14c53ef-ea52-463d-8c32-236dacabbc40.scope.3','\"volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50:read\"'),('graphql.schemas.d14c53ef-ea52-463d-8c32-236dacabbc40.scope.4','\"categorygroups.ed370231-a5e5-4af1-bd6a-98735fcda9fb:read\"'),('graphql.schemas.d14c53ef-ea52-463d-8c32-236dacabbc40.scope.5','\"directive:parseRefs\"'),('graphql.schemas.d14c53ef-ea52-463d-8c32-236dacabbc40.scope.6','\"directive:transform\"'),('imageTransforms.69307dd8-eb06-43e3-8188-b4df5b23d2e1.fill','null'),('imageTransforms.69307dd8-eb06-43e3-8188-b4df5b23d2e1.format','\"webp\"'),('imageTransforms.69307dd8-eb06-43e3-8188-b4df5b23d2e1.handle','\"image800x\"'),('imageTransforms.69307dd8-eb06-43e3-8188-b4df5b23d2e1.height','800'),('imageTransforms.69307dd8-eb06-43e3-8188-b4df5b23d2e1.interlace','\"none\"'),('imageTransforms.69307dd8-eb06-43e3-8188-b4df5b23d2e1.mode','\"fit\"'),('imageTransforms.69307dd8-eb06-43e3-8188-b4df5b23d2e1.name','\"Image 800x\"'),('imageTransforms.69307dd8-eb06-43e3-8188-b4df5b23d2e1.position','\"center-center\"'),('imageTransforms.69307dd8-eb06-43e3-8188-b4df5b23d2e1.quality','35'),('imageTransforms.69307dd8-eb06-43e3-8188-b4df5b23d2e1.upscale','true'),('imageTransforms.69307dd8-eb06-43e3-8188-b4df5b23d2e1.width','800'),('imageTransforms.c24954e3-8320-487b-87ac-8923abad84c2.fill','null'),('imageTransforms.c24954e3-8320-487b-87ac-8923abad84c2.format','\"webp\"'),('imageTransforms.c24954e3-8320-487b-87ac-8923abad84c2.handle','\"thumbnail\"'),('imageTransforms.c24954e3-8320-487b-87ac-8923abad84c2.height','400'),('imageTransforms.c24954e3-8320-487b-87ac-8923abad84c2.interlace','\"none\"'),('imageTransforms.c24954e3-8320-487b-87ac-8923abad84c2.mode','\"fit\"'),('imageTransforms.c24954e3-8320-487b-87ac-8923abad84c2.name','\"Thumbnail\"'),('imageTransforms.c24954e3-8320-487b-87ac-8923abad84c2.position','\"center-center\"'),('imageTransforms.c24954e3-8320-487b-87ac-8923abad84c2.quality','35'),('imageTransforms.c24954e3-8320-487b-87ac-8923abad84c2.upscale','true'),('imageTransforms.c24954e3-8320-487b-87ac-8923abad84c2.width','400'),('imageTransforms.c26a36f0-36c6-42c0-99e0-aa0b4303441c.fill','null'),('imageTransforms.c26a36f0-36c6-42c0-99e0-aa0b4303441c.format','\"webp\"'),('imageTransforms.c26a36f0-36c6-42c0-99e0-aa0b4303441c.handle','\"image1600x\"'),('imageTransforms.c26a36f0-36c6-42c0-99e0-aa0b4303441c.height','1600'),('imageTransforms.c26a36f0-36c6-42c0-99e0-aa0b4303441c.interlace','\"none\"'),('imageTransforms.c26a36f0-36c6-42c0-99e0-aa0b4303441c.mode','\"fit\"'),('imageTransforms.c26a36f0-36c6-42c0-99e0-aa0b4303441c.name','\"Image 1600x\"'),('imageTransforms.c26a36f0-36c6-42c0-99e0-aa0b4303441c.position','\"center-center\"'),('imageTransforms.c26a36f0-36c6-42c0-99e0-aa0b4303441c.quality','35'),('imageTransforms.c26a36f0-36c6-42c0-99e0-aa0b4303441c.upscale','true'),('imageTransforms.c26a36f0-36c6-42c0-99e0-aa0b4303441c.width','1600'),('meta.__names__.05c6e9dc-1fc7-46a8-bbee-2c8138640bd8','\"Bold\"'),('meta.__names__.0c017e24-6889-49f0-bdd2-058a139c9f1d','\"Data\"'),('meta.__names__.11dedd21-c9e4-4490-8ed2-ee30e10e3b4d','\"Accessibility\"'),('meta.__names__.1795220b-e9cf-41e2-814d-8c93f5dd0e30','\"External Link URL\"'),('meta.__names__.1d1e70bf-a278-465e-a64d-dfaa1661e193','\"Navigation\"'),('meta.__names__.21950e08-1320-46dd-b9f3-8ddae1b3aa50','\"Images\"'),('meta.__names__.329399c3-cf0b-4184-b8cf-111844590e07','\"Footer\"'),('meta.__names__.36dca454-5bf3-422e-b397-abb58dda5bbc','\"Image\"'),('meta.__names__.3a3779ad-ff4a-43ac-9875-963dca20b4b7','\"Navigation\"'),('meta.__names__.40b9212d-f977-40ad-b0ff-4cc1159a90af','\"Privacy\"'),('meta.__names__.43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c','\"Home\"'),('meta.__names__.4c6e825a-41ed-4b29-b9e6-13d83e2d675d','\"plain\"'),('meta.__names__.4c70ff1a-21c6-4f84-81e5-b339b02e6f0d','\"MA Card Title\"'),('meta.__names__.4e467547-468e-4edb-9dcb-04801550f11d','\"Large Textfield\"'),('meta.__names__.4f9ce81c-6377-48f1-8b5b-b5b2daefb9c1','\"Phone Number\"'),('meta.__names__.50a058af-57fd-4784-a532-cdf609d93221','\"About\"'),('meta.__names__.5228acaf-dbbf-4aac-b0b0-0c1c55e94b4a','\"Website Description\"'),('meta.__names__.5365ef59-c050-4702-82ab-876962749a48','\"Website Title\"'),('meta.__names__.5416109a-5864-4bdf-9179-ee951c51cfd8','\"Email\"'),('meta.__names__.5446d600-e88a-4d58-b876-2d5124956541','\"Accessibility\"'),('meta.__names__.58523f1c-677f-41b7-8aa2-d44d638c8cfa','\"Accessibility Textfield\"'),('meta.__names__.59142390-27d0-4780-8543-5bcfbef4549e','\"External Link Name\"'),('meta.__names__.599c2594-7f7c-47e8-ab7f-5f15ea9d8f90','\"Textfield with Links\"'),('meta.__names__.5e0d7bb4-8904-49ac-ac02-07a8b46945db','\"Bold Italic\"'),('meta.__names__.614813c6-21cb-4c1a-bb3b-f1373d4c80fe','\"Metadata Description\"'),('meta.__names__.67df4def-30b8-4e8b-82b0-b01e4b5b783a','\"Category Selection\"'),('meta.__names__.69307dd8-eb06-43e3-8188-b4df5b23d2e1','\"Image 800x\"'),('meta.__names__.6f2accc6-1408-427b-9915-bf88cae559ae','\"Public Schema\"'),('meta.__names__.7104f57b-112f-4c96-84cf-eda1c75fe796','\"Textfield\"'),('meta.__names__.731c4afc-3bf9-4c58-a826-7db0350cadfd','\"master-project\"'),('meta.__names__.77a9e634-565d-4610-8aea-d10dd619f000','\"Privacy\"'),('meta.__names__.8319de11-8b0e-487f-83c2-5032ef70e346','\"Footer\"'),('meta.__names__.841c0af1-37d6-429d-a7d8-bbb2c21d8566','\"About\"'),('meta.__names__.84547fdc-05c1-4c3c-a280-9b7fb6166e32','\"Example Entry\"'),('meta.__names__.861c6252-90ad-422d-b3bc-8eb31c71d798','\"Link\"'),('meta.__names__.89a65ca6-59b1-4161-a8ca-e27dc33a1765','\"Website Social Links\"'),('meta.__names__.94105fd8-47a5-4c58-9ac1-b9bdc86ac4e4','\"Image Gallery\"'),('meta.__names__.973845f1-1777-4565-9b1f-44ad04497aba','\"Metadata\"'),('meta.__names__.9cc3eba1-d7d2-478f-ab6d-57505ecbcd66','\"Example Entry\"'),('meta.__names__.9fa6c3db-85f7-4431-831a-05a8249b0e26','\"Metadata Title\"'),('meta.__names__.a2cae9f8-a8d7-4405-bb16-8546f16f6e4c','\"Text\"'),('meta.__names__.aa2ef690-cdae-4baa-882a-4ff5431f482e','\"Imprint Textfield\"'),('meta.__names__.bebc23d5-2d50-4499-ae0d-6aa66437be5e','\"Copyright\"'),('meta.__names__.becfe5ca-3a1d-4962-8fc7-30c4caf3a387','\"Bold Link\"'),('meta.__names__.c24954e3-8320-487b-87ac-8923abad84c2','\"Thumbnail\"'),('meta.__names__.c26a36f0-36c6-42c0-99e0-aa0b4303441c','\"Image 1600x\"'),('meta.__names__.c3b49286-4ca2-4801-9d33-2a3e31e1807d','\"Home\"'),('meta.__names__.c68104aa-08f5-44a5-a8c0-8aca3fba89eb','\"General\"'),('meta.__names__.c69f0277-c48d-451a-84c1-2b4423aff544','\"Imprint\"'),('meta.__names__.ccff5e66-8f82-4233-a6da-2adaf6c97ced','\"Italic\"'),('meta.__names__.ce490459-dc63-4854-810e-ff2762981c6f','\"Videos\"'),('meta.__names__.d14c53ef-ea52-463d-8c32-236dacabbc40','\"Private Schema\"'),('meta.__names__.da87989f-6fba-4fb3-afae-2501b651f019','\"Alt Text\"'),('meta.__names__.de666abc-e71d-43e3-b318-cc6d8044b6b9','\"master-project\"'),('meta.__names__.e344ac15-6d4b-4dca-a3e3-a23af0036956','\"Metadata Image\"'),('meta.__names__.e414d637-e54f-4359-9cf8-cd94185009c4','\"Imprint\"'),('meta.__names__.e65df9b6-f654-4750-b847-46e355ec1c39','\"Website Contact\"'),('meta.__names__.e9bcbfad-06b8-466d-b605-34bb3a34f00f','\"Metadata List\"'),('meta.__names__.ed370231-a5e5-4af1-bd6a-98735fcda9fb','\"Example Category\"'),('meta.__names__.f0d61459-f155-4f36-a8ba-74cafea22385','\"Website Privacy Policy\"'),('meta.__names__.f1f84e81-4f8a-443b-acac-309e7aac4ee4','\"Bold Italic Link Bullets Headline\"'),('plugins.ckeditor.edition','\"standard\"'),('plugins.ckeditor.enabled','true'),('plugins.ckeditor.schemaVersion','\"3.0.0.0\"'),('plugins.cp-field-inspect.edition','\"standard\"'),('plugins.cp-field-inspect.enabled','true'),('plugins.cp-field-inspect.schemaVersion','\"1.0.0\"'),('sections.40b9212d-f977-40ad-b0ff-4cc1159a90af.defaultPlacement','\"end\"'),('sections.40b9212d-f977-40ad-b0ff-4cc1159a90af.enableVersioning','true'),('sections.40b9212d-f977-40ad-b0ff-4cc1159a90af.entryTypes.0.uid','\"77a9e634-565d-4610-8aea-d10dd619f000\"'),('sections.40b9212d-f977-40ad-b0ff-4cc1159a90af.handle','\"privacy\"'),('sections.40b9212d-f977-40ad-b0ff-4cc1159a90af.maxAuthors','1'),('sections.40b9212d-f977-40ad-b0ff-4cc1159a90af.name','\"Privacy\"'),('sections.40b9212d-f977-40ad-b0ff-4cc1159a90af.previewTargets.0.__assoc__.0.0','\"label\"'),('sections.40b9212d-f977-40ad-b0ff-4cc1159a90af.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),('sections.40b9212d-f977-40ad-b0ff-4cc1159a90af.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),('sections.40b9212d-f977-40ad-b0ff-4cc1159a90af.previewTargets.0.__assoc__.1.1','\"{url}\"'),('sections.40b9212d-f977-40ad-b0ff-4cc1159a90af.previewTargets.0.__assoc__.2.0','\"refresh\"'),('sections.40b9212d-f977-40ad-b0ff-4cc1159a90af.previewTargets.0.__assoc__.2.1','\"1\"'),('sections.40b9212d-f977-40ad-b0ff-4cc1159a90af.propagationMethod','\"all\"'),('sections.40b9212d-f977-40ad-b0ff-4cc1159a90af.siteSettings.731c4afc-3bf9-4c58-a826-7db0350cadfd.enabledByDefault','true'),('sections.40b9212d-f977-40ad-b0ff-4cc1159a90af.siteSettings.731c4afc-3bf9-4c58-a826-7db0350cadfd.hasUrls','true'),('sections.40b9212d-f977-40ad-b0ff-4cc1159a90af.siteSettings.731c4afc-3bf9-4c58-a826-7db0350cadfd.template','\"_layouts/privacy.twig\"'),('sections.40b9212d-f977-40ad-b0ff-4cc1159a90af.siteSettings.731c4afc-3bf9-4c58-a826-7db0350cadfd.uriFormat','\"privacy\"'),('sections.40b9212d-f977-40ad-b0ff-4cc1159a90af.type','\"single\"'),('sections.5446d600-e88a-4d58-b876-2d5124956541.defaultPlacement','\"end\"'),('sections.5446d600-e88a-4d58-b876-2d5124956541.enableVersioning','true'),('sections.5446d600-e88a-4d58-b876-2d5124956541.entryTypes.0.uid','\"11dedd21-c9e4-4490-8ed2-ee30e10e3b4d\"'),('sections.5446d600-e88a-4d58-b876-2d5124956541.handle','\"accessibility\"'),('sections.5446d600-e88a-4d58-b876-2d5124956541.maxAuthors','1'),('sections.5446d600-e88a-4d58-b876-2d5124956541.name','\"Accessibility\"'),('sections.5446d600-e88a-4d58-b876-2d5124956541.previewTargets.0.__assoc__.0.0','\"label\"'),('sections.5446d600-e88a-4d58-b876-2d5124956541.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),('sections.5446d600-e88a-4d58-b876-2d5124956541.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),('sections.5446d600-e88a-4d58-b876-2d5124956541.previewTargets.0.__assoc__.1.1','\"{url}\"'),('sections.5446d600-e88a-4d58-b876-2d5124956541.previewTargets.0.__assoc__.2.0','\"refresh\"'),('sections.5446d600-e88a-4d58-b876-2d5124956541.previewTargets.0.__assoc__.2.1','\"1\"'),('sections.5446d600-e88a-4d58-b876-2d5124956541.propagationMethod','\"all\"'),('sections.5446d600-e88a-4d58-b876-2d5124956541.siteSettings.731c4afc-3bf9-4c58-a826-7db0350cadfd.enabledByDefault','true'),('sections.5446d600-e88a-4d58-b876-2d5124956541.siteSettings.731c4afc-3bf9-4c58-a826-7db0350cadfd.hasUrls','true'),('sections.5446d600-e88a-4d58-b876-2d5124956541.siteSettings.731c4afc-3bf9-4c58-a826-7db0350cadfd.template','\"_layouts/accessibility.twig\"'),('sections.5446d600-e88a-4d58-b876-2d5124956541.siteSettings.731c4afc-3bf9-4c58-a826-7db0350cadfd.uriFormat','\"accessibility\"'),('sections.5446d600-e88a-4d58-b876-2d5124956541.type','\"single\"'),('sections.841c0af1-37d6-429d-a7d8-bbb2c21d8566.defaultPlacement','\"end\"'),('sections.841c0af1-37d6-429d-a7d8-bbb2c21d8566.enableVersioning','true'),('sections.841c0af1-37d6-429d-a7d8-bbb2c21d8566.entryTypes.0.uid','\"50a058af-57fd-4784-a532-cdf609d93221\"'),('sections.841c0af1-37d6-429d-a7d8-bbb2c21d8566.handle','\"about\"'),('sections.841c0af1-37d6-429d-a7d8-bbb2c21d8566.maxAuthors','1'),('sections.841c0af1-37d6-429d-a7d8-bbb2c21d8566.name','\"About\"'),('sections.841c0af1-37d6-429d-a7d8-bbb2c21d8566.previewTargets.0.__assoc__.0.0','\"label\"'),('sections.841c0af1-37d6-429d-a7d8-bbb2c21d8566.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),('sections.841c0af1-37d6-429d-a7d8-bbb2c21d8566.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),('sections.841c0af1-37d6-429d-a7d8-bbb2c21d8566.previewTargets.0.__assoc__.1.1','\"{url}\"'),('sections.841c0af1-37d6-429d-a7d8-bbb2c21d8566.previewTargets.0.__assoc__.2.0','\"refresh\"'),('sections.841c0af1-37d6-429d-a7d8-bbb2c21d8566.previewTargets.0.__assoc__.2.1','\"1\"'),('sections.841c0af1-37d6-429d-a7d8-bbb2c21d8566.propagationMethod','\"all\"'),('sections.841c0af1-37d6-429d-a7d8-bbb2c21d8566.siteSettings.731c4afc-3bf9-4c58-a826-7db0350cadfd.enabledByDefault','true'),('sections.841c0af1-37d6-429d-a7d8-bbb2c21d8566.siteSettings.731c4afc-3bf9-4c58-a826-7db0350cadfd.hasUrls','true'),('sections.841c0af1-37d6-429d-a7d8-bbb2c21d8566.siteSettings.731c4afc-3bf9-4c58-a826-7db0350cadfd.template','\"_layouts/about.twig\"'),('sections.841c0af1-37d6-429d-a7d8-bbb2c21d8566.siteSettings.731c4afc-3bf9-4c58-a826-7db0350cadfd.uriFormat','\"about\"'),('sections.841c0af1-37d6-429d-a7d8-bbb2c21d8566.type','\"single\"'),('sections.84547fdc-05c1-4c3c-a280-9b7fb6166e32.defaultPlacement','\"end\"'),('sections.84547fdc-05c1-4c3c-a280-9b7fb6166e32.enableVersioning','true'),('sections.84547fdc-05c1-4c3c-a280-9b7fb6166e32.entryTypes.0.uid','\"9cc3eba1-d7d2-478f-ab6d-57505ecbcd66\"'),('sections.84547fdc-05c1-4c3c-a280-9b7fb6166e32.handle','\"exampleEntry\"'),('sections.84547fdc-05c1-4c3c-a280-9b7fb6166e32.maxAuthors','1'),('sections.84547fdc-05c1-4c3c-a280-9b7fb6166e32.name','\"Example Entry\"'),('sections.84547fdc-05c1-4c3c-a280-9b7fb6166e32.previewTargets.0.__assoc__.0.0','\"label\"'),('sections.84547fdc-05c1-4c3c-a280-9b7fb6166e32.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),('sections.84547fdc-05c1-4c3c-a280-9b7fb6166e32.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),('sections.84547fdc-05c1-4c3c-a280-9b7fb6166e32.previewTargets.0.__assoc__.1.1','\"{url}\"'),('sections.84547fdc-05c1-4c3c-a280-9b7fb6166e32.previewTargets.0.__assoc__.2.0','\"refresh\"'),('sections.84547fdc-05c1-4c3c-a280-9b7fb6166e32.previewTargets.0.__assoc__.2.1','\"1\"'),('sections.84547fdc-05c1-4c3c-a280-9b7fb6166e32.propagationMethod','\"all\"'),('sections.84547fdc-05c1-4c3c-a280-9b7fb6166e32.siteSettings.731c4afc-3bf9-4c58-a826-7db0350cadfd.enabledByDefault','true'),('sections.84547fdc-05c1-4c3c-a280-9b7fb6166e32.siteSettings.731c4afc-3bf9-4c58-a826-7db0350cadfd.hasUrls','true'),('sections.84547fdc-05c1-4c3c-a280-9b7fb6166e32.siteSettings.731c4afc-3bf9-4c58-a826-7db0350cadfd.template','\"card-example/_entry.twig\"'),('sections.84547fdc-05c1-4c3c-a280-9b7fb6166e32.siteSettings.731c4afc-3bf9-4c58-a826-7db0350cadfd.uriFormat','\"card-example/{slug}\"'),('sections.84547fdc-05c1-4c3c-a280-9b7fb6166e32.type','\"channel\"'),('sections.c3b49286-4ca2-4801-9d33-2a3e31e1807d.defaultPlacement','\"end\"'),('sections.c3b49286-4ca2-4801-9d33-2a3e31e1807d.enableVersioning','true'),('sections.c3b49286-4ca2-4801-9d33-2a3e31e1807d.entryTypes.0.uid','\"43dd2356-ba3d-4c0f-9dc7-ef6f8103a49c\"'),('sections.c3b49286-4ca2-4801-9d33-2a3e31e1807d.handle','\"home\"'),('sections.c3b49286-4ca2-4801-9d33-2a3e31e1807d.maxAuthors','1'),('sections.c3b49286-4ca2-4801-9d33-2a3e31e1807d.name','\"Home\"'),('sections.c3b49286-4ca2-4801-9d33-2a3e31e1807d.previewTargets.0.__assoc__.0.0','\"label\"'),('sections.c3b49286-4ca2-4801-9d33-2a3e31e1807d.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),('sections.c3b49286-4ca2-4801-9d33-2a3e31e1807d.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),('sections.c3b49286-4ca2-4801-9d33-2a3e31e1807d.previewTargets.0.__assoc__.1.1','\"{url}\"'),('sections.c3b49286-4ca2-4801-9d33-2a3e31e1807d.previewTargets.0.__assoc__.2.0','\"refresh\"'),('sections.c3b49286-4ca2-4801-9d33-2a3e31e1807d.previewTargets.0.__assoc__.2.1','\"1\"'),('sections.c3b49286-4ca2-4801-9d33-2a3e31e1807d.propagationMethod','\"all\"'),('sections.c3b49286-4ca2-4801-9d33-2a3e31e1807d.siteSettings.731c4afc-3bf9-4c58-a826-7db0350cadfd.enabledByDefault','true'),('sections.c3b49286-4ca2-4801-9d33-2a3e31e1807d.siteSettings.731c4afc-3bf9-4c58-a826-7db0350cadfd.hasUrls','true'),('sections.c3b49286-4ca2-4801-9d33-2a3e31e1807d.siteSettings.731c4afc-3bf9-4c58-a826-7db0350cadfd.template','\"_layouts/home.twig\"'),('sections.c3b49286-4ca2-4801-9d33-2a3e31e1807d.siteSettings.731c4afc-3bf9-4c58-a826-7db0350cadfd.uriFormat','\"__home__\"'),('sections.c3b49286-4ca2-4801-9d33-2a3e31e1807d.type','\"single\"'),('sections.e414d637-e54f-4359-9cf8-cd94185009c4.defaultPlacement','\"end\"'),('sections.e414d637-e54f-4359-9cf8-cd94185009c4.enableVersioning','true'),('sections.e414d637-e54f-4359-9cf8-cd94185009c4.entryTypes.0.uid','\"c69f0277-c48d-451a-84c1-2b4423aff544\"'),('sections.e414d637-e54f-4359-9cf8-cd94185009c4.handle','\"imprint\"'),('sections.e414d637-e54f-4359-9cf8-cd94185009c4.maxAuthors','1'),('sections.e414d637-e54f-4359-9cf8-cd94185009c4.name','\"Imprint\"'),('sections.e414d637-e54f-4359-9cf8-cd94185009c4.propagationMethod','\"all\"'),('sections.e414d637-e54f-4359-9cf8-cd94185009c4.siteSettings.731c4afc-3bf9-4c58-a826-7db0350cadfd.enabledByDefault','true'),('sections.e414d637-e54f-4359-9cf8-cd94185009c4.siteSettings.731c4afc-3bf9-4c58-a826-7db0350cadfd.hasUrls','true'),('sections.e414d637-e54f-4359-9cf8-cd94185009c4.siteSettings.731c4afc-3bf9-4c58-a826-7db0350cadfd.template','\"_layouts/imprint.twig\"'),('sections.e414d637-e54f-4359-9cf8-cd94185009c4.siteSettings.731c4afc-3bf9-4c58-a826-7db0350cadfd.uriFormat','\"imprint\"'),('sections.e414d637-e54f-4359-9cf8-cd94185009c4.type','\"single\"'),('siteGroups.de666abc-e71d-43e3-b318-cc6d8044b6b9.name','\"master-project\"'),('sites.731c4afc-3bf9-4c58-a826-7db0350cadfd.baseUrl','\"$PRIMARY_SITE_URL\"'),('sites.731c4afc-3bf9-4c58-a826-7db0350cadfd.handle','\"default\"'),('sites.731c4afc-3bf9-4c58-a826-7db0350cadfd.hasUrls','true'),('sites.731c4afc-3bf9-4c58-a826-7db0350cadfd.language','\"en-US\"'),('sites.731c4afc-3bf9-4c58-a826-7db0350cadfd.name','\"master-project\"'),('sites.731c4afc-3bf9-4c58-a826-7db0350cadfd.primary','true'),('sites.731c4afc-3bf9-4c58-a826-7db0350cadfd.siteGroup','\"de666abc-e71d-43e3-b318-cc6d8044b6b9\"'),('sites.731c4afc-3bf9-4c58-a826-7db0350cadfd.sortOrder','1'),('system.edition','\"solo\"'),('system.live','true'),('system.name','\"$DDEV_PROJECT\"'),('system.retryDuration','null'),('system.schemaVersion','\"5.9.0.8\"'),('system.timeZone','\"America/Los_Angeles\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.require2fa','false'),('users.requireEmailVerification','true'),('volumes.0c017e24-6889-49f0-bdd2-058a139c9f1d.altTranslationKeyFormat','null'),('volumes.0c017e24-6889-49f0-bdd2-058a139c9f1d.altTranslationMethod','\"none\"'),('volumes.0c017e24-6889-49f0-bdd2-058a139c9f1d.fieldLayouts.498553a1-729c-49ac-8cf3-ab0676a8ac94.cardView.0','\"filename\"'),('volumes.0c017e24-6889-49f0-bdd2-058a139c9f1d.fieldLayouts.498553a1-729c-49ac-8cf3-ab0676a8ac94.cardView.1','\"kind\"'),('volumes.0c017e24-6889-49f0-bdd2-058a139c9f1d.fieldLayouts.498553a1-729c-49ac-8cf3-ab0676a8ac94.cardView.2','\"size\"'),('volumes.0c017e24-6889-49f0-bdd2-058a139c9f1d.fieldLayouts.498553a1-729c-49ac-8cf3-ab0676a8ac94.cardView.3','\"uid\"'),('volumes.0c017e24-6889-49f0-bdd2-058a139c9f1d.fieldLayouts.498553a1-729c-49ac-8cf3-ab0676a8ac94.tabs.0.elementCondition','null'),('volumes.0c017e24-6889-49f0-bdd2-058a139c9f1d.fieldLayouts.498553a1-729c-49ac-8cf3-ab0676a8ac94.tabs.0.elements.0.autocapitalize','true'),('volumes.0c017e24-6889-49f0-bdd2-058a139c9f1d.fieldLayouts.498553a1-729c-49ac-8cf3-ab0676a8ac94.tabs.0.elements.0.autocomplete','false'),('volumes.0c017e24-6889-49f0-bdd2-058a139c9f1d.fieldLayouts.498553a1-729c-49ac-8cf3-ab0676a8ac94.tabs.0.elements.0.autocorrect','true'),('volumes.0c017e24-6889-49f0-bdd2-058a139c9f1d.fieldLayouts.498553a1-729c-49ac-8cf3-ab0676a8ac94.tabs.0.elements.0.class','null'),('volumes.0c017e24-6889-49f0-bdd2-058a139c9f1d.fieldLayouts.498553a1-729c-49ac-8cf3-ab0676a8ac94.tabs.0.elements.0.dateAdded','\"2024-11-21T10:25:38+00:00\"'),('volumes.0c017e24-6889-49f0-bdd2-058a139c9f1d.fieldLayouts.498553a1-729c-49ac-8cf3-ab0676a8ac94.tabs.0.elements.0.disabled','false'),('volumes.0c017e24-6889-49f0-bdd2-058a139c9f1d.fieldLayouts.498553a1-729c-49ac-8cf3-ab0676a8ac94.tabs.0.elements.0.elementCondition','null'),('volumes.0c017e24-6889-49f0-bdd2-058a139c9f1d.fieldLayouts.498553a1-729c-49ac-8cf3-ab0676a8ac94.tabs.0.elements.0.id','null'),('volumes.0c017e24-6889-49f0-bdd2-058a139c9f1d.fieldLayouts.498553a1-729c-49ac-8cf3-ab0676a8ac94.tabs.0.elements.0.inputType','null'),('volumes.0c017e24-6889-49f0-bdd2-058a139c9f1d.fieldLayouts.498553a1-729c-49ac-8cf3-ab0676a8ac94.tabs.0.elements.0.instructions','null'),('volumes.0c017e24-6889-49f0-bdd2-058a139c9f1d.fieldLayouts.498553a1-729c-49ac-8cf3-ab0676a8ac94.tabs.0.elements.0.label','null'),('volumes.0c017e24-6889-49f0-bdd2-058a139c9f1d.fieldLayouts.498553a1-729c-49ac-8cf3-ab0676a8ac94.tabs.0.elements.0.max','null'),('volumes.0c017e24-6889-49f0-bdd2-058a139c9f1d.fieldLayouts.498553a1-729c-49ac-8cf3-ab0676a8ac94.tabs.0.elements.0.min','null'),('volumes.0c017e24-6889-49f0-bdd2-058a139c9f1d.fieldLayouts.498553a1-729c-49ac-8cf3-ab0676a8ac94.tabs.0.elements.0.name','null'),('volumes.0c017e24-6889-49f0-bdd2-058a139c9f1d.fieldLayouts.498553a1-729c-49ac-8cf3-ab0676a8ac94.tabs.0.elements.0.orientation','null'),('volumes.0c017e24-6889-49f0-bdd2-058a139c9f1d.fieldLayouts.498553a1-729c-49ac-8cf3-ab0676a8ac94.tabs.0.elements.0.placeholder','null'),('volumes.0c017e24-6889-49f0-bdd2-058a139c9f1d.fieldLayouts.498553a1-729c-49ac-8cf3-ab0676a8ac94.tabs.0.elements.0.readonly','false'),('volumes.0c017e24-6889-49f0-bdd2-058a139c9f1d.fieldLayouts.498553a1-729c-49ac-8cf3-ab0676a8ac94.tabs.0.elements.0.requirable','false'),('volumes.0c017e24-6889-49f0-bdd2-058a139c9f1d.fieldLayouts.498553a1-729c-49ac-8cf3-ab0676a8ac94.tabs.0.elements.0.size','null'),('volumes.0c017e24-6889-49f0-bdd2-058a139c9f1d.fieldLayouts.498553a1-729c-49ac-8cf3-ab0676a8ac94.tabs.0.elements.0.step','null'),('volumes.0c017e24-6889-49f0-bdd2-058a139c9f1d.fieldLayouts.498553a1-729c-49ac-8cf3-ab0676a8ac94.tabs.0.elements.0.tip','null'),('volumes.0c017e24-6889-49f0-bdd2-058a139c9f1d.fieldLayouts.498553a1-729c-49ac-8cf3-ab0676a8ac94.tabs.0.elements.0.title','null'),('volumes.0c017e24-6889-49f0-bdd2-058a139c9f1d.fieldLayouts.498553a1-729c-49ac-8cf3-ab0676a8ac94.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\"'),('volumes.0c017e24-6889-49f0-bdd2-058a139c9f1d.fieldLayouts.498553a1-729c-49ac-8cf3-ab0676a8ac94.tabs.0.elements.0.uid','\"71c4720c-007f-4805-8b33-90f4112b489e\"'),('volumes.0c017e24-6889-49f0-bdd2-058a139c9f1d.fieldLayouts.498553a1-729c-49ac-8cf3-ab0676a8ac94.tabs.0.elements.0.userCondition','null'),('volumes.0c017e24-6889-49f0-bdd2-058a139c9f1d.fieldLayouts.498553a1-729c-49ac-8cf3-ab0676a8ac94.tabs.0.elements.0.warning','null'),('volumes.0c017e24-6889-49f0-bdd2-058a139c9f1d.fieldLayouts.498553a1-729c-49ac-8cf3-ab0676a8ac94.tabs.0.elements.0.width','100'),('volumes.0c017e24-6889-49f0-bdd2-058a139c9f1d.fieldLayouts.498553a1-729c-49ac-8cf3-ab0676a8ac94.tabs.0.name','\"Content\"'),('volumes.0c017e24-6889-49f0-bdd2-058a139c9f1d.fieldLayouts.498553a1-729c-49ac-8cf3-ab0676a8ac94.tabs.0.uid','\"f8fb2343-8f1f-47d5-921f-a343417f756d\"'),('volumes.0c017e24-6889-49f0-bdd2-058a139c9f1d.fieldLayouts.498553a1-729c-49ac-8cf3-ab0676a8ac94.tabs.0.userCondition','null'),('volumes.0c017e24-6889-49f0-bdd2-058a139c9f1d.fs','\"data\"'),('volumes.0c017e24-6889-49f0-bdd2-058a139c9f1d.handle','\"data\"'),('volumes.0c017e24-6889-49f0-bdd2-058a139c9f1d.name','\"Data\"'),('volumes.0c017e24-6889-49f0-bdd2-058a139c9f1d.sortOrder','2'),('volumes.0c017e24-6889-49f0-bdd2-058a139c9f1d.subpath','\"\"'),('volumes.0c017e24-6889-49f0-bdd2-058a139c9f1d.titleTranslationKeyFormat','null'),('volumes.0c017e24-6889-49f0-bdd2-058a139c9f1d.titleTranslationMethod','\"site\"'),('volumes.0c017e24-6889-49f0-bdd2-058a139c9f1d.transformFs','\"\"'),('volumes.0c017e24-6889-49f0-bdd2-058a139c9f1d.transformSubpath','\"\"'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.altTranslationKeyFormat','null'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.altTranslationMethod','\"none\"'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.fieldLayouts.f76322d0-ef05-49f6-aaf4-09267ebb69fc.cardView.0','\"filename\"'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.fieldLayouts.f76322d0-ef05-49f6-aaf4-09267ebb69fc.cardView.1','\"height\"'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.fieldLayouts.f76322d0-ef05-49f6-aaf4-09267ebb69fc.cardView.2','\"width\"'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.fieldLayouts.f76322d0-ef05-49f6-aaf4-09267ebb69fc.cardView.3','\"uid\"'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.fieldLayouts.f76322d0-ef05-49f6-aaf4-09267ebb69fc.cardView.4','\"layoutElement:0cfaaaf1-5973-4c8f-a91a-3a42edaef851\"'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.fieldLayouts.f76322d0-ef05-49f6-aaf4-09267ebb69fc.cardView.5','\"layoutElement:95ffa6d5-64d3-489c-893d-f553c73f5c94\"'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.fieldLayouts.f76322d0-ef05-49f6-aaf4-09267ebb69fc.tabs.0.elementCondition','null'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.fieldLayouts.f76322d0-ef05-49f6-aaf4-09267ebb69fc.tabs.0.elements.0.autocapitalize','true'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.fieldLayouts.f76322d0-ef05-49f6-aaf4-09267ebb69fc.tabs.0.elements.0.autocomplete','false'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.fieldLayouts.f76322d0-ef05-49f6-aaf4-09267ebb69fc.tabs.0.elements.0.autocorrect','true'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.fieldLayouts.f76322d0-ef05-49f6-aaf4-09267ebb69fc.tabs.0.elements.0.class','null'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.fieldLayouts.f76322d0-ef05-49f6-aaf4-09267ebb69fc.tabs.0.elements.0.dateAdded','\"2024-11-21T10:19:42+00:00\"'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.fieldLayouts.f76322d0-ef05-49f6-aaf4-09267ebb69fc.tabs.0.elements.0.disabled','false'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.fieldLayouts.f76322d0-ef05-49f6-aaf4-09267ebb69fc.tabs.0.elements.0.elementCondition','null'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.fieldLayouts.f76322d0-ef05-49f6-aaf4-09267ebb69fc.tabs.0.elements.0.id','null'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.fieldLayouts.f76322d0-ef05-49f6-aaf4-09267ebb69fc.tabs.0.elements.0.inputType','null'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.fieldLayouts.f76322d0-ef05-49f6-aaf4-09267ebb69fc.tabs.0.elements.0.instructions','null'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.fieldLayouts.f76322d0-ef05-49f6-aaf4-09267ebb69fc.tabs.0.elements.0.label','null'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.fieldLayouts.f76322d0-ef05-49f6-aaf4-09267ebb69fc.tabs.0.elements.0.max','null'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.fieldLayouts.f76322d0-ef05-49f6-aaf4-09267ebb69fc.tabs.0.elements.0.min','null'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.fieldLayouts.f76322d0-ef05-49f6-aaf4-09267ebb69fc.tabs.0.elements.0.name','null'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.fieldLayouts.f76322d0-ef05-49f6-aaf4-09267ebb69fc.tabs.0.elements.0.orientation','null'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.fieldLayouts.f76322d0-ef05-49f6-aaf4-09267ebb69fc.tabs.0.elements.0.placeholder','null'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.fieldLayouts.f76322d0-ef05-49f6-aaf4-09267ebb69fc.tabs.0.elements.0.readonly','false'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.fieldLayouts.f76322d0-ef05-49f6-aaf4-09267ebb69fc.tabs.0.elements.0.requirable','false'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.fieldLayouts.f76322d0-ef05-49f6-aaf4-09267ebb69fc.tabs.0.elements.0.size','null'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.fieldLayouts.f76322d0-ef05-49f6-aaf4-09267ebb69fc.tabs.0.elements.0.step','null'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.fieldLayouts.f76322d0-ef05-49f6-aaf4-09267ebb69fc.tabs.0.elements.0.tip','null'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.fieldLayouts.f76322d0-ef05-49f6-aaf4-09267ebb69fc.tabs.0.elements.0.title','null'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.fieldLayouts.f76322d0-ef05-49f6-aaf4-09267ebb69fc.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\"'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.fieldLayouts.f76322d0-ef05-49f6-aaf4-09267ebb69fc.tabs.0.elements.0.uid','\"c9e37db9-6937-4f12-8931-b098c093626d\"'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.fieldLayouts.f76322d0-ef05-49f6-aaf4-09267ebb69fc.tabs.0.elements.0.userCondition','null'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.fieldLayouts.f76322d0-ef05-49f6-aaf4-09267ebb69fc.tabs.0.elements.0.warning','null'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.fieldLayouts.f76322d0-ef05-49f6-aaf4-09267ebb69fc.tabs.0.elements.0.width','100'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.fieldLayouts.f76322d0-ef05-49f6-aaf4-09267ebb69fc.tabs.0.elements.1.dateAdded','\"2024-11-21T10:25:49+00:00\"'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.fieldLayouts.f76322d0-ef05-49f6-aaf4-09267ebb69fc.tabs.0.elements.1.elementCondition','null'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.fieldLayouts.f76322d0-ef05-49f6-aaf4-09267ebb69fc.tabs.0.elements.1.fieldUid','\"da87989f-6fba-4fb3-afae-2501b651f019\"'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.fieldLayouts.f76322d0-ef05-49f6-aaf4-09267ebb69fc.tabs.0.elements.1.handle','null'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.fieldLayouts.f76322d0-ef05-49f6-aaf4-09267ebb69fc.tabs.0.elements.1.instructions','null'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.fieldLayouts.f76322d0-ef05-49f6-aaf4-09267ebb69fc.tabs.0.elements.1.label','null'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.fieldLayouts.f76322d0-ef05-49f6-aaf4-09267ebb69fc.tabs.0.elements.1.required','false'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.fieldLayouts.f76322d0-ef05-49f6-aaf4-09267ebb69fc.tabs.0.elements.1.tip','null'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.fieldLayouts.f76322d0-ef05-49f6-aaf4-09267ebb69fc.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.fieldLayouts.f76322d0-ef05-49f6-aaf4-09267ebb69fc.tabs.0.elements.1.uid','\"95ffa6d5-64d3-489c-893d-f553c73f5c94\"'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.fieldLayouts.f76322d0-ef05-49f6-aaf4-09267ebb69fc.tabs.0.elements.1.userCondition','null'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.fieldLayouts.f76322d0-ef05-49f6-aaf4-09267ebb69fc.tabs.0.elements.1.warning','null'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.fieldLayouts.f76322d0-ef05-49f6-aaf4-09267ebb69fc.tabs.0.elements.1.width','100'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.fieldLayouts.f76322d0-ef05-49f6-aaf4-09267ebb69fc.tabs.0.elements.2.dateAdded','\"2024-11-21T10:25:49+00:00\"'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.fieldLayouts.f76322d0-ef05-49f6-aaf4-09267ebb69fc.tabs.0.elements.2.elementCondition','null'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.fieldLayouts.f76322d0-ef05-49f6-aaf4-09267ebb69fc.tabs.0.elements.2.fieldUid','\"bebc23d5-2d50-4499-ae0d-6aa66437be5e\"'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.fieldLayouts.f76322d0-ef05-49f6-aaf4-09267ebb69fc.tabs.0.elements.2.handle','null'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.fieldLayouts.f76322d0-ef05-49f6-aaf4-09267ebb69fc.tabs.0.elements.2.instructions','null'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.fieldLayouts.f76322d0-ef05-49f6-aaf4-09267ebb69fc.tabs.0.elements.2.label','null'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.fieldLayouts.f76322d0-ef05-49f6-aaf4-09267ebb69fc.tabs.0.elements.2.required','false'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.fieldLayouts.f76322d0-ef05-49f6-aaf4-09267ebb69fc.tabs.0.elements.2.tip','null'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.fieldLayouts.f76322d0-ef05-49f6-aaf4-09267ebb69fc.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.fieldLayouts.f76322d0-ef05-49f6-aaf4-09267ebb69fc.tabs.0.elements.2.uid','\"0cfaaaf1-5973-4c8f-a91a-3a42edaef851\"'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.fieldLayouts.f76322d0-ef05-49f6-aaf4-09267ebb69fc.tabs.0.elements.2.userCondition','null'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.fieldLayouts.f76322d0-ef05-49f6-aaf4-09267ebb69fc.tabs.0.elements.2.warning','null'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.fieldLayouts.f76322d0-ef05-49f6-aaf4-09267ebb69fc.tabs.0.elements.2.width','100'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.fieldLayouts.f76322d0-ef05-49f6-aaf4-09267ebb69fc.tabs.0.name','\"Content\"'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.fieldLayouts.f76322d0-ef05-49f6-aaf4-09267ebb69fc.tabs.0.uid','\"0b29a64e-8d30-4835-af4a-9ee754f3953b\"'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.fieldLayouts.f76322d0-ef05-49f6-aaf4-09267ebb69fc.tabs.0.userCondition','null'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.fs','\"images\"'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.handle','\"images\"'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.name','\"Images\"'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.sortOrder','1'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.subpath','\"\"'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.titleTranslationKeyFormat','null'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.titleTranslationMethod','\"site\"'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.transformFs','\"transforms\"'),('volumes.21950e08-1320-46dd-b9f3-8ddae1b3aa50.transformSubpath','\"\"'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.altTranslationKeyFormat','null'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.altTranslationMethod','\"none\"'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.fieldLayouts.fac307ad-c2f8-40e5-8998-c13af8ba3d21.cardView.0','\"filename\"'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.fieldLayouts.fac307ad-c2f8-40e5-8998-c13af8ba3d21.cardView.1','\"height\"'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.fieldLayouts.fac307ad-c2f8-40e5-8998-c13af8ba3d21.cardView.2','\"width\"'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.fieldLayouts.fac307ad-c2f8-40e5-8998-c13af8ba3d21.cardView.3','\"layoutElement:7faa717f-5193-45ec-8af5-f11a27e3aa1b\"'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.fieldLayouts.fac307ad-c2f8-40e5-8998-c13af8ba3d21.cardView.4','\"layoutElement:d39e6aff-b748-48f1-bd17-da6d454be74b\"'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.fieldLayouts.fac307ad-c2f8-40e5-8998-c13af8ba3d21.cardView.5','\"uid\"'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.fieldLayouts.fac307ad-c2f8-40e5-8998-c13af8ba3d21.tabs.0.elementCondition','null'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.fieldLayouts.fac307ad-c2f8-40e5-8998-c13af8ba3d21.tabs.0.elements.0.autocapitalize','true'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.fieldLayouts.fac307ad-c2f8-40e5-8998-c13af8ba3d21.tabs.0.elements.0.autocomplete','false'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.fieldLayouts.fac307ad-c2f8-40e5-8998-c13af8ba3d21.tabs.0.elements.0.autocorrect','true'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.fieldLayouts.fac307ad-c2f8-40e5-8998-c13af8ba3d21.tabs.0.elements.0.class','null'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.fieldLayouts.fac307ad-c2f8-40e5-8998-c13af8ba3d21.tabs.0.elements.0.dateAdded','\"2024-11-21T10:30:16+00:00\"'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.fieldLayouts.fac307ad-c2f8-40e5-8998-c13af8ba3d21.tabs.0.elements.0.disabled','false'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.fieldLayouts.fac307ad-c2f8-40e5-8998-c13af8ba3d21.tabs.0.elements.0.elementCondition','null'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.fieldLayouts.fac307ad-c2f8-40e5-8998-c13af8ba3d21.tabs.0.elements.0.id','null'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.fieldLayouts.fac307ad-c2f8-40e5-8998-c13af8ba3d21.tabs.0.elements.0.inputType','null'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.fieldLayouts.fac307ad-c2f8-40e5-8998-c13af8ba3d21.tabs.0.elements.0.instructions','null'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.fieldLayouts.fac307ad-c2f8-40e5-8998-c13af8ba3d21.tabs.0.elements.0.label','null'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.fieldLayouts.fac307ad-c2f8-40e5-8998-c13af8ba3d21.tabs.0.elements.0.max','null'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.fieldLayouts.fac307ad-c2f8-40e5-8998-c13af8ba3d21.tabs.0.elements.0.min','null'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.fieldLayouts.fac307ad-c2f8-40e5-8998-c13af8ba3d21.tabs.0.elements.0.name','null'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.fieldLayouts.fac307ad-c2f8-40e5-8998-c13af8ba3d21.tabs.0.elements.0.orientation','null'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.fieldLayouts.fac307ad-c2f8-40e5-8998-c13af8ba3d21.tabs.0.elements.0.placeholder','null'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.fieldLayouts.fac307ad-c2f8-40e5-8998-c13af8ba3d21.tabs.0.elements.0.readonly','false'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.fieldLayouts.fac307ad-c2f8-40e5-8998-c13af8ba3d21.tabs.0.elements.0.requirable','false'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.fieldLayouts.fac307ad-c2f8-40e5-8998-c13af8ba3d21.tabs.0.elements.0.size','null'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.fieldLayouts.fac307ad-c2f8-40e5-8998-c13af8ba3d21.tabs.0.elements.0.step','null'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.fieldLayouts.fac307ad-c2f8-40e5-8998-c13af8ba3d21.tabs.0.elements.0.tip','null'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.fieldLayouts.fac307ad-c2f8-40e5-8998-c13af8ba3d21.tabs.0.elements.0.title','null'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.fieldLayouts.fac307ad-c2f8-40e5-8998-c13af8ba3d21.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\"'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.fieldLayouts.fac307ad-c2f8-40e5-8998-c13af8ba3d21.tabs.0.elements.0.uid','\"57ea13c3-c50c-4ee5-935a-af163dc2a06a\"'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.fieldLayouts.fac307ad-c2f8-40e5-8998-c13af8ba3d21.tabs.0.elements.0.userCondition','null'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.fieldLayouts.fac307ad-c2f8-40e5-8998-c13af8ba3d21.tabs.0.elements.0.warning','null'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.fieldLayouts.fac307ad-c2f8-40e5-8998-c13af8ba3d21.tabs.0.elements.0.width','100'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.fieldLayouts.fac307ad-c2f8-40e5-8998-c13af8ba3d21.tabs.0.elements.1.dateAdded','\"2024-11-21T10:32:15+00:00\"'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.fieldLayouts.fac307ad-c2f8-40e5-8998-c13af8ba3d21.tabs.0.elements.1.elementCondition','null'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.fieldLayouts.fac307ad-c2f8-40e5-8998-c13af8ba3d21.tabs.0.elements.1.fieldUid','\"da87989f-6fba-4fb3-afae-2501b651f019\"'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.fieldLayouts.fac307ad-c2f8-40e5-8998-c13af8ba3d21.tabs.0.elements.1.handle','null'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.fieldLayouts.fac307ad-c2f8-40e5-8998-c13af8ba3d21.tabs.0.elements.1.instructions','null'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.fieldLayouts.fac307ad-c2f8-40e5-8998-c13af8ba3d21.tabs.0.elements.1.label','null'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.fieldLayouts.fac307ad-c2f8-40e5-8998-c13af8ba3d21.tabs.0.elements.1.required','false'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.fieldLayouts.fac307ad-c2f8-40e5-8998-c13af8ba3d21.tabs.0.elements.1.tip','null'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.fieldLayouts.fac307ad-c2f8-40e5-8998-c13af8ba3d21.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.fieldLayouts.fac307ad-c2f8-40e5-8998-c13af8ba3d21.tabs.0.elements.1.uid','\"7faa717f-5193-45ec-8af5-f11a27e3aa1b\"'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.fieldLayouts.fac307ad-c2f8-40e5-8998-c13af8ba3d21.tabs.0.elements.1.userCondition','null'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.fieldLayouts.fac307ad-c2f8-40e5-8998-c13af8ba3d21.tabs.0.elements.1.warning','null'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.fieldLayouts.fac307ad-c2f8-40e5-8998-c13af8ba3d21.tabs.0.elements.1.width','100'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.fieldLayouts.fac307ad-c2f8-40e5-8998-c13af8ba3d21.tabs.0.elements.2.dateAdded','\"2024-11-21T10:32:15+00:00\"'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.fieldLayouts.fac307ad-c2f8-40e5-8998-c13af8ba3d21.tabs.0.elements.2.elementCondition','null'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.fieldLayouts.fac307ad-c2f8-40e5-8998-c13af8ba3d21.tabs.0.elements.2.fieldUid','\"bebc23d5-2d50-4499-ae0d-6aa66437be5e\"'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.fieldLayouts.fac307ad-c2f8-40e5-8998-c13af8ba3d21.tabs.0.elements.2.handle','null'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.fieldLayouts.fac307ad-c2f8-40e5-8998-c13af8ba3d21.tabs.0.elements.2.instructions','null'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.fieldLayouts.fac307ad-c2f8-40e5-8998-c13af8ba3d21.tabs.0.elements.2.label','null'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.fieldLayouts.fac307ad-c2f8-40e5-8998-c13af8ba3d21.tabs.0.elements.2.required','false'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.fieldLayouts.fac307ad-c2f8-40e5-8998-c13af8ba3d21.tabs.0.elements.2.tip','null'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.fieldLayouts.fac307ad-c2f8-40e5-8998-c13af8ba3d21.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.fieldLayouts.fac307ad-c2f8-40e5-8998-c13af8ba3d21.tabs.0.elements.2.uid','\"d39e6aff-b748-48f1-bd17-da6d454be74b\"'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.fieldLayouts.fac307ad-c2f8-40e5-8998-c13af8ba3d21.tabs.0.elements.2.userCondition','null'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.fieldLayouts.fac307ad-c2f8-40e5-8998-c13af8ba3d21.tabs.0.elements.2.warning','null'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.fieldLayouts.fac307ad-c2f8-40e5-8998-c13af8ba3d21.tabs.0.elements.2.width','100'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.fieldLayouts.fac307ad-c2f8-40e5-8998-c13af8ba3d21.tabs.0.name','\"Content\"'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.fieldLayouts.fac307ad-c2f8-40e5-8998-c13af8ba3d21.tabs.0.uid','\"cf98a92a-ce1f-44aa-9838-cc81be93a79f\"'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.fieldLayouts.fac307ad-c2f8-40e5-8998-c13af8ba3d21.tabs.0.userCondition','null'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.fs','\"videos\"'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.handle','\"videos\"'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.name','\"Videos\"'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.sortOrder','3'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.subpath','\"\"'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.titleTranslationKeyFormat','null'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.titleTranslationMethod','\"site\"'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.transformFs','\"transforms\"'),('volumes.ce490459-dc63-4854-810e-ff2762981c6f.transformSubpath','\"\"');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `recoverycodes`
--

LOCK TABLES `recoverycodes` WRITE;
/*!40000 ALTER TABLE `recoverycodes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `recoverycodes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `relations` VALUES (1,7,18,NULL,13,2,'2024-11-21 11:16:36','2024-11-25 09:18:07','24c4a35d-9725-4361-8558-6d92fa2e6461'),(2,7,18,NULL,2,1,'2024-11-21 11:16:36','2024-11-25 09:18:07','a2c9bea9-a280-422e-8a83-e7370c93d02b'),(5,10,22,NULL,21,1,'2024-11-21 11:39:30','2024-11-21 11:39:30','02b0f145-8239-48f2-821b-148f5082f1b6'),(8,8,42,NULL,40,1,'2025-09-02 09:17:04','2025-09-02 09:17:04','3b50d3ba-4866-4658-82af-0023a4985165'),(9,8,42,NULL,6,2,'2025-09-02 09:17:04','2025-09-02 09:17:04','d823e4d7-1431-45ba-903c-70f0329cbf3f'),(10,8,42,NULL,37,3,'2025-09-02 09:17:04','2025-09-02 09:17:04','d11ee8a3-1c76-44b9-a671-20ecf22975b1'),(13,10,44,NULL,21,1,'2025-09-02 10:52:22','2025-09-02 10:52:22','15d80157-18ed-4d8d-812d-cb20c8935802'),(14,10,45,NULL,21,1,'2025-09-02 10:54:43','2025-09-02 10:54:43','17752d28-017b-437f-a4c3-26d90bc0a6a3'),(17,10,2,NULL,46,1,'2025-09-02 10:56:04','2025-09-02 10:56:04','444a5e08-a96a-4192-a7c4-74d1438c5655'),(18,10,48,NULL,46,1,'2025-09-02 10:56:04','2025-09-02 10:56:04','18139c64-a87c-4983-87e7-1ff79b51d4bd'),(19,10,55,NULL,46,1,'2026-05-12 09:08:11','2026-05-12 09:08:11','aca8f1a4-b975-45f3-b0ec-4dc595067280'),(20,10,56,NULL,46,1,'2026-05-12 09:08:16','2026-05-12 09:08:16','3ad216e7-c1b7-4736-9634-b633cc49473e'),(23,27,55,NULL,57,1,'2026-05-12 09:12:44','2026-05-12 09:12:44','d786a555-92e1-4374-9b6f-43ef61d28da6'),(24,10,60,NULL,46,1,'2026-05-12 09:12:44','2026-05-12 09:12:44','cfcb9ab2-86e5-424c-8ae6-dabb14c589f2'),(25,27,60,NULL,57,1,'2026-05-12 09:12:44','2026-05-12 09:12:44','26f7ef11-6458-42dc-9bd1-d0a5fe137743'),(26,27,61,NULL,58,1,'2026-05-12 09:12:56','2026-05-12 09:12:56','9c7097df-8186-4cb6-a35b-de14f9de070d'),(27,10,61,NULL,46,1,'2026-05-12 09:13:00','2026-05-12 09:13:00','2039579d-5c6b-47a7-9b7f-f68e66037e49'),(28,10,62,NULL,46,1,'2026-05-12 09:13:06','2026-05-12 09:13:06','63a7ceba-38f3-4f6d-b58e-07d3b3feb037'),(29,27,62,NULL,58,1,'2026-05-12 09:13:06','2026-05-12 09:13:06','1a77ff55-dc11-405d-b518-b9aebf892f75');
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `revisions` VALUES (1,2,1,1,NULL),(2,2,1,2,NULL),(3,2,1,3,NULL),(4,6,1,1,NULL),(5,6,1,2,NULL),(6,2,1,4,NULL),(7,2,1,5,NULL),(8,6,1,3,NULL),(9,2,1,6,NULL),(10,13,1,1,NULL),(11,2,1,7,NULL),(12,6,1,4,NULL),(13,20,1,1,''),(14,2,1,8,'Applied “Draft 1”'),(15,13,1,2,''),(16,6,1,5,''),(17,6,1,6,''),(18,2,1,9,'Applied “Draft 1”'),(19,2,1,10,NULL),(20,2,1,11,NULL),(21,2,1,12,NULL),(22,13,1,3,NULL),(23,6,1,7,NULL),(24,37,1,1,NULL),(25,37,1,2,NULL),(26,40,1,1,NULL),(27,2,1,13,'Applied “Draft 1”'),(28,2,1,14,''),(29,2,1,15,'Applied “Draft 1”'),(30,40,1,2,'Applied “Draft 1”'),(31,6,1,8,''),(32,37,1,3,'Applied “Draft 1”'),(33,55,1,1,''),(34,55,1,2,'Applied “Draft 1”'),(35,61,1,1,'');
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `searchindex` VALUES (1,'email',0,1,' base left studio '),(1,'firstname',0,1,''),(1,'fullname',0,1,''),(1,'lastname',0,1,''),(1,'slug',0,1,''),(1,'username',0,1,' left '),(2,'slug',0,1,' home '),(2,'title',0,1,' home '),(6,'slug',0,1,' imprint '),(6,'title',0,1,' imprint '),(13,'slug',0,1,' about '),(13,'title',0,1,' about '),(17,'slug',0,1,''),(18,'slug',0,1,''),(19,'slug',0,1,''),(20,'slug',0,1,' card example '),(20,'title',0,1,' card example '),(21,'alt',0,1,''),(21,'extension',0,1,' png '),(21,'filename',0,1,' screenshot 2024 11 04 at 17 55 44 png '),(21,'kind',0,1,' image '),(21,'slug',0,1,''),(21,'title',0,1,' screenshot 2024 11 04 at 17 55 44 '),(32,'slug',0,1,''),(33,'slug',0,1,''),(37,'slug',0,1,' privacy '),(37,'title',0,1,' privacy '),(40,'slug',0,1,' accessibility '),(40,'title',0,1,' accessibility '),(42,'slug',0,1,''),(46,'alt',0,1,''),(46,'extension',0,1,' jpg '),(46,'filename',0,1,' 52513fbc48c692f008ba2c82ec87bce4c03b17c5 jpg '),(46,'kind',0,1,' image '),(46,'slug',0,1,''),(46,'title',0,1,' 52513fbc48c692f008ba2c82ec87bce4c03b17c5 '),(55,'slug',0,1,' example entry '),(55,'title',0,1,' example entry '),(57,'slug',0,1,' type 1 '),(57,'title',0,1,' type 1 '),(58,'slug',0,1,' type 2 '),(58,'title',0,1,' type 2 '),(61,'slug',0,1,' example entry 2 '),(61,'title',0,1,' example entry 2 ');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindexqueue`
--

LOCK TABLES `searchindexqueue` WRITE;
/*!40000 ALTER TABLE `searchindexqueue` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `searchindexqueue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindexqueue_fields`
--

LOCK TABLES `searchindexqueue_fields` WRITE;
/*!40000 ALTER TABLE `searchindexqueue_fields` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `searchindexqueue_fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections` VALUES (1,NULL,'Home','home','single',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2024-11-21 08:48:14','2024-11-21 08:48:14',NULL,'c3b49286-4ca2-4801-9d33-2a3e31e1807d'),(2,NULL,'About','about','single',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2024-11-21 10:04:37','2024-11-21 10:55:34',NULL,'841c0af1-37d6-429d-a7d8-bbb2c21d8566'),(3,NULL,'Imprint','imprint','single',1,1,'all','end',NULL,'2024-11-21 10:07:47','2024-11-21 10:09:37',NULL,'e414d637-e54f-4359-9cf8-cd94185009c4'),(4,NULL,'Example Entry','exampleEntry','channel',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2024-11-21 11:38:38','2026-05-12 09:07:44',NULL,'84547fdc-05c1-4c3c-a280-9b7fb6166e32'),(5,NULL,'Privacy','privacy','single',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2025-09-02 09:06:44','2025-09-02 09:06:44',NULL,'40b9212d-f977-40ad-b0ff-4cc1159a90af'),(6,NULL,'Accessibility','accessibility','single',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2025-09-02 09:10:18','2025-09-02 09:10:18',NULL,'5446d600-e88a-4d58-b876-2d5124956541');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_entrytypes`
--

LOCK TABLES `sections_entrytypes` WRITE;
/*!40000 ALTER TABLE `sections_entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_entrytypes` VALUES (1,1,1,NULL,NULL,NULL),(2,2,1,NULL,NULL,NULL),(3,3,1,NULL,NULL,NULL),(4,4,1,NULL,NULL,NULL),(5,5,1,NULL,NULL,NULL),(6,6,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sections_entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_sites` VALUES (1,1,1,1,'__home__','_layouts/home.twig',1,'2024-11-21 08:48:14','2025-09-02 08:21:39','6da5b8a7-9a2a-47b6-a146-4f30ef6811b4'),(2,2,1,1,'about','_layouts/about.twig',1,'2024-11-21 10:04:37','2024-11-21 10:47:59','7dbd62fb-5778-4d70-98f4-cd8635c8191b'),(3,3,1,1,'imprint','_layouts/imprint.twig',1,'2024-11-21 10:07:47','2024-11-21 10:09:37','c4514b04-195a-4137-9210-7192b3898569'),(4,4,1,1,'card-example/{slug}','card-example/_entry.twig',1,'2024-11-21 11:38:38','2024-11-21 11:38:38','088b7832-bee2-48f1-a4a9-d45d3ce15021'),(5,5,1,1,'privacy','_layouts/privacy.twig',1,'2025-09-02 09:06:44','2025-09-02 09:07:47','eb79e65b-4233-4436-8f0d-4e171416a93d'),(6,6,1,1,'accessibility','_layouts/accessibility.twig',1,'2025-09-02 09:10:18','2025-09-02 09:10:18','31264a9b-a838-4289-9a6c-f3c2777a3a94');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sitegroups` VALUES (1,'master-project','2024-11-20 15:56:40','2024-11-20 15:56:40',NULL,'de666abc-e71d-43e3-b318-cc6d8044b6b9');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sites` VALUES (1,1,1,'true','master-project','default','en-US',1,'$PRIMARY_SITE_URL',1,'2024-11-20 15:56:41','2024-11-20 15:56:41',NULL,'731c4afc-3bf9-4c58-a826-7db0350cadfd');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sso_identities`
--

LOCK TABLES `sso_identities` WRITE;
/*!40000 ALTER TABLE `sso_identities` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sso_identities` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `structureelements` VALUES (1,1,NULL,1,1,6,0,'2026-05-12 09:11:47','2026-05-12 09:11:53','661316a6-42ea-4a84-821d-1f80efa86015'),(2,1,57,1,2,3,1,'2026-05-12 09:11:47','2026-05-12 09:11:47','32881894-5378-4db6-811e-568242b8a1d0'),(3,1,58,1,4,5,1,'2026-05-12 09:11:53','2026-05-12 09:11:53','d2b57e9f-1c72-4091-a709-9c4538e5924d');
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `structures` VALUES (1,NULL,'2026-05-12 09:11:38','2026-05-12 09:11:38',NULL,'ca744c8a-dd4b-4521-939c-6a2f4083e003');
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `userpreferences` VALUES (1,'{\"language\": \"en-US\", \"showFieldHandles\": true}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `users` VALUES (1,NULL,NULL,1,0,0,0,1,'left',NULL,NULL,NULL,'base@left.studio','$2y$13$nTZG1mFUj688D7VUz3RY..3eboJqWAktUOjb2GwXqnySobnsLIC2O','2026-05-12 12:37:50',NULL,NULL,NULL,'2025-09-30 15:07:30',NULL,1,NULL,NULL,NULL,0,'2025-09-02 08:19:43','2024-11-20 15:56:41','2026-05-12 12:37:50');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumefolders` VALUES (1,NULL,1,'Images','','2024-11-21 10:25:49','2024-11-21 10:25:49','dfa80b50-1281-49f2-880a-827971321978'),(2,NULL,2,'Data','','2024-11-21 10:27:49','2024-11-21 10:27:49','cc130904-f4f7-4c24-9dd3-0587bdb3ac7c'),(3,NULL,3,'Videos','','2024-11-21 10:32:15','2024-11-21 10:32:15','457761ae-6b27-474a-a5c2-5d142c4e5c5e'),(4,NULL,NULL,'Temporary Uploads',NULL,'2024-11-21 10:58:01','2024-11-21 10:58:01','38afea63-d3b2-4454-8608-236303b149b0'),(5,4,NULL,'user_1','user_1/','2024-11-21 10:58:01','2024-11-21 10:58:01','0156545f-c6d7-4481-97da-8d247fdcd05d');
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumes` VALUES (1,4,'Images','images','images','','transforms','','site',NULL,'none',NULL,1,'2024-11-21 10:25:49','2024-11-21 10:25:49',NULL,'21950e08-1320-46dd-b9f3-8ddae1b3aa50'),(2,5,'Data','data','data','','','','site',NULL,'none',NULL,2,'2024-11-21 10:27:49','2024-11-21 10:27:49',NULL,'0c017e24-6889-49f0-bdd2-058a139c9f1d'),(3,6,'Videos','videos','videos','','transforms','','site',NULL,'none',NULL,3,'2024-11-21 10:32:15','2024-11-21 10:32:15',NULL,'ce490459-dc63-4854-810e-ff2762981c6f');
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `webauthn`
--

LOCK TABLES `webauthn` WRITE;
/*!40000 ALTER TABLE `webauthn` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `webauthn` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `widgets` VALUES (1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"limit\": 10, \"siteId\": 1, \"section\": \"*\"}','2024-11-20 15:57:04','2024-11-20 15:57:04','6d0be4a7-942a-4be4-904f-e825b6c21b27'),(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]','2024-11-20 15:57:04','2024-11-20 15:57:04','f69ca25d-2c6a-4152-bf48-2a35a41fbb9e'),(3,1,'craft\\widgets\\Updates',3,NULL,'[]','2024-11-20 15:57:04','2024-11-20 15:57:04','d990580b-b8fe-4cd8-a108-61135321158f'),(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\": \"https://craftcms.com/news.rss\", \"limit\": 5, \"title\": \"Craft News\"}','2024-11-20 15:57:04','2024-11-20 15:57:04','32861ab8-cf98-482d-bb75-50c82ddad3cc');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping routines for database 'db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-12 15:06:25
