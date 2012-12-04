-- MySQL dump 10.13  Distrib 5.5.28, for osx10.7 (i386)
--
-- Host: localhost    Database: calendar
-- ------------------------------------------------------
-- Server version	5.5.28-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `attend_member`
--

DROP TABLE IF EXISTS `attend_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attend_member` (
  `event_id` bigint(20) unsigned NOT NULL,
  `member_id` varchar(20) NOT NULL,
  `number` int(10) unsigned NOT NULL,
  `created_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`event_id`,`member_id`),
  KEY `idx_1` (`member_id`,`created_datetime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event` (
  `event_id` bigint(20) unsigned NOT NULL,
  `page_id` bigint(20) unsigned NOT NULL,
  `module_id` bigint(20) unsigned NOT NULL,
  `title` varchar(40) NOT NULL,
  `description` text NOT NULL,
  `details_json` text NOT NULL,
  `category` varchar(20) NOT NULL,
  `attend_count` int(10) unsigned NOT NULL,
  `attend_limit` int(10) unsigned NOT NULL,
  `scheduled_datetime` datetime NOT NULL,
  `created_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`event_id`),
  KEY `idx_1` (`page_id`,`module_id`,`scheduled_datetime`),
  KEY `idx_2` (`scheduled_datetime`),
  KEY `idx_3` (`created_datetime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_id_pot`
--

DROP TABLE IF EXISTS `event_id_pot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_id_pot` (
  `event_id` bigint(20) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-12-04 21:53:10
