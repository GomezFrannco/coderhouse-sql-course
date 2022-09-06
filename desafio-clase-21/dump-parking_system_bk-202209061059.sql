-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: parking_system_bk
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `car_places`
--

DROP TABLE IF EXISTS `car_places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `car_places` (
  `place_id` int(11) NOT NULL AUTO_INCREMENT,
  `place_size` tinytext NOT NULL,
  `level_id` int(11) NOT NULL,
  PRIMARY KEY (`place_id`),
  KEY `FK_LEVEL_FLOOR` (`level_id`),
  CONSTRAINT `FK_LEVEL_FLOOR` FOREIGN KEY (`level_id`) REFERENCES `floor_level` (`level_id`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_places`
--

LOCK TABLES `car_places` WRITE;
/*!40000 ALTER TABLE `car_places` DISABLE KEYS */;
INSERT INTO `car_places` VALUES (1,'small',1),(2,'small',1),(3,'small',1),(4,'small',1),(5,'small',1),(6,'small',1),(7,'small',1),(8,'small',1),(9,'small',1),(10,'small',1),(11,'small',1),(12,'small',1),(13,'small',1),(14,'small',1),(15,'small',1),(16,'small',1),(17,'small',1),(18,'small',1),(19,'small',1),(20,'small',1),(21,'small',1),(22,'small',1),(23,'small',1),(24,'small',1),(25,'small',1),(26,'small',1),(27,'small',1),(28,'small',1),(29,'small',1),(30,'small',1),(31,'small',1),(32,'small',1),(33,'small',1),(34,'small',1),(35,'small',1),(36,'small',1),(37,'small',1),(38,'double',1),(39,'double',1),(40,'double',1),(41,'double',1),(42,'double',1),(43,'double',1),(44,'double',1),(45,'double',1),(46,'double',1),(47,'double',1),(48,'double',1),(49,'double',1),(50,'double',1),(51,'double',1),(52,'small',2),(53,'small',2),(54,'small',2),(55,'small',2),(56,'small',2),(57,'small',2),(58,'small',2),(59,'small',2),(60,'small',2),(61,'small',2),(62,'small',2),(63,'small',2),(64,'small',2),(65,'small',2),(66,'small',2),(67,'small',2),(68,'small',2),(69,'small',2),(70,'small',2),(71,'small',2),(72,'small',2),(73,'small',2),(74,'small',2),(75,'small',2),(76,'small',2),(77,'small',2),(78,'small',2),(79,'small',2),(80,'small',2),(81,'small',2),(82,'small',2),(83,'small',2),(84,'small',2),(85,'small',2),(86,'double',2),(87,'double',2),(88,'double',2),(89,'double',2),(90,'double',2),(91,'double',2),(92,'double',2),(93,'double',2),(94,'double',2),(95,'simple',2),(96,'double',2),(97,'double',2),(98,'double',2),(99,'double',2),(100,'double',2),(101,'double',2),(102,'double',2),(103,'small',3),(104,'small',3),(105,'small',3),(106,'small',3),(107,'small',3),(108,'small',3),(109,'small',3),(110,'small',3),(111,'small',3),(112,'small',3),(113,'small',3),(114,'small',3),(115,'small',3),(116,'small',3),(117,'small',3),(118,'small',3),(119,'small',3),(120,'small',3),(121,'small',3),(122,'small',3),(123,'small',3),(124,'small',3),(125,'small',3),(126,'small',3),(127,'small',3),(128,'small',3),(129,'small',3),(130,'small',3),(131,'small',3),(132,'small',3),(133,'small',3),(134,'small',3),(135,'small',3),(136,'small',3),(137,'small',3),(138,'small',3),(139,'double',3),(140,'double',3),(141,'double',3),(142,'double',3),(143,'double',3),(144,'double',3),(145,'double',3),(146,'double',3),(147,'double',3),(148,'double',3),(149,'small',3),(150,'double',3),(151,'double',3),(152,'double',3),(153,'double',3),(154,'double',3),(155,'double',3),(156,'double',3),(157,'double',3),(158,'double',3),(159,'double',3),(160,'double',3);
/*!40000 ALTER TABLE `car_places` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cars`
--

DROP TABLE IF EXISTS `cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cars` (
  `car_id` int(11) NOT NULL AUTO_INCREMENT,
  `place_id` int(11) NOT NULL,
  `car_plate` varchar(8) NOT NULL,
  `car_size` tinytext NOT NULL,
  PRIMARY KEY (`car_id`,`place_id`),
  KEY `FK_PLACE` (`place_id`),
  CONSTRAINT `FK_PLACE` FOREIGN KEY (`place_id`) REFERENCES `car_places` (`place_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cars`
--

LOCK TABLES `cars` WRITE;
/*!40000 ALTER TABLE `cars` DISABLE KEYS */;
INSERT INTO `cars` VALUES (1,52,'kdw402','small'),(2,66,'ute532','small'),(3,85,'aa293uc','small'),(4,49,'isd019','small'),(5,73,'dus931','small'),(6,60,'lps454','small'),(7,53,'fkx657','small'),(8,83,'ksx032','small'),(9,80,'pcx392','small'),(10,78,'wpc446','small'),(11,64,'cki103','small'),(12,65,'aa239vc','small'),(13,70,'qzk814','small'),(14,62,'af252sd','small'),(15,75,'cwq235','small'),(16,81,'vbb816','small'),(17,84,'coe194','small');
/*!40000 ALTER TABLE `cars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `client_id` int(11) NOT NULL AUTO_INCREMENT,
  `car_id` int(11) NOT NULL,
  `client_name` tinytext NOT NULL,
  `client_lastname` tinytext NOT NULL,
  PRIMARY KEY (`client_id`,`car_id`),
  KEY `FK_CAR` (`car_id`),
  CONSTRAINT `FK_CAR` FOREIGN KEY (`car_id`) REFERENCES `cars` (`car_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,1,'Ashleigh','Dobbs'),(2,2,'Toddie','Bocken'),(3,3,'Cody','MacDiarmid'),(4,4,'Eddie','Ilett'),(5,5,'Mehetabel','Chudleigh'),(6,6,'Georges','Buckthorp'),(7,7,'Malorie','Bagwell'),(8,8,'Alf','Clemenzi'),(9,9,'Ingaborg','Strudwick'),(10,10,'Isahella','MacAirt'),(11,11,'Dominik','Portsmouth'),(12,12,'June','Whichelow'),(13,13,'Dara','Chiommienti'),(14,14,'Barbabas','Gallanders'),(15,15,'Gerhardine','Caudle'),(16,16,'Gael','Buyers'),(17,17,'Frank','Georgescu');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily_clients`
--

DROP TABLE IF EXISTS `daily_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `daily_clients` (
  `car_id` int(11) NOT NULL,
  `leaving_date` datetime DEFAULT NULL,
  `entry_date` datetime DEFAULT NULL,
  PRIMARY KEY (`car_id`),
  CONSTRAINT `FK_DAILY_CLIENT` FOREIGN KEY (`car_id`) REFERENCES `cars` (`car_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_clients`
--

LOCK TABLES `daily_clients` WRITE;
/*!40000 ALTER TABLE `daily_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `daily_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `floor_level`
--

DROP TABLE IF EXISTS `floor_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `floor_level` (
  `level_id` int(11) NOT NULL AUTO_INCREMENT,
  `level_name` varchar(15) NOT NULL,
  PRIMARY KEY (`level_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `floor_level`
--

LOCK TABLES `floor_level` WRITE;
/*!40000 ALTER TABLE `floor_level` DISABLE KEYS */;
INSERT INTO `floor_level` VALUES (1,'planta baja'),(2,'primer piso'),(3,'segundo piso');
/*!40000 ALTER TABLE `floor_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monthly_clients`
--

DROP TABLE IF EXISTS `monthly_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monthly_clients` (
  `client_id` int(11) NOT NULL,
  `last_payment` date NOT NULL,
  PRIMARY KEY (`client_id`),
  CONSTRAINT `FK_MONTHLY_CLIENTS` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monthly_clients`
--

LOCK TABLES `monthly_clients` WRITE;
/*!40000 ALTER TABLE `monthly_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `monthly_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'parking_system_bk'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-06 10:59:12
