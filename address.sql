CREATE DATABASE  IF NOT EXISTS `address` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `address`;
-- MySQL dump 10.13  Distrib 8.0.17, for macos10.14 (x86_64)
--
-- Host: localhost    Database: address
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `people`
--

DROP TABLE IF EXISTS `people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `people` (
  `peopleno` int(11) NOT NULL AUTO_INCREMENT,
  `peoplename` varchar(45) DEFAULT NULL,
  `peopleemail` varchar(45) DEFAULT NULL,
  `peoplerelation` varchar(45) DEFAULT NULL,
  `peoplememo` text,
  `peopleimage` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`peopleno`),
  UNIQUE KEY `peopleid_UNIQUE` (`peopleno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `people`
--

LOCK TABLES `people` WRITE;
/*!40000 ALTER TABLE `people` DISABLE KEYS */;
/*!40000 ALTER TABLE `people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phone`
--

DROP TABLE IF EXISTS `phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phone` (
  `phoneno` int(11) NOT NULL AUTO_INCREMENT COMMENT '등록된 사람의 연락처 Sequence no',
  `people_peopleno` int(11) NOT NULL,
  `phonetel` varchar(45) DEFAULT NULL COMMENT '등록된 사람의 연락처\nPeople phone number',
  PRIMARY KEY (`phoneno`,`people_peopleno`),
  UNIQUE KEY `phoneno_UNIQUE` (`phoneno`),
  KEY `fk_phone_people1_idx` (`people_peopleno`),
  CONSTRAINT `fk_phone_people1` FOREIGN KEY (`people_peopleno`) REFERENCES `people` (`peopleno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phone`
--

LOCK TABLES `phone` WRITE;
/*!40000 ALTER TABLE `phone` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `register`
--

DROP TABLE IF EXISTS `register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `register` (
  `userinfo_useremail` varchar(45) NOT NULL,
  `registerdeletedate` date DEFAULT NULL,
  `people_peopleno` int(11) NOT NULL,
  PRIMARY KEY (`userinfo_useremail`,`people_peopleno`),
  KEY `fk_register_people1_idx` (`people_peopleno`),
  CONSTRAINT `fk_register_people1` FOREIGN KEY (`people_peopleno`) REFERENCES `people` (`peopleno`),
  CONSTRAINT `fk_register_userinfo` FOREIGN KEY (`userinfo_useremail`) REFERENCES `userinfo` (`useremail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `register`
--

LOCK TABLES `register` WRITE;
/*!40000 ALTER TABLE `register` DISABLE KEYS */;
/*!40000 ALTER TABLE `register` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `peoplefavorite` int(11) DEFAULT NULL,
  `peopleemg` int(11) DEFAULT NULL,
  `userinfo_useremail` varchar(45) NOT NULL,
  `people_peopleno` int(11) NOT NULL,
  PRIMARY KEY (`userinfo_useremail`,`people_peopleno`),
  KEY `fk_table1_userinfo1_idx` (`userinfo_useremail`),
  KEY `fk_table1_people1_idx` (`people_peopleno`),
  CONSTRAINT `fk_table1_people1` FOREIGN KEY (`people_peopleno`) REFERENCES `people` (`peopleno`),
  CONSTRAINT `fk_table1_userinfo1` FOREIGN KEY (`userinfo_useremail`) REFERENCES `userinfo` (`useremail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userInfo`
--

DROP TABLE IF EXISTS `userInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userInfo` (
  `useremail` varchar(45) NOT NULL,
  `username` varchar(10) DEFAULT NULL,
  `userpw` varchar(45) DEFAULT NULL,
  `userphone` varchar(13) DEFAULT NULL,
  `userdeletedate` date DEFAULT NULL,
  `userimage` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`useremail`),
  UNIQUE KEY `useremail_UNIQUE` (`useremail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userInfo`
--

LOCK TABLES `userInfo` WRITE;
/*!40000 ALTER TABLE `userInfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `userInfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-23 18:00:29
