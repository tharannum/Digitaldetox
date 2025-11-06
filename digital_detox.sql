CREATE DATABASE  IF NOT EXISTS `digital_detox` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `digital_detox`;
-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: digital_detox
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `question_options`
--

DROP TABLE IF EXISTS `question_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question_options` (
  `question_id` int NOT NULL,
  `option_label` char(1) NOT NULL,
  `option_text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`question_id`,`option_label`),
  CONSTRAINT `question_options_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_options`
--

LOCK TABLES `question_options` WRITE;
/*!40000 ALTER TABLE `question_options` DISABLE KEYS */;
INSERT INTO `question_options` VALUES (1,'A','Less than 2 hours'),(1,'B','2-4 hours'),(1,'C','4-6 hours'),(1,'D','More than 6 hours'),(2,'A','0-3 times'),(2,'B','4-9 times'),(2,'C','10-19 times'),(2,'D','20+ times'),(3,'A','Never'),(3,'B','Rarely'),(3,'C','Often'),(3,'D','Very often'),(4,'A','Never'),(4,'B','Occasionally'),(4,'C','Frequently'),(4,'D','Always'),(5,'A','Energized and focused'),(5,'B','Neutral'),(5,'C','Tired or fatigued'),(5,'D','Stressed or overwhelmed'),(6,'A','Never'),(6,'B','Sometimes'),(6,'C','Often'),(6,'D','Always'),(7,'A','Difficulty sleeping'),(7,'B','Eye or neck strain'),(7,'C','Anxiety or feeling'),(7,'D','mentally drained'),(8,'A','Never'),(8,'B','Sometimes'),(8,'C','Frequently'),(8,'D','Always'),(9,'A','No impact'),(9,'B','Occasionally'),(9,'C','Frequently creates misunderstandings'),(9,'D','Major source of conflict or disconnect'),(10,'A','Never'),(10,'B','Sometimes'),(10,'C','Frequently'),(10,'D','Always'),(11,'A','Never'),(11,'B','Sometimes'),(11,'C','Frequently'),(11,'D','Always'),(12,'A','Always'),(12,'B','Frequently'),(12,'C','Sometimes'),(12,'D','Never'),(13,'A','Never'),(13,'B','Sometimes'),(13,'C','Frequently'),(13,'D','Always'),(14,'A','Never'),(14,'B','Sometimes'),(14,'C','Frequently'),(14,'D','Always'),(15,'A','Never'),(15,'B','Sometimes'),(15,'C','Frequently'),(15,'D','Always');
/*!40000 ALTER TABLE `question_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `question_id` int NOT NULL AUTO_INCREMENT,
  `question_text` varchar(400) DEFAULT NULL,
  `weightage` int DEFAULT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,'On average, how many hours per day do you engage with digital devices (smartphone, computer, social media, streaming)?',8),(2,'How often do you “check in” (e.g. check emails, social media, notifications)?',7),(3,'Do you spend time on digital devices during: a) standing in line or at a stop? b) meals or social situations?',6),(4,'Do you check or use devices late at night?',6),(5,'How do you feel after spending prolonged time on digital devices?',6),(6,'Do you become restless or bothered when you can\'t use digital platforms?',8),(7,'Do you experience any of the following due to device use? (Select all that apply)',7),(8,'Have you ever compared your life negatively with others online?',6),(9,'Have your relationships (family/friends) been affected due to your screen time?',8),(10,'Do you feel anxious or uncomfortable when your phone is not with you?',8),(11,'Do you avoid certain real-life tasks or responsibilities because of digital distractions?',7),(12,'Can you easily stop scrolling when you plan to stop?',6),(13,'Do you use screens as a way to escape from emotions (e.g. boredom, sadness, loneliness)?',7),(14,'When you are using your phone for something important, how often do you end up scrolling on social media instead?',6),(15,'Do you feel guilty about how much time you spend on your devices?',4);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_responses`
--

DROP TABLE IF EXISTS `user_responses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_responses` (
  `user_id` int NOT NULL,
  `question_id` int NOT NULL,
  `selected_option` char(1) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`question_id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `user_responses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_responses_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_responses`
--

LOCK TABLES `user_responses` WRITE;
/*!40000 ALTER TABLE `user_responses` DISABLE KEYS */;
INSERT INTO `user_responses` VALUES (1,1,'A'),(1,2,'D'),(1,3,'D'),(1,4,'D'),(1,5,'A'),(1,6,'D'),(1,7,'C'),(1,8,'D'),(1,9,'D'),(1,10,'C'),(1,11,'B'),(1,12,'D'),(1,13,'B'),(1,14,'C'),(1,15,'C'),(2,1,'B'),(2,2,'D'),(2,3,'D'),(2,4,'C'),(2,5,'C'),(2,6,'C'),(2,7,'D'),(2,8,'C'),(2,9,'A'),(2,10,'C'),(2,11,'A'),(2,12,'A'),(2,13,'B'),(2,14,'A'),(2,15,'A'),(3,1,'A'),(3,2,'B'),(3,3,'B'),(3,4,'C'),(3,5,'B'),(3,6,'D'),(3,7,'C'),(3,8,'B'),(3,9,'D'),(3,10,'D'),(3,11,'D'),(3,12,'D'),(3,13,'A'),(3,14,'C'),(3,15,'D');
/*!40000 ALTER TABLE `user_responses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_email` varchar(100) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_email` (`user_email`),
  UNIQUE KEY `user_name` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'alice@example.com','Alice'),(2,'bob@example.com','Bob'),(3,'charlie@example.com','Charlie');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-06 16:16:42
