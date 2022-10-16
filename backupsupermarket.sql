-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: e_shop_supermarket
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Current Database: `e_shop_supermarket`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `e_shop_supermarket` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `e_shop_supermarket`;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `address_id` int NOT NULL,
  `street` varchar(40) DEFAULT NULL,
  `number` int DEFAULT NULL,
  `flat` int DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `postal_code` varchar(8) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,'Agiou Sila',32,0,'Limassol','Limassol','4878','Cyprus'),(2,'Bouboulinas',32,0,'Limassol','Limassol','3476','Cyprus'),(3,'Karaiskaki',102,304,'Limassol','Limassol','2692','Cyprus'),(4,'Arch. Makariou III',7,202,'Limassol','Limassol','2392','Cyprus'),(5,'Eleftherias',32,0,'Keryneia','Keryneia','1974','Cyprus'),(6,'28 Oktovriou',28,101,'Larnaca','Larnaca','7000','Cyprus'),(7,'Arch. Makariou III',2,108,'Nicosia','Nicosia','1092','Cyprus');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brands` (
  `brand_id` int NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (60,'Yummy'),(61,'Best Drinks'),(62,'Mitsides'),(63,'Best Snacks'),(64,'Lays'),(65,'Farm Fresh'),(66,'Dixan'),(67,'Dettol'),(68,'Bakery'),(69,'Delicious'),(70,'Others');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` int NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (300,'Asian Cousine'),(301,'Care Products'),(302,'Frozen'),(303,'Dairy'),(304,'Meat and Fish'),(305,'Bread and bread spreads'),(306,'Dried Goods'),(307,'Friuts and Vegetables'),(308,'Snacks'),(309,'Cleaning'),(310,'Laundry'),(311,'Drinks');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `employee_id` int NOT NULL,
  `people_id` int DEFAULT NULL,
  `job_title` varchar(30) DEFAULT NULL,
  `manager_id` int DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `fk_people` (`people_id`),
  KEY `fk_manager` (`manager_id`),
  CONSTRAINT `fk_manager` FOREIGN KEY (`manager_id`) REFERENCES `employees` (`employee_id`),
  CONSTRAINT `fk_people` FOREIGN KEY (`people_id`) REFERENCES `people` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (31,101,'Shop Manager',NULL),(32,107,'Sales Person',31),(33,102,'Warehouse Employee',31);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int DEFAULT NULL,
  `priceperproduct` float DEFAULT NULL,
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (200,1001,3,0.69),(200,1023,1,12.99),(200,1016,2,0.85),(200,1010,4,1.39),(200,1006,6,1.9),(200,1029,1,0.99),(201,1030,3,3.89),(201,1033,1,1.49),(201,1038,2,5.8),(201,1024,4,9.89),(201,1017,6,0.89),(201,1027,1,1.69),(203,1023,1,12.99),(203,1016,2,0.85),(203,1010,4,1.39),(203,1006,6,1.9),(203,1029,1,0.99),(203,1030,3,3.89),(203,1033,1,1.49),(203,1038,2,5.8),(203,1029,1,0.99),(203,1030,3,3.89),(203,1003,1,2.49),(203,1008,2,3.5),(204,1006,6,1.9),(204,1029,1,0.99),(204,1030,3,3.89),(204,1033,1,1.49),(204,1038,2,5.8),(204,1024,4,9.89),(204,1017,6,0.89),(204,1027,1,1.69),(204,1020,3,0.89),(205,1006,6,1.9),(205,1029,1,0.99),(205,1030,3,3.89),(205,1033,1,1.49),(205,1038,2,5.8),(205,1024,4,9.89),(205,1017,6,0.89),(205,1027,1,1.69),(205,1028,1,2.69),(205,1035,1,1.8);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL,
  `order_date` date DEFAULT NULL,
  `require_date` date DEFAULT NULL,
  `shipped_date` date DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  `comments` varchar(70) DEFAULT NULL,
  `username` varchar(20) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `fk_user` (`username`),
  CONSTRAINT `fk_user` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (200,'2022-10-01','2022-10-01','2022-10-03','Done','','angel91'),(201,'2022-10-02','2022-10-02','2022-10-03','Done','','phil67'),(202,'2022-10-05','2022-10-06','2022-10-08','Done','','mmich21'),(203,'2022-10-07','2022-10-08','2022-10-10','Shipped','','joedoe'),(204,'2022-10-08','2022-10-09',NULL,'Proccessing','','phil67'),(205,'2022-10-10','2022-10-11',NULL,'Proccessing','','angel91');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `payment_id` int NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `order_id` int NOT NULL,
  `amount` float DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `fk_order_pay` (`order_id`),
  CONSTRAINT `fk_order_pay` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (400,'angel91',200,200,'2022-10-01'),(401,'phil67',201,100,'2022-10-02'),(402,'mmich21',202,50,'2022-10-05'),(403,'joedoe',203,89,'2022-10-07'),(404,'phil67',204,68,'2022-10-08'),(405,'angel91',205,134,'2022-10-10');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `people`
--

DROP TABLE IF EXISTS `people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `people` (
  `id` int NOT NULL,
  `firstname` varchar(25) DEFAULT NULL,
  `lastname` varchar(25) DEFAULT NULL,
  `phone` int DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `address_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_address` (`address_id`),
  CONSTRAINT `fk_address` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `people`
--

LOCK TABLES `people` WRITE;
/*!40000 ALTER TABLE `people` DISABLE KEYS */;
INSERT INTO `people` VALUES (100,'Margarita','Smith',99999999,'margie_smith@abc.com',1),(101,'Georges','Brown',99000000,'georges@abc.com',2),(102,'Joe','Doe',97979797,'doejoe@abc.com',3),(103,'Angeliki','Brown',99900099,'mrsbrown@abc.com',2),(104,'Michael','Michail',96999996,'mmichail@abc.com',4),(105,'Georgia','Smith',92939999,'geo_smith@abc.com',5),(106,'Phillipos','Phillipou',93999499,'phillipou@abc.com',6),(107,'Anna','Georgiades',91919191,'anna_geo@abc.com',7);
/*!40000 ALTER TABLE `people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `stock_quantity` int DEFAULT NULL,
  `price` float DEFAULT NULL,
  `brand_id` int DEFAULT NULL,
  `vendor_id` int DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `fk_brand` (`brand_id`),
  KEY `fk_vendor` (`vendor_id`),
  CONSTRAINT `fk_brand` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`brand_id`),
  CONSTRAINT `fk_vendor` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`vendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1001,'Noodles','Yummy Noodles',200,0.69,60,21),(1002,'Sweet and Sour Sauce','Yummy Sweet and Sour Sauce',50,2.99,60,21),(1003,'Soya Sauce','Yummy Soya Sauce',200,3.49,60,21),(1004,'Salted Chips','Lays Salted Chips 100g',100,1.9,64,22),(1005,'Vinegar Salt Chips','Lays Vinagar and Salt Chips 100g',200,1.9,64,22),(1006,'Barbeque Chips','Lays Barbeque Chips 100g',100,1.9,64,22),(1007,'Pop Corn','Best Snacks Pop Corn 80g',300,1.5,63,21),(1008,'Walnuts','Best Snacks Walnuts 100g',80,3.5,63,21),(1009,'Almonds','Best Snacks Almonds 100g',100,3.3,63,21),(1010,'Orange Juice 1L','Best Drinks Orange Juice 1L',60,1.39,61,22),(1011,'Mango Juice 1L','Best Drinks Mango Juice 1L',40,1.49,61,22),(1012,'Apple Juice 1L','Best Drinks Apple Juice 1L',30,1.39,61,22),(1013,'Mix Juice 1L','Best Drinks Mix Juice 1L',60,1.49,61,22),(1014,'Orange Juice 0.5L','Best Drinks Orange Juice 0.5L',60,0.85,61,22),(1015,'Apple Juice 0.5L','Best Drinks Apple Juice 0.5L',60,0.85,61,22),(1016,'Mix Juice 0.5L','Best Drinks Mix Juice 0.5L',60,0.85,61,22),(1017,'Pasta No.1','Mitsides Pasta No.1',400,0.89,62,21),(1018,'Pasta No.2','Mitsides Pasta No.2',300,0.89,62,22),(1019,'Pasta No.3','Mitsides Pasta No.3',200,0.89,62,21),(1020,'Soda Drink 1','Best Drinks Soda Drink 1',70,0.89,61,21),(1021,'Soda Drink 2','Best Drinks Soda Drink 2',70,0.89,61,21),(1022,'Orange Soda Drink','Best Drinks Orange Soda Drink',70,0.89,61,21),(1023,'Cloth Soap 5kg','Dixan Cloth Soap 5kg',10,12.99,66,22),(1024,'Cloth Soap 2L','Dixan Cloth Soap 2L',70,9.89,66,22),(1025,'Cloth Conditioner 2L','Dixan Cloth Conditioner 2L',70,4.89,66,22),(1026,'Apples 1KG','Farm Fresh Apples 1kg',10,2.69,65,22),(1027,'Onions 1KG','Farm Fresh Onions 1kg',10,1.69,65,22),(1028,'Ginger 1KG','Farm Fresh Ginger 1kg',10,2.69,65,22),(1029,'Potatoes 1KG','Farm Fresh Potatoes 1kg',10,0.99,65,22),(1030,'Mangoes 1KG','Farm Fresh Mangoes 1kg',70,3.89,65,22),(1031,'Salad Mix 100g','Farm Fresh Salad Miz 100g',20,2.69,65,22),(1032,'Salad Mix 60g','Farm Fresh Salad Miz 60g',20,1.49,65,22),(1033,'Hand Soap 1L','Dettol Hand Soap 1L',200,4.9,67,21),(1034,'Soap bars','Dettol Soap Bars',60,6.6,67,21),(1035,'Bread Slice 60g','Bakery Bread Slice 60g',20,1.8,68,21),(1036,'Bread Slice 100g','Bakery Bread Slice 100g',20,2.8,68,21),(1037,'Tissue Boxes','Others Tissue Boxes',20,3.1,70,21),(1038,'Kitchen Tissue','Others Kitchen Tissue',20,5.8,70,21);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_categories`
--

DROP TABLE IF EXISTS `products_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_categories` (
  `product_id` int NOT NULL,
  `category_id` int NOT NULL,
  KEY `product_id` (`product_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `products_categories_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `products_categories_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_categories`
--

LOCK TABLES `products_categories` WRITE;
/*!40000 ALTER TABLE `products_categories` DISABLE KEYS */;
INSERT INTO `products_categories` VALUES (1001,300),(1001,306),(1002,300),(1003,300),(1004,306),(1004,308),(1005,306),(1005,308),(1006,306),(1006,308),(1007,306),(1007,308),(1008,306),(1008,308),(1009,306),(1009,308),(1010,311),(1011,311),(1012,311),(1013,311),(1014,311),(1015,311),(1016,311),(1017,306),(1018,306),(1019,306),(1020,311),(1021,311),(1022,311),(1023,310),(1024,310),(1025,310),(1026,307),(1027,307),(1028,307),(1029,307),(1030,307),(1031,307),(1032,307),(1033,301),(1033,309),(1034,301),(1034,309),(1035,305),(1036,305),(1037,301),(1037,309),(1038,309);
/*!40000 ALTER TABLE `products_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `products_full_details`
--

DROP TABLE IF EXISTS `products_full_details`;
/*!50001 DROP VIEW IF EXISTS `products_full_details`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `products_full_details` AS SELECT 
 1 AS `product_id`,
 1 AS `name`,
 1 AS `description`,
 1 AS `stock_quantity`,
 1 AS `price`,
 1 AS `brand_id`,
 1 AS `vendor_id`,
 1 AS `category_id`,
 1 AS `title`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `products_views`
--

DROP TABLE IF EXISTS `products_views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_views` (
  `username` varchar(20) NOT NULL,
  `product_id` int NOT NULL,
  `views` int DEFAULT NULL,
  KEY `username` (`username`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `products_views_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`),
  CONSTRAINT `products_views_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_views`
--

LOCK TABLES `products_views` WRITE;
/*!40000 ALTER TABLE `products_views` DISABLE KEYS */;
INSERT INTO `products_views` VALUES ('angel91',1001,3),('angel91',1023,1),('angel91',1016,2),('angel91',1010,1),('angel91',1006,9),('angel91',1029,9),('angel91',1033,3),('angel91',1034,2),('phil67',1030,3),('phil67',1033,4),('phil67',1038,5),('phil67',1024,4),('phil67',1017,6),('phil67',1027,1),('phil67',1014,7),('phil67',1001,6),('phil67',1004,1),('mmich21',1023,1),('mmich21',1016,2),('mmich21',1010,4),('mmich21',1006,6),('mmich21',1029,5),('mmich21',1030,4),('mmich21',1033,4),('mmich21',1038,2),('mmich21',1009,1),('mmich21',1031,8),('mmich21',1003,49),('mmich21',1008,2),('joedoe',1006,6),('joedoe',1029,9),('joedoe',1030,3),('joedoe',1033,4),('joedoe',1038,8),('joedoe',1024,4),('joedoe',1017,8),('joedoe',1027,1),('joedoe',1020,3),('gsmith013',1006,6),('gsmith013',1029,1),('gsmith013',1030,3),('gsmith013',1033,9),('gsmith013',1038,2),('gsmith013',1024,4),('gsmith013',1017,6),('gsmith013',1027,9),('gsmith013',1028,1),('gsmith013',1035,1);
/*!40000 ALTER TABLE `products_views` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `username` varchar(20) NOT NULL,
  `password` varchar(30) DEFAULT NULL,
  `people_id` int NOT NULL,
  PRIMARY KEY (`username`),
  KEY `fk_people_u` (`people_id`),
  CONSTRAINT `fk_people_u` FOREIGN KEY (`people_id`) REFERENCES `people` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('angel91','123456',103),('gsmith013','012345',105),('joedoe','123456',102),('mmich21','123456',104),('phil67','123456',106);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendors`
--

DROP TABLE IF EXISTS `vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendors` (
  `vendor_id` int NOT NULL,
  `people_id` int NOT NULL,
  PRIMARY KEY (`vendor_id`),
  KEY `fk_people_v` (`people_id`),
  CONSTRAINT `fk_people_v` FOREIGN KEY (`people_id`) REFERENCES `people` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendors`
--

LOCK TABLES `vendors` WRITE;
/*!40000 ALTER TABLE `vendors` DISABLE KEYS */;
INSERT INTO `vendors` VALUES (21,100),(22,104);
/*!40000 ALTER TABLE `vendors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `e_shop_supermarket`
--

USE `e_shop_supermarket`;

--
-- Final view structure for view `products_full_details`
--

/*!50001 DROP VIEW IF EXISTS `products_full_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `products_full_details` AS select `p`.`product_id` AS `product_id`,`p`.`name` AS `name`,`p`.`description` AS `description`,`p`.`stock_quantity` AS `stock_quantity`,`p`.`price` AS `price`,`p`.`brand_id` AS `brand_id`,`p`.`vendor_id` AS `vendor_id`,`c`.`category_id` AS `category_id`,`c`.`title` AS `title` from (((`products` `p` join `vendors` `v` on((`v`.`vendor_id` = `p`.`vendor_id`))) join `products_categories` `pc` on((`pc`.`product_id` = `p`.`product_id`))) join `categories` `c` on((`c`.`category_id` = `pc`.`category_id`))) order by `p`.`product_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-11 21:23:25
