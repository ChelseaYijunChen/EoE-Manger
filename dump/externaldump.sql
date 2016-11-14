-- MySQL dump 10.13  Distrib 5.5.46, for debian-linux-gnu (x86_64)
--
-- Host: mysql1.cs.clemson.edu    Database: EoE_1vku
-- ------------------------------------------------------
-- Server version	5.5.41-0ubuntu0.12.04.1

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
-- Table structure for table `foodDiary`
--

DROP TABLE IF EXISTS `foodDiary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `foodDiary` (
  `diaryID` int(11) NOT NULL AUTO_INCREMENT,
  `patientID` int(11) NOT NULL,
  `time` varchar(45) NOT NULL,
  `inputPerson` varchar(45) NOT NULL,
  `image` varchar(255) NOT NULL,
  `location` varchar(45) NOT NULL,
  `meal` varchar(45) NOT NULL,
  `partner` varchar(45) NOT NULL,
  `feelBefore` varchar(45) NOT NULL,
  `feelAfter` varchar(45) NOT NULL,
  `worry` varchar(45) NOT NULL,
  PRIMARY KEY (`diaryID`,`patientID`),
  KEY `patientID` (`patientID`),
  CONSTRAINT `foodDiary_ibfk_1` FOREIGN KEY (`patientID`) REFERENCES `userInfo` (`patientID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foodDiary`
--

LOCK TABLES `foodDiary` WRITE;
/*!40000 ALTER TABLE `foodDiary` DISABLE KEYS */;
INSERT INTO `foodDiary` VALUES (10,1,'12/4/15 11:04 AM','Parent','image','Home','Which meal?','Family Family ','0','1','1'),(11,1,'12/4/15 11:09 AM','Parent','/var/mobile/Containers/Data/Application/464DB8ED-CAB4-47C9-B579-B5B4CA6444AF/Documents/SwiftDataImages/DFC0481D-FA9F-40D5-B8A3-557C715D0CD7','School','Snack','Family Family Family Friends ','0','1','1'),(12,1,'12/4/15 11:17 AM','Parent','/var/mobile/Containers/Data/Application/464DB8ED-CAB4-47C9-B579-B5B4CA6444AF/Documents/SwiftDataImages/DFC0481D-FA9F-40D5-B8A3-557C715D0CD7','Clemson ','Snack','Family Family Family Friends Family Friends ','0','1','1');
/*!40000 ALTER TABLE `foodDiary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedsQL`
--

DROP TABLE IF EXISTS `pedsQL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedsQL` (
  `pedsQLID` int(11) NOT NULL AUTO_INCREMENT,
  `patientID` int(11) NOT NULL,
  `time` varchar(45) NOT NULL,
  `s1q1` varchar(45) NOT NULL,
  `s1q2` varchar(45) NOT NULL,
  `s1q3` varchar(45) NOT NULL,
  `s1q4` varchar(45) NOT NULL,
  `s1q5` varchar(45) NOT NULL,
  `s1q6` varchar(45) NOT NULL,
  `s2q1` varchar(45) NOT NULL,
  `s2q2` varchar(45) NOT NULL,
  `s2q3` varchar(45) NOT NULL,
  `s2q4` varchar(45) NOT NULL,
  `s3q1` varchar(45) NOT NULL,
  `s3q2` varchar(45) NOT NULL,
  `s3q3` varchar(45) NOT NULL,
  `s3q4` varchar(45) NOT NULL,
  `s3q5` varchar(45) NOT NULL,
  `s4q1` varchar(45) NOT NULL,
  `s4q2` varchar(45) NOT NULL,
  `s4q3` varchar(45) NOT NULL,
  `s4q4` varchar(45) NOT NULL,
  `s4q5` varchar(45) NOT NULL,
  `s4q6` varchar(45) NOT NULL,
  `s5q1` varchar(45) NOT NULL,
  `s5q2` varchar(45) NOT NULL,
  `s5q3` varchar(45) NOT NULL,
  `s5q4` varchar(45) NOT NULL,
  `s5q5` varchar(45) NOT NULL,
  `s67` varchar(45) DEFAULT NULL,
  `s6q1` varchar(45) DEFAULT NULL,
  `s6q2` varchar(45) DEFAULT NULL,
  `s6q3` varchar(45) DEFAULT NULL,
  `s6q4` varchar(45) DEFAULT NULL,
  `s7q1` varchar(45) DEFAULT NULL,
  `s7q2` varchar(45) DEFAULT NULL,
  `s7q3` varchar(45) DEFAULT NULL,
  `s8` varchar(45) DEFAULT NULL,
  `s8q1` varchar(45) DEFAULT NULL,
  `s8q2` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`pedsQLID`,`patientID`),
  KEY `patientID` (`patientID`),
  CONSTRAINT `pedsQL_ibfk_1` FOREIGN KEY (`patientID`) REFERENCES `userInfo` (`patientID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedsQL`
--

LOCK TABLES `pedsQL` WRITE;
/*!40000 ALTER TABLE `pedsQL` DISABLE KEYS */;
INSERT INTO `pedsQL` VALUES (1,1,'12/5/15 5:30 PM','1','0','0','1','2','1','2','3','2','4','1','2','0','0','1','1','2','3','4','1','1','1','1','0','1','2','1','3','2','1','2','2','3','4','','3','2'),(2,1,'12/5/15 5:39 PM','1','2','3','1','0','2','2','3','1','1','1','0','1','2','3','1','2','1','2','2','1','0','1','2','3','3','1','2','1','0','0','0','2','1','','0','0'),(3,1,'12/5/15 5:40 PM','0','0','1','2','1','2','3','1','1','3','0','0','2','3','2','1','1','2','1','3','1','2','3','2','1','0','0','0','0','0','0','0','0','0','0','0','0');
/*!40000 ALTER TABLE `pedsQL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peess`
--

DROP TABLE IF EXISTS `peess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `peess` (
  `peessID` int(11) NOT NULL AUTO_INCREMENT,
  `patientID` int(11) NOT NULL,
  `time` varchar(45) NOT NULL,
  `q1f` varchar(45) DEFAULT NULL,
  `q1s` varchar(45) DEFAULT NULL,
  `q2f` varchar(45) DEFAULT NULL,
  `q2s` varchar(45) DEFAULT NULL,
  `q3f` varchar(45) DEFAULT NULL,
  `q3s` varchar(45) DEFAULT NULL,
  `q4f` varchar(45) DEFAULT NULL,
  `q4s` varchar(45) DEFAULT NULL,
  `q5f` varchar(45) DEFAULT NULL,
  `q5s` varchar(45) DEFAULT NULL,
  `q6f` varchar(45) DEFAULT NULL,
  `q6s` varchar(45) DEFAULT NULL,
  `q7f` varchar(45) DEFAULT NULL,
  `q7s` varchar(45) DEFAULT NULL,
  `q8f` varchar(45) DEFAULT NULL,
  `q8s` varchar(45) DEFAULT NULL,
  `q9f` varchar(45) DEFAULT NULL,
  `q9s` varchar(45) DEFAULT NULL,
  `q10f` varchar(45) DEFAULT NULL,
  `q11f` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`peessID`,`patientID`),
  KEY `patientID` (`patientID`),
  CONSTRAINT `peess_ibfk_1` FOREIGN KEY (`patientID`) REFERENCES `userInfo` (`patientID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peess`
--

LOCK TABLES `peess` WRITE;
/*!40000 ALTER TABLE `peess` DISABLE KEYS */;
INSERT INTO `peess` VALUES (1,1,'12/5/15 4:39 PM','1','2','2','2','2','4','4','3','0','1','1','2','2','3','1','0','1','','1','1'),(2,1,'12/5/15 4:45 PM','1','2','2','0','0','1','0','2','2','3','2','1','1','3','1','0','0','2','2','2');
/*!40000 ALTER TABLE `peess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userInfo`
--

DROP TABLE IF EXISTS `userInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userInfo` (
  `patientID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `birthDate` varchar(45) NOT NULL,
  `race` varchar(255) NOT NULL,
  `ethnicity` varchar(45) NOT NULL,
  `gender` varchar(45) NOT NULL,
  `grade` varchar(45) NOT NULL,
  `lengthOfDisease` varchar(45) NOT NULL,
  `motherEducation` varchar(45) NOT NULL,
  `fatherEducation` varchar(45) NOT NULL,
  `familyIncome` varchar(45) NOT NULL,
  PRIMARY KEY (`patientID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userInfo`
--

LOCK TABLES `userInfo` WRITE;
/*!40000 ALTER TABLE `userInfo` DISABLE KEYS */;
INSERT INTO `userInfo` VALUES (1,'name','birthdate','race','ethnicity','gender','grade','le','mo','f','100');
/*!40000 ALTER TABLE `userInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userSurvey`
--

DROP TABLE IF EXISTS `userSurvey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userSurvey` (
  `surveyID` int(11) NOT NULL AUTO_INCREMENT,
  `patientID` int(11) NOT NULL,
  `time` varchar(45) DEFAULT NULL,
  `steroid` varchar(45) DEFAULT NULL,
  `dietary` varchar(45) DEFAULT NULL,
  `foodElimination` varchar(45) DEFAULT NULL,
  `allergy_syptoms` varchar(45) DEFAULT NULL,
  `allergy_syptoms_food` varchar(45) DEFAULT NULL,
  `sixFood` varchar(45) DEFAULT NULL,
  `sixFood_food` varchar(45) DEFAULT NULL,
  `elementalDiet` varchar(45) DEFAULT NULL,
  `exclElemental` varchar(45) DEFAULT NULL,
  `formula` varchar(45) DEFAULT NULL,
  `foodTrial` varchar(45) DEFAULT NULL,
  `foodTrial_food` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`surveyID`,`patientID`),
  KEY `patientID` (`patientID`),
  CONSTRAINT `userSurvey_ibfk_1` FOREIGN KEY (`patientID`) REFERENCES `userInfo` (`patientID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userSurvey`
--

LOCK TABLES `userSurvey` WRITE;
/*!40000 ALTER TABLE `userSurvey` DISABLE KEYS */;
INSERT INTO `userSurvey` VALUES (1,1,'12/5/15 6:00 PM','1','1 ','1','1','milk butter ','0','','1','1','1','1','butter ');
/*!40000 ALTER TABLE `userSurvey` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-05 18:26:38
