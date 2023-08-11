CREATE DATABASE  IF NOT EXISTS `swp391_project` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `swp391_project`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: swp391_project
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `bookingTime` date NOT NULL,
  `reason` varchar(200) DEFAULT NULL,
  `createdTime` datetime NOT NULL,
  `patient_id` int NOT NULL,
  `status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`bookingTime`,`patient_id`),
  KEY `fk_booking_user1_idx` (`patient_id`),
  CONSTRAINT `fk_booking_user1` FOREIGN KEY (`patient_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES ('2023-02-26','adf','2023-03-04 15:56:22',1,NULL),('2023-03-25','adf','2023-03-05 10:03:11',1,NULL);
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat` (
  `time` datetime NOT NULL,
  `detail` varchar(1000) DEFAULT NULL,
  `from_user_id` int NOT NULL,
  `to_user_id` int NOT NULL,
  PRIMARY KEY (`time`,`from_user_id`,`to_user_id`),
  KEY `fk_chat_user1_idx` (`from_user_id`),
  KEY `fk_chat_user2_idx` (`to_user_id`),
  CONSTRAINT `fk_chat_user1` FOREIGN KEY (`from_user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `fk_chat_user2` FOREIGN KEY (`to_user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat`
--

LOCK TABLES `chat` WRITE;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drug`
--

DROP TABLE IF EXISTS `drug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drug` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `unit_price` varchar(100) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `quantity_in_stock` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drug`
--

LOCK TABLES `drug` WRITE;
/*!40000 ALTER TABLE `drug` DISABLE KEYS */;
INSERT INTO `drug` VALUES (1,'Abrocto','Ống',6000,8990),(2,'Aerius 5mg','Viên',10000,8700),(3,'aescin 20mg','Viên',3000,869),(4,'agihistine 24','Viên',3100,386),(5,'alclav bid dry syrup','Chai',115000,210),(6,'Alerday 120 ','Viên',6000,995),(7,'Alfokid Syrup','Túi 5ml',11700,957),(8,'Allergex','Viên',9400,999),(9,'Alphadeka','Vỉ',3000,999),(10,'Alphatab','Viên',2000,987),(11,'Anginovag','Lọ',111300,999),(17,'Khám tai mũi họng abc1','thùng',12312,12),(18,'test1','lo',1200,-27),(19,'test2','12',12,2),(20,'tesst3','binh',12,12),(21,'4sdfsdfsd','sdfd',123,123);
/*!40000 ALTER TABLE `drug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feature`
--

DROP TABLE IF EXISTS `feature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feature` (
  `id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `url` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url_UNIQUE` (`url`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feature`
--

LOCK TABLES `feature` WRITE;
/*!40000 ALTER TABLE `feature` DISABLE KEYS */;
INSERT INTO `feature` VALUES (1,'Login','/login'),(2,'Logout','/logout'),(3,'Home','/home'),(4,'ViewDiseaseList','/view/disease-list'),(5,'ViewDiseaseDetail','/view/disease-detail'),(6,'ViewTreatmentList','/view/treatment-list'),(7,'ViewTreatmentDetail','/view/treatment-detail'),(8,'Register','/register'),(9,'ResetPassword','/reset-pass'),(10,'UserProfile','/common/profile'),(11,'PatientDashboard','/patient/dashboard'),(12,'MyBill','/patient/bill'),(13,'MyBookedList','/patient/booked-list'),(14,'MyMedicalReportList','/patient/medical-report-list'),(15,'MyMedicalReportDetail','/patient/medical-report-detail'),(16,'MyTreatmentDetail','/patient/treatment-detail'),(17,'AddBill','/doctor/add-bill'),(18,'AddTreatment','/doctor/add-treatment'),(19,'EditExamination','/doctor/edit-examination'),(20,'WaitingPatientList','/doctor/waiting-patient-list'),(21,'DoctorPatientMedicalReportList','/doctor/medical-report-list'),(22,'DoctorPatientMedicalReportDetail','/doctor/medical-report-detail'),(23,'DoctorDashboard','/doctor/dashboard'),(24,'ManageBookedList','/manage/booked-list'),(25,'ManageDiseaseList','/manage/disease-list'),(26,'ManageDiseaseDetail','/manage/disease-detail'),(27,'ManageDrugDosage','/manage/drug-dosage'),(28,'ManagePatientList','/manage/patient-list'),(29,'ManagePatientDetail','/manage/patient-detail'),(30,'ManageTreatmentList','/manage/treatment-list'),(31,'ManageTreatmentDetail','/manage/treatment-detail'),(32,'AdminDashboard','/admin/dashboard'),(33,'AdminUserList','/admin/user-list'),(34,'AdminUserDetail','/admin/user-detail'),(35,'Booking','/patient/booking'),(36,'RemoveBooking','/remove-booking'),(37,'AddTreatmentDetail','/doctor/add-treatment-detail'),(38,'AddDrug','/doctor/add-drug'),(39,'AddDrugDetail','/doctor/add-drug-detail'),(40,'Bill','/doctor/create-bill'),(41,'BillList','/doctor/bill-list'),(42,'ViewBookedList','/doctor/booked-list');
/*!40000 ALTER TABLE `feature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medical_report`
--

DROP TABLE IF EXISTS `medical_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medical_report` (
  `pulse` int DEFAULT NULL,
  `bloodpressure` int DEFAULT NULL,
  `breathing` int DEFAULT NULL,
  `height` int DEFAULT NULL,
  `weight` int DEFAULT NULL,
  `symptom` varchar(200) DEFAULT NULL,
  `result` varchar(200) DEFAULT NULL,
  `time` datetime NOT NULL,
  `patient_id` int NOT NULL,
  `doctor_id` int NOT NULL,
  `is_paid` bit(1) DEFAULT b'0',
  PRIMARY KEY (`patient_id`,`doctor_id`,`time`),
  KEY `fk_medical_report_user1_idx` (`patient_id`),
  KEY `fk_medical_report_user2_idx` (`doctor_id`),
  CONSTRAINT `fk_medical_report_user1` FOREIGN KEY (`patient_id`) REFERENCES `user` (`id`),
  CONSTRAINT `fk_medical_report_user2` FOREIGN KEY (`doctor_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_report`
--

LOCK TABLES `medical_report` WRITE;
/*!40000 ALTER TABLE `medical_report` DISABLE KEYS */;
INSERT INTO `medical_report` VALUES (45,45,54,45,45,'rthrt','rtyrt','2023-03-14 11:19:33',1,6,_binary '\0'),(NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-12 05:05:28',1,9,_binary '\0'),(NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-12 05:10:19',1,9,_binary '\0'),(NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-12 05:12:10',1,9,_binary '\0'),(NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-12 05:19:48',1,9,_binary '\0'),(NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-12 05:26:42',1,9,_binary '\0'),(NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-12 11:26:47',1,9,_binary '\0'),(0,0,0,0,0,'','','2023-03-13 11:06:14',1,9,_binary '\0'),(NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-14 11:27:18',1,9,_binary '\0'),(NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-14 11:35:39',1,9,_binary '\0'),(NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-14 11:41:34',1,9,_binary '\0'),(NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-14 11:42:31',1,9,_binary '\0'),(NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-14 11:49:57',1,9,_binary '\0'),(NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-14 11:52:11',1,9,_binary '\0'),(NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-14 11:54:02',1,9,_binary '\0'),(NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-14 11:59:58',1,9,_binary '\0'),(NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-14 12:01:33',1,9,_binary '\0'),(NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-14 12:07:32',1,9,_binary '\0'),(NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-14 12:10:27',1,9,_binary '\0'),(NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-14 12:13:21',1,9,_binary '\0'),(NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-14 12:17:06',1,9,_binary '\0'),(0,0,0,0,0,'','','2023-03-12 04:54:53',2,9,_binary '\0'),(NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-12 05:21:14',2,9,_binary '\0'),(1,3,50,2,4,'drsdfgsd','hfdghdfg','2023-02-28 17:32:47',3,6,_binary ''),(0,0,0,0,0,'','','2023-03-02 08:50:55',3,6,_binary ''),(0,0,0,0,0,'','','2023-03-12 04:56:56',3,9,_binary '\0'),(0,0,0,0,0,'','','2023-03-03 09:24:29',3,10,_binary '\0'),(0,0,0,0,0,'','','2023-02-28 17:33:38',4,6,_binary ''),(0,0,0,0,0,'','','2023-03-12 04:59:35',4,9,_binary '\0'),(68,86,80,160,60,'symptom E1','result E1','2023-02-28 17:34:09',5,6,_binary ''),(71,87,85,160,62,'symptom E3','result E3','2023-03-01 09:42:43',5,6,_binary ''),(70,85,90,160,59,'symptom E2','result E2','2023-03-05 02:54:52',5,6,_binary ''),(75,88,90,160,61,'symptom E4','result E4','2023-03-01 19:33:09',5,10,_binary ''),(99,99,99,99,99,'symptom E5','result E5','2023-03-11 09:15:09',5,10,_binary ''),(123,47,568,543,34,'gfhddf','srtert','2023-03-01 15:20:19',448,6,_binary ''),(NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-12 05:01:25',448,9,_binary '\0'),(NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-01 17:22:12',580,6,_binary ''),(NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-01 17:28:08',580,6,_binary '\0'),(NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-01 18:28:44',580,6,_binary ''),(NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-01 19:24:25',580,6,_binary '\0'),(NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-02 09:02:04',580,6,_binary '\0'),(NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-04 15:57:35',580,6,_binary '\0'),(1,3,5,2,4,'asdf','xcvbxcv','2023-03-04 16:11:04',580,6,_binary '\0'),(0,5,456,12,345,'asdf','afd','2023-03-04 16:14:30',580,6,_binary '\0'),(NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-04 16:15:38',580,6,_binary '\0'),(0,2,5,1,34,'adfs','ag','2023-03-04 16:18:17',580,6,_binary '\0');
/*!40000 ALTER TABLE `medical_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medical_report_has_drug`
--

DROP TABLE IF EXISTS `medical_report_has_drug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medical_report_has_drug` (
  `patient_id` int NOT NULL,
  `doctor_id` int NOT NULL,
  `time` datetime NOT NULL,
  `drug_id` int NOT NULL,
  `amount` int DEFAULT NULL,
  `price` int DEFAULT NULL,
  `dosage` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`patient_id`,`doctor_id`,`time`,`drug_id`),
  KEY `fk_medical_report_has_drug_drug1_idx` (`drug_id`),
  KEY `fk_medical_report_has_drug_medical_report1_idx` (`patient_id`,`doctor_id`,`time`),
  CONSTRAINT `fk_medical_report_has_drug_drug1` FOREIGN KEY (`drug_id`) REFERENCES `drug` (`id`),
  CONSTRAINT `fk_medical_report_has_drug_medical_report1` FOREIGN KEY (`patient_id`, `doctor_id`, `time`) REFERENCES `medical_report` (`patient_id`, `doctor_id`, `time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_report_has_drug`
--

LOCK TABLES `medical_report_has_drug` WRITE;
/*!40000 ALTER TABLE `medical_report_has_drug` DISABLE KEYS */;
INSERT INTO `medical_report_has_drug` VALUES (1,9,'2023-03-12 05:05:28',1,3,6000,''),(1,9,'2023-03-12 05:10:19',1,4,6000,''),(1,9,'2023-03-12 05:12:10',1,7,6000,''),(1,9,'2023-03-12 05:12:10',2,3,10000,''),(1,9,'2023-03-12 05:19:48',1,1,6000,''),(1,9,'2023-03-14 11:27:18',1,100,6000,''),(1,9,'2023-03-14 11:27:18',2,100,10000,''),(1,9,'2023-03-14 11:35:39',1,100,6000,''),(1,9,'2023-03-14 11:41:34',2,100,10000,''),(1,9,'2023-03-14 11:42:31',2,100,10000,''),(1,9,'2023-03-14 11:49:57',1,50,6000,'1sdfsd'),(1,9,'2023-03-14 11:52:11',1,10,6000,'sdfsd'),(1,9,'2023-03-14 11:52:11',2,5,10000,'sdf'),(1,9,'2023-03-14 11:54:02',1,10,6000,''),(1,9,'2023-03-14 11:59:58',1,10,6000,''),(1,9,'2023-03-14 12:01:33',1,100,6000,''),(1,9,'2023-03-14 12:07:32',1,10,6000,'ưew'),(1,9,'2023-03-14 12:10:27',1,5,6000,''),(1,9,'2023-03-14 12:10:27',2,40,10000,''),(1,9,'2023-03-14 12:10:27',3,15,3000,''),(1,9,'2023-03-14 12:13:21',1,75,6000,''),(1,9,'2023-03-14 12:13:21',2,100,10000,''),(1,9,'2023-03-14 12:13:21',3,25,3000,''),(1,9,'2023-03-14 12:17:06',1,10,6000,''),(1,9,'2023-03-14 12:17:06',2,100,10000,''),(1,9,'2023-03-14 12:17:06',3,1,3000,''),(2,9,'2023-03-12 04:54:53',1,7,6000,'á'),(2,9,'2023-03-12 04:54:53',2,3,10000,''),(3,9,'2023-03-12 04:56:56',1,10,6000,''),(4,6,'2023-02-27 21:03:33',1,4,2,'new dosage second'),(4,9,'2023-03-12 04:59:35',1,10,6000,''),(4,9,'2023-03-12 04:59:35',2,83,10000,''),(5,6,'2023-02-28 17:34:09',1,10,6000,'DOSAGE E11'),(5,6,'2023-02-28 17:34:09',2,6,10000,'DOSAGE E13'),(5,6,'2023-02-28 17:34:09',5,6,115000,'DOSAGE E13'),(5,6,'2023-03-01 09:42:43',1,10,6000,'DOSAGE E31'),(5,6,'2023-03-01 09:42:43',4,6,3100,'DOSAGE E33'),(5,6,'2023-03-01 09:42:43',6,4,6000,'DOSAGE E32'),(5,6,'2023-03-05 02:54:52',1,10,6000,'DOSAGE E21'),(5,6,'2023-03-05 02:54:52',4,3,3100,'DOSAGE E22'),(5,6,'2023-03-05 02:54:52',10,12,2000,'DOSAGE E23'),(5,10,'2023-03-01 19:33:09',3,41,3000,'DOSAGE E41'),(5,10,'2023-03-01 19:33:09',7,42,11700,'DOSAGE E42'),(6,6,'2023-02-28 18:54:42',1,123,6000,'6666666'),(6,6,'2023-02-28 18:54:42',4,555,3100,'fttttt'),(6,6,'2023-02-28 21:11:11',5,777,115000,'777'),(6,6,'2023-02-28 21:11:11',18,777,1200,'777'),(448,9,'2023-03-12 05:01:25',1,82,6000,''),(448,9,'2023-03-12 05:01:25',2,93,10000,''),(448,9,'2023-03-12 05:01:25',18,10,1200,''),(580,6,'2023-03-04 15:57:35',5,3,115000,'eyf'),(580,6,'2023-03-04 16:11:04',2,456,10000,'kghghjk'),(580,6,'2023-03-04 16:11:04',6,312,6000,'fdgsgdsdgf'),(580,6,'2023-03-04 16:14:30',5,123,115000,'shsdh'),(580,6,'2023-03-04 16:18:17',1,3,6000,'g'),(580,6,'2023-03-04 16:18:17',3,123,3000,'gfd');
/*!40000 ALTER TABLE `medical_report_has_drug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medical_report_treatment_detail`
--

DROP TABLE IF EXISTS `medical_report_treatment_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medical_report_treatment_detail` (
  `medical_report_patient_id` int NOT NULL,
  `medical_report_doctor_id` int NOT NULL,
  `medical_report_time` datetime NOT NULL,
  `treatment_id` int NOT NULL,
  `detail` mediumtext NOT NULL,
  `price` int NOT NULL,
  PRIMARY KEY (`medical_report_patient_id`,`medical_report_doctor_id`,`medical_report_time`,`treatment_id`),
  KEY `fk_medical_report_has_treatment_treatment1_idx` (`treatment_id`),
  KEY `fk_medical_report_has_treatment_medical_report1_idx` (`medical_report_patient_id`,`medical_report_doctor_id`,`medical_report_time`),
  CONSTRAINT `fk_medical_report_has_treatment_medical_report1` FOREIGN KEY (`medical_report_patient_id`, `medical_report_doctor_id`, `medical_report_time`) REFERENCES `medical_report` (`patient_id`, `doctor_id`, `time`),
  CONSTRAINT `fk_medical_report_has_treatment_treatment1` FOREIGN KEY (`treatment_id`) REFERENCES `treatment` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_report_treatment_detail`
--

LOCK TABLES `medical_report_treatment_detail` WRITE;
/*!40000 ALTER TABLE `medical_report_treatment_detail` DISABLE KEYS */;
INSERT INTO `medical_report_treatment_detail` VALUES (3,10,'2023-03-03 09:24:29',5,'12431',100000),(4,6,'2023-02-27 17:43:01',2,'abc',100000),(4,6,'2023-02-27 18:27:24',2,'abc',200000),(4,6,'2023-02-27 18:27:24',13,'asd',123),(4,6,'2023-02-27 18:39:22',2,'',200000),(4,6,'2023-02-27 18:39:22',12,'agbfd',6700000),(4,6,'2023-02-27 18:42:56',2,'only edit detail of treatemetn\r\n',200000),(4,6,'2023-02-27 18:42:56',13,'adsf',123),(4,6,'2023-02-27 18:45:04',13,'asdf',123),(4,6,'2023-02-27 18:52:21',5,'Update',100000),(4,6,'2023-02-27 18:52:21',6,'asdf',100000),(4,6,'2023-02-27 18:52:21',13,'asdf',123),(4,6,'2023-02-27 21:03:33',6,'á»™i tháº£o Ä‘Ã£ thá»‘ng nháº¥t Ä‘Ã¡nh giÃ¡ Ã½ nghÄ©a lá»‹ch sá»­, giÃ¡ trá»‹ to lá»›n, mang táº§m thá»i Ä‘áº¡i vÃ  sá»©c sá»‘ng lÃ¢u dÃ i, bá»n vá»¯ng cá»§a Äá» cÆ°Æ¡ng vá» vÄƒn hÃ³a Viá»‡t Nam trÆ°á»›c yÃªu cáº§u cá»§a tÃ¬nh hÃ¬nh cÃ¡ch máº¡ng trong nÆ°á»›c. Thá»±c hiá»‡n chá»§ trÆ°Æ¡ng cá»§a Trung Æ°Æ¡ng Äáº£ng vÃ  Ä‘á»“ng chÃ­ Nguyá»…n Ãi Quá»‘c, Äá» cÆ°Æ¡ng vá» vÄƒn hÃ³a Viá»‡t Nam do Ä‘á»“ng chÃ­ Tá»•ng BÃ­ thÆ° TrÆ°á»ng Chinh khá»Ÿi tháº£o Ä‘Æ°á»£c thÃ´ng qua tai Há»™i nghá»‹ Ban ThÆ°á»ng vá»¥ Trung Æ°Æ¡ng há»p tá»« ngÃ y 25-28/2/1943. Äá» cÆ°Æ¡ng Ä‘Ã£ thá»ƒ hiá»‡n sá»± kiÃªn Ä‘á»‹nh vÃ  váº­n dá»¥ng sÃ¡ng táº¡o chá»§ nghÄ©a Marx-Lenin vÃ o Ä‘iá»u kiá»‡n thá»±c tiá»…n cÃ¡ch máº¡ng Viá»‡t Nam. Kháº³ng Ä‘á»‹nh vÄƒn hÃ³a lÃ  má»™t trong ba máº·t tráº­n (kinh táº¿, chÃ­nh trá»‹, vÄƒn hÃ³a) á»Ÿ Ä‘Ã³, ngÆ°á»i Cá»™ng sáº£n pháº£i hoáº¡t Ä‘á»™ng vÃ  lÃ m cÃ¡ch máº¡ng vÄƒn hÃ³a.\r\n',100000),(4,6,'2023-02-27 21:03:33',13,'Há»™i tháº£o hÃ´m nay cÃ¹ng vá»›i thÃ nh quáº£ Ä‘Ã£ nghiÃªn cá»©u vÃ  nhá»¯ng tÆ° liá»‡u lá»‹ch sá»­ Ä‘Ã£ cÃ´ng bá»‘, má»™t láº§n ná»¯a chá»©ng minh vÃ  kháº³ng Ä‘á»‹nh giÃ¡ trá»‹ to lá»›n, toÃ n diá»‡n cá»§a Äá» cÆ°Æ¡ng vá» vÄƒn hÃ³a Viá»‡t Nam Ä‘á»‘i vá»›i sá»± nghiá»‡p cÃ¡ch máº¡ng váº» vang cá»§a dÃ¢n tá»™c ta dÆ°á»›i sá»± lÃ£nh Ä‘áº¡o cá»§a Äáº£ng\", Ä‘á»“ng chÃ­ Nguyá»…n Trá»ng NghÄ©a kháº³ng Ä‘á»‹nh.',123),(5,6,'2023-02-28 17:34:09',2,'examination E12',200000),(5,6,'2023-02-28 17:34:09',6,'Edit examination E13',100000),(5,6,'2023-03-01 09:42:43',6,'examination E31',100000),(5,6,'2023-03-01 09:42:43',7,'examination E32',10000000),(5,6,'2023-03-01 09:42:43',10,'examination E33',9000000),(5,6,'2023-03-05 02:54:52',3,'examination E21',600000),(5,6,'2023-03-05 02:54:52',5,'examination E22',100000),(5,10,'2023-03-01 19:33:09',5,'examination E41',100000),(5,10,'2023-03-01 19:33:09',10,'examination E42',9000000),(6,6,'2023-02-28 18:54:42',5,'66666',100000),(6,6,'2023-02-28 18:54:42',7,'666666',10000000),(6,6,'2023-02-28 21:11:11',9,'7777',8000000),(580,6,'2023-03-04 15:57:35',6,'asdfsda',100000),(580,6,'2023-03-04 16:11:04',6,'asdffdsa',100000),(580,6,'2023-03-04 16:11:04',12,'fhgjfgh',6700000),(580,6,'2023-03-04 16:14:30',3,'22552',600000),(580,6,'2023-03-04 16:18:17',2,'',200000),(580,6,'2023-03-04 16:18:17',6,'123',100000);
/*!40000 ALTER TABLE `medical_report_treatment_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Patient'),(2,'Doctor'),(3,'Manage'),(4,'Admin');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_feature`
--

DROP TABLE IF EXISTS `role_has_feature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_feature` (
  `role_id` int NOT NULL,
  `feature_id` int NOT NULL,
  PRIMARY KEY (`role_id`,`feature_id`),
  KEY `fk_role_has_feature_feature1_idx` (`feature_id`),
  KEY `fk_role_has_feature_role1_idx` (`role_id`),
  CONSTRAINT `fk_role_has_feature_feature1` FOREIGN KEY (`feature_id`) REFERENCES `feature` (`id`),
  CONSTRAINT `fk_role_has_feature_role1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_feature`
--

LOCK TABLES `role_has_feature` WRITE;
/*!40000 ALTER TABLE `role_has_feature` DISABLE KEYS */;
INSERT INTO `role_has_feature` VALUES (1,1),(2,1),(3,1),(4,1),(1,2),(2,2),(3,2),(4,2),(1,3),(2,3),(3,3),(4,3),(1,4),(2,4),(3,4),(4,4),(1,5),(2,5),(3,5),(4,5),(1,6),(2,6),(3,6),(4,6),(1,7),(2,7),(3,7),(4,7),(1,8),(2,8),(3,8),(4,8),(1,9),(2,9),(3,9),(4,9),(1,10),(2,10),(3,10),(4,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(2,17),(2,18),(2,19),(2,20),(2,21),(2,22),(2,23),(3,24),(3,25),(3,26),(3,27),(3,28),(3,29),(3,30),(3,31),(4,32),(4,33),(4,34),(1,35),(1,36),(3,36),(2,37),(2,38),(2,39),(2,40),(2,41),(2,42);
/*!40000 ALTER TABLE `role_has_feature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` VALUES (1,'Khám tai mũi họng ','Các bác sĩ giàu kinh nghiệm, đánh giá sức khỏe của tai mũi họng và chẩn đoán bệnh. Đưa ra những phương pháp điều trị phù hợp.'),(2,'Kê đơn thuốc','Chọn những loại thuốc tốt nhất và an toàn nhất cho tình trạng bệnh của bạn. Cung cấp các loại thuốc chính hãng và chất lượng cao.'),(3,'Nội soi','Dịch vụ chuyên nghiệp với trang thiết bị tiên tiến và kỹ thuật viên có kinh nghiệm. Xác định tình trạng bệnh chính xác và nhanh chóng.'),(4,'Thủ thuật can thiệp','Thủ Thuật Can Thiệp chuyên nghiệp(chỉnh hình, nạo VA, ...) với đội ngũ bác sỹ chuyên khoa giàu kinh nghiệm và trang thiết bị hiện đại. '),(16,'sdfsdfsdfsdf','sdfsdfsdfsdfsd');
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treatment`
--

DROP TABLE IF EXISTS `treatment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treatment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treatment`
--

LOCK TABLES `treatment` WRITE;
/*!40000 ALTER TABLE `treatment` DISABLE KEYS */;
INSERT INTO `treatment` VALUES (1,'Khám bệnh liên quan Tai – Mũi – Họng thông thường',85000),(2,'Khám và nội soi vùng Tai – Mũi – Họng (không áp dụng BHYT)',200000),(3,'Khám và nội soi ống so mềm, bước sóng ngắn vùng Tai – Mũi – Họng (áp dụng cho bệnh nhân trên 12 tuổi)',600000),(4,'Chụp X-quang cho xương sọ (một tư thế)',80000),(5,'Chụp X-Quang cho xương chũm, mỏm chũm',100000),(6,'Chụp Blondeau hoặc Hirtz',100000),(7,'Cấy ốc tai điện tử loại đặc biệt',10000000),(8,'Phẫu thuật cấy máy trợ thính đường xương(BAHA) loại 1',8000000),(9,'Phẫu thuật đặt điện cực tai giữa loại 1',8000000),(10,'Phẫu thuật khoét mê nhĩ loại đặc biệt',9000000),(11,'Phẫu thuật cắt dây thần kinh Vidienne loại 1',6700000),(12,'Phẫu thuật nội soi cắt dây thần kinh Vidienne loại 1',6700000);
/*!40000 ALTER TABLE `treatment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` text,
  `avatarUrl` varchar(45) DEFAULT NULL,
  `description` mediumtext,
  `dob` date DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `gender` bit(1) DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `passwordHash` varchar(100) NOT NULL,
  `active` bit(1) DEFAULT NULL,
  `room` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'A','HÃƒÂ²a LÃ¡ÂºÂ¡c ThÃ¡ÂºÂ¡ch ThÃ¡ÂºÂ¥t HÃƒÂ  NÃ¡Â»â„¢i',NULL,'-BÃ¡Â»â€¹ bÃƒÂ©o phÃƒÂ¬\\n-BÃ¡Â»â€¹ trÃ„Â© \\n-BÃ¡Â»â€¹ Ã„â€˜au mÃ¡ÂºÂ¯t ','2002-01-01','1234',_binary '','mra','mra',_binary '',1),(2,'B',NULL,NULL,'','2002-01-02','1235',_binary '','mrb','mrb',_binary '',2),(3,'C',NULL,NULL,'Update note for C++\r\nUpdate 1','2002-01-03','1236',_binary '\0','mrc','mrc',_binary '',3),(4,'D',NULL,NULL,'First note for patient 4','2002-01-04','1237',_binary '','mrd','mrd',_binary '',4),(5,'E','Đối diện nghĩa trang xã Hạ Bằng, Thạch Hòa, Thạch Thất, Hà Nội',NULL,'','2002-01-05','1238',_binary '\0','mre','mre',_binary '',5),(6,'F',NULL,'../image/doctor/mrf.jpg','a\nb\nc\n','2002-01-06','1239',_binary '','mrf','mrf',_binary '',6),(7,'G',NULL,NULL,'PhÃƒÂ¡t biÃ¡Â»Æ’u khai mÃ¡ÂºÂ¡c cuÃ¡Â»â„¢c hÃ¡Â»Âp, ThÃ¡Â»Â§ tÃ†Â°Ã¡Â»â€ºng PhÃ¡ÂºÂ¡m Minh ChÃƒÂ­nh nhÃ¡ÂºÂ¥n mÃ¡ÂºÂ¡nh tinh thÃ¡ÂºÂ§n cÃ¡Â»Â§a cuÃ¡Â»â„¢c lÃƒÂ m viÃ¡Â»â€¡c lÃƒÂ  phÃ¡ÂºÂ£i thÃ¡ÂºÂ³ng thÃ¡ÂºÂ¯n, chÃƒÂ¢n thÃƒÂ nh, tÃƒÂ¬m Ã„â€˜Ã†Â°Ã¡Â»Â£c \"Ã„â€˜Ã¡ÂºÂ§u ra\" cho cÃƒÂ´ng viÃ¡Â»â€¡c, cho cÃƒÂ¡c khÃƒÂ³ khÃ„Æ’n, vÃ†Â°Ã¡Â»â€ºng mÃ¡ÂºÂ¯c; khÃƒÂ´ng nao nÃƒÂºng mÃ¡ÂºÂ¥t bÃ¡ÂºÂ£n lÃ„Â©nh khi khÃƒÂ³ khÃ„Æ’n, cÃ…Â©ng khÃƒÂ´ng chÃ¡Â»Â§ quan, lÃ†Â¡ lÃƒÂ  khi tÃƒÂ¬nh hÃƒÂ¬nh thuÃ¡ÂºÂ­n lÃ¡Â»Â£i hÃ†Â¡n.','2002-01-07','1240',_binary '\0','mrg','mrg',_binary '',7),(8,'H',NULL,NULL,'BÃƒÂ¡o cÃƒÂ¡o cÃ¡Â»Â§a TÃ¡Â»â€°nh Ã¡Â»Â§y BÃ¡ÂºÂ¿n Tre tÃ¡ÂºÂ¡i buÃ¡Â»â€¢i lÃƒÂ m viÃ¡Â»â€¡c cho biÃ¡ÂºÂ¿t, nÃ„Æ’m 2022, tÃ¡Â»â€°nh Ã„â€˜Ã¡ÂºÂ¡t vÃƒÂ  vÃ†Â°Ã¡Â»Â£t 15/25 chÃ¡Â»â€° tiÃƒÂªu; GRDP tÃ„Æ’ng 7,33%, cÃ†Â¡ cÃ¡ÂºÂ¥u kinh tÃ¡ÂºÂ¿ chuyÃ¡Â»Æ’n dÃ¡Â»â€¹ch Ã„â€˜ÃƒÂºng hÃ†Â°Ã¡Â»â€ºng; xuÃ¡ÂºÂ¥t khÃ¡ÂºÂ©u Ã†Â°Ã¡Â»â€ºc Ã„â€˜Ã¡ÂºÂ¡t 1,51 tÃ¡Â»Â· USD, tÃ„Æ’ng 19,69%, Ã„â€˜Ã¡ÂºÂ·c biÃ¡Â»â€¡t lÃƒÂ  bÃ†Â°Ã¡Â»Å¸i da xanh (loÃ¡ÂºÂ¡i trÃƒÂ¡i cÃƒÂ¢y thÃ¡Â»Â© 7 cÃ¡Â»Â§a nÃ†Â°Ã¡Â»â€ºc ta) Ã„â€˜Ã†Â°Ã¡Â»Â£c phÃƒÂ©p nhÃ¡ÂºÂ­p khÃ¡ÂºÂ©u vÃƒÂ o thÃ¡Â»â€¹ trÃ†Â°Ã¡Â»Âng MÃ¡Â»Â¹. Thu ngÃƒÂ¢n sÃƒÂ¡ch NhÃƒÂ  nÃ†Â°Ã¡Â»â€ºc Ã„â€˜Ã¡ÂºÂ¡t trÃƒÂªn 5.635 tÃ¡Â»Â· Ã„â€˜Ã¡Â»â€œng, bÃ¡ÂºÂ±ng 106,43% dÃ¡Â»Â± toÃƒÂ¡n Trung Ã†Â°Ã†Â¡ng giao.','2002-01-08','1241',_binary '','mrh','mrh',_binary '',8),(9,'I',NULL,NULL,'SÃƒÂ¡ng 16/2, trong chuyÃ¡ÂºÂ¿n cÃƒÂ´ng tÃƒÂ¡c tÃ¡ÂºÂ¡i BÃ¡ÂºÂ¿n Tre, ThÃ¡Â»Â§ tÃ†Â°Ã¡Â»â€ºng PhÃ¡ÂºÂ¡m Minh ChÃƒÂ­nh vÃƒÂ  Ã„â€˜oÃƒÂ n cÃƒÂ´ng tÃƒÂ¡c Ã„â€˜ÃƒÂ£ lÃƒÂ m viÃ¡Â»â€¡c vÃ¡Â»â€ºi Ban ThÃ†Â°Ã¡Â»Âng vÃ¡Â»Â¥ TÃ¡Â»â€°nh Ã¡Â»Â§y BÃ¡ÂºÂ¿n Tre Ã„â€˜ÃƒÂ¡nh giÃƒÂ¡ kÃ¡ÂºÂ¿t quÃ¡ÂºÂ£ phÃƒÂ¡t triÃ¡Â»Æ’n kinh tÃ¡ÂºÂ¿-xÃƒÂ£ hÃ¡Â»â„¢i nÃ„Æ’m 2022, trao Ã„â€˜Ã¡Â»â€¢i, thÃ¡ÂºÂ£o luÃ¡ÂºÂ­n phÃ†Â°Ã†Â¡ng hÃ†Â°Ã¡Â»â€ºng, nhiÃ¡Â»â€¡m vÃ¡Â»Â¥ nÃ„Æ’m 2023, giÃ¡ÂºÂ£i quyÃ¡ÂºÂ¿t cÃƒÂ¡c khÃƒÂ³ khÃ„Æ’n, vÃ†Â°Ã¡Â»â€ºng mÃ¡ÂºÂ¯c vÃƒÂ  xÃ¡Â»Â­ lÃƒÂ½ kiÃ¡ÂºÂ¿n nghÃ¡Â»â€¹ nhÃ¡ÂºÂ±m hÃ¡Â»â€” trÃ¡Â»Â£ BÃ¡ÂºÂ¿n Tre phÃƒÂ¡t triÃ¡Â»Æ’n nhanh, bÃ¡Â»Ân vÃ¡Â»Â¯ng.','2002-01-09','1242',_binary '\0','mri','mri',_binary '',9),(10,'K',NULL,NULL,'C:\\Users\\nguye\\Desktop\\SWP391_Project\\web\\description\\mrk.txt','2002-01-10','1243',_binary '','mrk','mrk',_binary '',10),(448,'Nguyen Van A','Hoa Lac Thach That',NULL,'','2023-02-01','123456789',_binary '','nva','nva',NULL,NULL),(580,'Nguyen Van B','Hoa Lac Thach That',NULL,'Not for 580','2023-02-11','1234564121',_binary '\0','nvb','nvb',NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_has_role`
--

DROP TABLE IF EXISTS `user_has_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_has_role` (
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `fk_user_has_role_role1_idx` (`role_id`),
  KEY `fk_user_has_role_user1_idx` (`user_id`),
  CONSTRAINT `fk_user_has_role_role1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  CONSTRAINT `fk_user_has_role_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_has_role`
--

LOCK TABLES `user_has_role` WRITE;
/*!40000 ALTER TABLE `user_has_role` DISABLE KEYS */;
INSERT INTO `user_has_role` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(9,1),(10,1),(448,1),(580,1),(6,2),(7,2),(8,2),(9,2),(10,2),(8,3),(9,3),(10,3),(10,4);
/*!40000 ALTER TABLE `user_has_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waiting_patient`
--

DROP TABLE IF EXISTS `waiting_patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `waiting_patient` (
  `patient_id` int NOT NULL,
  `reason` varchar(200) DEFAULT NULL,
  `room` int DEFAULT NULL,
  `arrival_time` varchar(45) DEFAULT NULL,
  `book_created_time` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waiting_patient`
--

LOCK TABLES `waiting_patient` WRITE;
/*!40000 ALTER TABLE `waiting_patient` DISABLE KEYS */;
/*!40000 ALTER TABLE `waiting_patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'swp391_project'
--

--
-- Dumping routines for database 'swp391_project'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-14 12:22:50
