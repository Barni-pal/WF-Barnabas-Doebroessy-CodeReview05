CREATE DATABASE  IF NOT EXISTS `cr05_barnabas_doebroessy_carrental` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cr05_barnabas_doebroessy_carrental`;
-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: cr05_barnabas_doebroessy_carrental
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `additional_services`
--

DROP TABLE IF EXISTS `additional_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `additional_services` (
  `service_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `child_seat(s)` int(11) NOT NULL,
  `delivery_service` int(11) NOT NULL,
  `additional_driver` int(11) NOT NULL,
  PRIMARY KEY (`service_id`),
  KEY `fk_additional_services_payments1_idx` (`payment_id`),
  CONSTRAINT `fk_additional_services_payments1` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `additional_services`
--

LOCK TABLES `additional_services` WRITE;
/*!40000 ALTER TABLE `additional_services` DISABLE KEYS */;
INSERT INTO `additional_services` VALUES (1,3,25,100,0),(2,4,0,100,0),(3,1,0,0,0),(4,5,0,0,250);
/*!40000 ALTER TABLE `additional_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cars`
--

DROP TABLE IF EXISTS `cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cars` (
  `car_id` int(11) NOT NULL,
  `insurance_car_id` int(11) NOT NULL,
  `station_id` int(11) NOT NULL,
  `maintenance_id` int(11) NOT NULL,
  `licence_plate` varchar(45) NOT NULL,
  `state_of_car` varchar(45) NOT NULL,
  `brand` varchar(45) NOT NULL,
  `colour` varchar(25) NOT NULL,
  PRIMARY KEY (`car_id`),
  KEY `fk_cars_insurance_idx` (`insurance_car_id`) /*!80000 INVISIBLE */,
  KEY `fk_cars_maintenance1_idx` (`maintenance_id`),
  KEY `fk_cars_location1_idx` (`station_id`),
  CONSTRAINT `fk_cars_insurance1` FOREIGN KEY (`insurance_car_id`) REFERENCES `insurance` (`insurance_id`),
  CONSTRAINT `fk_cars_location1` FOREIGN KEY (`station_id`) REFERENCES `location` (`station_id`),
  CONSTRAINT `fk_cars_maintenance1` FOREIGN KEY (`maintenance_id`) REFERENCES `maintenance` (`maintenance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cars`
--

LOCK TABLES `cars` WRITE;
/*!40000 ALTER TABLE `cars` DISABLE KEYS */;
INSERT INTO `cars` VALUES (1,1,1,1,'AT-123231','Excellent','BMW','black'),(2,2,2,2,'AT-123331','Excellent','Toyota','brown'),(3,3,3,3,'AT-255122','Good','Volkwswagen','black'),(4,4,1,4,'AT-123232','Out Of Service','Volkswagen','white'),(5,5,2,5,'AT-163424','Good','Ford','yellow');
/*!40000 ALTER TABLE `cars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `client_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `identification_nr` varchar(45) NOT NULL,
  `phone_number` varchar(45) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `state_of_residence` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`client_id`),
  UNIQUE KEY `identification_nr_UNIQUE` (`identification_nr`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'John Doe','51255','0661214214','1990-05-12','Wien'),(2,'Cary Smith','12452','0662112221','1968-01-25','Salzburg'),(3,'Reginald Downstreet','12512','0662121353','1978-02-15','Tirol'),(4,'Eugene Cool','12552','0632186633','1989-06-06','Graz'),(5,'Jelly Beans','82353','0692132424','1959-09-21','Eisenstadt');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insurance`
--

DROP TABLE IF EXISTS `insurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insurance` (
  `insurance_id` int(11) NOT NULL AUTO_INCREMENT,
  `insurance_begin` date NOT NULL,
  `insurance_end` date NOT NULL,
  PRIMARY KEY (`insurance_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurance`
--

LOCK TABLES `insurance` WRITE;
/*!40000 ALTER TABLE `insurance` DISABLE KEYS */;
INSERT INTO `insurance` VALUES (1,'2019-05-01','2021-05-01'),(2,'2019-02-01','2021-02-01'),(3,'2018-12-30','2020-12-30'),(4,'2019-06-12','2021-06-12'),(5,'2019-03-22','2021-03-22');
/*!40000 ALTER TABLE `insurance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice` (
  `invoice_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `invoice_total` decimal(6,2) NOT NULL,
  `payment_total` decimal(6,2) NOT NULL,
  `payment_date` date NOT NULL,
  PRIMARY KEY (`invoice_id`),
  KEY `fk_invoice_clients1_idx` (`client_id`),
  CONSTRAINT `fk_invoice_clients1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
INSERT INTO `invoice` VALUES (1,2,400.00,0.00,'2019-03-27'),(2,4,300.00,10.00,'2018-12-22'),(3,3,250.00,0.00,'2019-05-07'),(4,2,125.00,25.00,'2019-08-21'),(5,5,260.00,0.00,'2019-06-26'),(6,1,960.00,0.00,'2019-11-20');
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `station_id` int(11) NOT NULL,
  `station_name` varchar(45) NOT NULL,
  PRIMARY KEY (`station_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'Hauptbahnhof'),(2,'Stephansplatz'),(3,'Karlsplatz');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenance`
--

DROP TABLE IF EXISTS `maintenance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maintenance` (
  `maintenance_id` int(11) NOT NULL,
  `yearly_costs` decimal(6,2) NOT NULL,
  PRIMARY KEY (`maintenance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance`
--

LOCK TABLES `maintenance` WRITE;
/*!40000 ALTER TABLE `maintenance` DISABLE KEYS */;
INSERT INTO `maintenance` VALUES (1,5000.00),(2,2100.00),(3,1200.00),(4,2100.00),(5,1900.00);
/*!40000 ALTER TABLE `maintenance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_methods`
--

DROP TABLE IF EXISTS `payment_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_methods` (
  `payment_id` int(11) NOT NULL,
  `payment_form` varchar(45) NOT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_methods`
--

LOCK TABLES `payment_methods` WRITE;
/*!40000 ALTER TABLE `payment_methods` DISABLE KEYS */;
INSERT INTO `payment_methods` VALUES (1,'Cash'),(2,'PayPal'),(3,'Western Union'),(4,'Bank Transfer');
/*!40000 ALTER TABLE `payment_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `payment_method_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `fk_payments_payment_methods1_idx` (`payment_method_id`),
  KEY `fk_payments_invoice1_idx` (`invoice_id`),
  KEY `fk_payments_clients1_idx` (`client_id`),
  CONSTRAINT `fk_payments_clients1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`),
  CONSTRAINT `fk_payments_invoice1` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`invoice_id`),
  CONSTRAINT `fk_payments_payment_methods1` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,2,1,1,1000.00),(2,4,1,2,1500.00),(3,3,1,3,850.00),(4,2,3,4,260.00),(5,5,1,5,180.00),(6,1,4,6,1200.00);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rent`
--

DROP TABLE IF EXISTS `rent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rent` (
  `rent_id` int(11) NOT NULL,
  `car_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `location_end` int(11) NOT NULL,
  `rent_date` date NOT NULL,
  `rent_end` date NOT NULL,
  PRIMARY KEY (`rent_id`),
  KEY `fk_rent_cars1_idx` (`car_id`),
  KEY `fk_rent_clients1_idx` (`client_id`),
  KEY `fk_rent_location1_idx` (`location_end`),
  CONSTRAINT `fk_rent_cars1` FOREIGN KEY (`car_id`) REFERENCES `cars` (`car_id`),
  CONSTRAINT `fk_rent_clients1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`),
  CONSTRAINT `fk_rent_location1` FOREIGN KEY (`location_end`) REFERENCES `location` (`station_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rent`
--

LOCK TABLES `rent` WRITE;
/*!40000 ALTER TABLE `rent` DISABLE KEYS */;
INSERT INTO `rent` VALUES (1,1,1,1,'2019-02-21','2019-02-23'),(2,3,2,2,'2019-01-03','2019-01-10'),(3,5,3,3,'2019-11-29','2019-12-02'),(4,3,4,1,'2019-04-07','2019-04-15'),(5,4,5,1,'2019-07-13','2019-07-16'),(6,2,1,1,'2019-03-01','2019-03-11'),(7,1,2,2,'2019-09-25','2019-09-26'),(8,4,3,3,'2019-08-11','2019-08-21');
/*!40000 ALTER TABLE `rent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservations`
--

DROP TABLE IF EXISTS `reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservations` (
  `reservation_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `car_id` int(11) NOT NULL,
  `reservation_start` varchar(45) NOT NULL,
  `reservation_end` varchar(45) NOT NULL,
  PRIMARY KEY (`reservation_id`),
  KEY `fk_reservations_clients1_idx` (`client_id`),
  KEY `fk_reservations_cars1_idx` (`car_id`),
  CONSTRAINT `fk_reservations_cars1` FOREIGN KEY (`car_id`) REFERENCES `cars` (`car_id`),
  CONSTRAINT `fk_reservations_clients1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservations`
--

LOCK TABLES `reservations` WRITE;
/*!40000 ALTER TABLE `reservations` DISABLE KEYS */;
INSERT INTO `reservations` VALUES (1,1,2,'2020-01-12','2020-01-13'),(2,3,1,'2020-02-28','2020-02-30'),(3,5,3,'2019-12-30','2020-01-03');
/*!40000 ALTER TABLE `reservations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-22 21:18:55
