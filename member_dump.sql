-- MySQL dump 10.13  Distrib 9.3.0, for macos14.7 (x86_64)
--
-- Host: localhost    Database: member
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `president`
--

DROP TABLE IF EXISTS `president`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `president` (
  `president_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `address` varchar(150) NOT NULL,
  `password` varchar(200) NOT NULL,
  `email` varchar(50) NOT NULL,
  `birth_date` date NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `terms_accept` tinyint(1) NOT NULL,
  `version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`president_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone_number` (`phone_number`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `president`
--

LOCK TABLES `president` WRITE;
/*!40000 ALTER TABLE `president` DISABLE KEYS */;
INSERT INTO `president` VALUES (1,'박준현','서울특별시 강동구','$2a$10$uLcw59Gv7u6YvrillYCLzeahIUH98FFZf/N5LI6FgwZhMrAZLGrVm','j525252p@gmail.com','2000-04-14','010-1111-1111',1,0),(2,'임지혁','서울특별시 강동구2','$2a$10$uUENU1ovZzf2g2FsnP4.ge2gGeydIXtBydfH62b0nnzpyAx/ZZFVC','kpaasteacher@gmail.com','2000-04-14','010-1111-1112',1,0),(3,'이현아','서울특별시 강동구2','$2a$10$uUENU1ovZzf2g2FsnP4.ge2gGeydIXtBydfH62b0nnzpyAx/ZZFVC','kpaasteacher23@gmail.com','2000-04-15','010-1111-1113',1,8);
/*!40000 ALTER TABLE `president` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store` (
  `store_id` int NOT NULL AUTO_INCREMENT,
  `store_name` varchar(50) NOT NULL,
  `business_number` varchar(50) NOT NULL,
  `account_number` varchar(50) NOT NULL,
  `bank_code` varchar(50) NOT NULL,
  `location` varchar(100) NOT NULL,
  `latitude` decimal(10,7) NOT NULL,
  `longitude` decimal(10,7) NOT NULL,
  `president_id` int NOT NULL,
  `version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`store_id`),
  UNIQUE KEY `store_name` (`store_name`),
  KEY `store_president_fk` (`president_id`),
  CONSTRAINT `store_president_fk` FOREIGN KEY (`president_id`) REFERENCES `president` (`president_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` VALUES (1,'짜글이집 상암점 ','11111111111','11111111111','020','마포구 월드컵북로 434',37.5816010,126.8861180,2,0),(2,'짜글이집 강남점 ','11111111112','11111111112','020','서울특별시 강남구 강남대로 396',37.4980950,127.0276100,2,0),(3,'상암점3','11111111113','11111111113','020','마포구 월드컵북로 434',37.5816010,126.8861180,1,0),(4,'상암점4','11111111114','11111111114','020','마포구 월드컵북로 434',37.5816010,126.8861180,1,0);
/*!40000 ALTER TABLE `store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_employee`
--

DROP TABLE IF EXISTS `store_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_employee` (
  `se_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `sex` tinyint(1) NOT NULL,
  `address` varchar(150) NOT NULL,
  `birth_date` date NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `salary` int NOT NULL,
  `employment_type` tinyint NOT NULL,
  `bank_code` varchar(50) NOT NULL,
  `account_number` varchar(50) NOT NULL,
  `payment_date` int NOT NULL,
  `store_id` int NOT NULL,
  `version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`se_id`),
  UNIQUE KEY `store_employee_email_unique` (`store_id`,`email`),
  CONSTRAINT `store_employee_store_fk` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `payment_date_range` CHECK (((`payment_date` >= 1) and (`payment_date` <= 28)))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_employee`
--

LOCK TABLES `store_employee` WRITE;
/*!40000 ALTER TABLE `store_employee` DISABLE KEYS */;
INSERT INTO `store_employee` VALUES (1,'김민준',1,'서울시 강남구 역삼동 123-45','1990-03-15','010-2222-2222','dealon77@gmail.com',10000,1,'020','22222222222',20,1,0),(2,'이서연',1,'서울시 서초구 서초동 234-56','1993-07-22','010-2222-3333','j2818p@gmail.com',10000,1,'003','33333333333',20,1,0),(3,'박지우',1,'서울시 송파구 잠실동 345-67','1988-11-30','010-2222-4444','jiwoo.park@email.com',130,2,'003','44444444444',20,1,0),(4,'최예린',1,'경기도 성남시 분당구 456-78','1995-04-18','010-2222-5555','yerin.choi@email.com',110,1,'020','55555555555',20,1,0),(5,'정현우',1,'인천시 연수구 송도동 567-89','1992-09-25','010-2222-6666','hyunwoo.jung@email.com',140,2,'003','66666666666',20,1,0),(6,'강지아',1,'경기도 수원시 영통구 678-90','1991-01-12','010-2222-7777','jia.kang@email.com',125,1,'003','77777777777',20,1,0),(7,'황승현',1,'서울시 마포구 홍대동 789-01','1994-06-08','010-2222-8888','seunghyun.hwang@email.com',115,2,'020','88888888888',20,1,0),(8,'임소율',1,'경기도 고양시 일산동구 890-12','1989-12-03','010-2222-9999','soyul.im@email.com',135,1,'020','99999999999',20,1,0),(9,'송도윤',1,'서울시 영등포구 여의도동 901-23','1987-08-20','010-2222-1111','doyun.song@email.com',145,2,'003','99999999910',20,1,0),(10,'한주원',1,'경기도 용인시 수지구 012-34','1996-02-28','010-2222-0000','joowon.han@email.com',105,1,'003','20000000000',20,1,0);
/*!40000 ALTER TABLE `store_employee` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-07 19:35:42
