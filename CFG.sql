-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 10, 2016 at 04:02 AM
-- Server version: 5.5.49-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `CFG`
--

-- --------------------------------------------------------

--
-- Table structure for table `Access_Role`
--

CREATE TABLE IF NOT EXISTS `Access_Role` (
  `Role_ID` int(10) NOT NULL,
  `Role_Name` varchar(25) NOT NULL,
  PRIMARY KEY (`Role_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Attendance`
--

CREATE TABLE IF NOT EXISTS `Attendance` (
  `Student_ID` int(10) NOT NULL,
  `Date` date NOT NULL,
  `Present` tinyint(1) NOT NULL,
  KEY `Student_ID` (`Student_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Documents_Collected`
--

CREATE TABLE IF NOT EXISTS `Documents_Collected` (
  `Student_ID` int(10) DEFAULT NULL,
  `Document_Type` varchar(25) NOT NULL,
  `Document_ID` varchar(25) NOT NULL,
  `Document_URL` varchar(50) NOT NULL,
  KEY `Student_ID` (`Student_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Health_Info`
--

CREATE TABLE IF NOT EXISTS `Health_Info` (
  `Student_ID` int(10) NOT NULL,
  `Dental` int(1) NOT NULL,
  `Vision` int(1) NOT NULL,
  `Medical` int(1) NOT NULL,
  KEY `Student_ID` (`Student_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Location_History`
--

CREATE TABLE IF NOT EXISTS `Location_History` (
  `Student_ID` int(10) DEFAULT NULL,
  `City` varchar(25) DEFAULT NULL,
  `Start_Date` date DEFAULT NULL,
  `End_Date` date DEFAULT NULL,
  KEY `Student_ID` (`Student_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Location_History`
--

INSERT INTO `Location_History` (`Student_ID`, `City`, `Start_Date`, `End_Date`) VALUES
(1000, 'Bangalore', '2013-02-12', '2016-07-09'),
(1000, 'Lucknow', '2016-07-09', '9999-12-30');

-- --------------------------------------------------------

--
-- Table structure for table `Relative_Details`
--

CREATE TABLE IF NOT EXISTS `Relative_Details` (
  `Student_ID` int(10) NOT NULL,
  `Name` varchar(25) NOT NULL,
  `Family_Income` int(7) NOT NULL,
  `Mobile` bigint(10) NOT NULL,
  KEY `Student_ID` (`Student_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `School`
--

CREATE TABLE IF NOT EXISTS `School` (
  `School_ID` int(10) NOT NULL,
  `School_Name` varchar(25) NOT NULL,
  `Mobile` bigint(10) NOT NULL,
  `City` varchar(25) NOT NULL,
  `State` varchar(25) NOT NULL,
  PRIMARY KEY (`School_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `School`
--

INSERT INTO `School` (`School_ID`, `School_Name`, `Mobile`, `City`, `State`) VALUES
(1000, 'Spring Dale College', 7845872026, 'Bangalore', 'Karnataka');

-- --------------------------------------------------------

--
-- Table structure for table `Sibling`
--

CREATE TABLE IF NOT EXISTS `Sibling` (
  `Student_ID` int(10) DEFAULT NULL,
  `Sibling_ID` int(10) DEFAULT NULL,
  KEY `Student_ID` (`Student_ID`),
  KEY `Sibling_ID` (`Sibling_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Student`
--

CREATE TABLE IF NOT EXISTS `Student` (
  `Student_ID` int(10) NOT NULL AUTO_INCREMENT,
  `Name` varchar(25) NOT NULL,
  `DOB` date NOT NULL,
  `Enrolled` tinyint(1) NOT NULL,
  `Gender` char(1) NOT NULL,
  `School_ID` int(10) DEFAULT NULL,
  `Photo_URL` varchar(50) NOT NULL,
  PRIMARY KEY (`Student_ID`),
  KEY `School_ID` (`School_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1002 ;

--
-- Dumping data for table `Student`
--

INSERT INTO `Student` (`Student_ID`, `Name`, `DOB`, `Enrolled`, `Gender`, `School_ID`, `Photo_URL`) VALUES
(1000, 'Rohit', '2015-06-02', 1, 'M', 1000, 'Images/1000.png'),
(1001, 'Saurabh', '1995-03-02', 0, 'M', 1000, '1000.png');

-- --------------------------------------------------------

--
-- Table structure for table `Student_Academic_Record`
--

CREATE TABLE IF NOT EXISTS `Student_Academic_Record` (
  `Student_ID` int(10) DEFAULT NULL,
  `Marks_Percentage` int(2) DEFAULT NULL,
  `Behaviour` int(1) DEFAULT NULL,
  KEY `Student_ID` (`Student_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Student_Contact_Details`
--

CREATE TABLE IF NOT EXISTS `Student_Contact_Details` (
  `Student_ID` int(10) NOT NULL,
  `Mobile` bigint(10) NOT NULL,
  `Pincode` int(6) NOT NULL,
  `City` varchar(25) NOT NULL,
  `State` varchar(25) NOT NULL,
  KEY `Student_ID` (`Student_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Student_Contact_Details`
--

INSERT INTO `Student_Contact_Details` (`Student_ID`, `Mobile`, `Pincode`, `City`, `State`) VALUES
(1000, 7845872029, 226018, 'Lucknow', 'Uttar Pradesh');

-- --------------------------------------------------------

--
-- Table structure for table `Teachers`
--

CREATE TABLE IF NOT EXISTS `Teachers` (
  `Teacher_ID` int(10) NOT NULL,
  `Teacher_Name` varchar(25) NOT NULL,
  `Mobile` bigint(10) NOT NULL,
  `School_ID` int(10) NOT NULL,
  PRIMARY KEY (`Teacher_ID`),
  KEY `School_ID` (`School_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Teachers`
--

INSERT INTO `Teachers` (`Teacher_ID`, `Teacher_Name`, `Mobile`, `School_ID`) VALUES
(1000, 'Joshi', 7275938215, 1000);

-- --------------------------------------------------------

--
-- Table structure for table `Teacher_Ref`
--

CREATE TABLE IF NOT EXISTS `Teacher_Ref` (
  `Student_ID` int(10) DEFAULT NULL,
  `Teacher_ID` int(10) DEFAULT NULL,
  KEY `Student_ID` (`Student_ID`),
  KEY `Teacher_ID` (`Teacher_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Teacher_Ref`
--

INSERT INTO `Teacher_Ref` (`Student_ID`, `Teacher_ID`) VALUES
(1000, 1000);

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE IF NOT EXISTS `User` (
  `Username` varchar(25) NOT NULL,
  `Password` varchar(40) NOT NULL,
  `Role_ID` int(10) NOT NULL,
  PRIMARY KEY (`Username`),
  KEY `Role_ID` (`Role_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Attendance`
--
ALTER TABLE `Attendance`
  ADD CONSTRAINT `Attendance_ibfk_1` FOREIGN KEY (`Student_ID`) REFERENCES `Student` (`Student_ID`);

--
-- Constraints for table `Documents_Collected`
--
ALTER TABLE `Documents_Collected`
  ADD CONSTRAINT `Documents_Collected_ibfk_1` FOREIGN KEY (`Student_ID`) REFERENCES `Student` (`Student_ID`);

--
-- Constraints for table `Health_Info`
--
ALTER TABLE `Health_Info`
  ADD CONSTRAINT `Health_Info_ibfk_1` FOREIGN KEY (`Student_ID`) REFERENCES `Student` (`Student_ID`) ON DELETE CASCADE;

--
-- Constraints for table `Location_History`
--
ALTER TABLE `Location_History`
  ADD CONSTRAINT `Location_History_ibfk_1` FOREIGN KEY (`Student_ID`) REFERENCES `Student` (`Student_ID`) ON DELETE CASCADE;

--
-- Constraints for table `Relative_Details`
--
ALTER TABLE `Relative_Details`
  ADD CONSTRAINT `Relative_Details_ibfk_1` FOREIGN KEY (`Student_ID`) REFERENCES `Student` (`Student_ID`);

--
-- Constraints for table `Sibling`
--
ALTER TABLE `Sibling`
  ADD CONSTRAINT `Sibling_ibfk_1` FOREIGN KEY (`Student_ID`) REFERENCES `Student` (`Student_ID`),
  ADD CONSTRAINT `Sibling_ibfk_2` FOREIGN KEY (`Sibling_ID`) REFERENCES `Student` (`Student_ID`);

--
-- Constraints for table `Student`
--
ALTER TABLE `Student`
  ADD CONSTRAINT `Student_ibfk_1` FOREIGN KEY (`School_ID`) REFERENCES `School` (`School_ID`);

--
-- Constraints for table `Student_Academic_Record`
--
ALTER TABLE `Student_Academic_Record`
  ADD CONSTRAINT `Student_Academic_Record_ibfk_1` FOREIGN KEY (`Student_ID`) REFERENCES `Student` (`Student_ID`) ON DELETE CASCADE;

--
-- Constraints for table `Student_Contact_Details`
--
ALTER TABLE `Student_Contact_Details`
  ADD CONSTRAINT `Student_Contact_Details_ibfk_1` FOREIGN KEY (`Student_ID`) REFERENCES `Student` (`Student_ID`);

--
-- Constraints for table `Teachers`
--
ALTER TABLE `Teachers`
  ADD CONSTRAINT `Teachers_ibfk_1` FOREIGN KEY (`School_ID`) REFERENCES `School` (`School_ID`);

--
-- Constraints for table `Teacher_Ref`
--
ALTER TABLE `Teacher_Ref`
  ADD CONSTRAINT `Teacher_Ref_ibfk_1` FOREIGN KEY (`Student_ID`) REFERENCES `Student` (`Student_ID`),
  ADD CONSTRAINT `Teacher_Ref_ibfk_2` FOREIGN KEY (`Teacher_ID`) REFERENCES `Teachers` (`Teacher_ID`);

--
-- Constraints for table `User`
--
ALTER TABLE `User`
  ADD CONSTRAINT `User_ibfk_1` FOREIGN KEY (`Role_ID`) REFERENCES `Access_Role` (`Role_ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
