-- MySQL dump 10.13  Distrib 5.5.49, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: CFG
-- ------------------------------------------------------
-- Server version	5.5.49-0ubuntu0.14.04.1

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
-- Table structure for table `Access_Role`
--

DROP TABLE IF EXISTS `Access_Role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Access_Role` (
  `Role_ID` int(10) NOT NULL,
  `Role_Name` varchar(25) NOT NULL,
  PRIMARY KEY (`Role_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Access_Role`
--

LOCK TABLES `Access_Role` WRITE;
/*!40000 ALTER TABLE `Access_Role` DISABLE KEYS */;
/*!40000 ALTER TABLE `Access_Role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Attendance`
--

DROP TABLE IF EXISTS `Attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Attendance` (
  `Student_ID` int(10) NOT NULL,
  `Date` date NOT NULL,
  `Present` tinyint(1) NOT NULL,
  `Bridge` tinyint(1) NOT NULL,
  KEY `Student_ID` (`Student_ID`),
  CONSTRAINT `Attendance_ibfk_1` FOREIGN KEY (`Student_ID`) REFERENCES `Student` (`Student_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Attendance`
--

LOCK TABLES `Attendance` WRITE;
/*!40000 ALTER TABLE `Attendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `Attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Documents_Collected`
--

DROP TABLE IF EXISTS `Documents_Collected`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Documents_Collected` (
  `Student_ID` int(10) DEFAULT NULL,
  `Document_Type` varchar(25) NOT NULL,
  `Document_ID` varchar(25) NOT NULL,
  `Document_URL` varchar(50) NOT NULL,
  KEY `Student_ID` (`Student_ID`),
  CONSTRAINT `Documents_Collected_ibfk_1` FOREIGN KEY (`Student_ID`) REFERENCES `Student` (`Student_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Documents_Collected`
--

LOCK TABLES `Documents_Collected` WRITE;
/*!40000 ALTER TABLE `Documents_Collected` DISABLE KEYS */;
/*!40000 ALTER TABLE `Documents_Collected` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Health_Info`
--

DROP TABLE IF EXISTS `Health_Info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Health_Info` (
  `Student_ID` int(10) NOT NULL,
  `Dental` int(1) NOT NULL,
  `Vision` int(1) NOT NULL,
  `Medical` int(1) NOT NULL,
  KEY `Student_ID` (`Student_ID`),
  CONSTRAINT `Health_Info_ibfk_1` FOREIGN KEY (`Student_ID`) REFERENCES `Student` (`Student_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Health_Info`
--

LOCK TABLES `Health_Info` WRITE;
/*!40000 ALTER TABLE `Health_Info` DISABLE KEYS */;
/*!40000 ALTER TABLE `Health_Info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Location_History`
--

DROP TABLE IF EXISTS `Location_History`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Location_History` (
  `Student_ID` int(10) DEFAULT NULL,
  `City` varchar(25) DEFAULT NULL,
  `Start_Date` date DEFAULT NULL,
  `End_Date` date DEFAULT NULL,
  KEY `Student_ID` (`Student_ID`),
  CONSTRAINT `Location_History_ibfk_1` FOREIGN KEY (`Student_ID`) REFERENCES `Student` (`Student_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Location_History`
--

LOCK TABLES `Location_History` WRITE;
/*!40000 ALTER TABLE `Location_History` DISABLE KEYS */;
/*!40000 ALTER TABLE `Location_History` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Relative_Details`
--

DROP TABLE IF EXISTS `Relative_Details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Relative_Details` (
  `Student_ID` int(10) NOT NULL,
  `Name` varchar(25) NOT NULL,
  `Family_Income` int(7) NOT NULL,
  `Mobile` int(10) NOT NULL,
  KEY `Student_ID` (`Student_ID`),
  CONSTRAINT `Relative_Details_ibfk_1` FOREIGN KEY (`Student_ID`) REFERENCES `Student` (`Student_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Relative_Details`
--

LOCK TABLES `Relative_Details` WRITE;
/*!40000 ALTER TABLE `Relative_Details` DISABLE KEYS */;
/*!40000 ALTER TABLE `Relative_Details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `School`
--

DROP TABLE IF EXISTS `School`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `School` (
  `School_ID` int(10) NOT NULL,
  `School_Name` varchar(25) NOT NULL,
  `Mobile` int(10) NOT NULL,
  `City` varchar(25) NOT NULL,
  `State` varchar(25) NOT NULL,
  PRIMARY KEY (`School_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `School`
--

LOCK TABLES `School` WRITE;
/*!40000 ALTER TABLE `School` DISABLE KEYS */;
/*!40000 ALTER TABLE `School` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sibling`
--

DROP TABLE IF EXISTS `Sibling`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Sibling` (
  `Student_ID` int(10) DEFAULT NULL,
  `Sibling_ID` int(10) DEFAULT NULL,
  KEY `Student_ID` (`Student_ID`),
  KEY `Sibling_ID` (`Sibling_ID`),
  CONSTRAINT `Sibling_ibfk_1` FOREIGN KEY (`Student_ID`) REFERENCES `Student` (`Student_ID`),
  CONSTRAINT `Sibling_ibfk_2` FOREIGN KEY (`Sibling_ID`) REFERENCES `Student` (`Student_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sibling`
--

LOCK TABLES `Sibling` WRITE;
/*!40000 ALTER TABLE `Sibling` DISABLE KEYS */;
/*!40000 ALTER TABLE `Sibling` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Student`
--

DROP TABLE IF EXISTS `Student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Student` (
  `Student_ID` int(10) NOT NULL DEFAULT '0',
  `Name` varchar(25) NOT NULL,
  `DOB` date NOT NULL,
  `Enrolled` tinyint(1) NOT NULL,
  `Gender` char(1) NOT NULL,
  `School_ID` int(10) DEFAULT NULL,
  `Photo_URL` varchar(50) NOT NULL,
  PRIMARY KEY (`Student_ID`),
  KEY `School_ID` (`School_ID`),
  CONSTRAINT `Student_ibfk_1` FOREIGN KEY (`School_ID`) REFERENCES `School` (`School_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student`
--

LOCK TABLES `Student` WRITE;
/*!40000 ALTER TABLE `Student` DISABLE KEYS */;
/*!40000 ALTER TABLE `Student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Student_Academic_Record`
--

DROP TABLE IF EXISTS `Student_Academic_Record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Student_Academic_Record` (
  `Student_ID` int(10) DEFAULT NULL,
  `Marks_Percentage` int(2) DEFAULT NULL,
  `Behaviour` int(1) DEFAULT NULL,
  KEY `Student_ID` (`Student_ID`),
  CONSTRAINT `Student_Academic_Record_ibfk_1` FOREIGN KEY (`Student_ID`) REFERENCES `Student` (`Student_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student_Academic_Record`
--

LOCK TABLES `Student_Academic_Record` WRITE;
/*!40000 ALTER TABLE `Student_Academic_Record` DISABLE KEYS */;
/*!40000 ALTER TABLE `Student_Academic_Record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Student_Contact_Details`
--

DROP TABLE IF EXISTS `Student_Contact_Details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Student_Contact_Details` (
  `Student_ID` int(10) NOT NULL,
  `Mobile` int(10) NOT NULL,
  `Pincode` int(6) NOT NULL,
  `City` varchar(25) NOT NULL,
  `State` varchar(25) NOT NULL,
  KEY `Student_ID` (`Student_ID`),
  CONSTRAINT `Student_Contact_Details_ibfk_1` FOREIGN KEY (`Student_ID`) REFERENCES `Student` (`Student_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student_Contact_Details`
--

LOCK TABLES `Student_Contact_Details` WRITE;
/*!40000 ALTER TABLE `Student_Contact_Details` DISABLE KEYS */;
/*!40000 ALTER TABLE `Student_Contact_Details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Teacher_Ref`
--

DROP TABLE IF EXISTS `Teacher_Ref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Teacher_Ref` (
  `Student_ID` int(10) DEFAULT NULL,
  `Teacher_ID` int(10) DEFAULT NULL,
  KEY `Student_ID` (`Student_ID`),
  KEY `Teacher_ID` (`Teacher_ID`),
  CONSTRAINT `Teacher_Ref_ibfk_1` FOREIGN KEY (`Student_ID`) REFERENCES `Student` (`Student_ID`),
  CONSTRAINT `Teacher_Ref_ibfk_2` FOREIGN KEY (`Teacher_ID`) REFERENCES `Teachers` (`Teacher_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Teacher_Ref`
--

LOCK TABLES `Teacher_Ref` WRITE;
/*!40000 ALTER TABLE `Teacher_Ref` DISABLE KEYS */;
/*!40000 ALTER TABLE `Teacher_Ref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Teachers`
--

DROP TABLE IF EXISTS `Teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Teachers` (
  `Teacher_ID` int(10) NOT NULL,
  `Teacher_Name` varchar(25) NOT NULL,
  `Mobile` int(10) NOT NULL,
  `School_ID` int(10) NOT NULL,
  PRIMARY KEY (`Teacher_ID`),
  KEY `School_ID` (`School_ID`),
  CONSTRAINT `Teachers_ibfk_1` FOREIGN KEY (`School_ID`) REFERENCES `School` (`School_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Teachers`
--

LOCK TABLES `Teachers` WRITE;
/*!40000 ALTER TABLE `Teachers` DISABLE KEYS */;
/*!40000 ALTER TABLE `Teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `Username` varchar(25) NOT NULL,
  `Password` varchar(40) NOT NULL,
  `Role_ID` int(10) NOT NULL,
  PRIMARY KEY (`Username`),
  KEY `Role_ID` (`Role_ID`),
  CONSTRAINT `User_ibfk_1` FOREIGN KEY (`Role_ID`) REFERENCES `Access_Role` (`Role_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-09 19:00:29
