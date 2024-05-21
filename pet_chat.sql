-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: data
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `adoption`
--

DROP TABLE IF EXISTS `adoption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adoption` (
  `name` varchar(100) NOT NULL,
  `species` text,
  `breed` varchar(100) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `size` varchar(20) DEFAULT NULL,
  `location` varchar(100) NOT NULL,
  `description` text,
  `image_url` varchar(255) DEFAULT NULL,
  `shelter_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shelter_id` (`shelter_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `adoption_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `shelter_id` FOREIGN KEY (`shelter_id`) REFERENCES `shelters` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adoption`
--

LOCK TABLES `adoption` WRITE;
/*!40000 ALTER TABLE `adoption` DISABLE KEYS */;
INSERT INTO `adoption` VALUES ('Buddy','Dog','Golden Retriever',4,'Large','Friendly and energetic','New York City','2Bq3.pdf',9,2,2),('Polly','Parrot','African Grey',5,'medium','Friendly, talkative','New York City, USA','7Mt6.pdf',9,2,3),('Max','Dog','Labrador Retriever',3,'large','Friendly, playful','City Park Animal Shelter','3Fs5.pdf',9,2,5);
/*!40000 ALTER TABLE `adoption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adoptionresources`
--

DROP TABLE IF EXISTS `adoptionresources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adoptionresources` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` text,
  `link` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adoptionresources`
--

LOCK TABLES `adoptionresources` WRITE;
/*!40000 ALTER TABLE `adoptionresources` DISABLE KEYS */;
/*!40000 ALTER TABLE `adoptionresources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_messages`
--

DROP TABLE IF EXISTS `chat_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_messages` (
  `chat_id` int NOT NULL AUTO_INCREMENT,
  `sender_id` int DEFAULT NULL,
  `receiver_id` int DEFAULT NULL,
  `message` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `file_path` varchar(255) DEFAULT NULL,
  `pid` int DEFAULT NULL,
  PRIMARY KEY (`chat_id`),
  KEY `pid` (`pid`),
  CONSTRAINT `chat_messages_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `petprofiles` (`pet_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_messages`
--

LOCK TABLES `chat_messages` WRITE;
/*!40000 ALTER TABLE `chat_messages` DISABLE KEYS */;
INSERT INTO `chat_messages` VALUES (1,2,9,'hi','2024-05-10 10:27:46','8Ar3.jpg',2),(2,2,9,'hi','2024-05-10 10:30:00','2Mb3.jpg',2),(3,9,2,'hello','2024-05-10 11:28:38','0Cm9.jpg',2),(4,9,2,'hello','2024-05-10 11:29:01','7Rb8.jpg',2),(5,2,9,'about max i need info','2024-05-10 11:30:19','3Ji9.jpg',5),(6,9,2,'ok it is good and active','2024-05-10 11:32:51','9Nl4.jpg',5);
/*!40000 ALTER TABLE `chat_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `petprofiles`
--

DROP TABLE IF EXISTS `petprofiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `petprofiles` (
  `name` varchar(100) NOT NULL,
  `species` text,
  `breed` varchar(100) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `size` varchar(20) DEFAULT NULL,
  `location` text,
  `personality` text,
  `history` text,
  `image_url` varchar(255) DEFAULT NULL,
  `shelter_id` int NOT NULL,
  `pet_id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`pet_id`),
  UNIQUE KEY `name` (`name`,`shelter_id`),
  KEY `shelter_id` (`shelter_id`),
  CONSTRAINT `petprofiles_ibfk_1` FOREIGN KEY (`shelter_id`) REFERENCES `shelters` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `petprofiles`
--

LOCK TABLES `petprofiles` WRITE;
/*!40000 ALTER TABLE `petprofiles` DISABLE KEYS */;
INSERT INTO `petprofiles` VALUES ('Buddy','Dog','Golden Retriever',4,'Large','Friendly and energetic','New York City','7Ig8.jpg','2Bq3.pdf',9,2),('Max','Dog','Labrador Retriever',3,'large','Friendly, playful','City Park Animal Shelter','0Ib6.jpg','3Fs5.pdf',9,5);
/*!40000 ALTER TABLE `petprofiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `savedsearches`
--

DROP TABLE IF EXISTS `savedsearches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `savedsearches` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `search_name` varchar(100) DEFAULT NULL,
  `species` varchar(50) NOT NULL,
  `breed` varchar(100) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `size` varchar(20) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `searched_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `s_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `s_id` (`s_id`),
  CONSTRAINT `s_id` FOREIGN KEY (`s_id`) REFERENCES `shelters` (`id`),
  CONSTRAINT `savedsearches_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `savedsearches`
--

LOCK TABLES `savedsearches` WRITE;
/*!40000 ALTER TABLE `savedsearches` DISABLE KEYS */;
INSERT INTO `savedsearches` VALUES (10,2,'dog','dog',NULL,NULL,NULL,NULL,'2024-03-29 15:38:41',NULL),(18,NULL,'cat','cat',NULL,NULL,NULL,NULL,'2024-04-01 14:18:57',9),(19,2,'cat','cat',NULL,NULL,NULL,NULL,'2024-04-01 14:37:35',NULL),(20,NULL,'dog','dog',NULL,NULL,NULL,NULL,'2024-04-01 14:51:51',9),(21,NULL,'dog','dog',NULL,NULL,NULL,NULL,'2024-04-01 14:53:37',9),(22,NULL,'dog','dog',NULL,NULL,NULL,NULL,'2024-04-01 14:57:36',9),(23,NULL,'dog','dog',NULL,NULL,NULL,NULL,'2024-04-01 15:00:37',9),(24,2,'parrot','parrot',NULL,NULL,NULL,NULL,'2024-04-01 15:01:08',NULL),(25,2,'dog','dog',NULL,NULL,NULL,NULL,'2024-04-25 16:10:06',NULL),(26,2,'cat','cat',NULL,NULL,NULL,NULL,'2024-04-25 16:14:16',NULL),(27,NULL,'cat','cat',NULL,NULL,NULL,NULL,'2024-05-09 16:55:46',9),(28,NULL,'d','d',NULL,NULL,NULL,NULL,'2024-05-09 16:55:57',9),(29,NULL,'cat','cat',NULL,NULL,NULL,NULL,'2024-05-10 15:18:18',9),(30,NULL,'d','d',NULL,NULL,NULL,NULL,'2024-05-10 15:18:28',9);
/*!40000 ALTER TABLE `savedsearches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searchfilters`
--

DROP TABLE IF EXISTS `searchfilters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `searchfilters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `location` varchar(100) DEFAULT NULL,
  `pet_type` varchar(50) DEFAULT NULL,
  `size` varchar(20) DEFAULT NULL,
  `age` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searchfilters`
--

LOCK TABLES `searchfilters` WRITE;
/*!40000 ALTER TABLE `searchfilters` DISABLE KEYS */;
INSERT INTO `searchfilters` VALUES (1,'vijayawada','dog','45',4),(2,'vijaywada','dog','4.5',3),(3,'vijayawada','dog','4.5',3),(4,'vijayawada','dog','4.5',3),(5,'vijayawada','dog','4.5',3),(6,'vijayawada','dog','4.5',3),(7,'vijayawada','dog','4.5',3),(8,'New York City','dog','large',5),(9,'New York City','dog','large',3),(10,'New York City','dog','large',3),(11,'vijayawada','parrot','medium',3),(12,'new york','dog','small',4),(13,'vijayawada','parrot','medium',5);
/*!40000 ALTER TABLE `searchfilters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shelters`
--

DROP TABLE IF EXISTS `shelters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shelters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `contact_person` varchar(100) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shelters`
--

LOCK TABLES `shelters` WRITE;
/*!40000 ALTER TABLE `shelters` DISABLE KEYS */;
INSERT INTO `shelters` VALUES (9,'anusha','vijayawada','12121212','anusha@codegnan.com','1212121212','');
/*!40000 ALTER TABLE `shelters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `registration_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'anusha','anusha@codegnan.com','123','2024-03-29 08:52:43');
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

-- Dump completed on 2024-05-10 17:25:23
