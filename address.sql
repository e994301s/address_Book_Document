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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `people`
--

LOCK TABLES `people` WRITE;
/*!40000 ALTER TABLE `people` DISABLE KEYS */;
INSERT INTO `people` VALUES (16,'김대환','asdf@naver.com','친구','술친구','null'),(17,'김기현','kqwer@naver.com','친구','고등학교 친구','null'),(18,'박인우','ddddvvhh@naver.com','친구','탑만 감','null'),(20,'말자하','edsfasdf@naver.com','친구','좋은 친구','20201231154077.jpg'),(21,'차시장','dfasdf@naver.com','친구','고등학교 친구','null'),(22,'김탈론','sdfasdf@naver.com','친구','중학교 친구','null'),(23,'한대희','fgjjnvc@naver.com','친구','고등학교 친구','null'),(24,'장안동 호날두','ksadfnasdf@naver.com','친구','나보다 못함ㅎㅎ','202012311554273.jpg'),(25,'이승훈','dsafasdf@naver.com','친구','밤송이','202012311555311.jpg'),(26,'이승기','','친구','비버 닮음ㅎㅎ','202012311556345.jpg'),(27,'김메기','sdafasdf@naver.com','친구','잠만보','202012311557180.jpg'),(28,'김과장님','adsfasdf@naver.com','회사','성질이 포악함(주의 요망)','202012311558482.jpg'),(29,'이부장님','dsaqvbhj@naver.com','회사','회사는 모텔이 아니다...','202012311559493.jpg'),(30,'최부장','sadfasdfn@naver.com','회사','부하 직원을 괴롭힘 ','20201231160450.jpg'),(31,'김사원','asdfasdf@naver.com','회사','신입사원이 잠을 자?','20201231161454.jpg'),(32,'천사 김대리님','0i9oowenkl@naver.com','회사','사수','20201231162315.jpg'),(33,'김동기','asdfasdf@naver.com','회사','자신만의 세계가 있음','20201231163218.jpg'),(34,'어머니','','가족','사랑하는 우리 어머니','null'),(35,'아버지','','가족','듬직한 아버지','null'),(36,'동생','','가족','ㅇㅇ','null'),(37,'정희원','dfasdfasdf@naver.com','친구','','null');
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
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phone`
--

LOCK TABLES `phone` WRITE;
/*!40000 ALTER TABLE `phone` DISABLE KEYS */;
INSERT INTO `phone` VALUES (11,16,'01012345678'),(12,16,'01032569865'),(13,17,'01012312312'),(14,17,'010456789'),(15,17,'0102223334'),(16,18,'0101234554'),(20,20,'01040002134'),(21,21,'010243512234'),(22,21,'0234502345'),(23,21,'011435345'),(24,22,'0102462313'),(25,22,'02143245234'),(26,23,'01023545234234'),(27,24,'0101234567'),(28,25,'01052341234'),(29,25,'0212423523'),(30,26,'015785432'),(31,27,'01045678912'),(32,28,'0102342525234'),(33,29,'010523451233'),(34,30,'0104889542'),(35,31,'01013241234'),(36,32,'01054234234'),(37,33,'010123534213'),(38,34,'010123456789'),(39,34,'02123456789'),(40,34,'02123459786'),(41,35,'010345342344'),(42,35,'02179842312'),(43,35,'02202154651'),(44,36,'01058421312321'),(45,37,'010456897521'),(46,37,'02123456');
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
  PRIMARY KEY (`people_peopleno`),
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
INSERT INTO `status` VALUES (0,1,'con@naver.com',16),(1,1,'con@naver.com',17),(1,0,'con@naver.com',18),(1,0,'con@naver.com',20),(0,0,'con@naver.com',21),(0,1,'con@naver.com',22),(1,0,'con@naver.com',23),(1,0,'con@naver.com',24),(0,0,'con@naver.com',25),(1,0,'con@naver.com',26),(1,0,'con@naver.com',27),(0,0,'con@naver.com',28),(0,0,'con@naver.com',29),(0,0,'con@naver.com',30),(0,0,'con@naver.com',31),(1,1,'con@naver.com',32),(0,0,'con@naver.com',33),(1,1,'con@naver.com',34),(1,1,'con@naver.com',35),(0,0,'con@naver.com',36),(1,0,'con@naver.com',37);
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
INSERT INTO `userInfo` VALUES ('con@naver.com',NULL,NULL,NULL,NULL,NULL);
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

-- Dump completed on 2020-12-31 16:34:52
