-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: demo
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `client_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `client_info_id` bigint DEFAULT NULL COMMENT 'FK client_info.id。客戶個資',
  `customer_number` varchar(20) DEFAULT NULL COMMENT '客戶編號10碼',
  `email` varchar(255) NOT NULL COMMENT '客戶的Email，登入帳號',
  `password` varchar(2000) DEFAULT '' COMMENT '客戶密碼',
  `set_password_verification_code_email` varchar(36) DEFAULT NULL COMMENT '存放寄送給客戶的第一次建立密碼郵件中的驗證碼',
  `set_password_verification_code_expiry_time` timestamp NULL DEFAULT NULL COMMENT 'set_password_verification_code_email的過期時間',
  `reset_password_verification_code_email` varchar(36) DEFAULT NULL COMMENT '從有密碼後的自二次開始，每次改密碼都是透過次欄位處理\n',
  `reset_password_verification_code_expiry_time` timestamp NULL DEFAULT NULL COMMENT 'reset_password_verification_code_email的過期時間',
  `enable_two_factor` bit(1) NOT NULL DEFAULT b'1' COMMENT '1:true(啟用)、0:false(停用)\n啟用二階段驗證',
  `two_factor_code` varchar(4) DEFAULT NULL COMMENT '二階段驗證碼',
  `two_factor_code_expiry_time` timestamp NULL DEFAULT NULL COMMENT 'two_factor_code的過期時間',
  `status` int NOT NULL DEFAULT '0' COMMENT '0:通過email驗證，尚未送出基本資料\n20:基本資料送出，待指派業務\n40:業務助理審核完成\n60:業務審核完成\n100:業務主管審核完成\n-1:遭到停用\n-99:遭到禁用',
  `registration_progress_verification_code` varchar(36) DEFAULT NULL COMMENT '記錄使用者用來查詢註冊進度的驗證碼的欄位',
  `registration_progress_verification_code_expiry_time` timestamp NULL DEFAULT NULL COMMENT 'registration_progress_verification_code的過期時間\n',
  `registration_verification_code` varchar(36) DEFAULT NULL COMMENT '記錄註冊信件的驗證碼的欄位',
  `registration_verification_code_expiry_time` timestamp NULL DEFAULT NULL COMMENT '記錄註冊信件的驗證碼的過期時間',
  `login_success_date` timestamp NULL DEFAULT NULL COMMENT '最後成功登入時間',
  `login_fail_count` int DEFAULT NULL COMMENT '登入失敗次數記錄',
  `is_lock` bit(1) DEFAULT b'0' COMMENT '帳號是否因為登入失敗次數過多被鎖起來\n預設0:FALSE 沒有被鎖、1:TRUE 有被鎖\n',
  `is_locked_time` varchar(45) DEFAULT NULL COMMENT '被帳號鎖住的時間',
  `register_review_id` bigint DEFAULT NULL COMMENT '註冊審核紀錄表\n',
  `create_user` varchar(45) NOT NULL DEFAULT 'system',
  `update_user` varchar(45) NOT NULL DEFAULT 'system',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`client_id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `client_number_UNIQUE` (`customer_number`),
  UNIQUE KEY `set_password_verification_code_email_UNIQUE` (`set_password_verification_code_email`),
  UNIQUE KEY `reset_password_verification_code_email_UNIQUE` (`reset_password_verification_code_email`),
  UNIQUE KEY `registration_progress_verification_code_UNIQUE` (`registration_progress_verification_code`),
  UNIQUE KEY `registration_verification_code_UNIQUE` (`registration_verification_code`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (35,NULL,NULL,'q2381050@gmail.com','',NULL,NULL,NULL,NULL,_binary '',NULL,NULL,5,'43d02467-97d6-4b9a-8684-ea654804c6be','2024-03-20 03:04:37','4f3ffac5-7a16-4da4-ae0f-73bb3f5b6951','2024-03-20 03:03:56',NULL,0,_binary '\0',NULL,NULL,'system','system','2024-03-19 03:02:42','2024-03-19 03:04:37');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_template`
--

DROP TABLE IF EXISTS `email_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_template` (
  `email_template_id` bigint NOT NULL AUTO_INCREMENT,
  `associated_api` varchar(45) NOT NULL,
  `subject` varchar(255) DEFAULT NULL COMMENT '信件主旨',
  `content` text COMMENT '信件內容',
  `create_user` varchar(45) DEFAULT NULL,
  `update_user` varchar(45) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`email_template_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='存放寄信用的信件範本';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_template`
--

LOCK TABLES `email_template` WRITE;
/*!40000 ALTER TABLE `email_template` DISABLE KEYS */;
INSERT INTO `email_template` VALUES (1,'register_user','使用者註冊信件','您好，\r\n \r\n	此電子郵件已由是蔡岳翰的測試系統自動發送，用於進入註冊頁面填寫基本資料。\r\n	請使用下方的連結填寫你的基本資料。\r\n   \r\n	{{register_user}}\r\n   \r\nGreeting,\r\n	This email has been automatically sent by Cai Yuehan\'s test system and is used to enter the registration page and fill in basic information.\r\n	Please use the link below to fill in your basic information.\r\n \r\n	{{register_user}}','system','system','2024-03-14 12:57:09','2024-03-14 12:57:09'),(2,'registration_progress','進度查詢的驗證碼','您好，\r\n \r\n	此電子郵件已由是蔡岳翰的測試系統自動發送，\r\n	您申請查詢註冊進度，請使用下方的連結查看進度。\r\n   \r\n	{{registration_progress}}\r\n   \r\nGreeting,\r\n	This email has been automatically sent by Cai Yuehan\'s test system.\r\n	You have applied to check the registration progress, please use the link below to check the progress.\r\n \r\n	{{registration_progress}}','system','system','2024-03-19 02:27:16','2024-03-19 02:27:16');
/*!40000 ALTER TABLE `email_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `error_message`
--

DROP TABLE IF EXISTS `error_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `error_message` (
  `error_message_id` bigint NOT NULL AUTO_INCREMENT,
  `message_group` varchar(255) NOT NULL COMMENT '系統群組代號',
  `message_key` varchar(255) NOT NULL COMMENT '系統群組中定位或使用情境',
  `usage_scenarios` varchar(255) DEFAULT NULL COMMENT '使用情況說明',
  `message_text` text COMMENT '參數內容',
  `create_user` varchar(45) DEFAULT 'system',
  `update_user` varchar(45) DEFAULT 'system',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`error_message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `error_message`
--

LOCK TABLES `error_message` WRITE;
/*!40000 ALTER TABLE `error_message` DISABLE KEYS */;
INSERT INTO `error_message` VALUES (1,'register_or_validate_user','initiate_registration_with_email','failed_to_send_letter','initiateRegistrationWithEmail is fail, because:','system','system','2024-03-16 08:50:21','2024-03-16 08:50:21'),(2,'register_or_validate_user','is_the_verification_letter_valid','invalid','The last verification letter is still valid, so cancel sending again.','system','system','2024-03-16 08:50:21','2024-03-16 08:50:21');
/*!40000 ALTER TABLE `error_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_parameter_setting`
--

DROP TABLE IF EXISTS `system_parameter_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_parameter_setting` (
  `setting_id` bigint NOT NULL AUTO_INCREMENT COMMENT '設定檔ID',
  `system_group` varchar(255) DEFAULT NULL COMMENT '系統群組代號',
  `system_key` varchar(255) DEFAULT NULL COMMENT '系統群組中定位或使用情境',
  `system_value` varchar(255) DEFAULT NULL COMMENT '參數內容',
  `system_text` text COMMENT '參數說明',
  `create_user` varchar(45) DEFAULT 'system',
  `update_user` varchar(45) DEFAULT 'system',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系統參數設定';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_parameter_setting`
--

LOCK TABLES `system_parameter_setting` WRITE;
/*!40000 ALTER TABLE `system_parameter_setting` DISABLE KEYS */;
INSERT INTO `system_parameter_setting` VALUES (1,'email','email_expiration_time','86400','信件的有效期間','system','system','2024-03-14 08:12:52','2024-03-14 08:12:52'),(2,'email','email_sender','Shirai <shiraiforwork@gmail.com>','信件的寄信者','system','system','2024-03-14 13:31:18','2024-03-14 13:31:18'),(3,'email','email_type_register_user','http://127.0.0.1:8080/user/register/','註冊信件裡面附上的 URL，使用會被導向填入個資的頁面','system','system','2024-03-14 14:53:26','2024-03-14 14:53:26'),(4,'email','email_type_registration_progress','http://127.0.0.1:8080/user/register/check-progress/','註冊進度查詢信件裡面附上的 URL，使用會被導向到進度查詢的頁面','system','system','2024-03-19 02:32:49','2024-03-19 02:32:49');
/*!40000 ALTER TABLE `system_parameter_setting` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-20 18:09:45
