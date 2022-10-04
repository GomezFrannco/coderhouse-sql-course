-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: parking_systemv3
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
-- Table structure for table `hourly_clients`
--

DROP TABLE IF EXISTS `hourly_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hourly_clients` (
  `vehicle_id` int(11) NOT NULL,
  `fee_type` int(11) NOT NULL,
  `entry_date` datetime NOT NULL,
  `leaving_date` datetime DEFAULT NULL,
  KEY `FK_CUSTOMER_VEHICLE_HOUR` (`vehicle_id`),
  KEY `FK_CUSTOMER_PAYMENT_HOUR` (`fee_type`),
  CONSTRAINT `FK_CUSTOMER_PAYMENT_HOUR` FOREIGN KEY (`fee_type`) REFERENCES `hourly_fees` (`fee_type`),
  CONSTRAINT `FK_CUSTOMER_VEHICLE_HOUR` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`vehicle_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hourly_clients`
--

LOCK TABLES `hourly_clients` WRITE;
/*!40000 ALTER TABLE `hourly_clients` DISABLE KEYS */;
INSERT INTO `hourly_clients` VALUES (1,3,'2022-10-03 21:13:48',NULL),(2,1,'2022-10-03 21:13:48',NULL),(10,4,'2022-10-03 21:13:48',NULL);
/*!40000 ALTER TABLE `hourly_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hourly_fees`
--

DROP TABLE IF EXISTS `hourly_fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hourly_fees` (
  `fee_type` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_type` int(11) NOT NULL,
  `n_hours` int(11) NOT NULL,
  `fee_price` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`fee_type`),
  KEY `FK_VEHICLE_PRICE_HOUR` (`vehicle_type`),
  CONSTRAINT `FK_VEHICLE_PRICE_HOUR` FOREIGN KEY (`vehicle_type`) REFERENCES `vehicle_type` (`vehicle_type`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hourly_fees`
--

LOCK TABLES `hourly_fees` WRITE;
/*!40000 ALTER TABLE `hourly_fees` DISABLE KEYS */;
INSERT INTO `hourly_fees` VALUES (1,2,1,350.00),(2,3,1,350.00),(3,4,1,390.00),(4,2,12,1400.00),(5,3,12,1400.00),(6,4,12,1560.00),(7,2,24,2800.00),(8,3,24,2800.00),(9,4,24,3120.00);
/*!40000 ALTER TABLE `hourly_fees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `levels`
--

DROP TABLE IF EXISTS `levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `levels` (
  `level_id` int(11) NOT NULL AUTO_INCREMENT,
  `level_name` tinytext DEFAULT NULL,
  PRIMARY KEY (`level_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `levels`
--

LOCK TABLES `levels` WRITE;
/*!40000 ALTER TABLE `levels` DISABLE KEYS */;
INSERT INTO `levels` VALUES (1,'planta baja'),(2,'primer piso'),(3,'segundo piso');
/*!40000 ALTER TABLE `levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_monthly_clients`
--

DROP TABLE IF EXISTS `log_monthly_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_monthly_clients` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `action_name` varchar(10) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `vehicle_id_updt` int(11) DEFAULT NULL,
  `client_name_updt` tinytext DEFAULT NULL,
  `client_lastname_updt` tinytext DEFAULT NULL,
  `client_phone_updt` varchar(10) DEFAULT NULL,
  `user_name` varchar(40) DEFAULT NULL,
  `log_date` datetime DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_monthly_clients`
--

LOCK TABLES `log_monthly_clients` WRITE;
/*!40000 ALTER TABLE `log_monthly_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_monthly_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_payments`
--

DROP TABLE IF EXISTS `log_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_payments` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `action_name` varchar(10) DEFAULT NULL,
  `payment_id` int(11) NOT NULL,
  `payment_date` datetime NOT NULL,
  `user_name` varchar(40) DEFAULT NULL,
  `log_date` datetime DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_payments`
--

LOCK TABLES `log_payments` WRITE;
/*!40000 ALTER TABLE `log_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monthly_clients`
--

DROP TABLE IF EXISTS `monthly_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monthly_clients` (
  `client_id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `client_name` tinytext NOT NULL,
  `client_lastname` tinytext NOT NULL,
  `client_phone` varchar(10) NOT NULL,
  PRIMARY KEY (`client_id`),
  KEY `FK_CUSTOMERS_VEHICLE_MONTH` (`vehicle_id`),
  KEY `FK_CUSTOMERS_PAYMENT_MONTH` (`payment_id`),
  CONSTRAINT `FK_CUSTOMERS_PAYMENT_MONTH` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`payment_id`),
  CONSTRAINT `FK_CUSTOMERS_VEHICLE_MONTH` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`vehicle_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monthly_clients`
--

LOCK TABLES `monthly_clients` WRITE;
/*!40000 ALTER TABLE `monthly_clients` DISABLE KEYS */;
INSERT INTO `monthly_clients` VALUES (1,3,1,'Jorge','Mandela','1123938472'),(2,7,2,'Javier','Martinez','1184345547'),(3,5,3,'Juan','Miranda','1197615428'),(4,4,4,'Jose','Molina','1133124084'),(5,10,5,'Jairo','Mesa','1166203704'),(6,9,6,'Joaquin','Mejia','1100214508'),(7,8,7,'Joel','Muñoz','1197056449');
/*!40000 ALTER TABLE `monthly_clients` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER TRG_new_monthly_clients_logger AFTER INSERT ON PARKING_SYSTEMV3.MONTHLY_CLIENTS

FOR EACH ROW

BEGIN

  INSERT INTO LOG_MONTHLY_CLIENTS (action_name, client_id, vehicle_id, user_name, log_date)

  VALUES ("INSERT", NEW.client_id, NEW.vehicle_id, SESSION_USER(), NOW());

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER TRG_changes_monthly_clients_logger AFTER UPDATE ON PARKING_SYSTEMV3.MONTHLY_CLIENTS

FOR EACH ROW

BEGIN

  INSERT INTO LOG_MONTHLY_CLIENTS (action_name, client_id,vehicle_id, vehicle_id_updt, client_name_updt, client_lastname_updt, client_phone_updt, user_name, log_date)

  VALUES ("UPDATE", NEW.client_id, OLD.vehicle_id, NEW.vehicle_id, NEW.client_name, NEW.client_lastname, NEW.client_phone, SESSION_USER(), NOW());

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `monthly_fees`
--

DROP TABLE IF EXISTS `monthly_fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monthly_fees` (
  `fee_type` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_type` int(11) NOT NULL,
  `fee_price` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`fee_type`),
  KEY `FK_VEHICLE_PRICE_MONTH` (`vehicle_type`),
  CONSTRAINT `FK_VEHICLE_PRICE_MONTH` FOREIGN KEY (`vehicle_type`) REFERENCES `vehicle_type` (`vehicle_type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monthly_fees`
--

LOCK TABLES `monthly_fees` WRITE;
/*!40000 ALTER TABLE `monthly_fees` DISABLE KEYS */;
INSERT INTO `monthly_fees` VALUES (1,1,5000.00),(2,2,8500.00),(3,3,8500.00),(4,4,11000.00);
/*!40000 ALTER TABLE `monthly_fees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `fee_type` int(11) NOT NULL,
  `payment_date` datetime NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `FK_PAYMENTS_FEE` (`fee_type`),
  CONSTRAINT `FK_PAYMENTS_FEE` FOREIGN KEY (`fee_type`) REFERENCES `monthly_fees` (`fee_type`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,3,'2022-10-03 21:13:48'),(2,3,'2022-10-03 21:13:48'),(3,2,'2022-10-03 21:13:48'),(4,2,'2022-10-03 21:13:48'),(5,4,'2022-10-03 21:13:48'),(6,4,'2022-10-03 21:13:48'),(7,4,'2022-10-03 21:13:48');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER TRG_new_payments_logger AFTER INSERT ON PARKING_SYSTEMV3.PAYMENTS 

FOR EACH ROW 

BEGIN

  INSERT INTO LOG_PAYMENTS (action_name, payment_id, payment_date, user_name, log_date)

  VALUES ("INSERT", NEW.payment_id, NEW.payment_date, SESSION_USER(), NOW());

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `place_type`
--

DROP TABLE IF EXISTS `place_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `place_type` (
  `place_type` int(11) NOT NULL AUTO_INCREMENT,
  `place_size` tinytext DEFAULT NULL,
  PRIMARY KEY (`place_type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `place_type`
--

LOCK TABLES `place_type` WRITE;
/*!40000 ALTER TABLE `place_type` DISABLE KEYS */;
INSERT INTO `place_type` VALUES (1,'simple'),(2,'doble');
/*!40000 ALTER TABLE `place_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `places`
--

DROP TABLE IF EXISTS `places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `places` (
  `place_id` decimal(4,1) NOT NULL,
  `level_id` int(11) NOT NULL,
  `place_type` int(11) NOT NULL,
  PRIMARY KEY (`place_id`),
  KEY `FK_PLACE_TYPE` (`place_type`),
  KEY `FK_PLACE_FLOOR` (`level_id`),
  CONSTRAINT `FK_PLACE_FLOOR` FOREIGN KEY (`level_id`) REFERENCES `levels` (`level_id`),
  CONSTRAINT `FK_PLACE_TYPE` FOREIGN KEY (`place_type`) REFERENCES `place_type` (`place_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `places`
--

LOCK TABLES `places` WRITE;
/*!40000 ALTER TABLE `places` DISABLE KEYS */;
INSERT INTO `places` VALUES (1.0,1,1),(2.0,1,1),(3.0,1,1),(4.0,1,1),(5.0,1,1),(6.0,1,1),(7.0,1,1),(8.0,1,1),(9.0,1,1),(10.0,1,1),(11.0,1,1),(12.0,1,1),(13.0,1,1),(14.0,1,1),(15.0,1,1),(16.0,1,1),(17.0,1,1),(18.0,1,1),(19.0,1,1),(20.0,1,1),(21.0,1,1),(22.0,1,1),(23.0,1,1),(24.0,1,1),(25.0,1,1),(26.0,1,1),(27.0,1,1),(28.0,1,1),(29.0,1,1),(30.0,1,1),(31.0,1,1),(32.0,1,1),(33.0,1,1),(34.0,1,1),(35.0,1,1),(36.0,1,1),(37.0,1,2),(37.2,1,2),(38.0,1,2),(38.2,1,2),(39.0,1,2),(39.2,1,2),(40.0,1,2),(40.2,1,2),(41.0,1,2),(41.2,1,2),(42.0,1,2),(42.2,1,2),(43.0,1,2),(43.2,1,2),(44.0,1,2),(44.2,1,2),(45.0,1,2),(45.2,1,2),(46.0,1,2),(46.2,1,2),(47.0,1,2),(47.2,1,2),(48.0,1,2),(48.2,1,2),(49.0,1,2),(49.2,1,2),(50.0,1,2),(50.2,1,2),(51.0,1,2),(51.2,1,2),(52.0,2,1),(53.0,2,1),(54.0,2,1),(55.0,2,1),(56.0,2,1),(57.0,2,1),(58.0,2,1),(59.0,2,1),(60.0,2,1),(61.0,2,1),(62.0,2,1),(63.0,2,1),(64.0,2,1),(65.0,2,1),(66.0,2,1),(67.0,2,1),(68.0,2,1),(69.0,2,1),(70.0,2,1),(71.0,2,1),(72.0,2,1),(73.0,2,1),(74.0,2,1),(75.0,2,1),(76.0,2,1),(77.0,2,1),(78.0,2,1),(79.0,2,1),(80.0,2,1),(81.0,2,1),(82.0,2,1),(83.0,2,1),(84.0,2,1),(85.0,2,1),(86.0,2,2),(86.2,2,2),(87.0,2,2),(87.2,2,2),(88.0,2,2),(88.2,2,2),(89.0,2,2),(89.2,2,2),(90.0,2,2),(90.2,2,2),(91.0,2,2),(91.2,2,2),(92.0,2,2),(92.2,2,2),(93.0,2,2),(93.2,2,2),(94.0,2,2),(94.2,2,2),(95.0,2,1),(96.0,2,1),(97.0,2,2),(97.2,2,2),(98.0,2,2),(98.2,2,2),(99.0,2,2),(99.2,2,2),(100.0,2,2),(100.2,2,2),(101.0,2,2),(101.2,2,2),(102.0,2,2),(102.2,2,2),(103.0,3,1),(104.0,3,1),(105.0,3,1),(106.0,3,1),(107.0,3,1),(108.0,3,1),(109.0,3,1),(110.0,3,1),(111.0,3,1),(112.0,3,1),(113.0,3,1),(114.0,3,1),(115.0,3,1),(116.0,3,1),(117.0,3,1),(118.0,3,1),(119.0,3,1),(120.0,3,1),(121.0,3,1),(122.0,3,1),(123.0,3,1),(124.0,3,1),(125.0,3,1),(126.0,3,1),(127.0,3,1),(128.0,3,1),(129.0,3,1),(130.0,3,1),(131.0,3,1),(132.0,3,1),(133.0,3,1),(134.0,3,1),(135.0,3,1),(136.0,3,1),(137.0,3,1),(138.0,3,1),(139.0,3,2),(139.2,3,2),(140.0,3,2),(140.2,3,2),(141.0,3,2),(141.2,3,2),(142.0,3,2),(142.2,3,2),(143.0,3,2),(143.2,3,2),(144.0,3,2),(144.2,3,2),(145.0,3,1),(146.0,3,1),(147.0,3,2),(147.2,3,2),(148.0,3,2),(148.2,3,2),(149.0,3,2),(149.2,3,2),(150.0,3,2),(150.2,3,2),(151.0,3,2),(151.2,3,2),(152.0,3,2),(152.2,3,2),(153.0,3,2),(153.2,3,2),(154.0,3,2),(154.2,3,2),(155.0,3,2),(155.2,3,2),(156.0,3,2),(156.2,3,2),(157.0,3,2),(157.2,3,2),(158.0,3,2),(158.2,3,2),(159.0,3,2),(159.2,3,2),(160.0,3,2),(160.2,3,2);
/*!40000 ALTER TABLE `places` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_type`
--

DROP TABLE IF EXISTS `vehicle_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle_type` (
  `vehicle_type` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` tinytext NOT NULL,
  PRIMARY KEY (`vehicle_type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_type`
--

LOCK TABLES `vehicle_type` WRITE;
/*!40000 ALTER TABLE `vehicle_type` DISABLE KEYS */;
INSERT INTO `vehicle_type` VALUES (1,'moto'),(2,'auto'),(3,'suv'),(4,'camioneta');
/*!40000 ALTER TABLE `vehicle_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicles`
--

DROP TABLE IF EXISTS `vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicles` (
  `vehicle_id` int(11) NOT NULL AUTO_INCREMENT,
  `place_id` decimal(4,1) NOT NULL,
  `vehicle_type` int(11) NOT NULL,
  `vehicle_color` tinytext NOT NULL,
  `vehicle_plate` varchar(7) NOT NULL,
  PRIMARY KEY (`vehicle_id`),
  KEY `FK_VEHICLES_PLACES` (`place_id`),
  KEY `FK_VEHICLE_TYPE` (`vehicle_type`),
  CONSTRAINT `FK_VEHICLES_PLACES` FOREIGN KEY (`place_id`) REFERENCES `places` (`place_id`),
  CONSTRAINT `FK_VEHICLE_TYPE` FOREIGN KEY (`vehicle_type`) REFERENCES `vehicle_type` (`vehicle_type`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicles`
--

LOCK TABLES `vehicles` WRITE;
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
INSERT INTO `vehicles` VALUES (1,44.0,4,'rojo','AE203CD'),(2,44.2,2,'blanco','AA235LD'),(3,49.0,3,'gris','AD293EF'),(4,96.0,3,'negro','AE973XW'),(5,155.0,2,'gris','AD271KG'),(6,139.0,2,'gris','KCE941'),(7,120.0,4,'gris','AC923SF'),(8,115.0,4,'blanco','OFX931'),(9,101.0,4,'blanco','AA261FE'),(10,9.0,2,'marron','MGD707');
/*!40000 ALTER TABLE `vehicles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vw_info_clientes_diarios`
--

DROP TABLE IF EXISTS `vw_info_clientes_diarios`;
/*!50001 DROP VIEW IF EXISTS `vw_info_clientes_diarios`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_info_clientes_diarios` (
  `vehiculo` tinyint NOT NULL,
  `matrícula` tinyint NOT NULL,
  `color` tinyint NOT NULL,
  `cochera` tinyint NOT NULL,
  `tamaño_cochera` tinyint NOT NULL,
  `piso` tinyint NOT NULL,
  `llegada` tinyint NOT NULL,
  `salida` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_info_clientes_mensuales`
--

DROP TABLE IF EXISTS `vw_info_clientes_mensuales`;
/*!50001 DROP VIEW IF EXISTS `vw_info_clientes_mensuales`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_info_clientes_mensuales` (
  `nombre` tinyint NOT NULL,
  `apellido` tinyint NOT NULL,
  `teléfono` tinyint NOT NULL,
  `vehiculo` tinyint NOT NULL,
  `matrícula` tinyint NOT NULL,
  `color` tinyint NOT NULL,
  `cochera` tinyint NOT NULL,
  `piso` tinyint NOT NULL,
  `útlimo_pago` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_info_clientes_mes_pago`
--

DROP TABLE IF EXISTS `vw_info_clientes_mes_pago`;
/*!50001 DROP VIEW IF EXISTS `vw_info_clientes_mes_pago`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_info_clientes_mes_pago` (
  `nombre` tinyint NOT NULL,
  `apellido` tinyint NOT NULL,
  `teléfono` tinyint NOT NULL,
  `vehiculo` tinyint NOT NULL,
  `matrícula` tinyint NOT NULL,
  `color` tinyint NOT NULL,
  `cochera` tinyint NOT NULL,
  `piso` tinyint NOT NULL,
  `útlimo_pago` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_info_cocheras_ocupadas`
--

DROP TABLE IF EXISTS `vw_info_cocheras_ocupadas`;
/*!50001 DROP VIEW IF EXISTS `vw_info_cocheras_ocupadas`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_info_cocheras_ocupadas` (
  `numero_cochera` tinyint NOT NULL,
  `tamaño_cochera` tinyint NOT NULL,
  `piso` tinyint NOT NULL,
  `vehiculo` tinyint NOT NULL,
  `color` tinyint NOT NULL,
  `matrícula` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_info_disponibilidad_total`
--

DROP TABLE IF EXISTS `vw_info_disponibilidad_total`;
/*!50001 DROP VIEW IF EXISTS `vw_info_disponibilidad_total`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_info_disponibilidad_total` (
  `numero_cochera` tinyint NOT NULL,
  `tamaño_cochera` tinyint NOT NULL,
  `piso` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_info_vehiculos_por_estadia`
--

DROP TABLE IF EXISTS `vw_info_vehiculos_por_estadia`;
/*!50001 DROP VIEW IF EXISTS `vw_info_vehiculos_por_estadia`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_info_vehiculos_por_estadia` (
  `cochera` tinyint NOT NULL,
  `piso` tinyint NOT NULL,
  `matricula` tinyint NOT NULL,
  `vehiculo` tinyint NOT NULL,
  `color` tinyint NOT NULL,
  `horas` tinyint NOT NULL,
  `total` tinyint NOT NULL,
  `llegada` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'parking_systemv3'
--
/*!50003 DROP FUNCTION IF EXISTS `FN_fee_por_servicio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FN_fee_por_servicio`(matricula VARCHAR(7)) RETURNS int(11)
    NO SQL
BEGIN

	DECLARE fee INT; -- Monto por el tipo de servicio

 	SELECT hf.fee_price

	FROM HOURLY_FEES hf

	INNER JOIN HOURLY_CLIENTS hc ON hc.fee_id = hf.fee_id

	INNER JOIN VEHICLES v ON v.vehicle_id = hc.vehicle_id

	WHERE v.vehicle_plate = matricula

	INTO fee;

	RETURN fee;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `FN_horas_en_cochera` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FN_horas_en_cochera`(matricula VARCHAR(7)) RETURNS int(11)
    NO SQL
BEGIN

	DECLARE entryDate DATETIME; -- Cuando entró el vehiculo.

	DECLARE leavingDate DATETIME; -- Cuando se retiró el vehiculo.

	DECLARE hours INT; -- Cantidad de tiempo que estuvo el vehiculo dentro del garage.

	SELECT entry_date

	FROM HOURLY_CLIENTS 

	WHERE vehicle_id = 

	(SELECT vehicle_id FROM VEHICLES WHERE vehicle_plate = matricula)

	INTO entryDate;

	SELECT leaving_date

	FROM HOURLY_CLIENTS 

	WHERE vehicle_id = 

	(SELECT vehicle_id FROM VEHICLES WHERE vehicle_plate = matricula)

	INTO leavingDate;

	SELECT ROUND((TIMESTAMPDIFF(MINUTE, entryDate, leavingDate) / 60))

	INTO hours; /* Se divide a los minutos entre 60 para obtener las horas y redondearlas hacia arriba (lógica propia del negocio) */

	IF hours > 4 && hours <= 12 THEN

		RETURN 4;

	ELSE

		RETURN hours;

	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `FN_n_cocheras_disponibles` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FN_n_cocheras_disponibles`(piso INT) RETURNS int(11)
    NO SQL
BEGIN

  DECLARE query INT;

  DECLARE levelId INT;

  SET levelId = piso;

  SELECT COUNT(pl.place_id)

  FROM PLACES pl

  WHERE pl.place_id NOT IN 

    (SELECT v.place_id FROM VEHICLES v) 

  AND pl.level_id = levelId

  INTO query;

  RETURN query;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `FN_precio_total` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FN_precio_total`(matricula VARCHAR(7)) RETURNS int(11)
    NO SQL
BEGIN

	DECLARE fee INT;

	DECLARE hours INT;

	DECLARE total INT;

	SELECT FN_horas_en_cochera(matricula) INTO hours;

	SELECT FN_fee_por_servicio(matricula) INTO fee;

	SELECT (hours * fee) INTO total;

	RETURN total;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_add_new_client` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_add_new_client`(IN c_name TEXT(10), IN c_lastname TEXT(15), IN c_phone VARCHAR(10), IN plate VARCHAR(7), IN vehicleType TEXT(9))
BEGIN

  DECLARE vehicleId INT;

  DECLARE fee INT;

  DECLARE lastPayment INT;

  SELECT vehicle_id 

  FROM VEHICLES 

  WHERE vehicle_plate = plate

  INTO vehicleId;

  SELECT fee_type

  FROM MONTHLY_FEES

  WHERE vehicle_type = 

    (SELECT vehicle_type FROM VEHICLE_TYPE WHERE type_name = vehicleType)

  INTO fee;

  INSERT INTO PAYMENTS (fee_type, payment_date)

  VALUES (fee, NOW());

  SELECT (payment_id)

  FROM PAYMENTS

  ORDER BY payment_id DESC

  LIMIT 1 INTO lastPayment;

  INSERT INTO MONTHLY_CLIENTS(vehicle_id, payment_id, client_name, client_lastname, client_phone)

  VALUES (vehicleId, lastPayment, c_name, c_lastname, c_phone);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_add_new_vehicle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_add_new_vehicle`(IN place INT, IN vehicleType TEXT(9), IN color TEXT(10), plate VARCHAR(7))
BEGIN

  DECLARE vtype INT;

  SELECT vehicle_type

  FROM VEHICLE_TYPE

  WHERE type_name = vehicleType

  INTO vtype;

  INSERT INTO VEHICLES (place_id, vehicle_type, vehicle_color, vehicle_plate)

  VALUES (place, vtype, color, plate);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_info_clientes_diarios`
--

/*!50001 DROP TABLE IF EXISTS `vw_info_clientes_diarios`*/;
/*!50001 DROP VIEW IF EXISTS `vw_info_clientes_diarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_info_clientes_diarios` AS (select `vt`.`type_name` AS `vehiculo`,`v`.`vehicle_plate` AS `matrícula`,`v`.`vehicle_color` AS `color`,`v`.`place_id` AS `cochera`,`pt`.`place_size` AS `tamaño_cochera`,`l`.`level_name` AS `piso`,`hc`.`entry_date` AS `llegada`,`hc`.`leaving_date` AS `salida` from ((((((`hourly_clients` `hc` join `vehicles` `v` on(`v`.`vehicle_id` = `hc`.`vehicle_id`)) join `vehicle_type` `vt` on(`vt`.`vehicle_type` = `v`.`vehicle_type`)) join `places` `pl` on(`pl`.`place_id` = `v`.`place_id`)) join `place_type` `pt` on(`pt`.`place_type` = `pl`.`place_type`)) join `levels` `l` on(`l`.`level_id` = `pl`.`level_id`)) join `hourly_fees` `hf` on(`hf`.`fee_type` = `hc`.`fee_type`)) where `hf`.`n_hours` < 12 order by `v`.`place_id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_info_clientes_mensuales`
--

/*!50001 DROP TABLE IF EXISTS `vw_info_clientes_mensuales`*/;
/*!50001 DROP VIEW IF EXISTS `vw_info_clientes_mensuales`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_info_clientes_mensuales` AS (select `mc`.`client_name` AS `nombre`,`mc`.`client_lastname` AS `apellido`,`mc`.`client_phone` AS `teléfono`,`vt`.`type_name` AS `vehiculo`,`v`.`vehicle_plate` AS `matrícula`,`v`.`vehicle_color` AS `color`,`v`.`place_id` AS `cochera`,`l`.`level_name` AS `piso`,`p`.`payment_date` AS `útlimo_pago` from (((((`monthly_clients` `mc` join `vehicles` `v` on(`v`.`vehicle_id` = `mc`.`vehicle_id`)) join `vehicle_type` `vt` on(`vt`.`vehicle_type` = `v`.`vehicle_type`)) join `places` `pl` on(`pl`.`place_id` = `v`.`place_id`)) join `levels` `l` on(`l`.`level_id` = `pl`.`level_id`)) join `payments` `p` on(`p`.`payment_id` = `mc`.`payment_id`)) order by `v`.`place_id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_info_clientes_mes_pago`
--

/*!50001 DROP TABLE IF EXISTS `vw_info_clientes_mes_pago`*/;
/*!50001 DROP VIEW IF EXISTS `vw_info_clientes_mes_pago`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_info_clientes_mes_pago` AS (select `mc`.`client_name` AS `nombre`,`mc`.`client_lastname` AS `apellido`,`mc`.`client_phone` AS `teléfono`,`vt`.`type_name` AS `vehiculo`,`v`.`vehicle_plate` AS `matrícula`,`v`.`vehicle_color` AS `color`,`v`.`place_id` AS `cochera`,`l`.`level_name` AS `piso`,`p`.`payment_date` AS `útlimo_pago` from (((((`monthly_clients` `mc` join `vehicles` `v` on(`v`.`vehicle_id` = `mc`.`vehicle_id`)) join `vehicle_type` `vt` on(`vt`.`vehicle_type` = `v`.`vehicle_type`)) join `places` `pl` on(`pl`.`place_id` = `v`.`place_id`)) join `levels` `l` on(`l`.`level_id` = `pl`.`level_id`)) join `payments` `p` on(`p`.`payment_id` = `mc`.`payment_id`)) where `p`.`payment_date` > curdate() - interval dayofmonth(curdate()) day order by `v`.`place_id` desc) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_info_cocheras_ocupadas`
--

/*!50001 DROP TABLE IF EXISTS `vw_info_cocheras_ocupadas`*/;
/*!50001 DROP VIEW IF EXISTS `vw_info_cocheras_ocupadas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_info_cocheras_ocupadas` AS (select `pl`.`place_id` AS `numero_cochera`,`pt`.`place_size` AS `tamaño_cochera`,`l`.`level_name` AS `piso`,`vt`.`type_name` AS `vehiculo`,`v`.`vehicle_color` AS `color`,`v`.`vehicle_plate` AS `matrícula` from ((((`places` `pl` join `place_type` `pt` on(`pt`.`place_type` = `pl`.`place_type`)) join `vehicles` `v` on(`v`.`place_id` = `pl`.`place_id`)) join `levels` `l` on(`l`.`level_id` = `pl`.`level_id`)) join `vehicle_type` `vt` on(`vt`.`vehicle_type` = `v`.`vehicle_type`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_info_disponibilidad_total`
--

/*!50001 DROP TABLE IF EXISTS `vw_info_disponibilidad_total`*/;
/*!50001 DROP VIEW IF EXISTS `vw_info_disponibilidad_total`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_info_disponibilidad_total` AS (select `pl`.`place_id` AS `numero_cochera`,`pt`.`place_size` AS `tamaño_cochera`,`l`.`level_name` AS `piso` from ((`places` `pl` join `place_type` `pt` on(`pt`.`place_type` = `pl`.`place_type`)) join `levels` `l` on(`l`.`level_id` = `pl`.`level_id`)) where !(`pl`.`place_id` in (select `v`.`place_id` from `vehicles` `v`)) order by `pl`.`place_id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_info_vehiculos_por_estadia`
--

/*!50001 DROP TABLE IF EXISTS `vw_info_vehiculos_por_estadia`*/;
/*!50001 DROP VIEW IF EXISTS `vw_info_vehiculos_por_estadia`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_info_vehiculos_por_estadia` AS (select `v`.`place_id` AS `cochera`,`l`.`level_name` AS `piso`,`v`.`vehicle_plate` AS `matricula`,`vt`.`type_name` AS `vehiculo`,`v`.`vehicle_color` AS `color`,`hf`.`n_hours` AS `horas`,`hf`.`fee_price` AS `total`,`hc`.`entry_date` AS `llegada` from (((((`vehicles` `v` join `places` `p` on(`p`.`place_id` = `v`.`place_id`)) join `levels` `l` on(`l`.`level_id` = `p`.`level_id`)) join `vehicle_type` `vt` on(`vt`.`vehicle_type` = `v`.`vehicle_type`)) join `hourly_clients` `hc` on(`hc`.`vehicle_id` = `v`.`vehicle_id`)) join `hourly_fees` `hf` on(`hf`.`fee_type` = `hc`.`fee_type`)) where `hf`.`n_hours` >= 12 order by `v`.`place_id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-03 21:17:25
