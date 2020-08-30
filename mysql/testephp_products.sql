CREATE DATABASE  IF NOT EXISTS `testephp` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `testephp`;
-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: testephp
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
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'minima labore consequatur',20228,'2020-08-30 21:33:29','2020-08-30 21:33:29'),(2,'iste enim provident',77228,'2020-08-30 21:33:29','2020-08-30 21:33:29'),(3,'excepturi quam quibusdam',84539,'2020-08-30 21:33:29','2020-08-30 21:33:29'),(4,'odio accusamus voluptates',94425,'2020-08-30 21:33:29','2020-08-30 21:33:29'),(5,'et architecto quaerat',17189,'2020-08-30 21:33:29','2020-08-30 21:33:29'),(6,'debitis sint praesentium',94758,'2020-08-30 21:33:29','2020-08-30 21:33:29'),(7,'placeat aut enim',50088,'2020-08-30 21:33:29','2020-08-30 21:33:29'),(8,'consequatur laboriosam aperiam',11180,'2020-08-30 21:33:29','2020-08-30 21:33:29'),(9,'et et magnam',49289,'2020-08-30 21:33:29','2020-08-30 21:33:29'),(10,'inventore quis qui',91801,'2020-08-30 21:33:29','2020-08-30 21:33:29'),(11,'voluptatem exercitationem vel',87770,'2020-08-30 21:33:29','2020-08-30 21:33:29'),(12,'nobis reprehenderit harum',48886,'2020-08-30 21:33:29','2020-08-30 21:33:29'),(13,'ipsum qui atque',24392,'2020-08-30 21:33:29','2020-08-30 21:33:29'),(14,'rerum quis laboriosam',76702,'2020-08-30 21:33:29','2020-08-30 21:33:29'),(15,'at quae modi',98690,'2020-08-30 21:33:29','2020-08-30 21:33:29'),(16,'nesciunt explicabo nostrum',54197,'2020-08-30 21:33:29','2020-08-30 21:33:29'),(17,'possimus modi aut',97841,'2020-08-30 21:33:29','2020-08-30 21:33:29'),(18,'qui consequatur modi',26182,'2020-08-30 21:33:29','2020-08-30 21:33:29'),(19,'officiis ipsa atque',68325,'2020-08-30 21:33:29','2020-08-30 21:33:29'),(20,'voluptatibus dolorem soluta',67709,'2020-08-30 21:33:29','2020-08-30 21:33:29'),(21,'ratione qui voluptate',29155,'2020-08-30 21:33:29','2020-08-30 21:33:29'),(22,'consectetur aperiam iusto',81395,'2020-08-30 21:33:29','2020-08-30 21:33:29'),(23,'eaque et iste',25431,'2020-08-30 21:33:29','2020-08-30 21:33:29'),(24,'tenetur harum quo',28420,'2020-08-30 21:33:29','2020-08-30 21:33:29'),(25,'occaecati consequatur est',26020,'2020-08-30 21:33:29','2020-08-30 21:33:29'),(26,'temporibus omnis et',76848,'2020-08-30 21:33:29','2020-08-30 21:33:29'),(27,'aspernatur tempora sunt',55649,'2020-08-30 21:33:29','2020-08-30 21:33:29'),(28,'aliquid et labore',79125,'2020-08-30 21:33:29','2020-08-30 21:33:29'),(29,'voluptas sit explicabo',73773,'2020-08-30 21:33:29','2020-08-30 21:33:29'),(30,'sed excepturi iusto',26013,'2020-08-30 21:33:29','2020-08-30 21:33:29'),(31,'cum ducimus quia',33512,'2020-08-30 21:33:29','2020-08-30 21:33:29'),(32,'ab totam et',96822,'2020-08-30 21:33:29','2020-08-30 21:33:29'),(33,'et provident aut',57120,'2020-08-30 21:33:29','2020-08-30 21:33:29'),(34,'deserunt reprehenderit adipisci',1674,'2020-08-30 21:33:29','2020-08-30 21:33:29'),(35,'ipsum est corrupti',10301,'2020-08-30 21:33:29','2020-08-30 21:33:29'),(36,'quia hic commodi',70300,'2020-08-30 21:33:29','2020-08-30 21:33:29'),(37,'id quod autem',66455,'2020-08-30 21:33:29','2020-08-30 21:33:29'),(38,'harum aut natus',68876,'2020-08-30 21:33:29','2020-08-30 21:33:29'),(39,'in qui debitis',7796,'2020-08-30 21:33:29','2020-08-30 21:33:29'),(40,'nostrum eum fugit',57737,'2020-08-30 21:33:29','2020-08-30 21:33:29'),(41,'enim laboriosam ut',48044,'2020-08-30 21:33:29','2020-08-30 21:33:29'),(42,'ut maiores mollitia',88017,'2020-08-30 21:33:29','2020-08-30 21:33:29'),(43,'vel deserunt molestias',44724,'2020-08-30 21:33:29','2020-08-30 21:33:29'),(44,'omnis voluptas eum',95240,'2020-08-30 21:33:29','2020-08-30 21:33:29'),(45,'maiores rerum libero',80251,'2020-08-30 21:33:29','2020-08-30 21:33:29'),(46,'maiores cupiditate excepturi',65455,'2020-08-30 21:33:29','2020-08-30 21:33:29'),(47,'sed neque quo',84067,'2020-08-30 21:33:29','2020-08-30 21:33:29'),(48,'neque temporibus quae',32501,'2020-08-30 21:33:29','2020-08-30 21:33:29'),(49,'magnam minima cupiditate',63107,'2020-08-30 21:33:29','2020-08-30 21:33:29'),(50,'ullam vel qui',20569,'2020-08-30 21:33:29','2020-08-30 21:33:29');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-30 15:36:03
