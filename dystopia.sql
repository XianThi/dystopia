-- MySQL dump 10.13  Distrib 5.5.40, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: dystopia
-- ------------------------------------------------------
-- Server version	5.5.40-0ubuntu0.14.04.1

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
-- Table structure for table `army`
--

DROP TABLE IF EXISTS `army`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `army` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `country` int(9) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `leader` int(9) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `army`
--

LOCK TABLES `army` WRITE;
/*!40000 ALTER TABLE `army` DISABLE KEYS */;
INSERT INTO `army` VALUES (1,'Deneme Ordu',1,'',1);
/*!40000 ALTER TABLE `army` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` longtext,
  `author` int(9) DEFAULT NULL,
  `owner` int(9) DEFAULT NULL,
  `vote` int(9) DEFAULT '0',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (1,'Dystopia Test Süreci','<p><span class=\"example2\"><strong>Dystopia Test S&uuml;reci başladı arkadaşlar. Elinizden geldiğince hile hurda yapmaya &ccedil;alışıp bana bildirirseniz sevinirim&nbsp;<img src=\"../../js/tinymce/plugins/emoticons/img/smiley-laughing.gif\" alt=\"laughing\" /></strong></span></p>',1,1,2,'2015-01-03 11:39:17'),(2,'İŞ ARAYANLAR','<p>Merhaba Değerli DYSTOPIA HALKI</p>\r\n<p>Oyun yeni kurulduğundan ekonomi tam &nbsp;oturmadı .Sizin yardımınıza ihtiyacım var değerli iş&ccedil;iler benim şirketlerimde &ccedil;alışırsanız paranızı y&uuml;kl&uuml; alıcaksınız ve piyasa oturunca hepinize gold bağışı yapacağım</p>\r\n<p>ŞİRKETLERDE HER SAAT BAŞI TEKLİF VARDIR :))</p>\r\n<p>&nbsp;</p>\r\n<p><a href=\"../../company/view/3\">http://188.166.42.60/company/view/3</a></p>\r\n<p><a href=\"../../company/view/4\">http://188.166.42.60/company/view/4</a></p>\r\n<p><a href=\"../../company/view/5\">http://188.166.42.60/company/view/5</a></p>\r\n<p><a href=\"../../company/view/7\">http://188.166.42.60/company/view/7</a></p>\r\n<p>&nbsp;</p>\r\n<p>İyi G&uuml;nler</p>\r\n<p>Ayrıca gazeteme abone olan herkese para yardımı yapılır :))&nbsp;</p>\r\n<p><a href=\"../../newspaper/view/2\">http://188.166.42.60/newspaper/view/2</a></p>\r\n<p>&nbsp;</p>\r\n<p>Not : Burdan verilir e-sim Priden alınır :D</p>',7,2,2,'2015-01-02 13:11:37'),(3,'DÜNYADA TEK BİR SES HAKİM OLACAK ; \"ANARCHISM\"','<p>Son of anarchy olarak t&uuml;m D&uuml;nya\'ya h&uuml;kmetmeye geldik.Kurulum aşamasında olan SOA i&ccedil;in hazırlıklar yapılıyor.T&uuml;m d&uuml;nyanın g&uuml;ndemini değiştirmeye geldik.</p>\r\n<p>Hail Cryptica</p>\r\n<p>Hail Metayd</p>\r\n<p>Hail Son of Anarchy</p>\r\n<p>Hail ANARCHISM</p>',8,3,3,'2015-01-02 13:15:03'),(4,'ANARSIZM\'IN BUYUK KURUCUSU : METAYD','<p>Anarşizm b&ouml;lgesinin y&ouml;neticisi b&uuml;y&uuml;k oy &ccedil;oğunluğuyla Metayd olmuştur.Başkanımıza g&ouml;revinde başarılar dileriz.</p>',8,3,1,'2015-01-06 18:03:04');
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `owner` int(9) DEFAULT NULL,
  `zones` int(11) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `type` int(9) DEFAULT NULL,
  `type2` int(9) DEFAULT NULL,
  `quality` int(9) DEFAULT '1',
  `money` float DEFAULT '0',
  `raw` float DEFAULT '100',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'Demokritos Weapons',1,3,'img/avatar/no_avatar.jpg',2,4,1,1468.53,12.79),(2,'Demokritos Metal',1,3,'img/avatar/no_avatar.jpg',1,1,1,7412,0),(3,'Lenin Q1 İRON',7,6,'img/avatar/no_avatar.jpg',1,1,1,0,NULL),(4,'LENİN Q1 WEAPON',7,6,'img/avatar/no_avatar.jpg',2,4,1,14,812.35),(5,'LENİN Q1 GRAİN',7,6,'img/avatar/no_avatar.jpg',1,3,1,0,NULL),(6,'Metayd\'s Anarchy Co. WEP',8,5,'img/avatar/no_avatar.jpg',2,4,1,0,833.8),(7,'LENİN Q1 FOOD',7,6,'img/avatar/no_avatar.jpg',2,7,1,6,762.65),(8,'Alemdar\'s Company',10,3,'img/avatar/no_avatar.jpg',1,1,1,278,NULL),(9,'Alemdar\'s Company2',10,3,'img/avatar/no_avatar.jpg',2,4,1,NULL,1000),(10,'Metayd\'s Anarchy Co. IRON',8,5,'img/avatar/no_avatar.jpg',1,1,1,700,NULL),(11,'BIRAKIN GELSİN LTD. ŞTİ AŞ.',22,2,'img/avatar/no_avatar.jpg',2,4,1,NULL,NULL),(12,'kafkafkafkafkaf',4,4,'img/avatar/no_avatar.jpg',1,1,1,NULL,NULL),(13,'kafkafkafkafkaf',4,4,'img/avatar/no_avatar.jpg',1,1,1,NULL,NULL),(14,'SAYLIK HOLDİNG',11,3,'img/avatar/no_avatar.jpg',2,6,1,500,NULL);
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_types`
--

DROP TABLE IF EXISTS `company_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_types` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` int(9) DEFAULT NULL,
  `price` int(9) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `req` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_types`
--

LOCK TABLES `company_types` WRITE;
/*!40000 ALTER TABLE `company_types` DISABLE KEYS */;
INSERT INTO `company_types` VALUES (1,'Metal',1,10,'./img/icons/metal-icon.png',0),(2,'Stone',1,10,'./img/icons/stone-icon.png',0),(3,'Grain',1,10,'./img/icons/grain-icon.png',0),(4,'Weapon',2,10,'./img/icons/weapon-icon.png',1),(5,'Defense Industry',2,20,'./img/icons/defense-icon.png',2),(6,'Hospital',2,50,'./img/icons/hospital-icon.png',2),(7,'Food',2,10,'',3);
/*!40000 ALTER TABLE `company_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `flag` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'Cosmos','/public/img/country/tr.png');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friends`
--

DROP TABLE IF EXISTS `friends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friends` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `friendid` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friends`
--

LOCK TABLES `friends` WRITE;
/*!40000 ALTER TABLE `friends` DISABLE KEYS */;
/*!40000 ALTER TABLE `friends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gov`
--

DROP TABLE IF EXISTS `gov`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gov` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `governmentid` int(255) DEFAULT NULL,
  `zoneid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gov`
--

LOCK TABLES `gov` WRITE;
/*!40000 ALTER TABLE `gov` DISABLE KEYS */;
INSERT INTO `gov` VALUES (1,1,3),(2,3,6),(3,2,2),(4,4,4),(5,5,5);
/*!40000 ALTER TABLE `gov` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `government`
--

DROP TABLE IF EXISTS `government`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `government` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `government`
--

LOCK TABLES `government` WRITE;
/*!40000 ALTER TABLE `government` DISABLE KEYS */;
INSERT INTO `government` VALUES (1,'Democracy'),(2,'Oligarchy'),(3,'Communism'),(4,'Monarchy'),(5,'Anarchy');
/*!40000 ALTER TABLE `government` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `itemid` int(11) DEFAULT NULL,
  `pcs` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (1,1,4,742),(2,1,1,484),(3,5,1,-10087),(4,10,1,720);
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `availability` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,'Metal','./img/icons/metal-icon.png',1,1,1),(2,'Stone','./img/icons/stone-icon.png',1,2,1),(3,'Grain','./img/icons/grain-icon.png',1,3,1),(4,'Pistol','./img/icons/pistol-icon.png',1,4,1),(5,'Rifle','',5,4,2),(6,'Bazooka','',10,4,3),(7,'Combat Plane','',15,4,4),(8,'Tank','',20,4,5),(9,'Wall','',100,5,1),(10,'Tower','',100,5,2);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_offers`
--

DROP TABLE IF EXISTS `job_offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_offers` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `owner` int(9) DEFAULT NULL,
  `job_type` int(9) DEFAULT NULL,
  `fee` varchar(255) DEFAULT NULL,
  `person` int(9) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_offers`
--

LOCK TABLES `job_offers` WRITE;
/*!40000 ALTER TABLE `job_offers` DISABLE KEYS */;
INSERT INTO `job_offers` VALUES (1,'11:00:00','13:00:00',1,0,'1',9),(2,'08:00:00','10:00:00',2,0,'1',8),(3,'11:00:00','18:00:00',1,0,'15',10),(4,'13:00:00','18:00:00',1,0,'10',10),(5,'18:00:00','23:00:00',1,0,'10',8),(6,'00:00:00','08:00:00',1,0,'10',410),(7,'08:00:00','11:00:00',1,0,'10',9),(8,'00:00:00','07:00:00',2,0,'10',8),(9,'11:00:00','18:00:00',2,0,'20',9),(10,'19:00:00','23:00:00',2,0,'10',8),(12,'14:00:00','15:00:00',3,NULL,'2',20),(13,'15:00:00','16:00:00',3,NULL,'2',17),(14,'17:00:00','17:00:00',3,NULL,'2',20),(15,'18:00:00','19:00:00',3,NULL,'2',19),(16,'14:00:00','15:00:00',4,NULL,'2',20),(17,'16:00:00','17:00:00',4,NULL,'2',20),(18,'18:00:00','19:00:00',4,NULL,'2',20),(19,'19:00:00','20:00:00',4,NULL,'2',20),(20,'14:00:00','15:00:00',5,NULL,'2',20),(21,'16:00:00','17:00:00',5,NULL,'2',20),(22,'17:00:00','18:00:00',5,NULL,'2',20),(23,'19:00:00','20:00:00',5,NULL,'2',20),(24,'20:00:00','21:00:00',5,NULL,'2',19),(25,'21:00:00','22:00:00',5,NULL,'2',20),(26,'22:00:00','23:00:00',5,NULL,'2',19),(27,'00:00:00','01:00:00',5,NULL,'2',20),(29,'02:00:00','03:00:00',5,NULL,'2',18),(30,'14:00:00','15:00:00',7,NULL,'2',20),(31,'16:00:00','16:00:00',7,NULL,'2',20),(32,'17:00:00','18:00:00',7,NULL,'2',20),(33,'19:00:00','20:00:00',7,NULL,'2',20),(34,'21:00:00','22:00:00',7,NULL,'2',19),(35,'22:00:00','23:00:00',7,NULL,'2',18),(36,'16:00:00','17:00:00',7,NULL,'2',20),(37,'12:00:00','13:00:00',7,NULL,'2',20),(38,'11:00:00','12:00:00',7,NULL,'2',20),(39,'10:00:00','11:00:00',7,NULL,'2',20),(40,'09:00:00','10:00:00',7,NULL,'2',20),(41,'08:00:00','09:00:00',7,NULL,'2',20),(42,'07:00:00','08:00:00',7,NULL,'2',20),(43,'13:00:00','14:00:00',3,NULL,'2',20),(44,'12:00:00','13:00:00',3,NULL,'2',20),(45,'11:00:00','12:00:00',3,NULL,'2',20),(46,'10:00:00','11:00:00',3,NULL,'2',20),(47,'09:00:00','10:00:00',3,NULL,'2',20),(48,'08:00:00','09:00:00',3,NULL,'2',20),(49,'07:00:00','20:00:00',3,NULL,'2',20),(50,'13:00:00','14:00:00',5,NULL,'2',20),(51,'12:00:00','13:00:00',5,NULL,'2',20),(52,'00:00:00','23:00:00',8,NULL,'2',2),(53,'11:00:00','12:00:00',5,NULL,'2',20),(54,'10:00:00','11:00:00',5,NULL,'2',20),(55,'09:00:00','10:00:00',5,NULL,'2',20),(56,'08:00:00','09:00:00',5,NULL,'2',20),(57,'07:00:00','08:00:00',5,NULL,'2',20),(58,'13:00:00','14:00:00',4,NULL,'2',20),(59,'12:00:00','13:00:00',4,NULL,'2',20),(60,'11:00:00','12:00:00',4,NULL,'2',20),(61,'10:00:00','11:00:00',4,NULL,'2',20),(62,'09:00:00','10:00:00',4,NULL,'2',20),(63,'08:00:00','09:00:00',4,NULL,'2',20),(64,'15:00:00','16:00:00',6,NULL,'50',1),(65,'00:00:00','23:00:00',6,NULL,'50',5),(66,'15:00:00','16:00:00',5,NULL,'2',20),(67,'15:00:00','16:00:00',4,NULL,'2',17),(68,'15:00:00','16:00:00',7,NULL,'2',20),(69,'06:00:00','23:00:00',6,NULL,'100',4),(70,'01:00:00','23:00:00',6,NULL,'50',3),(71,'06:00:00','23:00:00',10,NULL,'50',5);
/*!40000 ALTER TABLE `job_offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `flag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (61,'T','tr-TR','tr-TR');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `level`
--

DROP TABLE IF EXISTS `level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `level` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `level` int(9) DEFAULT NULL,
  `exp_min` double DEFAULT NULL,
  `exp_max` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `level`
--

LOCK TABLES `level` WRITE;
/*!40000 ALTER TABLE `level` DISABLE KEYS */;
INSERT INTO `level` VALUES (1,1,0,2),(2,2,2,5),(3,3,5,10),(4,4,10,15),(5,5,15,21),(6,6,21,30),(7,7,30,40),(8,8,40,55),(9,9,55,70),(10,10,70,100),(11,11,100,150),(12,12,150,210),(13,13,210,300),(14,14,300,400),(15,15,400,550),(16,16,550,700),(17,17,700,900),(18,18,900,1200),(19,19,1200,1550),(20,20,1550,1800),(21,21,1800,2500),(22,22,2500,3200),(23,23,3200,5000),(24,24,5000,7000),(25,25,7000,10000),(26,26,10000,15000),(27,27,15000,21000),(28,28,21000,30000),(29,29,30000,40000),(30,30,40000,55000),(31,31,55000,70000),(32,32,70000,90000),(33,33,90000,110000);
/*!40000 ALTER TABLE `level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `managers`
--

DROP TABLE IF EXISTS `managers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `managers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `zoneid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `managers`
--

LOCK TABLES `managers` WRITE;
/*!40000 ALTER TABLE `managers` DISABLE KEYS */;
INSERT INTO `managers` VALUES (1,1,2),(2,0,3),(3,0,4),(4,8,5),(5,9,6),(6,1,0);
/*!40000 ALTER TABLE `managers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `message` longtext,
  `title` varchar(255) DEFAULT NULL,
  `to_id` int(9) DEFAULT NULL,
  `from_id` int(9) DEFAULT NULL,
  `readx` int(9) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `messageid` int(9) DEFAULT NULL,
  `delete_user1` int(9) DEFAULT NULL,
  `delete_user2` int(9) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newspaper`
--

DROP TABLE IF EXISTS `newspaper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newspaper` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `owner` int(9) DEFAULT NULL,
  `subs` int(9) DEFAULT NULL,
  `zones` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newspaper`
--

LOCK TABLES `newspaper` WRITE;
/*!40000 ALTER TABLE `newspaper` DISABLE KEYS */;
INSERT INTO `newspaper` VALUES (1,'Dystopia News','img/avatar/no_avatar.jpg',1,4,0),(2,'Lenin NEWS','img/avatar/no_avatar.jpg',7,3,NULL),(3,'Metayd\'s Anarchy News','img/avatar/no_avatar.jpg',8,2,NULL),(4,'BULVAR','img/avatar/no_avatar.jpg',9,1,NULL);
/*!40000 ALTER TABLE `newspaper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `text` longtext,
  `image` varchar(255) DEFAULT NULL,
  `activite` int(11) DEFAULT NULL,
  `popup` int(11) DEFAULT NULL,
  `lang` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` VALUES (1,'Dystopia\'ya hoşgeldiniz!','Henüz yenisin, yapacak çok işin var!','img/world.png',1,1,'tr-TR');
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `read` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1027 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (30,'Seviye Atlad','Yeni seviyen : 9. Ayr',2,'2014-11-07 17:46:24',1),(47,'Seviye Atlad','Yeni seviyen : 10. Ayr',2,'2014-11-11 03:00:00',0),(172,'Seviye Atlad','Yeni seviyen : 11. Ayr',2,'2014-11-15 17:00:00',0),(369,'Seviye Atlad','Yeni seviyen : 12. Ayr',2,'2014-11-25 17:00:00',0),(371,'You dont work!','Demokritos Weapons ',2,'2014-12-02 00:00:00',0),(373,'You dont work!','Demokritos Weapons ',2,'2014-12-02 01:00:00',0),(375,'You dont work!','Demokritos Weapons ',2,'2014-12-02 02:00:00',0),(377,'You dont work!','Demokritos Weapons ',2,'2014-12-02 03:00:00',0),(385,'You dont work!','Demokritos Weapons ',2,'2014-12-02 16:00:00',0),(387,'You dont work!','Demokritos Weapons ',2,'2014-12-02 17:00:00',0),(389,'You dont work!','Demokritos Weapons ',2,'2014-12-02 23:00:00',0),(391,'You dont work!','Demokritos Weapons ',2,'2014-12-03 00:00:00',0),(393,'You dont work!','Demokritos Weapons ',2,'2014-12-03 01:00:00',0),(396,'You dont work!','Demokritos Weapons ',2,'2014-12-03 02:00:00',0),(398,'You dont work!','Demokritos Weapons ',2,'2014-12-03 03:00:00',0),(406,'You dont work!','Demokritos Weapons ',2,'2014-12-03 16:00:00',0),(408,'You dont work!','Demokritos Weapons ',2,'2014-12-03 17:00:00',0),(410,'You dont work!','Demokritos Weapons ',2,'2014-12-03 23:00:00',0),(412,'You dont work!','Demokritos Weapons ',2,'2014-12-04 00:00:00',0),(414,'You dont work!','Demokritos Weapons ',2,'2014-12-04 01:00:00',0),(416,'You dont work!','Demokritos Weapons ',2,'2014-12-04 02:00:00',0),(418,'You dont work!','Demokritos Weapons ',2,'2014-12-04 03:00:00',0),(426,'You dont work!','Demokritos Weapons ',2,'2014-12-04 16:00:00',0),(428,'You dont work!','Demokritos Weapons ',2,'2014-12-04 17:00:00',0),(430,'You dont work!','Demokritos Weapons ',2,'2014-12-04 23:00:00',0),(432,'You dont work!','Demokritos Weapons ',2,'2014-12-05 00:00:00',0),(434,'You dont work!','Demokritos Weapons ',2,'2014-12-05 01:00:00',0),(436,'You dont work!','Demokritos Weapons ',2,'2014-12-05 02:00:00',0),(438,'You dont work!','Demokritos Weapons ',2,'2014-12-05 03:00:00',0),(442,'You dont work!','Demokritos Weapons ',2,'2014-12-05 16:00:00',0),(444,'You dont work!','Demokritos Weapons ',2,'2014-12-05 17:00:00',0),(447,'Your company havent enought raw!','Şirkette hammadde olmadığı için işçiler çalışamıyor.',8,'2015-01-02 13:16:05',1),(448,'You dont work!','Metayd\'s Anarchy Co. şirketinde hammadde olmadığı için çalışamadın.',8,'2015-01-02 13:16:15',1),(451,'Seviye Atladın!','Yeni seviyen : 2. Ayrıca 5 gold kazandın!',10,'2015-01-02 14:02:54',0),(454,'Seviye Atladın!','Yeni seviyen : 2. Ayrıca 5 gold kazandın!',8,'2015-01-03 13:30:15',1),(457,'Seviye Atladın!','Yeni seviyen : 3. Ayrıca 5 gold kazandın!',10,'2015-01-02 17:00:01',0),(460,'Seviye Atladın!','Yeni seviyen : 3. Ayrıca 5 gold kazandın!',8,'2015-01-03 13:30:15',1),(463,'Seviye Atladın!','Yeni seviyen : 2. Ayrıca 5 gold kazandın!',9,'2015-01-02 20:03:25',1),(464,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-03 13:30:15',1),(465,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-03 13:30:15',1),(466,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-03 13:30:15',1),(467,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-03 13:30:15',1),(468,'Seviye Atladın!','Yeni seviyen : 4. Ayrıca 5 gold kazandın!',10,'2015-01-02 23:00:02',0),(469,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-03 13:30:15',1),(470,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-03 13:30:15',1),(471,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-03 13:30:15',1),(472,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-03 10:00:01',0),(473,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-03 13:30:15',1),(474,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-03 13:30:15',1),(475,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-03 13:30:15',1),(476,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-03 11:00:02',0),(477,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-03 13:30:15',1),(478,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-03 13:30:15',1),(479,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-03 13:30:15',1),(480,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-03 12:00:01',0),(481,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-03 13:30:10',1),(482,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-03 13:30:15',1),(483,'Seviye Atladın!','Yeni seviyen : 2. Ayrıca 5 gold kazandın!',13,'2015-01-03 13:00:01',0),(484,'Seviye Atladın!','Yeni seviyen : 2. Ayrıca 5 gold kazandın!',15,'2015-01-03 13:00:01',0),(485,'Seviye Atladın!','Yeni seviyen : 2. Ayrıca 5 gold kazandın!',14,'2015-01-03 13:00:01',0),(486,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-03 13:30:15',1),(487,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-03 13:00:01',0),(488,'Seviye Atladın!','Yeni seviyen : 2. Ayrıca 5 gold kazandın!',22,'2015-01-03 14:00:01',0),(489,'Seviye Atladın!','Yeni seviyen : 4. Ayrıca 5 gold kazandın!',8,'2015-01-04 00:23:27',1),(490,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-04 00:23:27',1),(491,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-03 17:00:02',0),(492,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-04 00:23:27',1),(493,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-03 18:00:01',0),(494,'Seviye Atladın!','Yeni seviyen : 2. Ayrıca 5 gold kazandın!',5,'2015-01-03 18:00:01',0),(495,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-04 00:23:27',1),(496,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-04 00:23:27',1),(497,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-04 00:23:27',1),(498,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-03 19:00:01',0),(499,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-04 00:23:27',1),(500,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-04 00:23:27',1),(501,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-04 00:23:27',1),(502,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-03 20:00:01',0),(503,'Seviye Atladın!','Yeni seviyen : 3. Ayrıca 5 gold kazandın!',9,'2015-01-04 00:26:18',1),(504,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-04 00:23:27',1),(505,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-04 00:23:27',1),(506,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-04 00:23:27',1),(507,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-04 00:23:27',1),(508,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-04 00:23:27',1),(509,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-04 00:23:27',1),(510,'Seviye Atladın!','Yeni seviyen : 3. Ayrıca 5 gold kazandın!',22,'2015-01-04 00:35:09',0),(511,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(512,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-06 17:54:13',1),(513,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(514,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-06 17:54:13',1),(515,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(516,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-04 14:00:01',0),(517,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(518,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-06 17:54:13',1),(519,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(520,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-04 15:00:01',0),(521,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(522,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-06 17:54:13',1),(523,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(524,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-04 16:00:01',0),(525,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(526,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-06 17:54:13',1),(527,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(528,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-04 17:00:01',0),(529,'Seviye Atladın!','Yeni seviyen : 3. Ayrıca 5 gold kazandın!',5,'2015-01-04 17:00:01',0),(530,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(531,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-06 17:54:13',1),(532,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(533,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-04 18:00:01',0),(534,'Seviye Atladın!','Yeni seviyen : 4. Ayrıca 5 gold kazandın!',9,'2015-01-04 18:00:01',0),(535,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(536,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-06 17:54:13',1),(537,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(538,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-04 19:00:01',0),(539,'Seviye Atladın!','Yeni seviyen : 2. Ayrıca 5 gold kazandın!',7,'2015-01-04 19:00:01',0),(540,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(541,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-06 17:54:13',1),(542,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(543,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-04 20:00:01',0),(544,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(545,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-06 17:54:13',1),(546,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(547,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-06 17:54:13',1),(548,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(549,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-06 17:54:13',1),(550,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(551,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-06 17:54:13',1),(552,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(553,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-06 17:54:13',1),(554,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(555,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-06 17:54:13',1),(556,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(557,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-06 17:54:13',1),(558,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(559,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-05 04:00:01',0),(560,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(561,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-06 17:54:13',1),(562,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(563,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-05 05:00:01',0),(564,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(565,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-06 17:54:13',1),(566,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(567,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-05 06:00:01',0),(568,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(569,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-06 17:54:13',1),(570,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(571,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-05 07:00:02',0),(572,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(573,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-06 17:54:13',1),(574,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(575,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-05 08:00:01',0),(576,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(577,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-06 17:54:13',1),(578,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(579,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-05 09:00:02',0),(580,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(581,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-06 17:54:13',1),(582,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(583,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-05 10:00:01',0),(584,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(585,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-06 17:54:13',1),(586,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(587,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-05 11:00:01',0),(588,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(589,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-06 17:54:13',1),(590,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(591,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-05 12:00:01',0),(592,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(593,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-06 17:54:13',1),(594,'Seviye Atladın!','Yeni seviyen : 3. Ayrıca 5 gold kazandın!',14,'2015-01-05 13:00:02',0),(595,'Seviye Atladın!','Yeni seviyen : 2. Ayrıca 5 gold kazandın!',16,'2015-01-05 13:00:02',0),(596,'Seviye Atladın!','Yeni seviyen : 2. Ayrıca 5 gold kazandın!',17,'2015-01-05 13:00:02',0),(597,'Seviye Atladın!','Yeni seviyen : 2. Ayrıca 5 gold kazandın!',18,'2015-01-05 13:00:02',0),(598,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(599,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-05 13:00:02',0),(600,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(601,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-06 17:54:13',1),(602,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(603,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-05 14:00:01',0),(604,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(605,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-06 17:54:13',1),(606,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(607,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-05 15:00:02',0),(608,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(609,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-06 17:54:13',1),(610,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(611,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-05 16:00:01',0),(612,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(613,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-06 17:54:13',1),(614,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(615,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-05 17:00:02',0),(616,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(617,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-06 17:54:13',1),(618,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(619,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-05 18:00:01',0),(620,'Seviye Atladın!','Yeni seviyen : 4. Ayrıca 5 gold kazandın!',5,'2015-01-05 18:00:01',0),(621,'Seviye Atladın!','Yeni seviyen : 5. Ayrıca 5 gold kazandın!',9,'2015-01-05 18:00:01',0),(622,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(623,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-06 17:54:13',1),(624,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(625,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-05 19:00:02',0),(626,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(627,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-06 17:54:13',1),(628,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(629,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-05 20:00:01',0),(630,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(631,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-06 17:54:13',1),(632,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(633,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-06 17:54:13',1),(634,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(635,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-06 17:54:13',1),(636,'Seviye Atladın!','Yeni seviyen : 3. Ayrıca 5 gold kazandın!',7,'2015-01-06 00:00:02',0),(637,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(638,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-06 17:54:13',1),(639,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(640,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-06 17:54:13',1),(641,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(642,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-06 17:54:13',1),(643,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(644,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-06 17:54:13',1),(645,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(646,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-06 04:00:01',0),(647,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(648,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-06 17:54:13',1),(649,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(650,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-06 05:00:01',0),(651,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(652,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-06 17:54:13',1),(653,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(654,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-06 06:00:01',0),(655,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(656,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-06 17:54:13',1),(657,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(658,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-06 07:00:01',0),(659,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(660,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-06 17:54:13',1),(661,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(662,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-06 08:00:02',0),(663,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(664,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-06 17:54:13',1),(665,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(666,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-06 09:00:01',0),(667,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(668,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-06 17:54:13',1),(669,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(670,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-06 10:00:02',0),(671,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(672,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-06 17:54:13',1),(673,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(674,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-06 11:00:01',0),(675,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(676,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-06 17:54:13',1),(677,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(678,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-06 12:00:01',0),(679,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(680,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-06 17:54:13',1),(681,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(682,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-06 13:00:02',0),(683,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(684,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-06 17:54:13',1),(685,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(686,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-06 14:00:01',0),(687,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(688,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-06 17:54:13',1),(689,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(690,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-06 15:00:02',0),(691,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(692,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-06 17:54:13',1),(693,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(694,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-06 16:00:01',0),(695,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(696,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-06 17:54:13',1),(697,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 17:54:13',1),(698,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-06 17:00:01',0),(699,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 18:06:12',1),(700,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-06 18:06:12',1),(701,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 18:06:12',1),(702,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-06 18:00:01',0),(703,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 19:00:02',0),(704,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-06 19:00:02',0),(705,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 19:00:02',0),(706,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-06 19:00:02',0),(707,'Seviye Atladın!','Yeni seviyen : 5. Ayrıca 5 gold kazandın!',5,'2015-01-06 19:00:02',0),(708,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 20:00:01',0),(709,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-06 20:00:01',0),(710,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 20:00:01',0),(711,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-06 20:00:01',0),(712,'Seviye Atladın!','Yeni seviyen : 6. Ayrıca 5 gold kazandın!',9,'2015-01-06 20:00:01',0),(713,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 22:00:02',0),(714,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-06 22:00:02',0),(715,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-06 23:00:01',0),(716,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-06 23:00:01',0),(717,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-07 00:00:01',0),(718,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-07 00:00:01',0),(719,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-07 01:00:02',0),(720,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-07 01:00:02',0),(721,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-07 02:00:01',0),(722,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-07 02:00:01',0),(723,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-07 03:00:01',0),(724,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-07 03:00:01',0),(725,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-07 04:00:01',0),(726,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-07 04:00:01',0),(727,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-07 04:00:01',0),(728,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-07 04:00:01',0),(729,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-07 05:00:01',0),(730,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-07 05:00:01',0),(731,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-07 05:00:01',0),(732,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-07 05:00:01',0),(733,'Your company havent enought raw!','Şirkette hammadde olmadığı için işçiler çalışamıyor.',1,'2015-01-07 06:00:01',0),(734,'You dont work!','Demokritos Weapons şirketinde hammadde olmadığı için çalışamadın.',1,'2015-01-07 06:00:01',0),(735,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-07 06:00:01',0),(736,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-07 06:00:01',0),(737,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-07 06:00:02',0),(738,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-07 06:00:02',0),(739,'Your company havent enought raw!','Şirkette hammadde olmadığı için işçiler çalışamıyor.',1,'2015-01-07 07:00:01',0),(740,'You dont work!','Demokritos Weapons şirketinde hammadde olmadığı için çalışamadın.',1,'2015-01-07 07:00:01',0),(741,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-07 07:00:01',0),(742,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-07 07:00:01',0),(743,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-07 07:00:02',0),(744,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-07 07:00:02',0),(745,'Your company havent enought raw!','Şirkette hammadde olmadığı için işçiler çalışamıyor.',1,'2015-01-07 08:00:01',0),(746,'You dont work!','Demokritos Weapons şirketinde hammadde olmadığı için çalışamadın.',1,'2015-01-07 08:00:01',0),(747,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-07 08:00:01',0),(748,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-07 08:00:01',0),(749,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-07 08:00:01',0),(750,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-07 08:00:01',0),(751,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-07 09:00:01',0),(752,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-07 09:00:01',0),(753,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-07 09:00:01',0),(754,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-07 09:00:01',0),(755,'Your company havent enought raw!','Şirkette hammadde olmadığı için işçiler çalışamıyor.',1,'2015-01-07 10:00:01',0),(756,'You dont work!','Demokritos Weapons şirketinde hammadde olmadığı için çalışamadın.',2,'2015-01-07 10:00:01',0),(757,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-07 10:00:01',0),(758,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-07 10:00:01',0),(759,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-07 10:00:01',0),(760,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-07 10:00:01',0),(761,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-07 11:00:02',0),(762,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-07 11:00:02',0),(763,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-07 11:00:02',0),(764,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-07 11:00:02',0),(765,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-07 12:00:01',0),(766,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-07 12:00:01',0),(767,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-07 12:00:01',0),(768,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-07 12:00:01',0),(769,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-07 13:00:01',0),(770,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-07 13:00:01',0),(771,'Seviye Atladın!','Yeni seviyen : 3. Ayrıca 5 gold kazandın!',13,'2015-01-07 13:00:01',0),(772,'Seviye Atladın!','Yeni seviyen : 3. Ayrıca 5 gold kazandın!',15,'2015-01-07 13:00:01',0),(773,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-07 13:00:01',0),(774,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-07 13:00:01',0),(775,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-07 14:00:01',0),(776,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-07 14:00:01',0),(777,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-07 14:00:01',0),(778,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-07 14:00:01',0),(779,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-07 15:00:01',0),(780,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-07 15:00:01',0),(781,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-07 15:00:01',0),(782,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-07 15:00:01',0),(783,'Your company havent enought raw!','Şirkette hammadde olmadığı için işçiler çalışamıyor.',1,'2015-01-07 16:00:01',0),(784,'You dont work!','Demokritos Weapons şirketinde hammadde olmadığı için çalışamadın.',2,'2015-01-07 16:00:01',0),(785,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-07 16:00:01',0),(786,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-07 16:00:01',0),(787,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-07 16:00:01',0),(788,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-07 16:00:01',0),(789,'Seviye Atladın!','Yeni seviyen : 5. Ayrıca 5 gold kazandın!',8,'2015-01-07 16:31:40',0),(790,'Your company havent enought raw!','Şirkette hammadde olmadığı için işçiler çalışamıyor.',1,'2015-01-07 17:00:01',0),(791,'You dont work!','Demokritos Weapons şirketinde hammadde olmadığı için çalışamadın.',2,'2015-01-07 17:00:01',0),(792,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-07 17:00:01',0),(793,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-07 17:00:01',0),(794,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-07 17:00:01',0),(795,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-07 17:00:01',0),(796,'Your company havent enought raw!','Şirkette hammadde olmadığı için işçiler çalışamıyor.',1,'2015-01-07 18:00:01',0),(797,'You dont work!','Demokritos Weapons şirketinde hammadde olmadığı için çalışamadın.',2,'2015-01-07 18:00:01',0),(798,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-07 18:00:01',0),(799,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-07 18:00:01',0),(800,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-07 18:00:01',0),(801,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-07 18:00:01',0),(802,'Your company havent enought raw!','Şirkette hammadde olmadığı için işçiler çalışamıyor.',1,'2015-01-07 19:00:01',0),(803,'You dont work!','Demokritos Weapons şirketinde hammadde olmadığı için çalışamadın.',2,'2015-01-07 19:00:01',0),(804,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-07 19:00:01',0),(805,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-07 19:00:01',0),(806,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-07 19:00:01',0),(807,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-07 19:00:01',0),(808,'Your company havent enought raw!','Şirkette hammadde olmadığı için işçiler çalışamıyor.',1,'2015-01-07 20:00:01',0),(809,'You dont work!','Demokritos Weapons şirketinde hammadde olmadığı için çalışamadın.',2,'2015-01-07 20:00:01',0),(810,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-07 20:00:01',0),(811,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-07 20:00:01',0),(812,'Seviye Atladın!','Yeni seviyen : 4. Ayrıca 5 gold kazandın!',14,'2015-01-07 20:00:01',0),(813,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-07 20:00:01',0),(814,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-07 20:00:01',0),(815,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-07 22:00:01',0),(816,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-07 22:00:01',0),(817,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-07 23:00:01',0),(818,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-07 23:00:01',0),(819,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-08 00:00:01',0),(820,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-08 00:00:01',0),(821,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-08 01:00:02',0),(822,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-08 01:00:02',0),(823,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-08 02:00:01',0),(824,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-08 02:00:01',0),(825,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-08 03:00:02',0),(826,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-08 03:00:02',0),(827,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-08 04:00:01',0),(828,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-08 04:00:01',0),(829,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-08 04:00:01',0),(830,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-08 04:00:01',0),(831,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-08 05:00:01',0),(832,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-08 05:00:01',0),(833,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-08 05:00:01',0),(834,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-08 05:00:01',0),(835,'Your company havent enought raw!','Şirkette hammadde olmadığı için işçiler çalışamıyor.',1,'2015-01-08 06:00:01',0),(836,'You dont work!','Demokritos Weapons şirketinde hammadde olmadığı için çalışamadın.',1,'2015-01-08 06:00:01',0),(837,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-08 06:00:01',0),(838,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-08 06:00:01',0),(839,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-08 06:00:01',0),(840,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-08 06:00:01',0),(841,'Your company havent enought raw!','Şirkette hammadde olmadığı için işçiler çalışamıyor.',1,'2015-01-08 07:00:01',0),(842,'You dont work!','Demokritos Weapons şirketinde hammadde olmadığı için çalışamadın.',1,'2015-01-08 07:00:01',0),(843,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-08 07:00:01',0),(844,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-08 07:00:01',0),(845,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-08 07:00:01',0),(846,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-08 07:00:01',0),(847,'Your company havent enought raw!','Şirkette hammadde olmadığı için işçiler çalışamıyor.',1,'2015-01-08 08:00:01',0),(848,'You dont work!','Demokritos Weapons şirketinde hammadde olmadığı için çalışamadın.',1,'2015-01-08 08:00:01',0),(849,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-08 08:00:01',0),(850,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-08 08:00:01',0),(851,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-08 08:00:01',0),(852,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-08 08:00:01',0),(853,'Your company havent enought raw!','Şirkette hammadde olmadığı için işçiler çalışamıyor.',1,'2015-01-08 09:00:01',0),(854,'You dont work!','Demokritos Weapons şirketinde hammadde olmadığı için çalışamadın.',2,'2015-01-08 09:00:01',0),(855,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-08 09:00:01',0),(856,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-08 09:00:01',0),(857,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-08 09:00:01',0),(858,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-08 09:00:01',0),(859,'Your company havent enought raw!','Şirkette hammadde olmadığı için işçiler çalışamıyor.',1,'2015-01-08 10:00:01',0),(860,'You dont work!','Demokritos Weapons şirketinde hammadde olmadığı için çalışamadın.',2,'2015-01-08 10:00:01',0),(861,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-08 10:00:01',0),(862,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-08 10:00:01',0),(863,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-08 10:00:01',0),(864,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-08 10:00:01',0),(865,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-08 11:00:01',0),(866,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-08 11:00:01',0),(867,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-08 11:00:01',0),(868,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-08 11:00:01',0),(869,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-08 12:00:01',0),(870,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-08 12:00:01',0),(871,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-08 12:00:01',0),(872,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-08 12:00:01',0),(873,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-08 13:00:01',0),(874,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-08 13:00:01',0),(875,'Seviye Atladın!','Yeni seviyen : 3. Ayrıca 5 gold kazandın!',16,'2015-01-08 13:00:01',0),(876,'Seviye Atladın!','Yeni seviyen : 3. Ayrıca 5 gold kazandın!',17,'2015-01-08 13:00:02',0),(877,'Seviye Atladın!','Yeni seviyen : 3. Ayrıca 5 gold kazandın!',18,'2015-01-08 13:00:02',0),(878,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-08 13:00:02',0),(879,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-08 13:00:02',0),(880,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-08 14:00:01',0),(881,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-08 14:00:01',0),(882,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-08 14:00:01',0),(883,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-08 14:00:01',0),(884,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-08 15:00:01',0),(885,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-08 15:00:01',0),(886,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-08 15:00:01',0),(887,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-08 15:00:01',0),(888,'Your company havent enought raw!','Şirkette hammadde olmadığı için işçiler çalışamıyor.',1,'2015-01-08 16:00:02',0),(889,'You dont work!','Demokritos Weapons şirketinde hammadde olmadığı için çalışamadın.',2,'2015-01-08 16:00:02',0),(890,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-08 16:00:02',0),(891,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-08 16:00:02',0),(892,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-08 16:00:02',0),(893,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-08 16:00:02',0),(894,'Your company havent enought raw!','Şirkette hammadde olmadığı için işçiler çalışamıyor.',1,'2015-01-08 17:00:01',0),(895,'You dont work!','Demokritos Weapons şirketinde hammadde olmadığı için çalışamadın.',2,'2015-01-08 17:00:01',0),(896,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-08 17:00:01',0),(897,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-08 17:00:01',0),(898,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-08 17:00:01',0),(899,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-08 17:00:01',0),(900,'Seviye Atladın!','Yeni seviyen : 6. Ayrıca 5 gold kazandın!',5,'2015-01-08 17:00:01',0),(901,'Your company havent enought raw!','Şirkette hammadde olmadığı için işçiler çalışamıyor.',1,'2015-01-08 18:00:01',0),(902,'You dont work!','Demokritos Weapons şirketinde hammadde olmadığı için çalışamadın.',2,'2015-01-08 18:00:01',0),(903,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-08 18:00:01',0),(904,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-08 18:00:01',0),(905,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-08 18:00:01',0),(906,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-08 18:00:01',0),(907,'Seviye Atladın!','Yeni seviyen : 7. Ayrıca 5 gold kazandın!',9,'2015-01-08 18:00:01',0),(908,'Your company havent enought raw!','Şirkette hammadde olmadığı için işçiler çalışamıyor.',1,'2015-01-08 19:00:01',0),(909,'You dont work!','Demokritos Weapons şirketinde hammadde olmadığı için çalışamadın.',2,'2015-01-08 19:00:01',0),(910,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-08 19:00:01',0),(911,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-08 19:00:01',0),(912,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-08 19:00:01',0),(913,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-08 19:00:01',0),(914,'Seviye Atladın!','Yeni seviyen : 4. Ayrıca 5 gold kazandın!',7,'2015-01-08 19:00:01',0),(915,'Your company havent enought raw!','Şirkette hammadde olmadığı için işçiler çalışamıyor.',1,'2015-01-08 20:00:02',0),(916,'You dont work!','Demokritos Weapons şirketinde hammadde olmadığı için çalışamadın.',2,'2015-01-08 20:00:02',0),(917,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-08 20:00:02',0),(918,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-08 20:00:02',0),(919,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-08 20:00:02',0),(920,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-08 20:00:02',0),(921,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-08 22:00:02',0),(922,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-08 22:00:02',0),(923,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-08 23:00:01',0),(924,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-08 23:00:01',0),(925,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-09 00:00:02',0),(926,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-09 00:00:02',0),(927,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-09 01:00:01',0),(928,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-09 01:00:01',0),(929,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-09 02:00:02',0),(930,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-09 02:00:02',0),(931,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-09 03:00:01',0),(932,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-09 03:00:01',0),(933,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-09 04:00:01',0),(934,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-09 04:00:01',0),(935,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-09 04:00:01',0),(936,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-09 04:00:01',0),(937,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-09 05:00:01',0),(938,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-09 05:00:01',0),(939,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-09 05:00:01',0),(940,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-09 05:00:01',0),(941,'Your company havent enought raw!','Şirkette hammadde olmadığı için işçiler çalışamıyor.',1,'2015-01-09 06:00:01',0),(942,'You dont work!','Demokritos Weapons şirketinde hammadde olmadığı için çalışamadın.',1,'2015-01-09 06:00:01',0),(943,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-09 06:00:02',0),(944,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-09 06:00:02',0),(945,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-09 06:00:02',0),(946,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-09 06:00:02',0),(947,'Your company havent enought raw!','Şirkette hammadde olmadığı için işçiler çalışamıyor.',1,'2015-01-09 07:00:01',0),(948,'You dont work!','Demokritos Weapons şirketinde hammadde olmadığı için çalışamadın.',1,'2015-01-09 07:00:01',0),(949,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-09 07:00:01',0),(950,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-09 07:00:01',0),(951,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-09 07:00:01',0),(952,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-09 07:00:01',0),(953,'Your company havent enought raw!','Şirkette hammadde olmadığı için işçiler çalışamıyor.',1,'2015-01-09 08:00:02',0),(954,'You dont work!','Demokritos Weapons şirketinde hammadde olmadığı için çalışamadın.',1,'2015-01-09 08:00:02',0),(955,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-09 08:00:02',0),(956,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-09 08:00:02',0),(957,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-09 08:00:02',0),(958,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-09 08:00:02',0),(959,'Your company havent enought raw!','Şirkette hammadde olmadığı için işçiler çalışamıyor.',1,'2015-01-09 09:00:01',0),(960,'You dont work!','Demokritos Weapons şirketinde hammadde olmadığı için çalışamadın.',2,'2015-01-09 09:00:01',0),(961,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-09 09:00:01',0),(962,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-09 09:00:01',0),(963,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-09 09:00:01',0),(964,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-09 09:00:01',0),(965,'Your company havent enought raw!','Şirkette hammadde olmadığı için işçiler çalışamıyor.',1,'2015-01-09 10:00:02',0),(966,'You dont work!','Demokritos Weapons şirketinde hammadde olmadığı için çalışamadın.',2,'2015-01-09 10:00:02',0),(967,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-09 10:00:02',0),(968,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-09 10:00:02',0),(969,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-09 10:00:02',0),(970,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-09 10:00:02',0),(971,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-09 11:00:01',0),(972,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-09 11:00:01',0),(973,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-09 11:00:01',0),(974,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-09 11:00:01',0),(975,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-09 12:00:02',0),(976,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-09 12:00:02',0),(977,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-09 12:00:02',0),(978,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-09 12:00:02',0),(979,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-09 13:00:01',0),(980,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-09 13:00:01',0),(981,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',7,'2015-01-09 13:00:01',0),(982,'You dont work!','Lenin Q1 İRON şirketinde para olmadığı için çalışamadın.',15,'2015-01-09 13:00:01',0),(983,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',7,'2015-01-09 13:00:01',0),(984,'You dont work!','Lenin Q1 İRON şirketinde para olmadığı için çalışamadın.',14,'2015-01-09 13:00:01',0),(985,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-09 13:00:01',0),(986,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-09 13:00:01',0),(987,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-09 14:00:01',0),(988,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-09 14:00:01',0),(989,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-09 14:00:01',0),(990,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-09 14:00:01',0),(991,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-09 15:00:01',0),(992,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-09 15:00:01',0),(993,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-09 15:00:01',0),(994,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-09 15:00:01',0),(995,'Your company havent enought raw!','Şirkette hammadde olmadığı için işçiler çalışamıyor.',1,'2015-01-09 16:00:02',0),(996,'You dont work!','Demokritos Weapons şirketinde hammadde olmadığı için çalışamadın.',2,'2015-01-09 16:00:02',0),(997,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',7,'2015-01-09 16:00:02',0),(998,'You dont work!','Lenin Q1 İRON şirketinde para olmadığı için çalışamadın.',9,'2015-01-09 16:00:02',0),(999,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-09 16:00:02',0),(1000,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-09 16:00:02',0),(1001,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-09 16:00:02',0),(1002,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-09 16:00:02',0),(1003,'Your company havent enought raw!','Şirkette hammadde olmadığı için işçiler çalışamıyor.',1,'2015-01-09 17:00:01',0),(1004,'You dont work!','Demokritos Weapons şirketinde hammadde olmadığı için çalışamadın.',2,'2015-01-09 17:00:01',0),(1005,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-09 17:00:01',0),(1006,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-09 17:00:01',0),(1007,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-09 17:00:01',0),(1008,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-09 17:00:01',0),(1009,'Your company havent enought raw!','Şirkette hammadde olmadığı için işçiler çalışamıyor.',1,'2015-01-09 18:00:01',0),(1010,'You dont work!','Demokritos Weapons şirketinde hammadde olmadığı için çalışamadın.',2,'2015-01-09 18:00:01',0),(1011,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-09 18:00:01',0),(1012,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-09 18:00:01',0),(1013,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-09 18:00:01',0),(1014,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-09 18:00:01',0),(1015,'Your company havent enought raw!','Şirkette hammadde olmadığı için işçiler çalışamıyor.',1,'2015-01-09 19:00:02',0),(1016,'You dont work!','Demokritos Weapons şirketinde hammadde olmadığı için çalışamadın.',2,'2015-01-09 19:00:02',0),(1017,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-09 19:00:02',0),(1018,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-09 19:00:02',0),(1019,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-09 19:00:02',0),(1020,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-09 19:00:02',0),(1021,'Your company havent enought raw!','Şirkette hammadde olmadığı için işçiler çalışamıyor.',1,'2015-01-09 20:00:02',0),(1022,'You dont work!','Demokritos Weapons şirketinde hammadde olmadığı için çalışamadın.',2,'2015-01-09 20:00:02',0),(1023,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-09 20:00:02',0),(1024,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',8,'2015-01-09 20:00:02',0),(1025,'Your company havent enought money!','Şirkette para olmadığı için işçiler çalışamıyor.',8,'2015-01-09 20:00:02',0),(1026,'You dont work!','Metayd\'s Anarchy Co. WEP şirketinde para olmadığı için çalışamadın.',22,'2015-01-09 20:00:02',0);
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `online`
--

DROP TABLE IF EXISTS `online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `online` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip` int(11) NOT NULL DEFAULT '0',
  `country` varchar(64) NOT NULL,
  `countrycode` varchar(2) NOT NULL,
  `city` varchar(64) NOT NULL,
  `dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ip` (`ip`),
  KEY `countrycode` (`countrycode`)
) ENGINE=MyISAM AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `online`
--

LOCK TABLES `online` WRITE;
/*!40000 ALTER TABLE `online` DISABLE KEYS */;
INSERT INTO `online` VALUES (100,1432737774,'Turkey','TR','Istanbul','2015-01-07 16:31:57');
/*!40000 ALTER TABLE `online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org`
--

DROP TABLE IF EXISTS `org`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `org` (
  `id` int(9) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `country` int(9) DEFAULT NULL,
  `region` int(9) DEFAULT NULL,
  `owner` int(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org`
--

LOCK TABLES `org` WRITE;
/*!40000 ALTER TABLE `org` DISABLE KEYS */;
INSERT INTO `org` VALUES (0,'Deneme Org',1,1,1);
/*!40000 ALTER TABLE `org` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `party`
--

DROP TABLE IF EXISTS `party`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `party` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `leader` int(9) DEFAULT NULL,
  `vice` int(9) DEFAULT NULL,
  `country` int(9) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `party`
--

LOCK TABLES `party` WRITE;
/*!40000 ALTER TABLE `party` DISABLE KEYS */;
INSERT INTO `party` VALUES (1,'',1,0,1,'');
/*!40000 ALTER TABLE `party` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productivity`
--

DROP TABLE IF EXISTS `productivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productivity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `companyid` int(11) DEFAULT NULL,
  `product` float DEFAULT NULL,
  `created_time` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=546 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productivity`
--

LOCK TABLES `productivity` WRITE;
/*!40000 ALTER TABLE `productivity` DISABLE KEYS */;
INSERT INTO `productivity` VALUES (1,1,1,31.975,'2014-10-20'),(2,1,2,23.575,'2014-10-23'),(3,1,2,23.5875,'2014-10-23'),(4,1,1,32.05,'2014-10-23'),(5,1,1,32.075,'2014-10-23'),(6,1,1,32.1,'2014-10-24'),(7,1,1,32.125,'2014-10-24'),(8,1,2,23.65,'2014-10-25'),(9,1,1,32.175,'2014-10-25'),(10,1,1,32.2,'2014-10-25'),(11,1,2,23.6875,'2014-10-26'),(12,1,1,32.25,'2014-10-26'),(13,1,1,32.275,'2014-10-26'),(14,1,1,32.3,'2014-10-26'),(15,1,2,23.7375,'2014-10-27'),(16,1,2,23.75,'2014-10-27'),(17,1,1,32.375,'2014-10-27'),(18,1,1,32.4,'2014-10-27'),(19,1,2,23.7875,'2014-10-28'),(20,1,1,32.45,'2014-10-28'),(21,1,1,32.475,'2014-10-28'),(22,1,2,23.825,'2014-10-29'),(23,1,2,23.8375,'2014-10-29'),(24,1,1,32.55,'2014-10-29'),(25,1,1,32.575,'2014-10-29'),(26,1,2,23.875,'2014-10-30'),(27,1,2,23.8875,'2014-10-30'),(28,1,1,32.65,'2014-10-30'),(29,1,2,23.9125,'2014-10-31'),(30,1,1,32.7,'2014-10-31'),(31,1,1,32.725,'2014-10-31'),(32,1,2,23.95,'2014-11-01'),(33,1,2,23.9625,'2014-11-01'),(34,1,1,32.8,'2014-11-01'),(35,1,1,32.825,'2014-11-01'),(36,1,2,24,'2014-11-02'),(37,1,2,24.0125,'2014-11-02'),(38,1,1,32.9,'2014-11-02'),(39,1,1,32.925,'2014-11-02'),(40,1,1,32.95,'2014-11-02'),(41,1,2,24.0625,'2014-11-03'),(42,1,2,24.075,'2014-11-03'),(43,1,1,33.025,'2014-11-03'),(44,1,1,33.05,'2014-11-03'),(45,1,2,24.1125,'2014-11-04'),(46,1,2,24.125,'2014-11-04'),(47,1,1,33.125,'2014-11-04'),(48,1,1,33.15,'2014-11-04'),(49,1,2,24.1625,'2014-11-04'),(50,1,1,33.2,'2014-11-04'),(51,1,2,24.2,'2014-11-04'),(52,1,2,24.225,'2014-11-04'),(53,1,2,24.25,'2014-11-04'),(54,1,2,24.275,'2014-11-04'),(55,1,2,24.3,'2014-11-05'),(56,1,2,24.325,'2014-11-05'),(57,1,2,24.35,'2014-11-05'),(58,1,2,24.375,'2014-11-05'),(59,1,2,24.4,'2014-11-05'),(60,1,2,24.425,'2014-11-05'),(61,1,2,24.45,'2014-11-05'),(62,1,2,24.475,'2014-11-05'),(63,1,2,24.5,'2014-11-05'),(64,1,1,33.875,'2014-11-05'),(65,1,2,24.5375,'2014-11-05'),(66,1,2,24.5625,'2014-11-05'),(67,1,2,24.5875,'2014-11-05'),(68,1,2,24.6125,'2014-11-05'),(69,2,1,5.64,'2014-11-05'),(70,1,2,24.65,'2014-11-05'),(71,1,2,24.6625,'2014-11-05'),(72,1,2,24.675,'2014-11-05'),(73,1,2,24.6875,'2014-11-05'),(74,1,2,24.7,'2014-11-05'),(75,2,1,5.655,'2014-11-05'),(76,2,1,5.67,'2014-11-05'),(77,2,1,5.685,'2014-11-05'),(78,2,1,5.7,'2014-11-05'),(79,2,1,5.715,'2014-11-05'),(80,1,2,24.8,'2014-11-06'),(81,1,2,24.8125,'2014-11-06'),(82,1,2,24.825,'2014-11-06'),(83,1,2,24.8375,'2014-11-06'),(84,1,2,24.85,'2014-11-06'),(85,1,2,24.8625,'2014-11-06'),(86,1,2,24.875,'2014-11-06'),(87,1,2,24.9,'2014-11-06'),(88,1,1,34.725,'2014-11-06'),(89,1,1,34.75,'2014-11-06'),(90,2,1,5.73,'2014-11-06'),(91,2,1,5.745,'2014-11-06'),(92,1,2,24.9625,'2014-11-06'),(93,1,2,24.975,'2014-11-06'),(94,1,2,24.9875,'2014-11-06'),(95,1,2,25,'2014-11-06'),(96,2,1,5.76,'2014-11-06'),(97,2,1,5.775,'2014-11-06'),(98,2,1,5.79,'2014-11-06'),(99,2,1,5.805,'2014-11-06'),(100,2,1,5.82,'2014-11-06'),(101,1,2,25.0875,'2014-11-07'),(102,1,1,35.1,'2014-11-07'),(103,1,1,35.125,'2014-11-07'),(104,2,1,5.835,'2014-11-07'),(105,2,1,5.85,'2014-11-07'),(106,2,1,5.865,'2014-11-07'),(107,1,2,25.1875,'2014-11-07'),(108,1,2,25.2,'2014-11-07'),(109,1,2,25.2125,'2014-11-07'),(110,1,2,25.225,'2014-11-07'),(111,1,1,35.375,'2014-11-10'),(112,2,1,5.88,'2014-11-10'),(113,1,2,25.2625,'2014-11-10'),(114,1,2,25.275,'2014-11-10'),(115,1,2,25.2875,'2014-11-10'),(116,1,2,25.3,'2014-11-10'),(117,1,2,25.3125,'2014-11-10'),(118,2,1,5.895,'2014-11-10'),(119,2,1,5.91,'2014-11-10'),(120,2,1,5.925,'2014-11-10'),(121,2,1,5.94,'2014-11-10'),(122,2,1,5.955,'2014-11-10'),(123,1,2,25.375,'2014-11-11'),(124,1,2,25.3875,'2014-11-11'),(125,1,2,25.4,'2014-11-11'),(126,1,2,25.4125,'2014-11-11'),(127,1,2,25.425,'2014-11-11'),(128,1,2,25.4375,'2014-11-11'),(129,1,2,25.45,'2014-11-11'),(130,1,2,25.475,'2014-11-11'),(131,1,2,25.5,'2014-11-11'),(132,1,1,35.925,'2014-11-11'),(133,2,1,5.97,'2014-11-11'),(134,2,1,5.985,'2014-11-11'),(135,1,2,25.55,'2014-11-11'),(136,1,2,25.5625,'2014-11-11'),(137,1,2,25.575,'2014-11-11'),(138,1,2,25.5875,'2014-11-11'),(139,1,2,25.6,'2014-11-11'),(140,2,1,6,'2014-11-11'),(141,2,1,6.015,'2014-11-11'),(142,2,1,6.03,'2014-11-11'),(143,2,1,6.045,'2014-11-11'),(144,2,1,6.06,'2014-11-11'),(145,1,2,25.6375,'2014-11-12'),(146,1,2,25.6625,'2014-11-12'),(147,1,1,36.25,'2014-11-12'),(148,2,1,6.075,'2014-11-12'),(149,2,1,6.09,'2014-11-12'),(150,2,1,6.105,'2014-11-12'),(151,2,1,6.12,'2014-11-12'),(152,2,1,6.135,'2014-11-12'),(153,2,1,6.15,'2014-11-12'),(154,2,1,6.165,'2014-11-12'),(155,1,2,25.7,'2014-11-13'),(156,1,2,25.725,'2014-11-13'),(157,1,1,36.375,'2014-11-13'),(158,2,1,6.18,'2014-11-13'),(159,2,1,6.195,'2014-11-13'),(160,2,1,6.21,'2014-11-13'),(161,2,1,6.225,'2014-11-13'),(162,2,1,6.24,'2014-11-13'),(163,2,1,6.255,'2014-11-13'),(164,2,1,6.27,'2014-11-13'),(165,1,1,36.4,'2014-11-14'),(166,2,1,6.285,'2014-11-14'),(167,2,1,6.3,'2014-11-14'),(168,2,1,6.315,'2014-11-14'),(169,2,1,6.33,'2014-11-14'),(170,2,1,6.345,'2014-11-14'),(171,2,1,6.36,'2014-11-14'),(172,2,1,6.375,'2014-11-14'),(173,1,1,36.425,'2014-11-15'),(174,1,1,36.45,'2014-11-15'),(175,1,1,36.475,'2014-11-15'),(176,2,1,6.39,'2014-11-15'),(177,2,1,6.405,'2014-11-15'),(178,2,1,6.42,'2014-11-15'),(179,2,1,6.435,'2014-11-15'),(180,2,1,6.45,'2014-11-15'),(181,2,1,6.465,'2014-11-15'),(182,2,1,6.48,'2014-11-15'),(183,1,1,36.5,'2014-11-16'),(184,1,1,36.525,'2014-11-16'),(185,1,1,36.55,'2014-11-16'),(186,2,1,6.495,'2014-11-16'),(187,2,1,6.51,'2014-11-16'),(188,2,1,6.525,'2014-11-16'),(189,2,1,6.54,'2014-11-16'),(190,2,1,6.555,'2014-11-16'),(191,2,1,6.57,'2014-11-16'),(192,2,1,6.585,'2014-11-16'),(193,1,1,36.575,'2014-11-17'),(194,1,1,36.6,'2014-11-17'),(195,1,1,36.625,'2014-11-17'),(196,2,1,6.6,'2014-11-17'),(197,2,1,6.615,'2014-11-17'),(198,2,1,6.63,'2014-11-17'),(199,2,1,6.645,'2014-11-17'),(200,2,1,6.66,'2014-11-17'),(201,2,1,6.675,'2014-11-17'),(202,2,1,6.69,'2014-11-17'),(203,1,1,36.65,'2014-11-18'),(204,1,1,36.675,'2014-11-18'),(205,1,1,36.7,'2014-11-18'),(206,2,1,6.705,'2014-11-18'),(207,2,1,6.72,'2014-11-18'),(208,2,1,6.735,'2014-11-18'),(209,2,1,6.75,'2014-11-18'),(210,2,1,6.765,'2014-11-18'),(211,2,1,6.78,'2014-11-18'),(212,2,1,6.795,'2014-11-18'),(213,1,1,36.725,'2014-11-19'),(214,1,1,36.75,'2014-11-19'),(215,1,1,36.775,'2014-11-19'),(216,2,1,6.81,'2014-11-19'),(217,2,1,6.825,'2014-11-19'),(218,2,1,6.84,'2014-11-19'),(219,2,1,6.855,'2014-11-19'),(220,2,1,6.87,'2014-11-19'),(221,2,1,6.885,'2014-11-19'),(222,2,1,6.9,'2014-11-19'),(223,1,1,36.8,'2014-11-20'),(224,1,1,36.825,'2014-11-20'),(225,1,1,36.85,'2014-11-20'),(226,2,1,6.915,'2014-11-20'),(227,2,1,6.93,'2014-11-20'),(228,1,2,26.0125,'2014-11-20'),(229,1,2,26.025,'2014-11-20'),(230,1,2,26.0375,'2014-11-20'),(231,1,2,26.05,'2014-11-20'),(232,1,2,26.0625,'2014-11-20'),(233,2,1,6.945,'2014-11-20'),(234,2,1,6.96,'2014-11-20'),(235,2,1,6.975,'2014-11-20'),(236,2,1,6.99,'2014-11-20'),(237,2,1,7.005,'2014-11-20'),(238,1,2,26.125,'2014-11-21'),(239,1,1,37.175,'2014-11-21'),(240,1,1,37.2,'2014-11-21'),(241,2,1,7.02,'2014-11-21'),(242,1,2,26.175,'2014-11-21'),(243,1,2,26.1875,'2014-11-21'),(244,1,2,26.2,'2014-11-21'),(245,1,2,26.2125,'2014-11-21'),(246,1,2,26.2375,'2014-11-24'),(247,1,1,37.4,'2014-11-24'),(248,2,1,7.035,'2014-11-24'),(249,2,1,7.05,'2014-11-24'),(250,1,2,26.2875,'2014-11-24'),(251,1,2,26.3,'2014-11-24'),(252,1,2,26.3125,'2014-11-24'),(253,1,2,26.325,'2014-11-24'),(254,1,2,26.3375,'2014-11-24'),(255,2,1,7.065,'2014-11-24'),(256,2,1,7.08,'2014-11-24'),(257,2,1,7.095,'2014-11-24'),(258,2,1,7.11,'2014-11-24'),(259,2,1,7.125,'2014-11-24'),(260,1,2,26.4,'2014-11-25'),(261,1,2,26.4125,'2014-11-25'),(262,1,2,26.425,'2014-11-25'),(263,1,2,26.4375,'2014-11-25'),(264,1,2,26.45,'2014-11-25'),(265,1,2,26.4625,'2014-11-25'),(266,1,2,26.475,'2014-11-25'),(267,1,2,26.5,'2014-11-25'),(268,1,2,26.525,'2014-11-25'),(269,1,1,37.975,'2014-11-25'),(270,2,1,7.14,'2014-11-25'),(271,2,1,7.155,'2014-11-25'),(272,1,2,26.575,'2014-11-25'),(273,1,2,26.5875,'2014-11-25'),(274,1,2,26.6,'2014-11-25'),(275,1,2,26.6125,'2014-11-25'),(276,1,2,26.625,'2014-11-25'),(277,2,1,7.17,'2014-11-25'),(278,2,1,7.185,'2014-11-25'),(279,2,1,7.2,'2014-11-25'),(280,2,1,7.215,'2014-11-25'),(281,2,1,7.23,'2014-11-25'),(282,1,2,26.6875,'2014-11-26'),(283,1,2,26.7,'2014-11-26'),(284,1,2,26.7125,'2014-11-26'),(285,1,2,26.725,'2014-11-26'),(286,1,2,26.7375,'2014-11-26'),(287,1,2,26.75,'2014-11-26'),(288,1,2,26.7625,'2014-11-26'),(289,1,2,26.7875,'2014-11-26'),(290,1,2,26.8125,'2014-11-26'),(291,1,1,38.55,'2014-11-26'),(292,2,1,7.245,'2014-11-26'),(293,2,1,7.26,'2014-11-26'),(294,1,2,26.8625,'2014-11-26'),(295,1,2,26.875,'2014-11-26'),(296,1,2,26.8875,'2014-11-26'),(297,1,2,26.9,'2014-11-26'),(298,1,2,26.9125,'2014-11-26'),(299,2,1,7.275,'2014-11-26'),(300,2,1,7.29,'2014-11-26'),(301,2,1,7.305,'2014-11-26'),(302,2,1,7.32,'2014-11-26'),(303,2,1,7.335,'2014-11-26'),(304,1,2,26.975,'2014-11-27'),(305,1,2,26.9875,'2014-11-27'),(306,1,2,27,'2014-11-27'),(307,1,2,27.0125,'2014-11-27'),(308,1,2,27.025,'2014-11-27'),(309,1,2,27.0375,'2014-11-27'),(310,1,2,27.05,'2014-11-27'),(311,1,2,27.075,'2014-11-27'),(312,1,2,27.1,'2014-11-27'),(313,1,1,39.125,'2014-11-27'),(314,2,1,7.35,'2014-11-27'),(315,2,1,7.365,'2014-11-27'),(316,1,2,27.15,'2014-11-27'),(317,1,2,27.1625,'2014-11-27'),(318,1,2,27.175,'2014-11-27'),(319,1,2,27.1875,'2014-11-27'),(320,1,1,39.3,'2014-11-28'),(321,2,1,7.38,'2014-11-28'),(322,2,1,7.395,'2014-11-28'),(323,1,2,27.2375,'2014-11-28'),(324,1,2,27.25,'2014-11-28'),(325,1,2,27.2625,'2014-11-28'),(326,1,2,27.275,'2014-11-28'),(327,1,2,27.3,'2014-12-01'),(328,1,1,39.525,'2014-12-01'),(329,2,1,7.41,'2014-12-01'),(330,2,1,7.425,'2014-12-01'),(331,1,2,27.35,'2014-12-01'),(332,1,2,27.3625,'2014-12-01'),(333,1,2,27.375,'2014-12-01'),(334,1,2,27.3875,'2014-12-01'),(335,1,2,27.4,'2014-12-01'),(336,2,1,7.44,'2014-12-01'),(337,1,2,27.4125,'2014-12-01'),(338,1,2,27.425,'2014-12-01'),(339,1,2,27.4375,'2014-12-01'),(340,1,2,27.45,'2014-12-01'),(341,1,2,27.4625,'2014-12-02'),(342,1,2,27.475,'2014-12-02'),(343,1,2,27.4875,'2014-12-02'),(344,1,2,27.5,'2014-12-02'),(345,1,2,27.5125,'2014-12-02'),(346,1,2,27.525,'2014-12-02'),(347,1,2,27.5375,'2014-12-02'),(348,1,2,27.55,'2014-12-02'),(349,1,2,27.5625,'2014-12-02'),(350,1,2,27.575,'2014-12-02'),(351,1,2,27.5875,'2014-12-02'),(352,1,2,27.6,'2014-12-02'),(353,1,2,27.6125,'2014-12-02'),(354,1,2,27.625,'2014-12-02'),(355,1,2,27.6375,'2014-12-02'),(356,1,2,27.65,'2014-12-02'),(357,1,2,27.6625,'2014-12-02'),(358,1,2,27.675,'2014-12-02'),(359,1,2,27.6875,'2014-12-02'),(360,1,2,27.7,'2014-12-02'),(361,1,2,27.7125,'2014-12-03'),(362,1,2,27.725,'2014-12-03'),(363,1,2,27.7375,'2014-12-03'),(364,1,2,27.75,'2014-12-03'),(365,1,2,27.7625,'2014-12-03'),(366,1,2,27.775,'2014-12-03'),(367,1,2,27.7875,'2014-12-03'),(368,1,2,27.8,'2014-12-03'),(369,1,2,27.8125,'2014-12-03'),(370,1,2,27.825,'2014-12-03'),(371,1,2,27.8375,'2014-12-03'),(372,1,2,27.85,'2014-12-03'),(373,1,2,27.8625,'2014-12-03'),(374,1,2,27.875,'2014-12-03'),(375,1,2,27.8875,'2014-12-03'),(376,1,2,27.9,'2014-12-03'),(377,1,2,27.9125,'2014-12-03'),(378,1,2,27.925,'2014-12-03'),(379,1,2,27.9375,'2014-12-03'),(380,1,2,27.95,'2014-12-03'),(381,1,2,27.9625,'2014-12-04'),(382,1,2,27.975,'2014-12-04'),(383,1,2,27.9875,'2014-12-04'),(384,1,2,28,'2014-12-04'),(385,1,2,28.0125,'2014-12-04'),(386,1,2,28.025,'2014-12-04'),(387,1,2,28.0375,'2014-12-04'),(388,1,2,28.05,'2014-12-04'),(389,1,2,28.0625,'2014-12-04'),(390,1,2,28.075,'2014-12-04'),(391,1,2,28.0875,'2014-12-04'),(392,1,2,28.1,'2014-12-04'),(393,1,2,28.1125,'2014-12-04'),(394,1,2,28.125,'2014-12-04'),(395,1,2,28.1375,'2014-12-04'),(396,1,2,28.15,'2014-12-04'),(397,1,2,28.1625,'2014-12-04'),(398,1,2,28.175,'2014-12-04'),(399,1,2,28.1875,'2014-12-04'),(400,1,2,28.2,'2014-12-04'),(401,1,2,28.2125,'2014-12-05'),(402,1,2,28.225,'2014-12-05'),(403,1,2,28.2375,'2014-12-05'),(404,1,2,28.25,'2014-12-05'),(405,1,2,28.2625,'2014-12-05'),(406,1,2,28.275,'2014-12-05'),(407,1,2,28.2875,'2014-12-05'),(408,15,3,10.3,'2015-01-02'),(409,10,8,10.1125,'2015-01-02'),(410,10,8,10.125,'2015-01-02'),(411,10,8,10.1375,'2015-01-02'),(412,10,8,10.15,'2015-01-02'),(413,10,8,10.1625,'2015-01-02'),(414,10,8,10.175,'2015-01-02'),(415,9,5,10.1125,'2015-01-02'),(416,10,8,10.2,'2015-01-02'),(417,10,8,10.2125,'2015-01-02'),(418,10,8,10.225,'2015-01-03'),(419,1,2,28.45,'2015-01-03'),(420,1,2,28.4625,'2015-01-03'),(421,18,4,5.15,'2015-01-03'),(422,22,6,5.125,'2015-01-03'),(423,22,6,5.15,'2015-01-03'),(424,22,6,5.175,'2015-01-03'),(425,5,2,10.2,'2015-01-03'),(426,5,2,10.2125,'2015-01-03'),(427,5,2,10.225,'2015-01-03'),(428,5,2,10.2375,'2015-01-03'),(429,1,2,28.5625,'2015-01-03'),(430,1,2,28.575,'2015-01-03'),(431,9,5,10.1625,'2015-01-03'),(432,1,2,28.6,'2015-01-03'),(433,1,2,28.6125,'2015-01-04'),(434,1,2,28.625,'2015-01-04'),(435,9,3,10.475,'2015-01-04'),(436,5,2,10.25,'2015-01-04'),(437,9,5,10.2875,'2015-01-04'),(438,5,2,10.275,'2015-01-04'),(439,5,2,10.2875,'2015-01-04'),(440,1,2,28.6875,'2015-01-04'),(441,1,2,28.7,'2015-01-04'),(442,7,5,10.225,'2015-01-04'),(443,1,2,28.725,'2015-01-04'),(444,1,2,28.7375,'2015-01-04'),(445,1,2,28.75,'2015-01-04'),(446,1,2,28.7625,'2015-01-04'),(447,1,2,28.7875,'2015-01-05'),(448,1,2,28.8125,'2015-01-05'),(449,1,1,42.35,'2015-01-05'),(450,2,1,7.695,'2015-01-05'),(451,2,1,7.71,'2015-01-05'),(452,1,2,28.8625,'2015-01-05'),(453,1,2,28.875,'2015-01-05'),(454,18,4,5.175,'2015-01-05'),(455,1,2,28.9,'2015-01-05'),(456,1,2,28.9125,'2015-01-05'),(457,9,3,10.5375,'2015-01-05'),(458,5,2,10.3,'2015-01-05'),(459,9,5,10.35,'2015-01-05'),(460,5,2,10.325,'2015-01-05'),(461,5,2,10.3375,'2015-01-05'),(462,1,2,28.975,'2015-01-05'),(463,1,2,28.9875,'2015-01-05'),(464,7,5,10.25,'2015-01-05'),(465,1,2,29.0125,'2015-01-05'),(466,1,2,29.025,'2015-01-05'),(467,1,2,29.0375,'2015-01-05'),(468,1,2,29.05,'2015-01-05'),(469,1,2,29.075,'2015-01-06'),(470,1,2,29.1,'2015-01-06'),(471,1,1,42.925,'2015-01-06'),(472,2,1,7.8,'2015-01-06'),(473,2,1,7.815,'2015-01-06'),(474,1,2,29.15,'2015-01-06'),(475,1,2,29.1625,'2015-01-06'),(476,18,4,5.2,'2015-01-06'),(477,1,2,29.1875,'2015-01-06'),(478,1,2,29.2,'2015-01-06'),(479,9,3,10.6,'2015-01-06'),(480,5,2,10.35,'2015-01-06'),(481,9,5,10.4125,'2015-01-06'),(482,5,2,10.375,'2015-01-06'),(483,5,2,10.3875,'2015-01-06'),(484,1,2,29.2625,'2015-01-06'),(485,1,2,29.275,'2015-01-06'),(486,7,5,10.275,'2015-01-06'),(487,1,2,29.3,'2015-01-06'),(488,1,2,29.3125,'2015-01-06'),(489,1,2,29.325,'2015-01-06'),(490,1,2,29.3375,'2015-01-06'),(491,1,2,29.35,'2015-01-07'),(492,1,2,29.3625,'2015-01-07'),(493,2,1,7.905,'2015-01-07'),(494,1,2,29.3875,'2015-01-07'),(495,1,2,29.4,'2015-01-07'),(496,1,2,29.4125,'2015-01-07'),(497,18,4,5.225,'2015-01-07'),(498,1,2,29.4375,'2015-01-07'),(499,1,2,29.45,'2015-01-07'),(500,9,3,10.6625,'2015-01-07'),(501,5,2,10.4,'2015-01-07'),(502,9,5,10.475,'2015-01-07'),(503,5,2,10.425,'2015-01-07'),(504,5,2,10.4375,'2015-01-07'),(505,1,2,29.5125,'2015-01-07'),(506,1,2,29.525,'2015-01-07'),(507,7,5,10.3,'2015-01-07'),(508,1,2,29.55,'2015-01-07'),(509,1,2,29.5625,'2015-01-07'),(510,1,2,29.575,'2015-01-07'),(511,1,2,29.5875,'2015-01-07'),(512,1,2,29.6,'2015-01-08'),(513,1,2,29.6125,'2015-01-08'),(514,1,2,29.625,'2015-01-08'),(515,1,2,29.6375,'2015-01-08'),(516,1,2,29.65,'2015-01-08'),(517,1,2,29.6625,'2015-01-08'),(518,18,4,5.25,'2015-01-08'),(519,1,2,29.6875,'2015-01-08'),(520,1,2,29.7,'2015-01-08'),(521,9,3,10.725,'2015-01-08'),(522,5,2,10.45,'2015-01-08'),(523,9,5,10.5375,'2015-01-08'),(524,5,2,10.475,'2015-01-08'),(525,5,2,10.4875,'2015-01-08'),(526,1,2,29.7625,'2015-01-08'),(527,1,2,29.775,'2015-01-08'),(528,7,5,10.325,'2015-01-08'),(529,1,2,29.8,'2015-01-08'),(530,1,2,29.8125,'2015-01-08'),(531,1,2,29.825,'2015-01-08'),(532,1,2,29.8375,'2015-01-08'),(533,1,2,29.85,'2015-01-09'),(534,1,2,29.8625,'2015-01-09'),(535,1,2,29.875,'2015-01-09'),(536,1,2,29.8875,'2015-01-09'),(537,1,2,29.9,'2015-01-09'),(538,1,2,29.9125,'2015-01-09'),(539,18,4,5.275,'2015-01-09'),(540,1,2,29.9375,'2015-01-09'),(541,1,2,29.95,'2015-01-09'),(542,5,2,10.5,'2015-01-09'),(543,9,5,10.5875,'2015-01-09'),(544,5,2,10.525,'2015-01-09'),(545,5,2,10.5375,'2015-01-09');
/*!40000 ALTER TABLE `productivity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `raws`
--

DROP TABLE IF EXISTS `raws`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `raws` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  `zoneid` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `raws`
--

LOCK TABLES `raws` WRITE;
/*!40000 ALTER TABLE `raws` DISABLE KEYS */;
INSERT INTO `raws` VALUES (1,'High Metal',4,2,1),(2,'High Stone',4,3,2),(3,'High Grain',4,5,3);
/*!40000 ALTER TABLE `raws` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regions`
--

DROP TABLE IF EXISTS `regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regions` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `country` int(9) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regions`
--

LOCK TABLES `regions` WRITE;
/*!40000 ALTER TABLE `regions` DISABLE KEYS */;
INSERT INTO `regions` VALUES (1,'Senatoria',1),(2,'Demokritos',1),(3,'Meslima',1),(4,'',1),(5,'Umaykut',1);
/*!40000 ALTER TABLE `regions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reward`
--

DROP TABLE IF EXISTS `reward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reward` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `earn` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reward`
--

LOCK TABLES `reward` WRITE;
/*!40000 ALTER TABLE `reward` DISABLE KEYS */;
INSERT INTO `reward` VALUES (1,'Media Mogul','This award is given to the person who rated the article 250 times.','img/gold.png',10),(2,'Hard Worker','This reward is given to you for train 30 days.','/img/medals/hardworker.png',5);
/*!40000 ALTER TABLE `reward` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reward_user`
--

DROP TABLE IF EXISTS `reward_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reward_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `rewardid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reward_user`
--

LOCK TABLES `reward_user` WRITE;
/*!40000 ALTER TABLE `reward_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `reward_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `selling`
--

DROP TABLE IF EXISTS `selling`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `selling` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `companyid` int(11) DEFAULT NULL,
  `pcs` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `zone` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `selling`
--

LOCK TABLES `selling` WRITE;
/*!40000 ALTER TABLE `selling` DISABLE KEYS */;
INSERT INTO `selling` VALUES (6,1,1500,10,4,1,3),(7,2,10900,1,1,1,3);
/*!40000 ALTER TABLE `selling` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `selling_companies`
--

DROP TABLE IF EXISTS `selling_companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `selling_companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `companyid` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `selling_companies`
--

LOCK TABLES `selling_companies` WRITE;
/*!40000 ALTER TABLE `selling_companies` DISABLE KEYS */;
/*!40000 ALTER TABLE `selling_companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `risk` float DEFAULT NULL,
  `speed` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'Dystopia','Ba',0,1);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shouts`
--

DROP TABLE IF EXISTS `shouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` longtext,
  `userid` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `zone` int(11) DEFAULT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shouts`
--

LOCK TABLES `shouts` WRITE;
/*!40000 ALTER TABLE `shouts` DISABLE KEYS */;
INSERT INTO `shouts` VALUES (1,'asdsad',1,0,3,'2014-11-07 15:41:54'),(2,'SA',5,0,3,'2015-01-01 22:01:17'),(3,'SA',5,0,3,'2015-01-01 22:01:17'),(4,'as',1,0,3,'2015-01-01 22:23:39'),(5,'sa beyler :D Admin kankam sölein ucuzdan gold satim size',7,0,6,'2015-01-02 12:11:29'),(6,'Lenin haklı beyler dağılın :D',1,0,3,'2015-01-02 12:15:48'),(7,'sa',8,0,5,'2015-01-02 12:20:54'),(8,'as',1,0,3,'2015-01-02 12:21:53'),(9,'sa beyler bende geldim :D',14,0,6,'2015-01-02 13:06:53'),(10,'as oo hoşgeldin :D',1,0,3,'2015-01-02 13:08:51'),(11,'sa\n',19,0,4,'2015-01-02 14:11:45'),(12,'as',1,0,3,'2015-01-02 14:36:07'),(13,'sa\n',22,0,5,'2015-01-02 19:14:33'),(14,'hail DS',22,0,5,'2015-01-02 19:14:40'),(15,'as o7',1,0,3,'2015-01-02 19:15:07'),(16,'hail TATS',7,0,6,'2015-01-02 19:23:24'),(17,'Hail MAFİA xd',24,0,4,'2015-01-02 19:23:36'),(18,'HAİL JASONDERULOO \n',9,2,6,'2015-01-02 19:51:32'),(19,'HAİL JASONderuloo\n',9,0,6,'2015-01-02 19:52:22'),(20,'dağışlın lan oyun benim',7,0,6,'2015-01-02 20:02:07'),(21,'sie :D kro lider benm atın sunu hapse',9,0,6,'2015-01-02 20:05:24'),(22,'SİKERM BELANI GO OLİM GÖSTERCEM',7,0,6,'2015-01-02 20:11:25'),(23,'go benım yavrım :D ',9,0,6,'2015-01-02 23:27:43'),(24,'deneme',11,0,5,'2015-01-03 11:35:53'),(25,'Sa türk var mı',22,0,5,'2015-01-03 13:34:32'),(26,'türk yok kanka herkes gavur',1,0,3,'2015-01-03 22:36:11'),(27,'Buralar benim lan',7,0,6,'2015-01-04 00:21:36'),(28,'http://prntscr.com/5o792q\n\nlenıne kapak',9,0,6,'2015-01-04 00:29:32');
/*!40000 ALTER TABLE `shouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stocks`
--

DROP TABLE IF EXISTS `stocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `companyid` int(11) DEFAULT NULL,
  `total_stock` float DEFAULT NULL,
  `selling` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stocks`
--

LOCK TABLES `stocks` WRITE;
/*!40000 ALTER TABLE `stocks` DISABLE KEYS */;
INSERT INTO `stocks` VALUES (1,1,5283.73,1460),(2,2,19376.4,10900),(3,3,261.638,0),(4,4,93.825,0),(5,5,259.411,0),(6,6,83.1,0),(7,7,118.675,0),(8,8,111.787,0),(9,9,0,0),(10,10,0,0),(11,11,0,0),(12,12,0,0),(13,13,0,0),(14,14,0,0);
/*!40000 ALTER TABLE `stocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subs`
--

DROP TABLE IF EXISTS `subs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subs` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `newspaper` int(9) DEFAULT NULL,
  `userid` int(9) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subs`
--

LOCK TABLES `subs` WRITE;
/*!40000 ALTER TABLE `subs` DISABLE KEYS */;
INSERT INTO `subs` VALUES (1,1,1),(2,2,7),(3,3,8),(4,2,1),(5,3,1),(6,1,9),(7,2,9),(8,1,20),(9,4,9),(10,1,11);
/*!40000 ALTER TABLE `subs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userinfo`
--

DROP TABLE IF EXISTS `userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userinfo` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `userid` int(9) DEFAULT NULL,
  `bio` longtext,
  `wellness` double DEFAULT '100',
  `exp` double DEFAULT NULL,
  `str` double DEFAULT NULL,
  `intelling` double DEFAULT NULL,
  `economic_skill` double DEFAULT NULL,
  `gold` double DEFAULT NULL,
  `currency` double DEFAULT NULL,
  `party` int(9) DEFAULT NULL,
  `army` int(9) DEFAULT NULL,
  `org` int(9) DEFAULT NULL,
  `work` int(9) DEFAULT NULL,
  `newspaper` int(9) DEFAULT NULL,
  `country_id` int(9) DEFAULT NULL,
  `energy` int(9) DEFAULT '100',
  `level` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userinfo`
--

LOCK TABLES `userinfo` WRITE;
/*!40000 ALTER TABLE `userinfo` DISABLE KEYS */;
INSERT INTO `userinfo` VALUES (1,1,'SA BEYLER',100,3378,387,48,15.85,100,12373,1,1,1,1,1,1,95,23),(2,2,'',60,200,15,5,1.88,100,2245.3228100199,0,0,0,0,0,1,100,12),(3,3,'',100,51,40,0,1,100,1120,0,0,0,0,0,2,100,9),(4,4,'',100,0,0,NULL,0,80,6100,NULL,NULL,NULL,NULL,NULL,4,100,1),(5,5,'',100,28,0,NULL,0.28,125,11487,NULL,NULL,NULL,1,NULL,3,95,6),(6,6,'',100,0,0,NULL,0,100,1120,NULL,NULL,NULL,NULL,NULL,3,100,1),(7,7,'',100,12,0,NULL,0.12,115,944,NULL,NULL,NULL,1,NULL,6,100,4),(8,8,'',100,15,30,15,0.12,110,20,NULL,NULL,NULL,0,NULL,5,100,5),(9,9,'',100,36,20,10,0.34,127,1188,NULL,NULL,NULL,1,NULL,6,90,7),(10,10,'',100,12,1,1,0.11,105,122,NULL,NULL,NULL,1,NULL,3,100,4),(11,11,'',100,1,10,5,0,50,620,NULL,NULL,NULL,NULL,NULL,5,100,1),(12,12,'',100,0,0,NULL,0,100,120,NULL,NULL,NULL,NULL,NULL,3,100,1),(13,13,'',100,7,0,NULL,0.07,110,134,NULL,NULL,NULL,1,NULL,6,100,3),(14,14,'',100,13,0,NULL,0.13,115,146,NULL,NULL,NULL,1,NULL,6,95,4),(15,15,'',100,6,0,NULL,0.06,110,132,NULL,NULL,NULL,0,NULL,6,100,3),(16,16,'',100,6,0,NULL,0.06,110,132,NULL,NULL,NULL,1,NULL,6,100,3),(17,17,'',100,6,0,NULL,0.06,110,132,NULL,NULL,NULL,1,NULL,6,100,3),(18,18,'',100,6,0,NULL,0.06,110,132,NULL,NULL,NULL,1,NULL,6,100,3),(19,19,'',100,0,0,NULL,0,100,120,NULL,NULL,NULL,NULL,NULL,4,100,1),(20,20,'',100,0,0,NULL,0,100,120,NULL,NULL,NULL,NULL,NULL,4,100,1),(21,21,'',100,0,0,NULL,0,100,120,NULL,NULL,NULL,NULL,NULL,2,100,1),(22,22,'',100,6,15,8,0.04,100,520,NULL,NULL,NULL,0,NULL,5,100,3),(23,23,'',100,0,0,NULL,0,0,20,NULL,NULL,NULL,NULL,NULL,3,100,1),(24,24,'',100,0,0,NULL,0,0,20,NULL,NULL,NULL,NULL,NULL,4,100,1),(25,25,'',100,0,0,NULL,0,0,20,NULL,NULL,NULL,NULL,NULL,3,100,1),(26,26,'',100,1,10,5,0,0,20,NULL,NULL,NULL,NULL,NULL,2,100,1);
/*!40000 ALTER TABLE `userinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `zones` int(11) DEFAULT NULL,
  `citizenship` int(4) NOT NULL,
  `created_at` date DEFAULT NULL,
  `active` varchar(1) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT '/public/img/avatar/no_avatar.jpg',
  `cover` varchar(255) DEFAULT NULL,
  `dead` int(11) DEFAULT '0',
  `injury` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Tonyukuk','1ade21081468b1b43afe5c5814c432697350ef5e','rexox@hotmail.de',3,1,'2014-03-21','Y','./img/avatar/avatar_c4ca4238a0b923820dcc509a6f75849b.png','./img/cover/cover_c4ca4238a0b923820dcc509a6f75849b.jpg',0,0),(2,'Administrator','1ade21081468b1b43afe5c5814c432697350ef5e','xianthi@yandex.com.tr',3,1,'2014-03-26','Y','public/img/avatar/no_avatar.jpg','',0,0),(3,'BilgeKagan','1ade21081468b1b43afe5c5814c432697350ef5e','bilalayik@gmail.com',4,1,'2014-03-28','Y','public/img/avatar/no_avatar.jpg','',0,0),(4,'DrazenPetrovic','f7c3bc1d808e04732adf679965ccc34ca7ae3441','drazenpetrovic1912@gmail.com',4,1,'2015-01-01','Y','public/img/avatar/no_avatar.jpg',NULL,NULL,NULL),(5,'AtAdam','dd5877682f883a011b0927b6cffed785497d6705','EEmaid4542@superrito.com',3,1,'2015-01-01','Y','./img/avatar/avatar_e4da3b7fbbce2345d7772b0674a318d5.jpg',NULL,NULL,NULL),(6,'gavanoz61','8afe4c2ba82e22de104e3a6f0772dd4b3b690807','operasyon_face1@hotmail.com',3,1,'2015-01-01','Y','public/img/avatar/no_avatar.jpg',NULL,NULL,NULL),(7,'VladimirLenin','9d5be6df02c3bda071434232a952e3804a6b6f3a','oguzcanisk@gmail.com',6,1,'2015-01-02','Y','./img/avatar/avatar_8f14e45fceea167a5a36dedd4bea2543.png','./img/cover/cover_8f14e45fceea167a5a36dedd4bea2543.png',NULL,NULL),(8,'Metayd','7041f6d4dcf4013ba257442cb7e6bc9fb8f56dd2','plenarypowerxd@hotmail.com',5,1,'2015-01-02','Y','./img/avatar/avatar_c9f0f895fb98ab9159f51fd0297e236d.jpg',NULL,NULL,NULL),(9,'jasonDerulo','7c222fb2927d828af22f592134e8932480637c0d','alimehmetcakar@gmail.com',6,1,'2015-01-02','Y','./img/avatar/avatar_45c48cce2e2d7fbdea1afc51c7c6ad26.jpg','./img/cover/cover_45c48cce2e2d7fbdea1afc51c7c6ad26.jpg',NULL,NULL),(10,'Alemdar','ea962fb14188f6b62ce4e76f9c54b36364c9b7b3','resim_124@hotmail.com',3,1,'2015-01-02','Y','public/img/avatar/no_avatar.jpg',NULL,NULL,NULL),(11,'h3kt0r','1ade21081468b1b43afe5c5814c432697350ef5e','xianthi@live.de',5,1,'2015-01-02','Y','public/img/avatar/no_avatar.jpg',NULL,NULL,NULL),(12,'BuvBuv','9d5be6df02c3bda071434232a952e3804a6b6f3a','realmango55@gmail.com',3,1,'2015-01-02','Y','public/img/avatar/no_avatar.jpg',NULL,NULL,NULL),(13,'Promagnon','9d5be6df02c3bda071434232a952e3804a6b6f3a','rako_can@outlook.com',6,1,'2015-01-02','Y','public/img/avatar/no_avatar.jpg',NULL,NULL,NULL),(14,'EfsaneEmo','5b8acb8b818130e99d21c0c2e0253c1b3560d1e3','lebranjaymes_31@hotmail.com',6,1,'2015-01-02','Y','./img/avatar/avatar_aab3238922bcc25a6f606eb525ffdc56.jpg',NULL,NULL,NULL),(15,'uvvsitmen','9d5be6df02c3bda071434232a952e3804a6b6f3a','richwarior@hotmail.com',6,1,'2015-01-02','Y','public/img/avatar/no_avatar.jpg',NULL,NULL,NULL),(16,'P0mpaci','9d5be6df02c3bda071434232a952e3804a6b6f3a','durpanpaaa@gmail.com',6,1,'2015-01-02','Y','public/img/avatar/no_avatar.jpg',NULL,NULL,NULL),(17,'cocacola','9d5be6df02c3bda071434232a952e3804a6b6f3a','ruksaddsa@gmail.com',6,1,'2015-01-02','Y','public/img/avatar/no_avatar.jpg',NULL,NULL,NULL),(18,'kokoloo','9d5be6df02c3bda071434232a952e3804a6b6f3a','aaaaaaaaaaaaaaaaaaaaa@gmail.com',6,1,'2015-01-02','Y','public/img/avatar/no_avatar.jpg',NULL,NULL,NULL),(19,'SelimHalim','b4d333d3afcb4ab2169709d1f9ee928053818a13','dsada.dsada@dsa.com',4,1,'2015-01-02','Y','public/img/avatar/no_avatar.jpg',NULL,NULL,NULL),(20,'zzzz','2f2e0002e8ab60981619e2444df314923a191c75','zzzz@hotmail',4,1,'2015-01-02','Y','public/img/avatar/no_avatar.jpg',NULL,NULL,NULL),(21,'Huor Earfalas','f8757e7bc417465ca7ca959d7d3d2c9ba7a0c188','kingofipstown@hotmail.com',2,1,'2015-01-02','Y','public/img/avatar/no_avatar.jpg',NULL,NULL,NULL),(22,'quietLy','2d81cdfea15e7aec6516e3f919af4b89baf44cf4','yuso6@hotmail.com',5,1,'2015-01-02','Y','./img/avatar/avatar_b6d767d2f8ed5d21a44b0e5886680cb9.jpg',NULL,NULL,NULL),(23,'Kingpack','f3daaf3f078d16efcea8e9fc86a9bfd92a65e631','miracyildiz@hotmail.com',3,1,'2015-01-02','Y','public/img/avatar/no_avatar.jpg',NULL,NULL,NULL),(24,'nabersin','9a8287748a7762a6d573638f863dcc055e93eb59','gerialfacee@mynet.com',4,1,'2015-01-02','Y','public/img/avatar/no_avatar.jpg',NULL,NULL,NULL),(25,'Thanatos03','18890d9275c5d534e57493c6fab0fe5f0c55b912','bcallipinar@hotmail.com',3,1,'2015-01-02','Y','public/img/avatar/no_avatar.jpg',NULL,NULL,NULL),(26,'duch','567036e656fbb65526f42d38af9528da2c4df076','duchh90@gmail.com',2,1,'2015-01-03','Y','public/img/avatar/no_avatar.jpg',NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vote`
--

DROP TABLE IF EXISTS `vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vote` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `article` int(9) DEFAULT NULL,
  `userid` int(9) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vote`
--

LOCK TABLES `vote` WRITE;
/*!40000 ALTER TABLE `vote` DISABLE KEYS */;
INSERT INTO `vote` VALUES (1,1,1),(2,2,1),(3,2,7),(4,3,14),(5,3,8),(6,3,1),(7,1,11),(8,4,1);
/*!40000 ALTER TABLE `vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wars`
--

DROP TABLE IF EXISTS `wars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attacker` int(11) DEFAULT NULL,
  `defender` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wars`
--

LOCK TABLES `wars` WRITE;
/*!40000 ALTER TABLE `wars` DISABLE KEYS */;
/*!40000 ALTER TABLE `wars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workout`
--

DROP TABLE IF EXISTS `workout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workout` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `first_day` date DEFAULT NULL,
  `last_day` date DEFAULT NULL,
  `timerow` int(9) DEFAULT NULL,
  `owner` int(9) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workout`
--

LOCK TABLES `workout` WRITE;
/*!40000 ALTER TABLE `workout` DISABLE KEYS */;
INSERT INTO `workout` VALUES (12,'2014-04-23','2015-01-02',1,1),(14,'2014-05-26','2014-05-26',1,3),(15,'2014-11-05','2014-11-05',1,2),(16,'2015-01-03','2015-01-03',1,11),(17,'2015-01-03','2015-01-04',2,9),(18,'2015-01-03','2015-01-03',1,10),(19,'2015-01-03','2015-01-03',1,26),(20,'2015-01-03','2015-01-07',2,8),(21,'2015-01-03','2015-01-03',2,22);
/*!40000 ALTER TABLE `workout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worktime`
--

DROP TABLE IF EXISTS `worktime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `worktime` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `companyid` int(11) DEFAULT NULL,
  `salary` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worktime`
--

LOCK TABLES `worktime` WRITE;
/*!40000 ALTER TABLE `worktime` DISABLE KEYS */;
INSERT INTO `worktime` VALUES (4,1,'08:00:00','11:00:00',1,'10'),(6,1,'19:00:00','23:00:00',2,'10'),(7,1,'11:00:00','18:00:00',2,'20'),(8,1,'00:00:00','07:00:00',2,'10'),(9,1,'08:00:00','10:00:00',2,'1'),(10,2,'18:00:00','23:00:00',1,'10'),(11,2,'11:00:00','13:00:00',1,'1'),(12,9,'18:00:00','19:00:00',3,'2'),(13,8,'00:00:00','23:00:00',6,'50'),(15,13,'15:00:00','16:00:00',3,'2'),(16,14,'22:00:00','23:00:00',7,'2'),(17,15,'15:00:00','16:00:00',3,'2'),(18,14,'15:00:00','16:00:00',3,'2'),(19,16,'15:00:00','16:00:00',4,'2'),(20,17,'15:00:00','16:00:00',4,'2'),(21,18,'15:00:00','16:00:00',4,'2'),(22,22,'06:00:00','23:00:00',6,'100'),(23,9,'22:00:00','23:00:00',5,'2'),(24,7,'21:00:00','22:00:00',7,'2'),(25,9,'02:00:00','03:00:00',5,'2'),(26,9,'22:00:00','23:00:00',7,'2'),(27,5,'19:00:00','23:00:00',2,'10'),(28,7,'02:00:00','03:00:00',5,'2'),(29,9,'20:00:00','21:00:00',5,'2');
/*!40000 ALTER TABLE `worktime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zones`
--

DROP TABLE IF EXISTS `zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `flag` varchar(255) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `lat` decimal(9,6) DEFAULT NULL,
  `long` decimal(9,6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zones`
--

LOCK TABLES `zones` WRITE;
/*!40000 ALTER TABLE `zones` DISABLE KEYS */;
INSERT INTO `zones` VALUES (1,'Cosmos','/public/img/country/dystopia.png',0,0.000000,0.000000),(2,'Senatoria','/public/img/country/it.gif',1,11.000000,2.000000),(3,'Demokritos','/public/img/country/gr.gif',1,21.000000,-3.000000),(4,'Nazismus','/public/img/country/de.gif',1,21.000000,6.000000),(5,'Anarchos','/public/img/country/tr.gif',1,0.000000,0.000000),(6,'Proletariat','/public/img/country/ru.gif',1,11.000000,-7.000000);
/*!40000 ALTER TABLE `zones` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-01-09 15:23:31
