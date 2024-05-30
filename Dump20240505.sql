CREATE DATABASE  IF NOT EXISTS `auctiondb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `auctiondb`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: auctiondb
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `accountmanagement`
--

DROP TABLE IF EXISTS `accountmanagement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accountmanagement` (
  `UserID` varchar(30) NOT NULL,
  `login` tinyint(1) DEFAULT NULL,
  `logout` tinyint(1) DEFAULT NULL,
  `createAccount` tinyint(1) DEFAULT NULL,
  `deleteAccount` tinyint(1) DEFAULT NULL,
  `changePassword` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  CONSTRAINT `accountmanagement_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `enduser` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accountmanagement`
--

LOCK TABLES `accountmanagement` WRITE;
/*!40000 ALTER TABLE `accountmanagement` DISABLE KEYS */;
/*!40000 ALTER TABLE `accountmanagement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adminstaff`
--

DROP TABLE IF EXISTS `adminstaff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adminstaff` (
  `AdminID` varchar(10) NOT NULL,
  `RepID` varchar(10) NOT NULL,
  `adminUser` varchar(30) DEFAULT NULL,
  `adminPassword` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`AdminID`,`RepID`),
  KEY `RepID` (`RepID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminstaff`
--

LOCK TABLES `adminstaff` WRITE;
/*!40000 ALTER TABLE `adminstaff` DISABLE KEYS */;
INSERT INTO `adminstaff` VALUES ('admin','0000',NULL,'defaultPassword'),('sardar','0000',NULL,'gul'),('tommy','0000',NULL,'goldendog');
/*!40000 ALTER TABLE `adminstaff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auction`
--

DROP TABLE IF EXISTS `auction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auction` (
  `AuctionID` int NOT NULL,
  `endTime` datetime DEFAULT NULL,
  `initialPrice` double DEFAULT NULL,
  `bidsList` varchar(200) DEFAULT NULL,
  `secretMinPrice` double DEFAULT NULL,
  `bidIncrements` double DEFAULT NULL,
  `maxBid` double DEFAULT NULL,
  PRIMARY KEY (`AuctionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auction`
--

LOCK TABLES `auction` WRITE;
/*!40000 ALTER TABLE `auction` DISABLE KEYS */;
INSERT INTO `auction` VALUES (50,'2024-05-12 11:00:00',200,'',180,15,400),(55,'2024-05-10 09:00:00',100,'',90,5,200),(60,'2024-05-11 10:00:00',150,'',140,10,300);
/*!40000 ALTER TABLE `auction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bestselling`
--

DROP TABLE IF EXISTS `bestselling`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bestselling` (
  `AdminID` varchar(10) NOT NULL,
  `items` varchar(25) DEFAULT NULL,
  `UserID` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`AdminID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `bestselling_ibfk_1` FOREIGN KEY (`AdminID`) REFERENCES `adminstaff` (`AdminID`),
  CONSTRAINT `bestselling_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `enduser` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bestselling`
--

LOCK TABLES `bestselling` WRITE;
/*!40000 ALTER TABLE `bestselling` DISABLE KEYS */;
/*!40000 ALTER TABLE `bestselling` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bid`
--

DROP TABLE IF EXISTS `bid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bid` (
  `bidID` int NOT NULL AUTO_INCREMENT,
  `bidIncrements` double DEFAULT NULL,
  `buyer` varchar(40) DEFAULT NULL,
  `auctionID` int DEFAULT NULL,
  `bidAmount` float DEFAULT NULL,
  `bidLimit` float DEFAULT NULL,
  `autoBid` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`bidID`),
  KEY `buyer` (`buyer`),
  KEY `auctionID` (`auctionID`),
  CONSTRAINT `bid_ibfk_1` FOREIGN KEY (`buyer`) REFERENCES `login` (`userID`),
  CONSTRAINT `bid_ibfk_2` FOREIGN KEY (`auctionID`) REFERENCES `auction` (`AuctionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bid`
--

LOCK TABLES `bid` WRITE;
/*!40000 ALTER TABLE `bid` DISABLE KEYS */;
/*!40000 ALTER TABLE `bid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clothing`
--

DROP TABLE IF EXISTS `clothing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clothing` (
  `clothingID` int NOT NULL,
  `color` varchar(10) DEFAULT NULL,
  `material` varchar(20) DEFAULT NULL,
  `design` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`clothingID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clothing`
--

LOCK TABLES `clothing` WRITE;
/*!40000 ALTER TABLE `clothing` DISABLE KEYS */;
/*!40000 ALTER TABLE `clothing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customerrepresentation`
--

DROP TABLE IF EXISTS `customerrepresentation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customerrepresentation` (
  `UserID` varchar(30) NOT NULL,
  `RepID` varchar(10) NOT NULL,
  `AuctionID` int NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`UserID`,`RepID`,`AuctionID`),
  KEY `AuctionID` (`AuctionID`),
  KEY `RepID` (`RepID`),
  CONSTRAINT `customerrepresentation_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `enduser` (`UserID`),
  CONSTRAINT `customerrepresentation_ibfk_2` FOREIGN KEY (`AuctionID`) REFERENCES `auction` (`AuctionID`),
  CONSTRAINT `customerrepresentation_ibfk_3` FOREIGN KEY (`RepID`) REFERENCES `adminstaff` (`RepID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerrepresentation`
--

LOCK TABLES `customerrepresentation` WRITE;
/*!40000 ALTER TABLE `customerrepresentation` DISABLE KEYS */;
/*!40000 ALTER TABLE `customerrepresentation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customerrepresentative`
--

DROP TABLE IF EXISTS `customerrepresentative`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customerrepresentative` (
  `RepID` varchar(10) NOT NULL,
  `resetPassword` tinyint(1) DEFAULT NULL,
  `removeBid` tinyint(1) DEFAULT NULL,
  `removeIllegalAuction` tinyint(1) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`RepID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerrepresentative`
--

LOCK TABLES `customerrepresentative` WRITE;
/*!40000 ALTER TABLE `customerrepresentative` DISABLE KEYS */;
INSERT INTO `customerrepresentative` VALUES ('luigi',NULL,NULL,NULL,'test'),('ratman',NULL,NULL,NULL,'pizza'),('reggie',NULL,NULL,NULL,'cat'),('ronald',NULL,NULL,NULL,'reagen');
/*!40000 ALTER TABLE `customerrepresentative` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `earningssalesreport`
--

DROP TABLE IF EXISTS `earningssalesreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `earningssalesreport` (
  `item` varchar(25) DEFAULT NULL,
  `enduser` varchar(30) DEFAULT NULL,
  `item_type` varchar(20) DEFAULT NULL,
  `totalEarnings` double DEFAULT NULL,
  `AdminID` varchar(10) NOT NULL,
  PRIMARY KEY (`AdminID`),
  CONSTRAINT `earningssalesreport_ibfk_1` FOREIGN KEY (`AdminID`) REFERENCES `adminstaff` (`AdminID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `earningssalesreport`
--

LOCK TABLES `earningssalesreport` WRITE;
/*!40000 ALTER TABLE `earningssalesreport` DISABLE KEYS */;
/*!40000 ALTER TABLE `earningssalesreport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enduser`
--

DROP TABLE IF EXISTS `enduser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enduser` (
  `UserID` varchar(30) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  CONSTRAINT `fk_enduser_user` FOREIGN KEY (`UserID`) REFERENCES `login` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enduser`
--

LOCK TABLES `enduser` WRITE;
/*!40000 ALTER TABLE `enduser` DISABLE KEYS */;
/*!40000 ALTER TABLE `enduser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hats`
--

DROP TABLE IF EXISTS `hats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hats` (
  `clothingID` int NOT NULL,
  `hatSize` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`clothingID`),
  CONSTRAINT `hats_ibfk_1` FOREIGN KEY (`clothingID`) REFERENCES `clothing` (`clothingID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hats`
--

LOCK TABLES `hats` WRITE;
/*!40000 ALTER TABLE `hats` DISABLE KEYS */;
/*!40000 ALTER TABLE `hats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `clothingID` int NOT NULL AUTO_INCREMENT,
  `clothingCategory` varchar(30) DEFAULT NULL,
  `seller` varchar(30) DEFAULT NULL,
  `color` varchar(30) DEFAULT NULL,
  `manufacturer` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`clothingID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'hats','HatSeller1','blue','Gap'),(2,'hats','HatSeller2','red','Lids'),(3,'hats','HatSeller3','green','Lids'),(4,'shirts','ShirtSeller1','green','H And M'),(5,'shirts','ShirtSeller2','yellow','Uniqlo'),(6,'shirts','ShirtSeller2','blue','Ralph Lauren'),(7,'shirts','ShirtSeller1','green','Uniqlo'),(8,'pants','PantsSeller1','black','American Eagle'),(9,'pants','PantsSeller2','gray','Gap '),(10,'pants','PantsSeller2','gray','Vans');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `UserID` varchar(30) NOT NULL,
  `password` varchar(30) DEFAULT NULL,
  `accountType` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES ('login','password',NULL),('Rimmy','goldendog','null'),('Tommy','goldendog',NULL);
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pants`
--

DROP TABLE IF EXISTS `pants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pants` (
  `clothingID` int NOT NULL,
  `pantsSize` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`clothingID`),
  CONSTRAINT `pants_ibfk_1` FOREIGN KEY (`clothingID`) REFERENCES `clothing` (`clothingID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pants`
--

LOCK TABLES `pants` WRITE;
/*!40000 ALTER TABLE `pants` DISABLE KEYS */;
/*!40000 ALTER TABLE `pants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `question` varchar(1000) DEFAULT NULL,
  `questionID` int NOT NULL AUTO_INCREMENT,
  `answer` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`questionID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES ('What is the starting bid for the red shirt?',1,'50 euros'),('Is the black gucci hat available in multiple sizes?',2,'I don\'t know I am not a genie.'),('Could you describe the material of the ralph lauren pants?',3,'denim'),('Do you offer international shipping for the gap shirts?',4,NULL),('Are there any special features in the gucci hats?',5,NULL),('What is the condition of the red adidas pants?',6,NULL),('Can I combine shipping if I purchase multiple items?',7,NULL),('How many licks does it take to get to the tootsie roll center of a tootsie pop?',8,NULL),('is this a valid question?',9,NULL);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shirt`
--

DROP TABLE IF EXISTS `shirt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shirt` (
  `clothingID` int NOT NULL,
  `shirtSize` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`clothingID`),
  CONSTRAINT `shirt_ibfk_1` FOREIGN KEY (`clothingID`) REFERENCES `clothing` (`clothingID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shirt`
--

LOCK TABLES `shirt` WRITE;
/*!40000 ALTER TABLE `shirt` DISABLE KEYS */;
/*!40000 ALTER TABLE `shirt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userauctioninteraction`
--

DROP TABLE IF EXISTS `userauctioninteraction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userauctioninteraction` (
  `DeleteAuction` tinyint(1) DEFAULT NULL,
  `ListAuction` tinyint(1) DEFAULT NULL,
  `bid` double DEFAULT NULL,
  `autoBidLimit` double DEFAULT NULL,
  `autoBidIncrement` double DEFAULT NULL,
  `ViewBidHistory` tinyint(1) DEFAULT NULL,
  `AuctionID` int NOT NULL,
  `UserID` varchar(30) NOT NULL,
  PRIMARY KEY (`AuctionID`,`UserID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `userauctioninteraction_ibfk_1` FOREIGN KEY (`AuctionID`) REFERENCES `auction` (`AuctionID`),
  CONSTRAINT `userauctioninteraction_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `enduser` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userauctioninteraction`
--

LOCK TABLES `userauctioninteraction` WRITE;
/*!40000 ALTER TABLE `userauctioninteraction` DISABLE KEYS */;
/*!40000 ALTER TABLE `userauctioninteraction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usercommands`
--

DROP TABLE IF EXISTS `usercommands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usercommands` (
  `UserID` varchar(30) NOT NULL,
  PRIMARY KEY (`UserID`),
  CONSTRAINT `usercommands_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `enduser` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usercommands`
--

LOCK TABLES `usercommands` WRITE;
/*!40000 ALTER TABLE `usercommands` DISABLE KEYS */;
/*!40000 ALTER TABLE `usercommands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `websiteinteraction`
--

DROP TABLE IF EXISTS `websiteinteraction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `websiteinteraction` (
  `UserID` varchar(30) NOT NULL,
  `ItemAlert` varchar(50) DEFAULT NULL,
  `SearchForAuctions` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  CONSTRAINT `websiteinteraction_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `enduser` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `websiteinteraction`
--

LOCK TABLES `websiteinteraction` WRITE;
/*!40000 ALTER TABLE `websiteinteraction` DISABLE KEYS */;
/*!40000 ALTER TABLE `websiteinteraction` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-05 18:15:53
