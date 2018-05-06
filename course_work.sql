-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: course_work
-- ------------------------------------------------------
-- Server version	5.7.21

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
-- Table structure for table `_attribute_facility`
--

DROP TABLE IF EXISTS `_attribute_facility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_attribute_facility` (
  `attribute_id` int(11) NOT NULL,
  `facility_id` int(11) NOT NULL,
  `string_value` varchar(45) DEFAULT NULL,
  `int_value` int(11) DEFAULT NULL,
  PRIMARY KEY (`attribute_id`,`facility_id`),
  KEY `FK17_idx` (`facility_id`),
  CONSTRAINT `FK16` FOREIGN KEY (`attribute_id`) REFERENCES `attribute` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK17` FOREIGN KEY (`facility_id`) REFERENCES `facility` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_attribute_facility`
--

LOCK TABLES `_attribute_facility` WRITE;
/*!40000 ALTER TABLE `_attribute_facility` DISABLE KEYS */;
INSERT INTO `_attribute_facility` VALUES (1,1,'facility_str_val_1',NULL),(1,2,'facility_str_val_1',NULL),(1,4,'facility_str_val_1',NULL),(2,3,'facility_str_val_2',NULL),(2,4,'facility_str_val_2',NULL),(2,5,'facility_str_val_2',NULL),(3,1,'facility_str_val_3',NULL),(3,4,'facility_str_val_3',NULL),(3,7,'facility_str_val_3',NULL),(4,6,'',4),(5,6,'',5),(5,7,'',5),(6,3,'',6),(6,8,'',6),(7,8,'facility_str_val_7',NULL),(7,9,'facility_str_val_7',NULL),(7,10,'facility_str_val_7',NULL),(8,10,'facility_str_val_8',NULL),(9,10,'',9),(10,10,'',10);
/*!40000 ALTER TABLE `_attribute_facility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_attribute_facility_type`
--

DROP TABLE IF EXISTS `_attribute_facility_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_attribute_facility_type` (
  `attribute_id` int(11) NOT NULL,
  `facility_type_id` int(11) NOT NULL,
  PRIMARY KEY (`facility_type_id`,`attribute_id`),
  KEY `FK1_idx` (`attribute_id`),
  CONSTRAINT `FK1` FOREIGN KEY (`attribute_id`) REFERENCES `attribute` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK2` FOREIGN KEY (`facility_type_id`) REFERENCES `facility_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_attribute_facility_type`
--

LOCK TABLES `_attribute_facility_type` WRITE;
/*!40000 ALTER TABLE `_attribute_facility_type` DISABLE KEYS */;
INSERT INTO `_attribute_facility_type` VALUES (1,5),(1,6),(1,7),(2,6),(2,7),(3,5),(3,7),(3,8),(4,8),(5,8),(6,6),(6,8),(7,8),(7,9),(7,10),(8,10),(9,10),(10,10);
/*!40000 ALTER TABLE `_attribute_facility_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_coach_sport`
--

DROP TABLE IF EXISTS `_coach_sport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_coach_sport` (
  `coach_id` int(11) NOT NULL,
  `kind_of_sport_id` int(11) NOT NULL,
  PRIMARY KEY (`coach_id`,`kind_of_sport_id`),
  KEY `FK5_idx` (`kind_of_sport_id`),
  CONSTRAINT `FK4` FOREIGN KEY (`coach_id`) REFERENCES `coach` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK5` FOREIGN KEY (`kind_of_sport_id`) REFERENCES `kind_of_sport` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_coach_sport`
--

LOCK TABLES `_coach_sport` WRITE;
/*!40000 ALTER TABLE `_coach_sport` DISABLE KEYS */;
INSERT INTO `_coach_sport` VALUES (1,1),(1,2),(2,2),(2,3),(3,3),(3,4),(4,4),(5,5),(11,5),(5,6),(6,6),(12,6),(7,7),(13,7),(8,8),(14,8),(9,9),(15,9),(10,10);
/*!40000 ALTER TABLE `_coach_sport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_sportsman_sport`
--

DROP TABLE IF EXISTS `_sportsman_sport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_sportsman_sport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sportsman_id` int(11) NOT NULL,
  `kind_of_sport_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`sportsman_id`,`kind_of_sport_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK7_idx` (`sportsman_id`),
  KEY `FK8_idx` (`kind_of_sport_id`),
  CONSTRAINT `FK7` FOREIGN KEY (`sportsman_id`) REFERENCES `sportsman` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK8` FOREIGN KEY (`kind_of_sport_id`) REFERENCES `kind_of_sport` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_sportsman_sport`
--

LOCK TABLES `_sportsman_sport` WRITE;
/*!40000 ALTER TABLE `_sportsman_sport` DISABLE KEYS */;
INSERT INTO `_sportsman_sport` VALUES (1,1,1),(2,2,2),(3,3,3),(4,3,1),(5,3,4),(6,4,5),(7,5,5),(8,5,6),(9,6,7),(10,7,8),(11,8,9),(12,9,10),(13,10,10),(14,11,1),(15,11,2),(16,11,3),(17,12,4),(18,13,5),(19,14,6),(20,15,7),(21,16,7),(22,17,8),(23,18,8),(24,19,9),(25,20,10),(26,20,2),(27,20,3);
/*!40000 ALTER TABLE `_sportsman_sport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_sportsman_sport_coach`
--

DROP TABLE IF EXISTS `_sportsman_sport_coach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_sportsman_sport_coach` (
  `_sportsman_sport_id` int(11) NOT NULL,
  `coach_id` int(11) NOT NULL,
  PRIMARY KEY (`_sportsman_sport_id`,`coach_id`),
  KEY `FK15_idx` (`coach_id`),
  CONSTRAINT `FK14` FOREIGN KEY (`_sportsman_sport_id`) REFERENCES `_sportsman_sport` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK15` FOREIGN KEY (`coach_id`) REFERENCES `coach` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_sportsman_sport_coach`
--

LOCK TABLES `_sportsman_sport_coach` WRITE;
/*!40000 ALTER TABLE `_sportsman_sport_coach` DISABLE KEYS */;
INSERT INTO `_sportsman_sport_coach` VALUES (1,1),(2,1),(4,1),(14,1),(15,1),(26,1),(3,2),(16,2),(27,3),(5,4),(17,4),(7,5),(18,5),(8,6),(9,7),(20,7),(22,8),(12,10),(13,10),(25,10),(6,11),(19,12),(21,13),(10,14),(23,14),(11,15),(24,15);
/*!40000 ALTER TABLE `_sportsman_sport_coach` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `course_work`.`_sportsman_sport_coach_BEFORE_INSERT` BEFORE INSERT ON `_sportsman_sport_coach` FOR EACH ROW
BEGIN
if not exists (select *
					from _coach_sport as _cs
					where _cs.coach_id = new.coach_id and 
						_cs.kind_of_sport_id in
							(select kind_of_sport_id
								from _sportsman_sport as _ss
								where _ss.id = new._sportsman_sport_id))
then
	set new._sportsman_sport_id = NULL;
    set new.coach_id = NULL;
    
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `attenders`
--

DROP TABLE IF EXISTS `attenders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attenders` (
  `competition_id` int(11) NOT NULL,
  `sportsman_id` int(11) NOT NULL,
  `is_medalist` tinyint(4) DEFAULT NULL COMMENT '1 - if medalist\n0 - if not medalist',
  `result` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`competition_id`,`sportsman_id`),
  KEY `FK13_idx` (`sportsman_id`),
  CONSTRAINT `FK12` FOREIGN KEY (`competition_id`) REFERENCES `competition` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK13` FOREIGN KEY (`sportsman_id`) REFERENCES `sportsman` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attenders`
--

LOCK TABLES `attenders` WRITE;
/*!40000 ALTER TABLE `attenders` DISABLE KEYS */;
INSERT INTO `attenders` VALUES (1,1,1,1),(1,2,1,2),(1,3,1,3),(1,4,0,4),(2,1,0,4),(2,2,1,2),(2,3,0,5),(2,4,0,6),(2,5,1,1),(2,6,1,3),(3,6,1,1),(3,7,1,2),(3,8,1,3),(3,9,0,4),(3,10,0,5);
/*!40000 ALTER TABLE `attenders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute`
--

DROP TABLE IF EXISTS `attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `value_type` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute`
--

LOCK TABLES `attribute` WRITE;
/*!40000 ALTER TABLE `attribute` DISABLE KEYS */;
INSERT INTO `attribute` VALUES (1,'str_attribute_1','string'),(2,'str_attribute_2','string'),(3,'str_attribute_3','string'),(4,'int_attribute_1','int'),(5,'int_attribute_2','int'),(6,'int_attribute_3','int'),(7,'str_attribute_4','string'),(8,'str_attribute_5','string'),(9,'int_attribute_4','int'),(10,'int_attribute_5','int');
/*!40000 ALTER TABLE `attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coach`
--

DROP TABLE IF EXISTS `coach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coach` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coach`
--

LOCK TABLES `coach` WRITE;
/*!40000 ALTER TABLE `coach` DISABLE KEYS */;
INSERT INTO `coach` VALUES (1,'coach_name_1','coach_surname_1'),(2,'coach_name_2','coach_surname_2'),(3,'coach_name_3','coach_surname_3'),(4,'coach_name_4','coach_surname_4'),(5,'coach_name_5','coach_surname_5'),(6,'coach_name_6','coach_surname_6'),(7,'coach_name_7','coach_surname_7'),(8,'coach_name_8','coach_surname_8'),(9,'coach_name_9','coach_surname_9'),(10,'coach_name_10','coach_surname_10'),(11,'coach_name_11','coach_surname_11'),(12,'coach_name_12','coach_surname_12'),(13,'coach_name_13','coach_surname_13'),(14,'coach_name_14','coach_surname_14'),(15,'coach_name_15','coach_surname_15');
/*!40000 ALTER TABLE `coach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `competition`
--

DROP TABLE IF EXISTS `competition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `competition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organizer_id` int(11) NOT NULL,
  `kind_of_sport_id` int(11) NOT NULL,
  `facility_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`,`organizer_id`,`kind_of_sport_id`,`facility_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `FK9_idx` (`organizer_id`),
  KEY `FK10_idx` (`kind_of_sport_id`),
  KEY `FK11_idx` (`facility_id`),
  CONSTRAINT `FK10` FOREIGN KEY (`kind_of_sport_id`) REFERENCES `kind_of_sport` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK11` FOREIGN KEY (`facility_id`) REFERENCES `facility` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK9` FOREIGN KEY (`organizer_id`) REFERENCES `organizer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competition`
--

LOCK TABLES `competition` WRITE;
/*!40000 ALTER TABLE `competition` DISABLE KEYS */;
INSERT INTO `competition` VALUES (1,1,1,1,'competition_1','2005-01-01'),(2,2,2,2,'competition_2','2006-01-01'),(3,2,3,2,'competition_3','2007-02-03'),(4,3,4,3,'competition_4','2008-03-04'),(5,3,5,3,'competition_5','2009-04-05'),(6,3,6,4,'competition_6','2010-05-06'),(7,4,7,4,'competition_7','2011-06-07'),(8,4,8,5,'competition_8','2012-07-08'),(9,5,9,6,'competition_9','2013-08-09'),(10,6,10,7,'competition_10','2014-09-10');
/*!40000 ALTER TABLE `competition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facility`
--

DROP TABLE IF EXISTS `facility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facility` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `facility_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`facility_type_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `FK1_idx` (`facility_type_id`),
  CONSTRAINT `FK3` FOREIGN KEY (`facility_type_id`) REFERENCES `facility_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facility`
--

LOCK TABLES `facility` WRITE;
/*!40000 ALTER TABLE `facility` DISABLE KEYS */;
INSERT INTO `facility` VALUES (1,'facility_1',5),(10,'facility_10',10),(2,'facility_2',6),(3,'facility_3',6),(4,'facility_4',7),(5,'facility_5',7),(6,'facility_6',8),(7,'facility_7',8),(8,'facility_8',8),(9,'facility_9',9);
/*!40000 ALTER TABLE `facility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facility_type`
--

DROP TABLE IF EXISTS `facility_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facility_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET big5 DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facility_type`
--

LOCK TABLES `facility_type` WRITE;
/*!40000 ALTER TABLE `facility_type` DISABLE KEYS */;
INSERT INTO `facility_type` VALUES (6,'facility_type_1'),(8,'facility_type_2'),(5,'facility_type_3'),(9,'facility_type_4'),(10,'facility_type_5'),(7,'facility_type_6');
/*!40000 ALTER TABLE `facility_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kind_of_sport`
--

DROP TABLE IF EXISTS `kind_of_sport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kind_of_sport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kind_of_sport`
--

LOCK TABLES `kind_of_sport` WRITE;
/*!40000 ALTER TABLE `kind_of_sport` DISABLE KEYS */;
INSERT INTO `kind_of_sport` VALUES (1,'kind_of_sport_1'),(10,'kind_of_sport_10'),(2,'kind_of_sport_2'),(3,'kind_of_sport_3'),(4,'kind_of_sport_4'),(5,'kind_of_sport_5'),(6,'kind_of_sport_6'),(7,'kind_of_sport_7'),(8,'kind_of_sport_8'),(9,'kind_of_sport_9');
/*!40000 ALTER TABLE `kind_of_sport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizer`
--

DROP TABLE IF EXISTS `organizer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organizer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizer`
--

LOCK TABLES `organizer` WRITE;
/*!40000 ALTER TABLE `organizer` DISABLE KEYS */;
INSERT INTO `organizer` VALUES (1,'oganizer_1'),(10,'oganizer_10'),(2,'oganizer_2'),(3,'oganizer_3'),(4,'oganizer_4'),(5,'oganizer_5'),(6,'oganizer_6'),(7,'oganizer_7'),(8,'oganizer_8'),(9,'oganizer_9');
/*!40000 ALTER TABLE `organizer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sport_club`
--

DROP TABLE IF EXISTS `sport_club`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sport_club` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sport_club`
--

LOCK TABLES `sport_club` WRITE;
/*!40000 ALTER TABLE `sport_club` DISABLE KEYS */;
INSERT INTO `sport_club` VALUES (1,'sport_club_1'),(10,'sport_club_10'),(2,'sport_club_2'),(3,'sport_club_3'),(4,'sport_club_4'),(5,'sport_club_5'),(6,'sport_club_6'),(7,'sport_club_7'),(8,'sport_club_8'),(9,'sport_club_9');
/*!40000 ALTER TABLE `sport_club` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sportsman`
--

DROP TABLE IF EXISTS `sportsman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sportsman` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `age` int(10) unsigned NOT NULL,
  `category` int(10) unsigned NOT NULL,
  `sport_club_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`sport_club_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK6_idx` (`sport_club_id`),
  CONSTRAINT `FK6` FOREIGN KEY (`sport_club_id`) REFERENCES `sport_club` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sportsman`
--

LOCK TABLES `sportsman` WRITE;
/*!40000 ALTER TABLE `sportsman` DISABLE KEYS */;
INSERT INTO `sportsman` VALUES (1,'sportsman_name_1','sportsman_surname_1',20,1,1),(2,'sportsman_name_2','sportsman_surname_2',21,2,2),(3,'sportsman_name_3','sportsman_surname_3',22,3,2),(4,'sportsman_name_4','sportsman_surname_4',23,1,3),(5,'sportsman_name_5','sportsman_surname_5',24,2,3),(6,'sportsman_name_6','sportsman_surname_6',25,3,3),(7,'sportsman_name_7','sportsman_surname_7',26,1,4),(8,'sportsman_name_8','sportsman_surname_8',27,2,4),(9,'sportsman_name_9','sportsman_surname_9',28,3,4),(10,'sportsman_name_10','sportsman_surname_10',29,1,4),(11,'sportsman_name_11','sportsman_surname_11',30,2,5),(12,'sportsman_name_12','sportsman_surname_12',31,3,5),(13,'sportsman_name_13','sportsman_surname_13',32,1,5),(14,'sportsman_name_14','sportsman_surname_14',33,2,5),(15,'sportsman_name_15','sportsman_surname_15',34,3,5),(16,'sportsman_name_16','sportsman_surname_16',35,1,6),(17,'sportsman_name_17','sportsman_surname_17',36,2,7),(18,'sportsman_name_18','sportsman_surname_18',37,3,7),(19,'sportsman_name_19','sportsman_surname_19',38,1,8),(20,'sportsman_name_20','sportsman_surname_20',39,2,9);
/*!40000 ALTER TABLE `sportsman` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'course_work'
--

--
-- Dumping routines for database 'course_work'
--
/*!50003 DROP FUNCTION IF EXISTS `get_coach_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_coach_id`(coach_name varchar(20),
	coach_surname varchar(20)) RETURNS int(11)
begin
	declare coach_id int default -1;
    
	select c.id into coach_id
	from coach as c
	where c.name = coach_name and c.surname = coach_surname;

    return coach_id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_sportsman_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_sportsman_id`(s_name varchar(20),
	s_surname varchar(20)) RETURNS int(11)
begin
	declare sportsman_id int default -1;
    
	select id into sportsman_id
	from sportsman as s
	where s.name = s_name and s.surname = s_surname;

    return sportsman_id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_sport_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_sport_id`(sport_name varchar(20)) RETURNS int(11)
begin
	declare sport_id int default -1;
    
	select id into sport_id
	from kind_of_sport as kos
	where kos.name = sport_name;

    return sport_id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_type_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_type_id`(type_name varchar(20)) RETURNS int(11)
begin
	declare type_id int default -1;
    
	select id into type_id
    from facility_type as ft
    where ft.name = type_name;
    
    return type_id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_coaches` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_coaches`(in s_name varchar(20),
	in s_surname varchar(20))
begin
	select s.name as 'Sportsman name',
				s.surname as 'Sportsman surname',
                c.name as 'Coach name',
                c.surname as 'Coach surname'
	from coach as c
    join _sportsman_sport_coach as _ssc on _ssc.coach_id = c.id
    join _sportsman_sport as _ss on _ss.id = _ssc._sportsman_sport_id
    join sportsman as s on s.id = _ss.sportsman_id
    where _ss.sportsman_id = get_sportsman_id(s_name, s_surname);	
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_competitions_by_date` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_competitions_by_date`(in low_date date, in top_date date,
	in org_name varchar(20))
begin
	select c.name as 'Title',
				c.date as 'Date',
                o.name as 'Ogranizer'
	from competition as c
    join organizer as o on o.id = c.organizer_id
    where (c.date > low_date) and (c.date < top_date)
    and (org_name = "" or o.name = org_name);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_facilities_by_int_param` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_facilities_by_int_param`(IN type_name varchar(20),
			IN attr_name varchar(20),
            IN low_bound int,
            IN top_bound int)
begin
	select f.name as 'Facility name',
				attr.name as 'Attribute name',
                _af.int_value as 'Value'
	from facility as f
	join _attribute_facility as _af
	join attribute as attr
	join _attribute_facility_type as _aft on _aft.attribute_id = _af.attribute_id
		and f.id = _af.facility_id
		and f.facility_type_id = _aft.facility_type_id
		and attr.id = _af.attribute_id
	where attr.name = attr_name 
			and f.facility_type_id = get_type_id(type_name)
            and attr.value_type = "int"
			and _af.int_value >= low_bound
            and _af.int_value <= top_bound;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_facilities_by_str_param` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_facilities_by_str_param`(IN type_name varchar(20),
			IN attr_name varchar(20),
            IN attr_value varchar(20))
begin
	select f.name as 'Facility name',
				attr.name as 'Attribute name',
                _af.string_value as 'Value'
	from facility as f
	join _attribute_facility as _af
	join attribute as attr
	join _attribute_facility_type as _aft on _aft.attribute_id = _af.attribute_id
		and f.id = _af.facility_id
		and f.facility_type_id = _aft.facility_type_id
		and attr.id = _af.attribute_id
	where attr.name = attr_name 
			and f.facility_type_id = get_type_id(type_name)
            and attr.value_type = "string"
			and _af.string_value = attr_value;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_facilities_by_type` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_facilities_by_type`(IN type_name varchar(20))
begin
	select f.id as 'ID',
				f.name as 'Facility name',
                ft.name as 'Type name',
                a.name as 'Attribute name',
                _af.int_value as 'Integer value',
                _af.string_value as 'String value'                
	from facility as f
    join facility_type as ft 			on f.facility_type_id = ft.id
    join _attribute_facility as _af 	on f.id = _af.facility_id
    join attribute as a 						on a.id = _af.attribute_id
	where f.facility_type_id = get_type_id(type_name) group by f.id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_sportsmans_by_coach` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_sportsmans_by_coach`(IN coach_name varchar(20),
	IN coach_surname varchar(20), IN category int)
begin
	select s.name as 'Name',
				s.surname as 'Surname',
                s.category as 'Category',
                c.name as 'Coach name',
                c.surname as 'Coach surname'
                
    from sportsman as s
    join _sportsman_sport as _ss on _ss.sportsman_id = s.id
    join _sportsman_sport_coach as _ssc on _ssc._sportsman_sport_id = _ss.id
    join coach as c on c.id = _ssc.coach_id
		where _ssc.coach_id = get_coach_id(coach_name, coach_surname)
			and (category = -1 or s.category <= category);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_sportsmans_by_sport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_sportsmans_by_sport`(IN sport_name varchar(20),
	IN category int)
begin
	select s.name as 'Name',
				s.surname as 'Surname',
                kos.name as 'Kind of sport',
                s.category as 'Category'
    from sportsman as s
    join _sportsman_sport as _ss on _ss.sportsman_id = s.id
    join kind_of_sport as kos on kos.id = _ss.kind_of_sport_id
		where _ss.kind_of_sport_id = get_sport_id(sport_name)
			and (category = -1 or s.category <= category);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_sportsmans_by_sport_category` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_sportsmans_by_sport_category`(IN sport_name varchar(20),
	IN category int)
begin
	select s.name as 'Name',
				s.surname as 'Surname',
                kos.name as 'Kind of sport',
                s.category as 'Category'
    from sportsman as s
    join _sportsman_sport as _ss on _ss.sportsman_id = s.id
    join kind_of_sport as kos on kos.id = _ss.kind_of_sport_id
		where _ss.kind_of_sport_id = get_sport_id(sport_name)
        and s.category <= category;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_sportsmans_several_kos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_sportsmans_several_kos`()
begin    
	select s.name as 'Name',
				s.surname as 'Surname',
               count(_ss.sportsman_id) as 'Sports count'
    from sportsman as s
    join _sportsman_sport as _ss on _ss.sportsman_id = s.id 
	 group by s.id
     having count(_ss.sportsman_id) > 1;
	
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-06 14:33:03
