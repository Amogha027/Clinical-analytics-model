CREATE DATABASE  IF NOT EXISTS `ebdb` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ebdb`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: nhdbtest.czvgsfkl9jqg.ap-south-1.rds.amazonaws.com    Database: ebdb
-- ------------------------------------------------------
-- Server version	8.0.21

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `HSN_Codes`
--

DROP TABLE IF EXISTS `HSN_Codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HSN_Codes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `company name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `brand_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HSNcode` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `GST tax` float DEFAULT NULL,
  `CGST` float DEFAULT NULL,
  `SGST` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=111948 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `active_admin_comments`
--

DROP TABLE IF EXISTS `active_admin_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `active_admin_comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `namespace` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `resource_id` int DEFAULT NULL,
  `resource_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author_id` int DEFAULT NULL,
  `author_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_active_admin_comments_on_namespace` (`namespace`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `activities`
--

DROP TABLE IF EXISTS `activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `trackable_id` int DEFAULT NULL,
  `trackable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `owner_id` int DEFAULT NULL,
  `owner_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8_unicode_ci,
  `recipient_id` int DEFAULT NULL,
  `recipient_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `index_activities_on_trackable_id_and_trackable_type` (`trackable_id`,`trackable_type`),
  KEY `index_activities_on_owner_id_and_owner_type` (`owner_id`,`owner_type`),
  KEY `index_activities_on_recipient_id_and_recipient_type` (`recipient_id`,`recipient_type`)
) ENGINE=InnoDB AUTO_INCREMENT=266 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `address_details`
--

DROP TABLE IF EXISTS `address_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `address_type` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Home',
  `address_kind` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lttd` decimal(10,7) DEFAULT NULL,
  `lgtd` decimal(10,7) DEFAULT NULL,
  `address_line1` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_line2` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `area` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `landmark` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city_master_id` int NOT NULL DEFAULT '1',
  `pin_code` int DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `rfq_corp_master_id` int DEFAULT NULL,
  `corp_master_id` int DEFAULT NULL,
  `patient_master_id` int DEFAULT NULL,
  `diagnostic_lab_master_id` int DEFAULT NULL,
  `updates_json` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_address_details_on_user_id` (`user_id`),
  KEY `fk_rails_d4020054bb` (`city_master_id`),
  CONSTRAINT `fk_rails_d4020054bb` FOREIGN KEY (`city_master_id`) REFERENCES `city_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_ff0648aefa` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=92023 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `advance_balance_details`
--

DROP TABLE IF EXISTS `advance_balance_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `advance_balance_details` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `care_delivery_program_master_id` int DEFAULT NULL,
  `hospital_master_id` int DEFAULT NULL,
  `patient_master_id` int DEFAULT NULL,
  `credit_amt` float DEFAULT NULL,
  `notes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency_master_id` int DEFAULT NULL,
  `transacted_by_id` int DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `index_advance_balance_details_on_care_delivery_program_master_id` (`care_delivery_program_master_id`),
  KEY `index_advance_balance_details_on_hospital_master_id` (`hospital_master_id`),
  KEY `index_advance_balance_details_on_patient_master_id` (`patient_master_id`),
  KEY `index_advance_balance_details_on_currency_master_id` (`currency_master_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `advance_refund_details`
--

DROP TABLE IF EXISTS `advance_refund_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `advance_refund_details` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `care_delivery_program_master_id` int DEFAULT NULL,
  `hospital_master_id` int DEFAULT NULL,
  `patient_master_id` int DEFAULT NULL,
  `debit_amt` float DEFAULT NULL,
  `payment_gateway_master_id` int DEFAULT NULL,
  `currency_master_id` int DEFAULT NULL,
  `notes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `index_advance_refund_details_on_care_delivery_program_master_id` (`care_delivery_program_master_id`),
  KEY `index_advance_refund_details_on_hospital_master_id` (`hospital_master_id`),
  KEY `index_advance_refund_details_on_patient_master_id` (`patient_master_id`),
  KEY `index_advance_refund_details_on_payment_gateway_master_id` (`payment_gateway_master_id`),
  KEY `index_advance_refund_details_on_currency_master_id` (`currency_master_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `advance_transaction_details`
--

DROP TABLE IF EXISTS `advance_transaction_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `advance_transaction_details` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `care_delivery_program_master_id` int DEFAULT NULL,
  `hospital_master_id` int DEFAULT NULL,
  `patient_master_id` int DEFAULT NULL,
  `credit_amt` float DEFAULT NULL,
  `debit_amt` float DEFAULT NULL,
  `balance` float DEFAULT NULL,
  `currency_master_id` int DEFAULT NULL,
  `payment_gateway_master_id` int DEFAULT NULL,
  `txn_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `receipt_img_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction_detail_id` int DEFAULT NULL,
  `notes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `receipt_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_advance_transaction_details_on_hospital_master_id` (`hospital_master_id`),
  KEY `index_advance_transaction_details_on_patient_master_id` (`patient_master_id`),
  KEY `index_advance_transaction_details_on_currency_master_id` (`currency_master_id`),
  KEY `index_advance_transaction_details_on_payment_gateway_master_id` (`payment_gateway_master_id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `age_range_masters`
--

DROP TABLE IF EXISTS `age_range_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `age_range_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lower_age` int DEFAULT NULL,
  `upper_age` int DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `appointment_blocking_details`
--

DROP TABLE IF EXISTS `appointment_blocking_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_blocking_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `service_master_id` int NOT NULL,
  `appointer_master_id` int DEFAULT NULL,
  `appointment_type_master_id` int NOT NULL,
  `block_type` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `block_start_time` datetime NOT NULL,
  `block_end_time` datetime NOT NULL,
  `block_repeat` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_apmnt_type_masters` (`appointment_type_master_id`),
  CONSTRAINT `fk_apmnt_type_masters` FOREIGN KEY (`appointment_type_master_id`) REFERENCES `appointment_type_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `appointment_partner_status_updates`
--

DROP TABLE IF EXISTS `appointment_partner_status_updates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_partner_status_updates` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `user_id` int DEFAULT NULL,
  `appointment_tracking_id` int NOT NULL,
  `cmmts` text COLLATE utf8_unicode_ci,
  `status` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `json_resp` text COLLATE utf8_unicode_ci,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `appointment_status_updates`
--

DROP TABLE IF EXISTS `appointment_status_updates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_status_updates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `user_id` int NOT NULL,
  `appointment_tracking_id` int NOT NULL,
  `cmmts` text COLLATE utf8_unicode_ci,
  `status` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rails_6144904f86` (`appointment_tracking_id`),
  CONSTRAINT `fk_rails_6144904f86` FOREIGN KEY (`appointment_tracking_id`) REFERENCES `appointment_trackings` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=88059 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `appointment_trackings`
--

DROP TABLE IF EXISTS `appointment_trackings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_trackings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `appointment_id` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `partner_booking_ref_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `service_master_id` int NOT NULL,
  `provider_id` int DEFAULT NULL,
  `patient_master_id` int NOT NULL,
  `sale_order_header_id` int DEFAULT NULL,
  `promo_code_master_id` int DEFAULT NULL,
  `order_value` int DEFAULT NULL,
  `discount` int DEFAULT NULL,
  `netpayable` int DEFAULT NULL,
  `razorpay_payment_id` tinytext COLLATE utf8_unicode_ci,
  `appointment_type_master_id` int NOT NULL,
  `screening_camp_master_id` int DEFAULT NULL,
  `order_address_detail_id` int DEFAULT NULL,
  `apmnt_date` datetime NOT NULL,
  `apmnt_end_date` datetime DEFAULT NULL,
  `apmnt_status` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `prev_apmnt_id` int DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `patient_test_recommendation_detail_id` int DEFAULT NULL,
  `invoice_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `token_number` int DEFAULT NULL,
  `referral_detail_id` int DEFAULT NULL,
  `referred_by_id` int DEFAULT NULL,
  `complaints` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `complaints_link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updates_json` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_appointment_trackings_on_service_master_id` (`service_master_id`),
  KEY `index_appointment_trackings_on_appointment_type_master_id` (`appointment_type_master_id`),
  KEY `index_appointment_trackings_on_patient_master_id` (`patient_master_id`),
  KEY `index_appointment_trackings_on_promo_code_master_id` (`promo_code_master_id`),
  KEY `index_appointment_trackings_on_provider_id` (`provider_id`),
  KEY `index_appointment_trackings_on_order_value` (`order_value`),
  KEY `index_appointment_trackings_on_appointment_id` (`appointment_id`(6)),
  KEY `fk_rails_7ce8e6acae` (`sale_order_header_id`),
  KEY `fk_rails_e5356db9e8` (`order_address_detail_id`),
  KEY `fk_rails_8e80a0767e` (`patient_test_recommendation_detail_id`),
  CONSTRAINT `fk_rails_232d32ab9d` FOREIGN KEY (`patient_master_id`) REFERENCES `patient_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_7ce8e6acae` FOREIGN KEY (`sale_order_header_id`) REFERENCES `sale_order_headers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_801b64a2b3` FOREIGN KEY (`appointment_type_master_id`) REFERENCES `appointment_type_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_8a4ea9acbb` FOREIGN KEY (`service_master_id`) REFERENCES `service_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_8e80a0767e` FOREIGN KEY (`patient_test_recommendation_detail_id`) REFERENCES `patient_test_recommendation_details` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_aeb32df202` FOREIGN KEY (`promo_code_master_id`) REFERENCES `promo_code_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_e5356db9e8` FOREIGN KEY (`order_address_detail_id`) REFERENCES `order_address_details` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=30011 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `appointment_type_masters`
--

DROP TABLE IF EXISTS `appointment_type_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_type_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `apmnt_type_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `apmnt_type_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `apmnt_type_desc` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon_img_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `archived_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `effctv_dt` datetime NOT NULL DEFAULT '2018-02-20 14:41:25',
  `trmntn_dt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_appointment_type_masters_on_apmnt_type_code` (`apmnt_type_code`),
  UNIQUE KEY `index_appointment_type_masters_on_apmnt_type_name` (`apmnt_type_name`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `area_masters`
--

DROP TABLE IF EXISTS `area_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `area_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `area_nm` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city_master_id` int NOT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `archived_at` datetime DEFAULT NULL,
  `effctv_dt` datetime NOT NULL DEFAULT '2018-02-20 14:41:26',
  `trmntn_dt` datetime DEFAULT NULL,
  `pin_code` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rails_0577d507d2` (`city_master_id`),
  CONSTRAINT `fk_rails_0577d507d2` FOREIGN KEY (`city_master_id`) REFERENCES `city_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=1553 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `area_wise_sync_data`
--

DROP TABLE IF EXISTS `area_wise_sync_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `area_wise_sync_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ptnt_rgstrtn_id` varchar(21) COLLATE utf8_unicode_ci DEFAULT NULL,
  `screen_typ` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `screen_no` int DEFAULT NULL,
  `frst_nm` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lst_nm` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dsply_nm` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `dob_verified` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gndr` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `addrss` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location_master_id` int DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nmbr` varchar(15) CHARACTER SET utf8 DEFAULT NULL,
  `phn_nmbr_typ` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fthr_or_spuse_nm` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pn_cd` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ptnt_pht` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `poi_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prf_of_idntty` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `poi_pht` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ethnicity` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_dbts` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_hyptn` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `on_mdctn` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hrt_attck` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `smoking` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prgnnt` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dbts_fam` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hyptn_fam` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dizzy` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `urntn` smallint DEFAULT NULL,
  `dry_tnge` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nmbness` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hght_ft` smallint DEFAULT NULL,
  `hght_in` smallint DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `waist` mediumint DEFAULT NULL,
  `bmi` float DEFAULT NULL,
  `bp_systlc` mediumint DEFAULT NULL,
  `bp_dstlc` mediumint DEFAULT NULL,
  `bld_sgr` mediumint DEFAULT NULL,
  `bld_sgr_ctgry` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pulse` mediumint DEFAULT NULL,
  `spo2` mediumint DEFAULT NULL,
  `tmprtur` float DEFAULT NULL,
  `bld_grp` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bld_grp_rh_fctr` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `haemoglobin` float DEFAULT NULL,
  `hba1c` float DEFAULT NULL,
  `prescription_img` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` int DEFAULT NULL,
  `dummy3` float DEFAULT NULL,
  `dummy4` float DEFAULT NULL,
  `dummy5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lttd` decimal(9,6) DEFAULT NULL,
  `lgtd` decimal(9,6) DEFAULT NULL,
  `cmmts` varchar(10000) CHARACTER SET utf8 DEFAULT NULL,
  `tblt_crtd_at` datetime DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bp_rsk_lvl` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bp_rsk_scr` mediumint DEFAULT NULL,
  `bld_sgr_rsk_lvl` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bld_sgr_rsk_scr` mediumint DEFAULT NULL,
  `disease` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status_master_id` int DEFAULT NULL,
  `hospital_doctor_id` int DEFAULT NULL,
  `amt_paid` int DEFAULT NULL,
  `change_type` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `imei_code` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flag` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `visit_date` datetime DEFAULT NULL,
  `saathi_accompanied` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `referred_by` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `program_master_id` int DEFAULT NULL,
  `total_chol` float DEFAULT NULL,
  `hdl` float DEFAULT NULL,
  `ldl` float DEFAULT NULL,
  `triglycerides` decimal(10,0) DEFAULT NULL,
  `t3` float DEFAULT NULL,
  `t4` float DEFAULT NULL,
  `tsh` float DEFAULT NULL,
  `ddid` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy6` datetime DEFAULT NULL,
  `dummy7` datetime DEFAULT NULL,
  `screening_camp_master_id` int DEFAULT NULL,
  `patient_package_detail_id` int DEFAULT NULL,
  `group_id` int DEFAULT NULL,
  `pck_id` int DEFAULT NULL,
  `pck_start_date` datetime DEFAULT NULL,
  `pck_end_date` datetime DEFAULT NULL,
  `mnth_cnt` int DEFAULT NULL,
  `fam_mem_cnt` int DEFAULT NULL,
  `renewal_date` datetime DEFAULT NULL,
  `next_test_date` datetime DEFAULT NULL,
  `fam_head` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `full_questnr` tinyint(1) DEFAULT NULL,
  `cnslng_durtn` int DEFAULT NULL,
  `db_rsk_scr` bigint DEFAULT NULL,
  `htn_systlc_rsk_scr` bigint DEFAULT NULL,
  `htn_dstlc_rsk_scr` bigint DEFAULT NULL,
  `ob_rsk_scr` bigint DEFAULT NULL,
  `alchl` int DEFAULT NULL,
  `exercise_frq` float DEFAULT NULL,
  `hip` smallint DEFAULT NULL,
  `whr` float DEFAULT NULL,
  `synced_tabs` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by_id` int DEFAULT NULL,
  `allergies` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40458 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `availability_details`
--

DROP TABLE IF EXISTS `availability_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `availability_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `day_master_id` int NOT NULL,
  `available_date` datetime DEFAULT NULL,
  `available_start_time` time NOT NULL,
  `available_end_time` time NOT NULL,
  `service_master_id` int NOT NULL,
  `appointer_master_id` int NOT NULL,
  `appointment_type_master_id` int NOT NULL,
  `total_slot_capacity` int DEFAULT NULL,
  `rem_slot_capacity` int DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_by_id` int DEFAULT '31',
  `updated_by_id` int DEFAULT '31',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_availability_details_on_day_master_id` (`day_master_id`),
  KEY `index_availability_details_on_service_master_id` (`service_master_id`),
  KEY `index_availability_details_on_appointer_master_id` (`appointer_master_id`),
  KEY `index_availability_details_on_appointment_type_master_id` (`appointment_type_master_id`),
  CONSTRAINT `fk_rails_1e45542241` FOREIGN KEY (`day_master_id`) REFERENCES `day_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_2f98666be2` FOREIGN KEY (`appointment_type_master_id`) REFERENCES `appointment_type_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_8915f022b7` FOREIGN KEY (`service_master_id`) REFERENCES `service_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3284 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blog_category_masters`
--

DROP TABLE IF EXISTS `blog_category_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_category_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `category_slug` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `category_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by_id` int NOT NULL DEFAULT '2',
  `updated_by_id` int NOT NULL DEFAULT '2',
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `effctv_dt` datetime NOT NULL DEFAULT '2018-02-20 14:44:30',
  `trmntn_dt` datetime DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_blog_category_masters_on_category_name` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blog_post_category_details`
--

DROP TABLE IF EXISTS `blog_post_category_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_post_category_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `blog_post_detail_id` int NOT NULL,
  `blog_category_master_id` int NOT NULL,
  `created_by_id` int NOT NULL DEFAULT '2',
  `updated_by_id` int NOT NULL DEFAULT '2',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_post_detail_category_master` (`blog_post_detail_id`,`blog_category_master_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blog_post_comment_details`
--

DROP TABLE IF EXISTS `blog_post_comment_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_post_comment_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `blog_post_detail_id` int NOT NULL,
  `comment_text` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `commented_by_id` int DEFAULT NULL,
  `enable` tinyint(1) NOT NULL,
  `comment_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_by_id` int NOT NULL DEFAULT '2',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by_id` int NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blog_post_details`
--

DROP TABLE IF EXISTS `blog_post_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_post_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `post_title` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `post_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `post_content_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `post_content_type_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `post_slug` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `post_content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `meta_description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `post_status` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `post_excerpt` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `post_author_id` int NOT NULL,
  `updated_by_id` int NOT NULL DEFAULT '2',
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `views_count` int DEFAULT '0',
  `created_by_id` int NOT NULL DEFAULT '2',
  `marketing_access` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '0',
  `is_active` tinyint(1) DEFAULT '1',
  `website_master_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_blog_post_details_on_post_title` (`post_title`(50))
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blog_post_tag_details`
--

DROP TABLE IF EXISTS `blog_post_tag_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_post_tag_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `blog_post_detail_id` int NOT NULL,
  `blog_tag_master_id` int NOT NULL,
  `created_by_id` int NOT NULL DEFAULT '2',
  `updated_by_id` int NOT NULL DEFAULT '2',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `index_blog_post_tag_details_on_blog_tag_master_id` (`blog_tag_master_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blog_tag_masters`
--

DROP TABLE IF EXISTS `blog_tag_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_tag_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `tag_slug` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `tag_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_visible_web` tinyint(1) DEFAULT '0',
  `created_by_id` int NOT NULL DEFAULT '2',
  `updated_by_id` int NOT NULL DEFAULT '2',
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `effctv_dt` datetime NOT NULL DEFAULT '2018-02-20 14:45:37',
  `trmntn_dt` datetime DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_blog_tag_masters_on_tag_name` (`tag_name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blood_request_donor_mapping_masters`
--

DROP TABLE IF EXISTS `blood_request_donor_mapping_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blood_request_donor_mapping_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `blood_requester_master_id` int DEFAULT NULL,
  `blood_donor_master_id` int DEFAULT NULL,
  `donation_date` datetime DEFAULT NULL,
  `mapp_status` int DEFAULT '1',
  `notes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `brand_category_masters`
--

DROP TABLE IF EXISTS `brand_category_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand_category_masters` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc` text COLLATE utf8_unicode_ci,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `brand_masters`
--

DROP TABLE IF EXISTS `brand_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `brand_desc` text CHARACTER SET utf8,
  `route` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `generic_master_id` int DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `unit_price` decimal(7,2) DEFAULT NULL,
  `medicine_type_master_id` int DEFAULT NULL,
  `dose` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `unit_master_id` int DEFAULT NULL,
  `product_sales_channel_master_id` int DEFAULT NULL,
  `is_verified` tinyint(1) DEFAULT '0',
  `verified_by` int DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `archived_by_id` int DEFAULT NULL,
  `effctv_dt` datetime DEFAULT NULL,
  `trmntn_dt` datetime DEFAULT NULL,
  `hsncode` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tax_service_mapping_master_id` int DEFAULT NULL,
  `category` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mrp` float DEFAULT NULL,
  `med_time` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vaccine_master_ids` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `consent_text` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `brand_category_master_id` int DEFAULT NULL,
  `manufacturer_master_id` int DEFAULT NULL,
  `serial_no_required` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique index on brand_name_type_price` (`brand_name`,`medicine_type_master_id`,`unit_price`),
  KEY `index_brand_masters_on_archive` (`archive`),
  KEY `index_brand_masters_on_is_active` (`is_active`)
) ENGINE=InnoDB AUTO_INCREMENT=49772 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `brand_temp_masters`
--

DROP TABLE IF EXISTS `brand_temp_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand_temp_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `brand_desc` text COLLATE utf8_unicode_ci,
  `route` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `generic_master_id` int DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `unit_price` decimal(10,0) DEFAULT NULL,
  `medicine_type_master_id` int DEFAULT NULL,
  `dose` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_master_id` int DEFAULT NULL,
  `product_sales_channel_master_id` int DEFAULT NULL,
  `is_verified` tinyint(1) DEFAULT NULL,
  `verified_by` int DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `archived_by_id` int DEFAULT NULL,
  `effctv_dt` datetime DEFAULT NULL,
  `trmntn_dt` datetime DEFAULT NULL,
  `hsncode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tax_service_mapping_master_id` int DEFAULT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mrp` float DEFAULT NULL,
  `med_time` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `breast_cancer_screening_details`
--

DROP TABLE IF EXISTS `breast_cancer_screening_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `breast_cancer_screening_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `screening_detail_id` int DEFAULT NULL,
  `npl_dschrg` tinyint(1) DEFAULT NULL,
  `brst_pain_srns` tinyint(1) DEFAULT NULL,
  `brst_cncr_fam` tinyint(1) DEFAULT NULL,
  `npl_rtrctn` tinyint(1) DEFAULT NULL,
  `rst_npl` tinyint(1) DEFAULT NULL,
  `rt_lmp` tinyint(1) DEFAULT NULL,
  `lt_lmp` tinyint(1) DEFAULT NULL,
  `status_master_id` int DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `rsk_scr` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=682 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `call_trackings`
--

DROP TABLE IF EXISTS `call_trackings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `call_trackings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_master_id` int DEFAULT NULL,
  `status_master_id` int DEFAULT NULL,
  `location_master_id` int NOT NULL,
  `phn_nmbr` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nmbr_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `call_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `call_duration` int DEFAULT NULL,
  `call_start_time` datetime DEFAULT NULL,
  `call_end_time` datetime DEFAULT NULL,
  `tablet_master_id` int NOT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `updates_json` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_call_trackings_on_patient_master_id` (`patient_master_id`),
  KEY `index_call_trackings_on_status_master_id` (`status_master_id`),
  KEY `index_call_trackings_on_location_master_id` (`location_master_id`)
) ENGINE=InnoDB AUTO_INCREMENT=97334 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cancer_questionnaire_masters`
--

DROP TABLE IF EXISTS `cancer_questionnaire_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cancer_questionnaire_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `disease_master_id` int NOT NULL,
  `q1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `q2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `q3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `q4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `q5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `q6` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `q7` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `q8` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `q9` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `q10` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `q11` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `q12` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rsk_scr` int NOT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `archived_by_id` int DEFAULT NULL,
  `effctv_dt` datetime NOT NULL,
  `trmntn_dt` datetime DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_cancer_questionnaire_masters_on_disease_master_id` (`disease_master_id`),
  CONSTRAINT `fk_rails_4a61da70c3` FOREIGN KEY (`disease_master_id`) REFERENCES `disease_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `care_delivery_program_masters`
--

DROP TABLE IF EXISTS `care_delivery_program_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `care_delivery_program_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_detail_id` int DEFAULT NULL,
  `address_detail_id` int DEFAULT NULL,
  `web_logo_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hme_bgrnd_img` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `app_logo_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `is_own` tinyint(1) DEFAULT '0',
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `archived_at` datetime DEFAULT NULL,
  `effctv_dt` datetime NOT NULL DEFAULT '2018-02-20 14:41:28',
  `trmntn_dt` datetime DEFAULT NULL,
  `patient_id_format` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `app_link_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `razorpay_id` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `domain_link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_care_delivery_program_masters_on_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `care_delivery_program_parameter_details`
--

DROP TABLE IF EXISTS `care_delivery_program_parameter_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `care_delivery_program_parameter_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `care_delivery_program_master_id` int DEFAULT NULL,
  `parameter_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parameter_master_id` int DEFAULT NULL,
  `parameter_value` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `required` tinyint(1) DEFAULT '1',
  `int_val` int DEFAULT NULL,
  `str_val` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_val` datetime DEFAULT NULL,
  `service_master_id` int DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '0',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_rails_a276ab1b58` (`service_master_id`),
  CONSTRAINT `fk_rails_a276ab1b58` FOREIGN KEY (`service_master_id`) REFERENCES `service_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4444 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_master_id` int DEFAULT NULL,
  `cart_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order_value` decimal(7,2) DEFAULT NULL,
  `cart_status` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cart_details` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `updates_json` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rails_610aea39fd` (`patient_master_id`),
  CONSTRAINT `fk_rails_610aea39fd` FOREIGN KEY (`patient_master_id`) REFERENCES `patient_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=32142 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `category_location_program_maping_masters`
--

DROP TABLE IF EXISTS `category_location_program_maping_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_location_program_maping_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_category_master_id` int DEFAULT NULL,
  `location_master_id` int DEFAULT NULL,
  `program_master_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `category_wise_diagnosis_masters`
--

DROP TABLE IF EXISTS `category_wise_diagnosis_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_wise_diagnosis_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `doctor_master_id` int DEFAULT NULL,
  `specialisation_master_id` int DEFAULT NULL,
  `age_range_master_id` int DEFAULT NULL,
  `gender_master_id` int DEFAULT NULL,
  `icd_cm_code_master_id` int DEFAULT NULL,
  `priority` int DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cervical_cancer_screening_details`
--

DROP TABLE IF EXISTS `cervical_cancer_screening_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cervical_cancer_screening_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `screening_detail_id` int DEFAULT NULL,
  `vagnl_dschrg` tinyint(1) DEFAULT NULL,
  `extrnl_anogenitalia` tinyint(1) DEFAULT NULL,
  `ulcr_rghnd_anogenitalia` tinyint(1) DEFAULT NULL,
  `lwr_abdn_pain` tinyint(1) DEFAULT NULL,
  `pain_sxl_intrcrs` tinyint(1) DEFAULT NULL,
  `bldng_intrcrs` tinyint(1) DEFAULT NULL,
  `intrmnstrl_bldng` tinyint(1) DEFAULT NULL,
  `lw_bck_ache` tinyint(1) DEFAULT NULL,
  `status_master_id` int DEFAULT NULL,
  `rsk_scr` float DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=252 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `charge_code_masters`
--

DROP TABLE IF EXISTS `charge_code_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `charge_code_masters` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `health_system_master_id` int DEFAULT NULL,
  `charge_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `charge_code_desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level` int DEFAULT NULL,
  `parent_charge_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_daily_charge` tinyint(1) DEFAULT '0',
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `charge_code_UNIQUE` (`charge_code`)
) ENGINE=InnoDB AUTO_INCREMENT=229 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `city_masters`
--

DROP TABLE IF EXISTS `city_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cty_nm` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cty_shrt_nm` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dist_nm` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `state_master_id` int DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `archived_at` datetime DEFAULT NULL,
  `effctv_dt` datetime NOT NULL DEFAULT '2018-02-20 14:41:27',
  `trmntn_dt` datetime DEFAULT NULL,
  `district_master_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_city_masters_on_cty_nm` (`cty_nm`),
  KEY `fk_rails_6b2e14da1a` (`state_master_id`),
  CONSTRAINT `fk_rails_6b2e14da1a` FOREIGN KEY (`state_master_id`) REFERENCES `state_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=498 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `claim_details`
--

DROP TABLE IF EXISTS `claim_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `claim_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `insurance_policy_detail_id` int NOT NULL,
  `ic_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `insurance_company_master_id` int DEFAULT NULL,
  `policy_start_date` datetime DEFAULT NULL,
  `policy_end_date` datetime DEFAULT NULL,
  `policy_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `corp_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `corp_master_id` int NOT NULL,
  `employee_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `patient` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `patient_gender` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `age` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `relation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uhc_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `insurance_card_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `claim_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `claim_Type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `claim_type_master_id` int NOT NULL,
  `intimation_date` datetime DEFAULT NULL,
  `admission_date` datetime DEFAULT NULL,
  `discharge_date` datetime DEFAULT NULL,
  `lastauditdate` datetime DEFAULT NULL,
  `claim_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `claim_status_master_id` int NOT NULL,
  `claim_amt` decimal(12,2) DEFAULT NULL,
  `approved_amount` decimal(12,2) DEFAULT NULL,
  `servicetax` decimal(12,2) DEFAULT NULL,
  `incurred_amount` decimal(12,2) DEFAULT NULL,
  `disease` float DEFAULT NULL,
  `icdcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icd_code_master_id` int DEFAULT NULL,
  `level1_icd_group` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level2_icd_group` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level3_icd_group` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hospital_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hospital_city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hospital_state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hospital_master_id` int DEFAULT NULL,
  `utr_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `utr_date` datetime DEFAULT NULL,
  `payment_mode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_gateway_master_id` int DEFAULT NULL,
  `paymnet_confirmation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `float_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `query_or_rejection_date` datetime DEFAULT NULL,
  `query_or_rejection_reason` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `nh_impact_prcnt` float DEFAULT NULL,
  `appointment_tracking_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=985 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `claim_status_masters`
--

DROP TABLE IF EXISTS `claim_status_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `claim_status_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cs_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cs_desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `effctv_dt` datetime DEFAULT NULL,
  `trmntn_dt` datetime DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `claim_type_masters`
--

DROP TABLE IF EXISTS `claim_type_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `claim_type_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ct_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ct_code_desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `effctv_dt` datetime DEFAULT NULL,
  `trmntn_dt` datetime DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clinic_room_bed_masters`
--

DROP TABLE IF EXISTS `clinic_room_bed_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clinic_room_bed_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `clinic_room_master_id` int DEFAULT NULL,
  `bed_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` float DEFAULT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clinic_room_masters`
--

DROP TABLE IF EXISTS `clinic_room_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clinic_room_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `clinic_room_type_master_id` int DEFAULT NULL,
  `room_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` float DEFAULT NULL,
  `hospital_master_id` int DEFAULT NULL,
  `charge_code_master_id` int DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clinic_room_type_masters`
--

DROP TABLE IF EXISTS `clinic_room_type_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clinic_room_type_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `room_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `care_delivery_program_master_id` int DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `charge_code_master_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cloud_tele_consultation_details`
--

DROP TABLE IF EXISTS `cloud_tele_consultation_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cloud_tele_consultation_details` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cloud_telephone_provider_id` int DEFAULT '1',
  `patient_engagement_detail_id` bigint DEFAULT NULL,
  `campaign_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `campaign_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `caller_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `skill` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_time` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `end_time` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time_to_answer` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `call_duration` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `duration` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `agent_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `agentID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `agent_phone_number` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `agent_unique_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `agent_status` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_status` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `request_datetime` datetime DEFAULT NULL,
  `received_datetime` datetime DEFAULT NULL,
  `received_audio_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `saved_audio_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `received_json` text COLLATE utf8_unicode_ci,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `index_cloud_tele_consultation_details_on_patient_engmnt_dtl_id` (`patient_engagement_detail_id`),
  CONSTRAINT `fk_rails_258f149cea` FOREIGN KEY (`patient_engagement_detail_id`) REFERENCES `patient_engagement_details` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contact_details`
--

DROP TABLE IF EXISTS `contact_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `frst_nm` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lst_nm` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phn_nmbr_typ` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nmbr` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_master_id` int DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `rfq_corp_master_id` int DEFAULT NULL,
  `corp_master_id` int DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `patient_master_id` int DEFAULT NULL,
  `updates_json` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3768 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `corp_business_type_masters`
--

DROP TABLE IF EXISTS `corp_business_type_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `corp_business_type_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `business_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `effctv_dt` datetime DEFAULT NULL,
  `trmntn_dt` datetime DEFAULT NULL,
  `archive` tinyint(1) DEFAULT NULL,
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `corp_masters`
--

DROP TABLE IF EXISTS `corp_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `corp_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `corp_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `program_master_id` int NOT NULL,
  `corp_group_master_id` int DEFAULT NULL,
  `corp_business_type_master_id` int DEFAULT NULL,
  `e_e_relationship` tinyint(1) DEFAULT NULL,
  `e_e_reln_no_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `effctv_dt` datetime DEFAULT NULL,
  `trmntn_dt` datetime DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_service_agency_master_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `corporate_event_masters`
--

DROP TABLE IF EXISTS `corporate_event_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `corporate_event_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `corp_master_id` int DEFAULT NULL,
  `event_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `corporate_user_mapping_masters`
--

DROP TABLE IF EXISTS `corporate_user_mapping_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `corporate_user_mapping_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `corp_master_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `rfq_corp_master_id` int DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `country_masters`
--

DROP TABLE IF EXISTS `country_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cntry_nm` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cntry_shrt_nm` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cntry_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `archived_at` datetime DEFAULT NULL,
  `effctv_dt` datetime NOT NULL DEFAULT '2018-02-20 14:41:29',
  `trmntn_dt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=527 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `covid_provider_inventory_details`
--

DROP TABLE IF EXISTS `covid_provider_inventory_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `covid_provider_inventory_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `covid_provider_master_id` int DEFAULT NULL,
  `item_master_id` int DEFAULT NULL,
  `total` int DEFAULT NULL,
  `availability` int DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_rails_967db69fd7` (`covid_provider_master_id`),
  CONSTRAINT `fk_rails_967db69fd7` FOREIGN KEY (`covid_provider_master_id`) REFERENCES `covid_provider_masters` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `covid_provider_masters`
--

DROP TABLE IF EXISTS `covid_provider_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `covid_provider_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `facility_type_master_id` int DEFAULT NULL,
  `provider_name` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `management` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_detail_id` int DEFAULT NULL,
  `address_detail_id` int DEFAULT NULL,
  `char1` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `char2` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `char3` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_rails_852a50d22d` (`facility_type_master_id`),
  KEY `fk_rails_3cb74dcfed` (`contact_detail_id`),
  KEY `fk_rails_3617f765a6` (`address_detail_id`),
  CONSTRAINT `fk_rails_3617f765a6` FOREIGN KEY (`address_detail_id`) REFERENCES `address_details` (`id`),
  CONSTRAINT `fk_rails_3cb74dcfed` FOREIGN KEY (`contact_detail_id`) REFERENCES `contact_details` (`id`),
  CONSTRAINT `fk_rails_852a50d22d` FOREIGN KEY (`facility_type_master_id`) REFERENCES `facility_type_masters` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `currency_masters`
--

DROP TABLE IF EXISTS `currency_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currency_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `country_master_id` int NOT NULL,
  `currency_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `currency_code` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `currency_desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `effctv_dt` datetime NOT NULL,
  `trmntn_dt` datetime DEFAULT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `custom_recommendation_masters`
--

DROP TABLE IF EXISTS `custom_recommendation_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_recommendation_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rec_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `custom_template_pdf_details`
--

DROP TABLE IF EXISTS `custom_template_pdf_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_template_pdf_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `template_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `service_master_ids` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source_id` int DEFAULT NULL,
  `questnr_master_id` int DEFAULT NULL,
  `template_heading` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template_header_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `template_header_height` int DEFAULT NULL,
  `template_content` text COLLATE utf8_unicode_ci,
  `footer_header_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template_footer_height` int DEFAULT NULL,
  `signature_url` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `commts` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `care_delivery_program_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dashboard_masters`
--

DROP TABLE IF EXISTS `dashboard_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dashboard_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `desc` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dashboard_path` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dashboard_report_mapping_masters`
--

DROP TABLE IF EXISTS `dashboard_report_mapping_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_report_mapping_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dashboard_master_id` int DEFAULT NULL,
  `report_master_id` int DEFAULT NULL,
  `is_derived` tinyint(1) DEFAULT '1',
  `derived_report_ids` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `day_masters`
--

DROP TABLE IF EXISTS `day_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `day_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `day_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `archived_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `effctv_dt` datetime NOT NULL DEFAULT '2018-02-20 14:41:30',
  `trmntn_dt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_day_masters_on_day_name` (`day_name`),
  KEY `index_day_masters_on_archive` (`archive`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `delivery_status_masters`
--

DROP TABLE IF EXISTS `delivery_status_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_status_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `delivery_status_code` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `delivery_status_desc` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `effctv_dt` datetime DEFAULT NULL,
  `trmntn_dt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_delivery_status_masters_on_delivery_status_code` (`delivery_status_code`),
  KEY `index_delivery_status_masters_on_archive` (`archive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `demographic_details`
--

DROP TABLE IF EXISTS `demographic_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `demographic_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `location_program_maping_master_id` int NOT NULL DEFAULT '1',
  `emp_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `frst_nm` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lst_nm` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fthr_or_spuse_nm` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(15) CHARACTER SET utf8 DEFAULT NULL,
  `gndr` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `department` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `designation` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cmpny_nm` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `adrs_line1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `adrs_line2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `landmark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `area` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pin` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flag` tinyint(1) DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `bld_grp` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_dbts` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `on_mdctn_db` tinyint(1) DEFAULT NULL,
  `is_hyptn` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `on_mdctn_htn` tinyint(1) DEFAULT NULL,
  `is_lpd` tinyint(1) DEFAULT NULL,
  `on_mdctn_lpd` tinyint(1) DEFAULT NULL,
  `is_thh` tinyint(1) DEFAULT NULL,
  `on_mdctn_thh` tinyint(1) DEFAULT NULL,
  `other_diseases` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `on_mdctn_other` tinyint(1) DEFAULT NULL,
  `hrt_attck` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `smoking` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alchl` int DEFAULT NULL,
  `health_chckp` int DEFAULT NULL,
  `daily_diet` int DEFAULT NULL,
  `exercise_frq` float DEFAULT NULL,
  `prgnnt` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hght_ft` int DEFAULT NULL,
  `hght_in` int DEFAULT NULL,
  `hyptn_fam` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dbts_fam` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dizzy` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `urntn` int DEFAULT NULL,
  `dry_tnge` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nmbnss` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `other_diseases_bool` tinyint(1) DEFAULT NULL,
  `patient_relationship_master_id` int DEFAULT NULL,
  `rfq_insurance_policy_detail_id` int DEFAULT NULL,
  `sum_insured` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_demographic_details_on_emp_id` (`emp_id`),
  KEY `index_demographic_details_on_mobile` (`mobile`),
  KEY `index_demographic_details_on_flag` (`flag`)
) ENGINE=InnoDB AUTO_INCREMENT=12286 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `department_masters`
--

DROP TABLE IF EXISTS `department_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department_masters` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `care_delivery_program_master_id` int DEFAULT NULL,
  `department_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `device_masters`
--

DROP TABLE IF EXISTS `device_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `device_type_master_id` int DEFAULT NULL,
  `device_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `device_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uuid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `major` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `minor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_available` tinyint(1) DEFAULT '1',
  `hospital_master_id` int DEFAULT NULL,
  `saathi_master_id` int DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `rent_per_day` float DEFAULT NULL,
  `sale_price` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `device_type_masters`
--

DROP TABLE IF EXISTS `device_type_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_type_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `care_delivery_program_master_id` int NOT NULL,
  `device_type` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `diagnostic_lab_masters`
--

DROP TABLE IF EXISTS `diagnostic_lab_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diagnostic_lab_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lab_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `diagnostic_lab_group` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_detail_id` int DEFAULT NULL,
  `landline` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `service_master_id` int DEFAULT NULL,
  `is_verified` tinyint(1) DEFAULT '0',
  `verified_by` int DEFAULT NULL,
  `in_network` tinyint(1) DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `archived_by_id` int DEFAULT NULL,
  `effctv_dt` datetime DEFAULT NULL,
  `trmntn_dt` datetime DEFAULT NULL,
  `header_img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `footer_img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_diagnostic_lab_masters_on_lab_name` (`lab_name`),
  KEY `index_diagnostics_lab_masters_on_address_detail_id` (`address_detail_id`),
  KEY `index_diagnostics_lab_masters_on_service_master_id` (`service_master_id`),
  KEY `index_diagnostics_lab_masters_on_active` (`is_active`),
  KEY `index_diagnostics_lab_masters_on_archive` (`archive`),
  CONSTRAINT `fk_rails_dd66015c5e` FOREIGN KEY (`service_master_id`) REFERENCES `service_masters` (`id`),
  CONSTRAINT `fk_rails_e2313da242` FOREIGN KEY (`address_detail_id`) REFERENCES `address_details` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=561 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `diagnostic_test_book_lines`
--

DROP TABLE IF EXISTS `diagnostic_test_book_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diagnostic_test_book_lines` (
  `id` int NOT NULL AUTO_INCREMENT,
  `diagnostic_test_booking_header_id` int DEFAULT NULL,
  `diagnostic_test_lab_detail_id` int DEFAULT NULL,
  `test_amount` int DEFAULT NULL,
  `test_date` datetime DEFAULT NULL,
  `pickup_time` time DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `diagnostic_test_booking_headers`
--

DROP TABLE IF EXISTS `diagnostic_test_booking_headers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diagnostic_test_booking_headers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `appointment_tracking_id` int DEFAULT NULL,
  `diagnostic_lab_master_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `patient_master_id` int DEFAULT NULL,
  `status_master_id` int DEFAULT NULL,
  `test_collected_from` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `test_date` datetime DEFAULT NULL,
  `pickup_time` time DEFAULT NULL,
  `address_detail_id` int DEFAULT NULL,
  `presc_image_detail_id` int DEFAULT NULL,
  `order_value` int DEFAULT NULL,
  `promo_code_master_id` int DEFAULT NULL,
  `discount` int DEFAULT NULL,
  `discount_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `netpayable` int DEFAULT NULL,
  `service_master_id` int DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `updates_json` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_diagnostic_test_booking_headers_on_appointment_tracking_id` (`appointment_tracking_id`),
  KEY `index_diagnostic_test_booking_headers_on_user_id` (`user_id`),
  KEY `index_diagnostic_test_booking_headers_on_patient_master_id` (`patient_master_id`),
  KEY `index_diagnostic_test_booking_headers_on_address_detail_id` (`address_detail_id`),
  KEY `index_diagnostic_test_booking_headers_on_promo_code_master_id` (`promo_code_master_id`),
  KEY `index_diagnostic_test_booking_headers_on_service_master_id` (`service_master_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `diagnostic_test_details`
--

DROP TABLE IF EXISTS `diagnostic_test_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diagnostic_test_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `diagnostic_test_master_id` int DEFAULT NULL,
  `diagnostic_test_child_id` int NOT NULL,
  `diagnostic_test_child_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` tinyint(1) DEFAULT '1',
  `diagnostic_test_lab_detail_id` int DEFAULT NULL,
  `min_age` int DEFAULT NULL,
  `max_age` int DEFAULT NULL,
  `gender` varchar(12) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1689 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `diagnostic_test_lab_details`
--

DROP TABLE IF EXISTS `diagnostic_test_lab_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diagnostic_test_lab_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `diagnostic_test_master_id` int NOT NULL,
  `diagnostic_lab_master_id` int NOT NULL,
  `program_master_id` int NOT NULL DEFAULT '0',
  `test_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `lab_test_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sample_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `units` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `volume` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` float DEFAULT NULL,
  `ideal_range` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `fasting` tinyint(1) DEFAULT NULL,
  `test_amount` int DEFAULT NULL,
  `technology` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `method_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `method_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` varchar(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `field_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `max_value` decimal(12,2) DEFAULT NULL,
  `min_value` decimal(12,2) DEFAULT NULL,
  `option_values` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `required_units` tinyint(1) DEFAULT '1',
  `required_ideal` tinyint(1) DEFAULT '1',
  `is_active` tinyint(1) DEFAULT '1',
  `department` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `have_child` varchar(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `is_individual` tinyint(1) NOT NULL,
  `test_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_template_pdf_detail_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '0',
  `order_id` int DEFAULT '10',
  `age_range_master_ids` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `organ_master_ids` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `disease_master_ids` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_mode_id` int NOT NULL DEFAULT '0',
  `payment_detail_id` int NOT NULL DEFAULT '0',
  `department_master_id` int NOT NULL DEFAULT '0',
  `room_type_master_id` int NOT NULL DEFAULT '0',
  `group_only` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `test_master_lab_detail_uniq` (`diagnostic_lab_master_id`,`diagnostic_test_master_id`),
  KEY `index_diagnostic_test_lab_details_on_diagnostic_tes_master_id` (`diagnostic_test_master_id`),
  KEY `index_diagnostic_test_lab_details_on_diagnostic_lab_master_id` (`diagnostic_lab_master_id`),
  KEY `index_diagnostic_test_lab_details_on_active` (`active`),
  CONSTRAINT `fk_rails_11d7332a69` FOREIGN KEY (`diagnostic_lab_master_id`) REFERENCES `diagnostic_lab_masters` (`id`),
  CONSTRAINT `fk_rails_dfef3675c8` FOREIGN KEY (`diagnostic_test_master_id`) REFERENCES `diagnostic_test_masters` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3395 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `diagnostic_test_masters`
--

DROP TABLE IF EXISTS `diagnostic_test_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diagnostic_test_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `loinc_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `test_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `alias_name` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `department` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `test_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `units` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `sample_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `volume` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` decimal(7,2) DEFAULT NULL,
  `field_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `required` tinyint(1) DEFAULT NULL,
  `max_value` int DEFAULT NULL,
  `min_value` int DEFAULT NULL,
  `ideal_range` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `test_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `max_range` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `have_child` varchar(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `is_individual` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `archive` tinyint NOT NULL DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `archived_by_id` int DEFAULT NULL,
  `effctv_dt` datetime NOT NULL,
  `trmntn_dt` datetime DEFAULT NULL,
  `technology` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `test_image_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `faqs` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `test_name_UNIQUE` (`test_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3476 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dietician_brand_favourites`
--

DROP TABLE IF EXISTS `dietician_brand_favourites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dietician_brand_favourites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dietician_master_id` int NOT NULL,
  `brand_master_id` int NOT NULL,
  `mrng` int DEFAULT NULL,
  `aftn` int DEFAULT NULL,
  `evng` int DEFAULT NULL,
  `nyt` int DEFAULT NULL,
  `route` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `med_time` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `end_duration` int DEFAULT NULL,
  `end_duration_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy2` int DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `gender` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `used_count` bigint DEFAULT NULL,
  `disease_master_id` int DEFAULT NULL,
  `age_range_master_id` int DEFAULT NULL,
  `frequency` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_diet_mast_brand_fav_on_diet_master_id` (`dietician_master_id`),
  KEY `index_diet_mast_brand_fav_on_brand_master_id` (`brand_master_id`),
  KEY `index_dietician_brand_favourites_on_disease_master_id` (`disease_master_id`),
  KEY `index_dietician_brand_favourites_on_age_range_master_id` (`age_range_master_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dietician_consultation_details`
--

DROP TABLE IF EXISTS `dietician_consultation_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dietician_consultation_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hospital_dietician_id` int DEFAULT NULL,
  `appointment_type_master_id` int DEFAULT NULL,
  `price` float DEFAULT NULL,
  `slot_duration` int DEFAULT NULL,
  `visibility` int DEFAULT '0',
  `nh_visibility` int DEFAULT '0',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dietician_fav_diagnosis_masters`
--

DROP TABLE IF EXISTS `dietician_fav_diagnosis_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dietician_fav_diagnosis_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dietician_master_id` int DEFAULT NULL,
  `disease_master_id` int DEFAULT NULL,
  `dss_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `used_count` int DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `index_diet_mastfavdiag_on_diet_master_id` (`dietician_master_id`),
  KEY `index_diet_mastfavdiag_on_disease_mast_id` (`disease_master_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dietician_favourite_diagnostic_test_masters`
--

DROP TABLE IF EXISTS `dietician_favourite_diagnostic_test_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dietician_favourite_diagnostic_test_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dietician_master_id` int DEFAULT NULL,
  `disease_master_id` int DEFAULT NULL,
  `diagnostic_test_master_id` int DEFAULT NULL,
  `age_range_master_id` int DEFAULT NULL,
  `used_count` int DEFAULT NULL,
  `gender` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_favourite` tinyint(1) DEFAULT '0',
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `index_dietmastfavdiagtest_on_diet_master_id` (`dietician_master_id`),
  KEY `index_dietmastfavdiagtest_on_disease_master_id` (`disease_master_id`),
  KEY `index_dietmastfavdiagtest_on_diag_test_master_id` (`diagnostic_test_master_id`),
  KEY `index_dietmastfavdiagtest_on_age_range_id` (`age_range_master_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dietician_favourite_prescription_lines`
--

DROP TABLE IF EXISTS `dietician_favourite_prescription_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dietician_favourite_prescription_lines` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `dietician_favourite_prescription_id` int NOT NULL,
  `brand_master_id` int NOT NULL,
  `mrng` decimal(5,2) DEFAULT NULL,
  `aftn` decimal(5,2) DEFAULT NULL,
  `evng` decimal(5,2) DEFAULT NULL,
  `nyt` decimal(5,2) DEFAULT NULL,
  `route` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `med_time` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `end_duration` int NOT NULL,
  `end_duration_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `total_price` int DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `note` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `brand_descript` text COLLATE utf8_unicode_ci,
  `frequency` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `diet_fav_presc_id_on_dietfavpreslines` (`dietician_favourite_prescription_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dietician_favourite_prescriptions`
--

DROP TABLE IF EXISTS `dietician_favourite_prescriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dietician_favourite_prescriptions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fav_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dietician_master_id` int DEFAULT NULL,
  `status_master_id` int DEFAULT NULL,
  `disease` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `symptoms` text COLLATE utf8_unicode_ci,
  `diagnosis` text COLLATE utf8_unicode_ci,
  `recommended_labs` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `cmmts` text COLLATE utf8_unicode_ci,
  `lttd` decimal(10,7) DEFAULT NULL,
  `lgtd` decimal(10,7) DEFAULT NULL,
  `user_selfrecordtest_detail_id` int DEFAULT NULL,
  `next_visit_dt` datetime DEFAULT NULL,
  `emergency_care` tinyint(1) DEFAULT NULL,
  `next_visit_mode` tinyint(1) DEFAULT NULL,
  `referral_hospital_id` int DEFAULT NULL,
  `referral_doctor_id` int DEFAULT NULL,
  `referral_reason` text COLLATE utf8_unicode_ci,
  `ref_doctor_specialisation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `visited_public` tinyint(1) DEFAULT '0',
  `referred_public` tinyint(1) DEFAULT '0',
  `lyf_style_chnge_rqd` tinyint(1) DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `health_history` text COLLATE utf8_unicode_ci,
  `langauge_preference_id` int DEFAULT NULL,
  `accompanied_with` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `visit_type` int DEFAULT NULL,
  `packages_or_surgeries` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nxt_vst_dur` int DEFAULT NULL,
  `nxt_vst_dur_type` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `index_diet_mast_diet_fav_presc` (`dietician_master_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dietician_favourite_symptom_masters`
--

DROP TABLE IF EXISTS `dietician_favourite_symptom_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dietician_favourite_symptom_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dietician_master_id` int DEFAULT NULL,
  `full_text` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_favourite` tinyint(1) DEFAULT '1',
  `used_count` int DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `index_dietmastfavsym_on_diet_master_id` (`dietician_master_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dietician_favourite_symptoms_disease_masters`
--

DROP TABLE IF EXISTS `dietician_favourite_symptoms_disease_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dietician_favourite_symptoms_disease_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dietician_master_id` int DEFAULT NULL,
  `dietician_favourite_symptom_master_id` int DEFAULT NULL,
  `disease_master_id` int DEFAULT NULL,
  `used_count` int DEFAULT NULL,
  `is_favourite` tinyint(1) DEFAULT '0',
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `icd_cm_code_master_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_dietician_mast_id_on_dietfavsymdismaster` (`dietician_master_id`),
  KEY `index_dietician_fav_sym_mast_id_on_dietfavsymdismaster` (`dietician_favourite_symptom_master_id`),
  KEY `index_disease_master_id_on_dietfavsymdismaster` (`disease_master_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dietician_masters`
--

DROP TABLE IF EXISTS `dietician_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dietician_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `frst_nm` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `lst_nm` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dsply_nm` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rgstrtn_no` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qualification` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nmbr` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phn_nmbr_typ` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `nanohealth_emp` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `effctv_start_dt` datetime NOT NULL DEFAULT '2018-03-15 10:20:54',
  `trmntn_dt` datetime DEFAULT NULL,
  `image_detail_id` int DEFAULT NULL,
  `signature` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `service_master_id` int DEFAULT NULL,
  `fee_home_visit` int DEFAULT NULL,
  `fee_video_consultation` int DEFAULT NULL,
  `cmmts` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `archived_by_id` int DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cntry_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vital_question_ids` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notify` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_dietician_masters_on_user_id` (`user_id`),
  KEY `index_dietician_masters_on_fees_home_visit` (`fee_home_visit`),
  KEY `index_dietician_masters_on_fees_video_consultation` (`fee_video_consultation`),
  KEY `index_dietician_masters_on_is_active` (`is_active`),
  KEY `fk_rails_70d1f0bb46` (`image_detail_id`),
  KEY `fk_rails_db1504aa68` (`service_master_id`),
  CONSTRAINT `fk_rails_70d1f0bb46` FOREIGN KEY (`image_detail_id`) REFERENCES `image_details` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_db1504aa68` FOREIGN KEY (`service_master_id`) REFERENCES `service_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_f5ac9bb503` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=454 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dietician_specialisation_details`
--

DROP TABLE IF EXISTS `dietician_specialisation_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dietician_specialisation_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `specialisation_master_id` int NOT NULL,
  `service_master_id` int DEFAULT NULL,
  `dietician_master_id` int NOT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dietician_visits`
--

DROP TABLE IF EXISTS `dietician_visits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dietician_visits` (
  `id` int NOT NULL AUTO_INCREMENT,
  `appointment_tracking_id` int DEFAULT NULL,
  `hospital_dietician_id` int NOT NULL,
  `patient_master_id` int NOT NULL,
  `status_master_id` int NOT NULL,
  `visit_date` datetime NOT NULL,
  `presc_image_detail_id` int DEFAULT NULL,
  `neypayable` int DEFAULT NULL,
  `saathi_accompanied` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cmmts` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lttd` decimal(10,7) DEFAULT NULL,
  `lgtd` decimal(10,7) DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `tblt_crtd_by_id` int DEFAULT NULL,
  `tblt_crtd_at` datetime DEFAULT NULL,
  `proc_updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `interaction_count` int DEFAULT NULL,
  `updates_json` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_dietician_visits_on_appointment_tracking_id` (`appointment_tracking_id`),
  KEY `index_dietician_visits_on_hospital_dietician_id` (`hospital_dietician_id`),
  KEY `index_dietician_visits_on_patient_master_id` (`patient_master_id`),
  KEY `index_dietician_visits_on_status_master_id` (`status_master_id`),
  KEY `fk_rails_0b1c2f22f0` (`presc_image_detail_id`),
  CONSTRAINT `fk_rails_0b1c2f22f0` FOREIGN KEY (`presc_image_detail_id`) REFERENCES `image_details` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_1927f511ec` FOREIGN KEY (`appointment_tracking_id`) REFERENCES `appointment_trackings` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_3c07e2339a` FOREIGN KEY (`hospital_dietician_id`) REFERENCES `hospital_dieticians` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_86f7de4f4f` FOREIGN KEY (`status_master_id`) REFERENCES `status_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_ecc221b659` FOREIGN KEY (`patient_master_id`) REFERENCES `patient_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=368 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `discharge_summaries`
--

DROP TABLE IF EXISTS `discharge_summaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discharge_summaries` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `appointemnt_tracking_id` int DEFAULT NULL,
  `hospital_doctor_id` int DEFAULT NULL,
  `hospital_master_id` int DEFAULT NULL,
  `doctor_master_id` int DEFAULT NULL,
  `patient_master_id` int DEFAULT NULL,
  `location_master_id` int DEFAULT NULL,
  `status_master_id` int DEFAULT NULL,
  `clinical_status_master_id` int DEFAULT NULL,
  `disease` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `visit_date` datetime DEFAULT NULL,
  `visit_type` int DEFAULT NULL,
  `prescription_img` mediumblob,
  `symptoms` text COLLATE utf8_unicode_ci,
  `diagnosis` text COLLATE utf8_unicode_ci,
  `recommended_labs` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `packages_or_surgeries` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `consultation_fees` int DEFAULT NULL,
  `saathi_accompanied` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cmmts` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by_id` int NOT NULL DEFAULT '36',
  `updated_by_id` int DEFAULT NULL,
  `lttd` decimal(10,7) DEFAULT NULL,
  `lgtd` decimal(10,7) DEFAULT NULL,
  `tblt_crtd_at` datetime DEFAULT NULL,
  `tblt_crtd_by_id` int DEFAULT NULL,
  `proc_updated_at` datetime DEFAULT NULL,
  `patient_prescription_header_id` int DEFAULT NULL,
  `patient_past_prescription_header_id` int DEFAULT NULL,
  `patient_labresult_header_id` int DEFAULT NULL,
  `user_selfrecordtest_detail_id` int DEFAULT NULL,
  `next_visit_dt` datetime DEFAULT NULL,
  `emergency_care` tinyint DEFAULT NULL,
  `next_visit_mode` tinyint DEFAULT NULL,
  `referral_hospital_id` int DEFAULT NULL,
  `referral_doctor_id` int DEFAULT NULL,
  `referral_reason` text COLLATE utf8_unicode_ci,
  `ref_doctor_specialisation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `visited_public` tinyint DEFAULT NULL,
  `referred_public` tinyint DEFAULT NULL,
  `lyf_style_chnge_rqd` tinyint DEFAULT NULL,
  `interaction_count` int DEFAULT NULL,
  `is_draft` tinyint DEFAULT NULL,
  `accompanied_with` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `health_history` text COLLATE utf8_unicode_ci,
  `langauge_preference_id` int DEFAULT NULL,
  `updates_json` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `remotipart_submitted` tinyint(1) DEFAULT '0',
  `provisional_diagnosis` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `course_or_treatment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `condition_on_discharge` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `advice_on_discharge` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comorbidity` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rails_652c840a61` (`appointemnt_tracking_id`),
  KEY `fk_rails_5fcebd21ea` (`hospital_doctor_id`),
  KEY `fk_rails_b0c55a97fd` (`hospital_master_id`),
  KEY `fk_rails_8bcee212da` (`doctor_master_id`),
  KEY `fk_rails_209832867b` (`patient_master_id`),
  KEY `fk_rails_db35c9fb47` (`location_master_id`),
  KEY `fk_rails_4b6c5f235a` (`status_master_id`),
  KEY `fk_rails_3058da3de1` (`patient_prescription_header_id`),
  KEY `fk_rails_48471f4f98` (`user_selfrecordtest_detail_id`),
  CONSTRAINT `fk_rails_209832867b` FOREIGN KEY (`patient_master_id`) REFERENCES `patient_masters` (`id`),
  CONSTRAINT `fk_rails_3058da3de1` FOREIGN KEY (`patient_prescription_header_id`) REFERENCES `patient_prescription_headers` (`id`),
  CONSTRAINT `fk_rails_48471f4f98` FOREIGN KEY (`user_selfrecordtest_detail_id`) REFERENCES `user_selfrecordtest_details` (`id`),
  CONSTRAINT `fk_rails_4b6c5f235a` FOREIGN KEY (`status_master_id`) REFERENCES `status_masters` (`id`),
  CONSTRAINT `fk_rails_5fcebd21ea` FOREIGN KEY (`hospital_doctor_id`) REFERENCES `hospital_doctors` (`id`),
  CONSTRAINT `fk_rails_652c840a61` FOREIGN KEY (`appointemnt_tracking_id`) REFERENCES `appointment_trackings` (`id`),
  CONSTRAINT `fk_rails_8bcee212da` FOREIGN KEY (`doctor_master_id`) REFERENCES `doctor_masters` (`id`),
  CONSTRAINT `fk_rails_b0c55a97fd` FOREIGN KEY (`hospital_master_id`) REFERENCES `hospital_masters` (`id`),
  CONSTRAINT `fk_rails_db35c9fb47` FOREIGN KEY (`location_master_id`) REFERENCES `location_masters` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9157 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `disease_management_details`
--

DROP TABLE IF EXISTS `disease_management_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disease_management_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `disease_master_id` int DEFAULT NULL,
  `banner_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `disease_desc` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `blog_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `package_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `lab_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `comments` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `meta_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `og_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `color` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `form_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `dss_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `disease_masters`
--

DROP TABLE IF EXISTS `disease_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disease_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dss_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `dss_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `alias_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `dss_desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `questnr_master_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `default_questnr_master_ids` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `archived_at` datetime DEFAULT NULL,
  `effctv_dt` datetime NOT NULL DEFAULT '2018-02-20 14:45:37',
  `trmntn_dt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_disease_masters_on_dss_name` (`dss_name`),
  KEY `index_disease_masters_on_created_by_id` (`created_by_id`),
  KEY `index_disease_masters_on_updated_by_id` (`updated_by_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2997 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `disease_score_parameter_masters`
--

DROP TABLE IF EXISTS `disease_score_parameter_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disease_score_parameter_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `care_delivery_program_master_id` int DEFAULT NULL,
  `questnr_master_id` int NOT NULL,
  `lower_range` float NOT NULL,
  `upper_range` float NOT NULL,
  `gender` int DEFAULT '0',
  `age_lwr_lmt` int DEFAULT '0',
  `age_upr_lmt` int DEFAULT '1800',
  `score` smallint NOT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `archived_at` datetime DEFAULT NULL,
  `archived_by_id` datetime DEFAULT NULL,
  `effctv_dt` datetime NOT NULL DEFAULT '2018-02-20 14:45:38',
  `trmntn_dt` datetime DEFAULT NULL,
  `impression` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `recommendations` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `district_masters`
--

DROP TABLE IF EXISTS `district_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `district_masters` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `state_master_id` int DEFAULT NULL,
  `district_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `district_code` int DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=763 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `doctor_brand_favourites`
--

DROP TABLE IF EXISTS `doctor_brand_favourites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_brand_favourites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `doctor_master_id` int NOT NULL,
  `brand_master_id` int NOT NULL,
  `mrng` int DEFAULT NULL,
  `aftn` int DEFAULT NULL,
  `evng` int DEFAULT NULL,
  `nyt` int DEFAULT NULL,
  `route` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `med_time` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `end_duration` int DEFAULT NULL,
  `end_duration_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy2` int DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `gender` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `used_count` bigint DEFAULT NULL,
  `disease_master_id` int DEFAULT NULL,
  `age_range_master_id` int DEFAULT NULL,
  `frequency` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_doctor_brand_favourites_on_doctor_master_id` (`doctor_master_id`),
  KEY `index_doctor_brand_favourites_on_brand_master_id` (`brand_master_id`),
  KEY `doc_bra_fav_on_dis_mas_id` (`disease_master_id`),
  KEY `doc_bra_fav_on_age_ran_mas_id` (`age_range_master_id`),
  CONSTRAINT `fk_rails_50cff4cabe` FOREIGN KEY (`doctor_master_id`) REFERENCES `doctor_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_846075e7c0` FOREIGN KEY (`brand_master_id`) REFERENCES `brand_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_e730190775` FOREIGN KEY (`disease_master_id`) REFERENCES `disease_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_fdda381d3d` FOREIGN KEY (`age_range_master_id`) REFERENCES `age_range_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2935 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `doctor_consultation_details`
--

DROP TABLE IF EXISTS `doctor_consultation_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_consultation_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hospital_doctor_id` int DEFAULT NULL,
  `appointment_type_master_id` int DEFAULT NULL,
  `price` float DEFAULT NULL,
  `slot_duration` int DEFAULT NULL,
  `visibility` int DEFAULT '0',
  `nh_visibility` int DEFAULT '0',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `payment_mode_id` int NOT NULL DEFAULT '0',
  `payment_detail_id` int NOT NULL DEFAULT '0',
  `department_master_id` int NOT NULL DEFAULT '0',
  `room_type_master_id` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=190 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `doctor_disease_life_style_suggestion_masters`
--

DROP TABLE IF EXISTS `doctor_disease_life_style_suggestion_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_disease_life_style_suggestion_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `doctor_master_id` int DEFAULT NULL,
  `disease_master_id` int DEFAULT NULL,
  `suggestion_desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `priority` int DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `doctor_fav_diagnosis_master_id` int DEFAULT NULL,
  `dietician_master_id` int DEFAULT NULL,
  `dietician_fav_diagnosis_master_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_doctor_disease_lifestl_on_dietician_master_id` (`dietician_master_id`),
  KEY `idx_diet_fav_diag_mas_id_on_doctor_dise_life_sty_sug_mas` (`dietician_fav_diagnosis_master_id`)
) ENGINE=InnoDB AUTO_INCREMENT=653 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `doctor_fav_diagnosis_masters`
--

DROP TABLE IF EXISTS `doctor_fav_diagnosis_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_fav_diagnosis_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `doctor_master_id` int DEFAULT NULL,
  `disease_master_id` int DEFAULT NULL,
  `dss_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `used_count` int DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=312 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `doctor_fav_lab_tests`
--

DROP TABLE IF EXISTS `doctor_fav_lab_tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_fav_lab_tests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `doctor_master_id` int DEFAULT NULL,
  `daignostic_test_master_id` int DEFAULT NULL,
  `repeated_cnt` int DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `doctor_favourite_diagnostic_test_masters`
--

DROP TABLE IF EXISTS `doctor_favourite_diagnostic_test_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_favourite_diagnostic_test_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `doctor_master_id` int DEFAULT NULL,
  `disease_master_id` int DEFAULT NULL,
  `diagnostic_test_master_id` int DEFAULT NULL,
  `age_range_master_id` int DEFAULT NULL,
  `used_count` int DEFAULT NULL,
  `gender` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_favourite` tinyint(1) DEFAULT '0',
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `doc_fav_diag_tes_mas_on_doc_mas_id` (`doctor_master_id`),
  KEY `doc_fav_diag_tes_mas_on_dis_mas_id` (`disease_master_id`),
  KEY `doc_fav_diag_tes_mas_on_dig_test_mas_id` (`diagnostic_test_master_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1018 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `doctor_favourite_prescription_lines`
--

DROP TABLE IF EXISTS `doctor_favourite_prescription_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_favourite_prescription_lines` (
  `id` int NOT NULL AUTO_INCREMENT,
  `doctor_favourite_prescription_id` int NOT NULL,
  `brand_master_id` int NOT NULL,
  `mrng` decimal(5,2) DEFAULT NULL,
  `aftn` decimal(5,2) DEFAULT NULL,
  `evng` decimal(5,2) DEFAULT NULL,
  `nyt` decimal(5,2) DEFAULT NULL,
  `route` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `med_time` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `end_duration` int NOT NULL,
  `end_duration_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `total_price` int DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `note` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `brand_descript` text COLLATE utf8_unicode_ci,
  `frequency` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `doctor_favourite_prescriptions`
--

DROP TABLE IF EXISTS `doctor_favourite_prescriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_favourite_prescriptions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fav_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `doctor_master_id` int DEFAULT NULL,
  `status_master_id` int DEFAULT NULL,
  `disease` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `symptoms` text COLLATE utf8_unicode_ci,
  `diagnosis` text COLLATE utf8_unicode_ci,
  `recommended_labs` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `cmmts` text COLLATE utf8_unicode_ci,
  `lttd` decimal(10,7) DEFAULT NULL,
  `lgtd` decimal(10,7) DEFAULT NULL,
  `user_selfrecordtest_detail_id` int DEFAULT NULL,
  `next_visit_dt` datetime DEFAULT NULL,
  `emergency_care` tinyint(1) DEFAULT NULL,
  `next_visit_mode` tinyint(1) DEFAULT NULL,
  `referral_hospital_id` int DEFAULT NULL,
  `referral_doctor_id` int DEFAULT NULL,
  `referral_reason` text COLLATE utf8_unicode_ci,
  `ref_doctor_specialisation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `visited_public` tinyint(1) DEFAULT '0',
  `referred_public` tinyint(1) DEFAULT '0',
  `lyf_style_chnge_rqd` tinyint(1) DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `health_history` text COLLATE utf8_unicode_ci,
  `langauge_preference_id` int DEFAULT NULL,
  `accompanied_with` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `visit_type` int DEFAULT NULL,
  `packages_or_surgeries` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nxt_vst_dur` int DEFAULT NULL,
  `nxt_vst_dur_type` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `doctor_favourite_symptom_masters`
--

DROP TABLE IF EXISTS `doctor_favourite_symptom_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_favourite_symptom_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `doctor_master_id` int DEFAULT NULL,
  `full_text` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_favourite` tinyint(1) DEFAULT '1',
  `used_count` int DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=340 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `doctor_favourite_symptoms_disease_masters`
--

DROP TABLE IF EXISTS `doctor_favourite_symptoms_disease_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_favourite_symptoms_disease_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `doctor_master_id` int DEFAULT NULL,
  `doctor_favourite_symptom_master_id` int DEFAULT NULL,
  `disease_master_id` int DEFAULT NULL,
  `used_count` int DEFAULT NULL,
  `is_favourite` tinyint(1) DEFAULT '0',
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `icd_cm_code_master_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Custom_1` (`doctor_master_id`),
  KEY `Custom_2` (`doctor_favourite_symptom_master_id`),
  KEY `Custom_3` (`disease_master_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1078 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `doctor_hospital_unit_mapping_masters`
--

DROP TABLE IF EXISTS `doctor_hospital_unit_mapping_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_hospital_unit_mapping_masters` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `doctor_master_id` int NOT NULL,
  `hospital_appointment_unit_master_id` int NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `priority` int DEFAULT '1',
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_lead` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `doctor_masters`
--

DROP TABLE IF EXISTS `doctor_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_master_id` int DEFAULT NULL,
  `form_master_id` int DEFAULT NULL,
  `frst_nm` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `lst_nm` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dsply_nm` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rgstrton_no` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rgstrton_yr` int DEFAULT NULL,
  `qualification` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `phn_nmbr_typ` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nmbr` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `available_end_time` datetime DEFAULT NULL,
  `available_start_time` datetime DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '0',
  `effctv_start_dt` datetime DEFAULT '2018-03-15 10:20:55',
  `trmntn_dt` datetime DEFAULT NULL,
  `nanohealth_emp` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_detail_id` int DEFAULT NULL,
  `signature` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `service_master_id` int DEFAULT NULL,
  `is_verified` tinyint(1) DEFAULT '0',
  `verified_by` int DEFAULT NULL,
  `in_network` tinyint(1) DEFAULT '0',
  `bop_only` tinyint(1) DEFAULT NULL,
  `fee_home_visit` int DEFAULT NULL,
  `fee_video_consultation` int DEFAULT NULL,
  `cmmts` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_by_id` int DEFAULT '31',
  `updated_by_id` int DEFAULT '31',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `archived_by_id` datetime DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `archive` tinyint(1) DEFAULT NULL,
  `notify` int DEFAULT NULL,
  `is_lead` tinyint(1) DEFAULT '1',
  `name_template` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vital_question_ids` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cntry_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_doctor_masters_on_user_master_id` (`user_master_id`),
  KEY `index_doctor_masters_on_created_by_id` (`created_by_id`),
  KEY `index_doctor_masters_on_updated_by_id` (`updated_by_id`),
  KEY `index_doctor_masters_on_image_detail_id` (`image_detail_id`),
  KEY `index_doctor_masters_on_service_master_id` (`service_master_id`),
  KEY `index_doctor_masters_on_form_master_id` (`form_master_id`),
  CONSTRAINT `fk_rails_3dbb9b1c83` FOREIGN KEY (`user_master_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_52a6e4de5a` FOREIGN KEY (`service_master_id`) REFERENCES `service_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_aec6202d0f` FOREIGN KEY (`image_detail_id`) REFERENCES `image_details` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2007 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `doctor_personalized_recommendation_details`
--

DROP TABLE IF EXISTS `doctor_personalized_recommendation_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_personalized_recommendation_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_master_id` int NOT NULL,
  `doctor_master_id` int NOT NULL,
  `screening_detail_id` int NOT NULL,
  `recommended_date` datetime DEFAULT NULL,
  `doctor_recommended` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `diet_recommended` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `exercise_recommended` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `other_recommended` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updates_json` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `doctor_prescription_configuration_headers`
--

DROP TABLE IF EXISTS `doctor_prescription_configuration_headers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_prescription_configuration_headers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hospital_doctor_id` int DEFAULT NULL,
  `provider_id` int DEFAULT NULL,
  `hospital_master_id` int DEFAULT NULL,
  `department_master_id` int DEFAULT NULL,
  `hospital_dietician_id` int DEFAULT NULL,
  `service_master_id` int DEFAULT NULL,
  `prescription_field_master_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `discharge_summary_field_master_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hospital_ids` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `header_height` int DEFAULT NULL,
  `footer_height` int DEFAULT NULL,
  `left_margin` int DEFAULT NULL,
  `right_margin` int DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `hospital_doctor_prescription` (`hospital_doctor_id`),
  KEY `hospital_dietician_prescription` (`hospital_dietician_id`)
) ENGINE=InnoDB AUTO_INCREMENT=539 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `doctor_specialisation_details`
--

DROP TABLE IF EXISTS `doctor_specialisation_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_specialisation_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `specialisation_master_id` int NOT NULL,
  `service_master_id` int DEFAULT NULL,
  `doctor_master_id` int NOT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_doc_master_specialisation_master` (`doctor_master_id`,`specialisation_master_id`),
  KEY `index_doctor_specialisation_details_on_specialisation_master_id` (`specialisation_master_id`),
  KEY `index_doctor_specialisation_details_on_doctor_master_id` (`doctor_master_id`),
  CONSTRAINT `fk_rails_0caed00f8f` FOREIGN KEY (`doctor_master_id`) REFERENCES `doctor_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_bf3fc88fed` FOREIGN KEY (`specialisation_master_id`) REFERENCES `specialisation_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=638 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `doctor_visits`
--

DROP TABLE IF EXISTS `doctor_visits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_visits` (
  `id` int NOT NULL AUTO_INCREMENT,
  `appointemnt_tracking_id` int DEFAULT NULL,
  `hospital_doctor_id` int DEFAULT NULL,
  `hospital_master_id` int DEFAULT NULL,
  `doctor_master_id` int DEFAULT NULL,
  `patient_master_id` int DEFAULT NULL,
  `location_master_id` int DEFAULT NULL,
  `status_master_id` int DEFAULT NULL,
  `clinical_status_master_id` int DEFAULT NULL,
  `disease` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `visit_date` datetime NOT NULL,
  `visit_type` int DEFAULT NULL,
  `prescription_img` mediumblob,
  `symptoms` text COLLATE utf8_unicode_ci,
  `diagnosis` text COLLATE utf8_unicode_ci,
  `recommended_labs` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `packages_or_surgeries` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `consultation_fees` int DEFAULT NULL,
  `saathi_accompanied` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cmmts` varchar(2000) CHARACTER SET utf8 DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lttd` decimal(10,7) DEFAULT NULL,
  `lgtd` decimal(10,7) DEFAULT NULL,
  `tblt_crtd_at` datetime DEFAULT NULL,
  `tblt_crtd_by_id` int DEFAULT NULL,
  `proc_updated_at` datetime DEFAULT NULL,
  `patient_prescription_header_id` int DEFAULT NULL,
  `patient_past_prescription_header_id` int DEFAULT NULL,
  `patient_labresult_header_id` int DEFAULT NULL,
  `user_selfrecordtest_detail_id` int DEFAULT NULL,
  `appointment_tracking_id` int DEFAULT NULL,
  `next_visit_dt` datetime DEFAULT NULL,
  `nxt_vst_dur_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nxt_vst_dur` int DEFAULT NULL,
  `emergency_care` tinyint(1) DEFAULT NULL,
  `next_visit_mode` tinyint(1) DEFAULT NULL,
  `referral_hospital_id` int DEFAULT NULL,
  `referral_doctor_id` int DEFAULT NULL,
  `referral_reason` text COLLATE utf8_unicode_ci,
  `ref_doctor_specialisation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `visited_public` tinyint(1) DEFAULT '0',
  `referred_public` tinyint(1) DEFAULT '0',
  `lyf_style_chnge_rqd` tinyint(1) DEFAULT NULL,
  `interaction_count` int DEFAULT NULL,
  `is_draft` tinyint(1) DEFAULT '0',
  `accompanied_with` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `health_history` text COLLATE utf8_unicode_ci,
  `langauge_preference_id` int DEFAULT NULL,
  `updates_json` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icd_code_master_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icd_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remotipart_submitted` tinyint(1) DEFAULT '0',
  `comorbidity` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_doctor_visits_on_status_master_id` (`status_master_id`),
  KEY `fk_rails_619232c1bc` (`doctor_master_id`),
  KEY `fk_rails_553624cc38` (`location_master_id`),
  KEY `fk_rails_50ebd3d647` (`patient_prescription_header_id`),
  KEY `fk_rails_7e8556b790` (`appointment_tracking_id`),
  KEY `fk_rails_f19f428d1a` (`user_selfrecordtest_detail_id`),
  KEY `fk_rails_2864753247` (`hospital_master_id`),
  KEY `fk_rails_2ff21639da` (`langauge_preference_id`),
  KEY `fk_rails_cac0f93061` (`hospital_doctor_id`),
  CONSTRAINT `fk_rails_2864753247` FOREIGN KEY (`hospital_master_id`) REFERENCES `hospital_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_2ff21639da` FOREIGN KEY (`langauge_preference_id`) REFERENCES `language_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_50ebd3d647` FOREIGN KEY (`patient_prescription_header_id`) REFERENCES `patient_prescription_headers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_553624cc38` FOREIGN KEY (`location_master_id`) REFERENCES `location_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_619232c1bc` FOREIGN KEY (`doctor_master_id`) REFERENCES `doctor_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_7e8556b790` FOREIGN KEY (`appointment_tracking_id`) REFERENCES `appointment_trackings` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_9bd24df0bf` FOREIGN KEY (`status_master_id`) REFERENCES `status_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_cac0f93061` FOREIGN KEY (`hospital_doctor_id`) REFERENCES `hospital_doctors` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=12183 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `document_type_masters`
--

DROP TABLE IF EXISTS `document_type_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document_type_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `document_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `desc` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employee_masters`
--

DROP TABLE IF EXISTS `employee_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `emp_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `corp_master_id` int DEFAULT NULL,
  `contact_detail_id` int DEFAULT NULL,
  `gndr` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dob` datetime DEFAULT NULL,
  `department` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `joining_date` datetime DEFAULT NULL,
  `relieving_date` datetime DEFAULT NULL,
  `marital_status` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uhid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `policy_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `policy_end_date` datetime DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `effctv_dt` datetime DEFAULT NULL,
  `trmntn_dt` datetime DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `frst_nm` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lst_nm` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fthr_or_spuse_nm` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `designation` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `adrs_line1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `adrs_line2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `landmark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `area` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pin` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flag` tinyint DEFAULT NULL,
  `bld_grp` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_dbts` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `on_mdctn_db` tinyint(1) DEFAULT NULL,
  `is_hyptn` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `on_mdctn_htn` tinyint(1) DEFAULT NULL,
  `is_lpd` tinyint(1) DEFAULT NULL,
  `on_mdctn_lpd` tinyint(1) DEFAULT NULL,
  `is_thh` tinyint(1) DEFAULT NULL,
  `on_mdctn_thh` tinyint(1) DEFAULT NULL,
  `other_diseases` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `on_mdctn_other` tinyint(1) DEFAULT NULL,
  `hrt_attck` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `smoking` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alchl` int DEFAULT NULL,
  `health_chckp` int DEFAULT NULL,
  `daily_diet` int DEFAULT NULL,
  `exercise_frq` float DEFAULT NULL,
  `prgnnt` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hght_ft` int DEFAULT NULL,
  `hght_in` int DEFAULT NULL,
  `hyptn_fam` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dbts_fam` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dizzy` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `urntn` int DEFAULT NULL,
  `dry_tnge` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nmbnss` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `other_diseases_bool` tinyint(1) DEFAULT NULL,
  `patient_relationship_master_id` int DEFAULT NULL,
  `patient_master_id` int DEFAULT NULL,
  `updates_json` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1407 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enquiry_details`
--

DROP TABLE IF EXISTS `enquiry_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enquiry_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `frst_nm` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lst_nm` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `service` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `crnt_org` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `crnt_job` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fnctl_area` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `exp` float DEFAULT NULL,
  `cmmnts` varchar(1500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `addr1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `addr2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pin` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enq_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `executive_masters`
--

DROP TABLE IF EXISTS `executive_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `executive_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_master_id` int DEFAULT NULL,
  `frst_nm` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lst_nm` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dsply_nm` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gndr` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `addrss` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city_master_id` int DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phn_nmbr_typ` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nmbr` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fthr_or_spuse_nm` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `poi_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prf_of_idntty` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `marital_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `education` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `training_modules` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `effctv_dt` datetime NOT NULL DEFAULT '2018-03-15 10:20:55',
  `trmntn_dt` datetime DEFAULT NULL,
  `notes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `exec_pht_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `exec_pht_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `exec_pht_file_size` int DEFAULT NULL,
  `exec_pht_updated_at` datetime DEFAULT NULL,
  `exec_poi_pht_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `exec_poi_pht_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `exec_poi_pht_file_size` int DEFAULT NULL,
  `exec_poi_pht_updated_at` datetime DEFAULT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `archived_by_id` datetime DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_executive_masters_on_user_master_id` (`user_master_id`),
  KEY `index_executive_masters_on_frst_nm` (`frst_nm`),
  KEY `index_executive_masters_on_city_master_id` (`city_master_id`),
  KEY `index_executive_masters_on_created_by_id` (`created_by_id`),
  KEY `index_executive_masters_on_updated_by_id` (`updated_by_id`),
  CONSTRAINT `fk_rails_8b200dee6b` FOREIGN KEY (`city_master_id`) REFERENCES `city_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_d9edf3554e` FOREIGN KEY (`user_master_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `executive_target_details`
--

DROP TABLE IF EXISTS `executive_target_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `executive_target_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `executive_master_id` int NOT NULL,
  `location_master_id` int NOT NULL,
  `actv_mnths` int DEFAULT NULL,
  `screening_camp_act` int DEFAULT NULL,
  `track_date` datetime NOT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_rails_c92b120b09` (`executive_master_id`),
  KEY `fk_rails_d9eb506a60` (`location_master_id`),
  CONSTRAINT `fk_rails_c92b120b09` FOREIGN KEY (`executive_master_id`) REFERENCES `executive_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_d9eb506a60` FOREIGN KEY (`location_master_id`) REFERENCES `location_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=248 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `expense_headers`
--

DROP TABLE IF EXISTS `expense_headers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expense_headers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `purchase_dt` datetime DEFAULT NULL,
  `total_purchase_cost` float DEFAULT NULL,
  `cgst` float DEFAULT NULL,
  `sgst` float DEFAULT NULL,
  `receipt_img_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transportation_cost` float DEFAULT NULL,
  `invoice_img_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `purchase_discount` float DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `supplier` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hospital_master_id` int DEFAULT NULL,
  `invoice_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `receipt_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `expense_item_masters`
--

DROP TABLE IF EXISTS `expense_item_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expense_item_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `care_delivery_program_master_id` int DEFAULT NULL,
  `item_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `item_desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `packet_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sub_item_count` int DEFAULT NULL,
  `total_item_price` decimal(12,2) DEFAULT NULL,
  `shrt_nm` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `recurrent` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_cost` decimal(12,2) DEFAULT NULL,
  `supplier` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `brand_nm` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `manufacturer` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `effctv_start_dt` datetime DEFAULT NULL,
  `effctv_end_dt` datetime DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `archive` tinyint DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hsncode` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tax_service_mapping_master_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `expense_lines`
--

DROP TABLE IF EXISTS `expense_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expense_lines` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pharmacy_purchase_header_id` int DEFAULT NULL,
  `brand_master_id` int DEFAULT NULL,
  `batch` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiry_dt` datetime DEFAULT NULL,
  `purchase_qty` int DEFAULT NULL,
  `purchase_unit_price` int DEFAULT NULL,
  `sale_unit_price` float DEFAULT NULL,
  `sale_discount_percent` float DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `expense_header_id` int DEFAULT NULL,
  `expense_item_master_id` int DEFAULT NULL,
  `hsn_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gst_rate` float DEFAULT NULL,
  `tax` float DEFAULT NULL,
  `sgst` float DEFAULT NULL,
  `cgst` float DEFAULT NULL,
  `purchase_discount` float DEFAULT NULL,
  `total_price` float DEFAULT NULL,
  `hsncode` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mrp` float DEFAULT NULL,
  `free_itm_cnt` int NOT NULL DEFAULT '0',
  `category` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `purchase_pck_qty` int DEFAULT NULL,
  `purchase_pck_cost` float DEFAULT NULL,
  `pck_mrp` float DEFAULT NULL,
  `qty_per_pck` int DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `exp_count` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `facility_type_masters`
--

DROP TABLE IF EXISTS `facility_type_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facility_type_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `facility_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facility_classification` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_ip` tinyint(1) DEFAULT '0',
  `desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_by_id` int DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `effctv_dt` datetime NOT NULL DEFAULT '2018-03-15 10:20:55',
  `trmntn_dt` datetime DEFAULT NULL,
  `facility_sector` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_facility_type_masters_on_facility_classification` (`facility_classification`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `field_type_masters`
--

DROP TABLE IF EXISTS `field_type_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `field_type_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `field_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `form_masters`
--

DROP TABLE IF EXISTS `form_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `form_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `care_delivery_program_master_id` int DEFAULT NULL,
  `form_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `form_label_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(3) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `resp_role_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '9',
  `saathi_app_font` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `submit_text` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `submit_link` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `website_form_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `form_meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `form_meta_desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` int DEFAULT '0',
  `age_lwr_lmt` int DEFAULT '0',
  `age_upr_lmt` int DEFAULT '1800',
  `program_master_id` int DEFAULT NULL,
  `operational_status_id` int DEFAULT NULL,
  `clinical_status_id` int DEFAULT NULL,
  `form_icon_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `form_og_img_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `form_web_img_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `has_group` tinyint(1) DEFAULT '1',
  `form_type_master_id` int DEFAULT NULL,
  `dynamic_link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `header_img_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `header_img_height` int DEFAULT NULL,
  `footer_img_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `footer_img_height` int DEFAULT NULL,
  `is_image` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `form_parameter_masters`
--

DROP TABLE IF EXISTS `form_parameter_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `form_parameter_masters` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `form_master_id` int NOT NULL,
  `parameter_master_id` int NOT NULL,
  `parameter_value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `form_questnr_group_mapping_masters`
--

DROP TABLE IF EXISTS `form_questnr_group_mapping_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `form_questnr_group_mapping_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `form_master_id` int DEFAULT NULL,
  `questnr_group_master_id` int DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `gender` int DEFAULT '0',
  `age_lwr_lmt` int DEFAULT '0',
  `age_upr_lmt` int DEFAULT '1800',
  `order_id` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=236 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `form_type_masters`
--

DROP TABLE IF EXISTS `form_type_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `form_type_masters` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `form_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `accessible_role_ids` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `category_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gender_masters`
--

DROP TABLE IF EXISTS `gender_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gender_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `gender` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `generic_masters`
--

DROP TABLE IF EXISTS `generic_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `generic_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `generic_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `generic_desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `effctv_dt` datetime NOT NULL DEFAULT '2018-03-15 10:20:56',
  `trmntn_dt` datetime DEFAULT NULL,
  `archived_by_id` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_generic_masters_on_generic_name` (`generic_name`),
  KEY `index_generic_masters_on_archive` (`archive`),
  KEY `index_generic_masters_on_is_active` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `global_status_masters`
--

DROP TABLE IF EXISTS `global_status_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `global_status_masters` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `status_name` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status_code` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `goods_serial_number_details`
--

DROP TABLE IF EXISTS `goods_serial_number_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods_serial_number_details` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `pharmacy_goods_received_detail_id` int DEFAULT NULL,
  `brand_master_id` int DEFAULT NULL,
  `serial_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `received_dt` datetime DEFAULT NULL,
  `patient_master_id` int DEFAULT NULL,
  `prescription_order_line_id` int DEFAULT NULL,
  `prescription_sale_order_header_id` int DEFAULT NULL,
  `gr_invoice_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `pharmacy_purchase_line_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `group_masters`
--

DROP TABLE IF EXISTS `group_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `care_delivery_program_master_id` int DEFAULT NULL,
  `program_master_id` int DEFAULT NULL,
  `group_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_patient` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `health_coach_appointment_details`
--

DROP TABLE IF EXISTS `health_coach_appointment_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `health_coach_appointment_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `appointment_tracking_id` int DEFAULT NULL,
  `checkin_date_time` datetime DEFAULT NULL,
  `checkout_date_time` datetime DEFAULT NULL,
  `in_lttd` decimal(10,7) DEFAULT NULL,
  `in_lgtd` decimal(10,7) DEFAULT NULL,
  `out_lttd` decimal(10,7) DEFAULT NULL,
  `out_lgtd` decimal(10,7) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=237 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `health_system_masters`
--

DROP TABLE IF EXISTS `health_system_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `health_system_masters` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `health_system` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hospital_appointment_unit_masters`
--

DROP TABLE IF EXISTS `hospital_appointment_unit_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospital_appointment_unit_masters` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `care_delivery_program_master_id` int NOT NULL,
  `hospital_master_id` int NOT NULL,
  `appointment_unit_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `slot_duration` int DEFAULT NULL,
  `auto_assign` tinyint(1) DEFAULT '0',
  `price` float DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hospital_diagnostic_lab_mapping_masters`
--

DROP TABLE IF EXISTS `hospital_diagnostic_lab_mapping_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospital_diagnostic_lab_mapping_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hospital_master_id` int NOT NULL,
  `diagnostic_lab_master_id` int NOT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `effctv_dt` datetime NOT NULL,
  `trmntn_dt` datetime DEFAULT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hospital_dieticians`
--

DROP TABLE IF EXISTS `hospital_dieticians`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospital_dieticians` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hospital_master_id` int NOT NULL,
  `service_master_id` int DEFAULT NULL,
  `dietician_master_id` int NOT NULL,
  `location_master_id` int DEFAULT NULL,
  `fees_clinic` int DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slot_duration` int DEFAULT NULL,
  `days_in_advnce` int DEFAULT NULL,
  `time_sensivity` int DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `effctv_dt` datetime NOT NULL,
  `trmntn_dt` datetime DEFAULT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `payment_details` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `visibility` int DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_on_hsptl_dietician` (`hospital_master_id`,`dietician_master_id`),
  UNIQUE KEY `fk_hospital_id_dietician_id` (`hospital_master_id`,`dietician_master_id`),
  KEY `index_hospital_dieticians_on_service_master_id` (`service_master_id`),
  KEY `index_hospital_dieticians_on_location_master_id` (`location_master_id`),
  KEY `fk_rails_91d50f16b4` (`dietician_master_id`),
  CONSTRAINT `fk_rails_66a2d505a4` FOREIGN KEY (`hospital_master_id`) REFERENCES `hospital_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_8f0fd4d9f9` FOREIGN KEY (`location_master_id`) REFERENCES `location_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_91d50f16b4` FOREIGN KEY (`dietician_master_id`) REFERENCES `dietician_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_a20556d3f8` FOREIGN KEY (`service_master_id`) REFERENCES `service_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=403 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hospital_doctors`
--

DROP TABLE IF EXISTS `hospital_doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospital_doctors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hospital_master_id` int NOT NULL,
  `doctor_master_id` int NOT NULL,
  `location_master_id` int DEFAULT NULL,
  `service_master_id` int DEFAULT NULL,
  `visibility` int DEFAULT '0',
  `slot_duration` int DEFAULT NULL,
  `time_sensivity` int DEFAULT NULL,
  `days_in_advnce` int DEFAULT NULL,
  `app_only` tinyint(1) DEFAULT NULL,
  `is_verified` tinyint(1) DEFAULT '0',
  `verified_by` int DEFAULT NULL,
  `in_network` tinyint(1) DEFAULT '0',
  `fees_clinic` int DEFAULT NULL,
  `varble_price_on_durtn` tinyint(1) DEFAULT '0',
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by_id` int NOT NULL DEFAULT '31',
  `updated_by_id` int NOT NULL DEFAULT '31',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `trmntn_dt` datetime DEFAULT NULL,
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `effctv_dt` datetime DEFAULT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `emergency_consltn_fee` float DEFAULT NULL,
  `langauge_preference_id` int DEFAULT NULL,
  `payment_details` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fk_hospital_id_doctor_id` (`hospital_master_id`,`doctor_master_id`),
  KEY `index_hospital_doctors_on_hospital_master_id` (`hospital_master_id`),
  KEY `index_hospital_doctors_on_doctor_master_id` (`doctor_master_id`),
  KEY `index_hospital_doctors_on_location_master_id` (`location_master_id`),
  KEY `index_hospital_doctors_on_created_by_id` (`created_by_id`),
  KEY `index_hospital_doctors_on_updated_by_id` (`updated_by_id`),
  KEY `index_hospital_doctors_on_service_master_id` (`service_master_id`),
  KEY `fk_rails_be6b878675` (`langauge_preference_id`),
  CONSTRAINT `fk_rails_090da3b7cd` FOREIGN KEY (`location_master_id`) REFERENCES `location_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_3b70f3ae5b` FOREIGN KEY (`hospital_master_id`) REFERENCES `hospital_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_5167c1dc0e` FOREIGN KEY (`doctor_master_id`) REFERENCES `doctor_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_be6b878675` FOREIGN KEY (`langauge_preference_id`) REFERENCES `language_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_d835df695f` FOREIGN KEY (`service_master_id`) REFERENCES `service_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2054 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hospital_masters`
--

DROP TABLE IF EXISTS `hospital_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospital_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hsptl_nm` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facility_type_master_id` int DEFAULT NULL,
  `category` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_detail_id` int DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phn_nmbr_typ` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nmbr` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo` blob,
  `wbst_url` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rgstrton_no` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rgstrton_yr` int DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '0',
  `effctv_start_dt` datetime DEFAULT '2018-03-15 10:20:57',
  `trmntn_dt` datetime DEFAULT NULL,
  `cmmts` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_verified` tinyint(1) DEFAULT '0',
  `verified_by` int DEFAULT NULL,
  `in_network` tinyint(1) DEFAULT '0',
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_by_id` int DEFAULT '31',
  `updated_by_id` int DEFAULT '31',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `header_img_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `header_img_height` int DEFAULT NULL,
  `footer_img_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `footer_img_height` int DEFAULT NULL,
  `patient_id_format` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `app_link_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_day_clinic` tinyint(1) DEFAULT NULL,
  `alerts_string` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_beds` int DEFAULT NULL,
  `vacant` int DEFAULT NULL,
  `is_covid_hospital` tinyint(1) DEFAULT '0',
  `management` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_hospital_masters_on_created_by_id` (`created_by_id`),
  KEY `index_hospital_masters_on_updated_by_id` (`updated_by_id`),
  KEY `index_hospital_masters_on_address_detail_id` (`address_detail_id`),
  KEY `fk_rails_ae3e1f62ef` (`facility_type_master_id`),
  CONSTRAINT `fk_rails_37226e39e9` FOREIGN KEY (`address_detail_id`) REFERENCES `address_details` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_ae3e1f62ef` FOREIGN KEY (`facility_type_master_id`) REFERENCES `facility_type_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=1074 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hospital_pharmacy_mapping_masters`
--

DROP TABLE IF EXISTS `hospital_pharmacy_mapping_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospital_pharmacy_mapping_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hospital_master_id` int DEFAULT NULL,
  `pharmacy_master_id` int DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hospital_referral_mapping_masters`
--

DROP TABLE IF EXISTS `hospital_referral_mapping_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospital_referral_mapping_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hospital_master_id` int NOT NULL,
  `refferal_master_id` int NOT NULL,
  `rfrl_hsptl_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `program_master_id` int DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `trmntn_dt` datetime DEFAULT NULL,
  `effctv_dt` datetime NOT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `archived_at` datetime DEFAULT NULL,
  `archived_by_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_on_hsptl_mstr_hsptl_refrl` (`hospital_master_id`,`refferal_master_id`),
  KEY `fk_rails_7a898ba029` (`refferal_master_id`),
  KEY `fk_rails_565690bd8a` (`program_master_id`),
  CONSTRAINT `fk_rails_0f2d3306dc` FOREIGN KEY (`hospital_master_id`) REFERENCES `hospital_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_565690bd8a` FOREIGN KEY (`program_master_id`) REFERENCES `program_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_7a898ba029` FOREIGN KEY (`refferal_master_id`) REFERENCES `hospital_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hospital_surgery_mapping_masters`
--

DROP TABLE IF EXISTS `hospital_surgery_mapping_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospital_surgery_mapping_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `icd10_pcs_code_master_id` int DEFAULT NULL,
  `hospital_procedure_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hospital_master_id` int DEFAULT NULL,
  `service_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT '1',
  `role_master_id` int DEFAULT NULL,
  `surgery_master_id` int NOT NULL DEFAULT '1',
  `alias` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `price` decimal(12,2) DEFAULT NULL,
  `payment_mode` int DEFAULT '0',
  `payment_detail_id` int DEFAULT '0',
  `icd_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `charge_code_master_id` int DEFAULT NULL,
  `room_type_master_id` int DEFAULT '0',
  `department_master_id` int DEFAULT '0',
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `effctv_dt` datetime NOT NULL,
  `trmntn_dt` datetime DEFAULT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `adv_admit_hours` float DEFAULT NULL,
  `expected_admit_hours` float DEFAULT NULL,
  `approx_duration` int DEFAULT NULL,
  `custom_template_pdf_detail_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=696 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ic_ipclass_details`
--

DROP TABLE IF EXISTS `ic_ipclass_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ic_ipclass_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `insurance_company_master_id` int NOT NULL,
  `insurance_policy_class_master_id` int NOT NULL,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `icd10_pcs_code_masters`
--

DROP TABLE IF EXISTS `icd10_pcs_code_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `icd10_pcs_code_masters` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `icd10_pcs_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description_long` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `service_master_id` int DEFAULT NULL,
  `charge_code_master_id` int DEFAULT NULL,
  `role_master_id` int DEFAULT NULL,
  `tax_service_mapping_master_id` int DEFAULT NULL,
  `desc_level1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc_level2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc_level3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc_level4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc_level5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc_level6` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_icd10_pcs_code_masters_on_service_master_id` (`service_master_id`),
  KEY `index_icd10_pcs_code_masters_on_charge_code_master_id` (`charge_code_master_id`),
  KEY `index_icd10_pcs_code_masters_on_role_master_id` (`role_master_id`),
  KEY `index_icd10_pcs_code_masters_on_tax_service_mapping_master_id` (`tax_service_mapping_master_id`)
) ENGINE=InnoDB AUTO_INCREMENT=78140 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `icd_cm_code_masters`
--

DROP TABLE IF EXISTS `icd_cm_code_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `icd_cm_code_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `icd_cm_code` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level` int DEFAULT NULL,
  `description1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23629 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `icd_code_dummy`
--

DROP TABLE IF EXISTS `icd_code_dummy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `icd_code_dummy` (
  `id` int NOT NULL AUTO_INCREMENT,
  `icd_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nh_impact_prcnt` float DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=485 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `icd_code_masters`
--

DROP TABLE IF EXISTS `icd_code_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `icd_code_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `diagnosis_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icd_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `full_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icd_code_level2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icd_code_level3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nh_impact_prcnt` float DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `effctv_dt` datetime DEFAULT NULL,
  `trmntn_dt` datetime DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44488 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ico_leads`
--

DROP TABLE IF EXISTS `ico_leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ico_leads` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `frst_nm` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lst_nm` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cntry_code` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_ico_leads_on_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `image_details`
--

DROP TABLE IF EXISTS `image_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_master_id` int DEFAULT NULL,
  `img_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `img_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `upload_date` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `nano_safe_detail_id` int DEFAULT NULL,
  `doctor_visit_id` int DEFAULT NULL,
  `patient_prescription_header_id` int DEFAULT NULL,
  `patient_labresult_header_id` int DEFAULT NULL,
  `screening_detail_id` int DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `rfq_insurance_policy_detail_id` int DEFAULT NULL,
  `img_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `insurance_policy_detail_id` int DEFAULT NULL,
  `patient_message_id` int DEFAULT NULL,
  `dietician_visit_id` int DEFAULT NULL,
  `updates_json` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sale_order_header_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_image_details_on_patient_master_id` (`patient_master_id`),
  KEY `index_image_details_on_img_type` (`img_type`),
  KEY `fk_rails_a74ee51d35` (`patient_prescription_header_id`),
  KEY `fk_rails_84243952cb` (`patient_labresult_header_id`),
  CONSTRAINT `fk_rails_84243952cb` FOREIGN KEY (`patient_labresult_header_id`) REFERENCES `patient_labresult_headers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_a74ee51d35` FOREIGN KEY (`patient_prescription_header_id`) REFERENCES `patient_prescription_headers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_a94b04e1f0` FOREIGN KEY (`patient_master_id`) REFERENCES `patient_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=68100 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `impressions`
--

DROP TABLE IF EXISTS `impressions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `impressions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `impressionable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `impressionable_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `controller_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `action_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `view_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `request_hash` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `session_hash` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `referrer` text COLLATE utf8_unicode_ci,
  `params` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `impressionable_type_message_index` (`impressionable_type`,`message`(255),`impressionable_id`),
  KEY `poly_request_index` (`impressionable_type`,`impressionable_id`,`request_hash`),
  KEY `poly_ip_index` (`impressionable_type`,`impressionable_id`,`ip_address`),
  KEY `poly_session_index` (`impressionable_type`,`impressionable_id`,`session_hash`),
  KEY `controlleraction_request_index` (`controller_name`,`action_name`,`request_hash`),
  KEY `controlleraction_ip_index` (`controller_name`,`action_name`,`ip_address`),
  KEY `controlleraction_session_index` (`controller_name`,`action_name`,`session_hash`),
  KEY `poly_params_request_index` (`impressionable_type`,`impressionable_id`,`params`(255)),
  KEY `index_impressions_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `in_patient_details`
--

DROP TABLE IF EXISTS `in_patient_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `in_patient_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_master_id` int NOT NULL,
  `ip_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `surgery_master_id` int DEFAULT NULL,
  `sale_order_header_id` int DEFAULT NULL,
  `preferred_payment_id` int DEFAULT NULL,
  `preferred_payment_detail_id` int DEFAULT NULL,
  `operation_dt` datetime DEFAULT NULL,
  `admission_dt` datetime DEFAULT NULL,
  `discharge_dt` datetime DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `room_no` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price_per_day` float DEFAULT NULL,
  `anaesthesia_chrge` float DEFAULT NULL,
  `nursing_chrge` float DEFAULT NULL,
  `referred_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admitted_days` float DEFAULT '0',
  `consent_form_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `planned_operation_dt` datetime DEFAULT NULL,
  `planned_admission_dt` datetime DEFAULT NULL,
  `planned_discharge_dt` datetime DEFAULT NULL,
  `ot_chrge` float DEFAULT NULL,
  `lead_doctor_id` int DEFAULT NULL,
  `doctor_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `therapist_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `counsellor_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `summary_images` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updates_json` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `room_type_master_id` int DEFAULT NULL,
  `department_master_id` int DEFAULT NULL,
  `interaction_count` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2383 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `in_patient_program_assigned_lines`
--

DROP TABLE IF EXISTS `in_patient_program_assigned_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `in_patient_program_assigned_lines` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `patient_master_id` int DEFAULT NULL,
  `service_master_id` int DEFAULT NULL,
  `activity_detail_id` int DEFAULT NULL,
  `where_recommendation_id` int DEFAULT NULL,
  `whose_resp_role_id` int DEFAULT NULL,
  `schedule_date_time` datetime DEFAULT NULL,
  `actual_date_time` datetime DEFAULT NULL,
  `status` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cmmts` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `appointment_tracking_id` int DEFAULT NULL,
  `interaction_count` int DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `incentive_conversion_masters`
--

DROP TABLE IF EXISTS `incentive_conversion_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incentive_conversion_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `from_data_type_master_id` int NOT NULL,
  `to_data_type_master_id` int NOT NULL,
  `conversion_value` float NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `effctv_dt` datetime NOT NULL,
  `trmntn_dt` datetime DEFAULT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `incentive_type_masters`
--

DROP TABLE IF EXISTS `incentive_type_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incentive_type_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `care_delivery_program_master_id` int DEFAULT NULL,
  `incentive_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `insurance_company_masters`
--

DROP TABLE IF EXISTS `insurance_company_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insurance_company_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ic_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ic_short_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ic_address_detail_id` int DEFAULT NULL,
  `parent_corp_id` int DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `effctv_dt` datetime DEFAULT NULL,
  `trmntn_dt` datetime DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `custom_template_pdf_detail_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `insurance_company_parameter_details`
--

DROP TABLE IF EXISTS `insurance_company_parameter_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insurance_company_parameter_details` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `insurance_company_master_id` int NOT NULL,
  `parameter_master_id` int NOT NULL,
  `parameter_value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `insurance_coverage_list_masters`
--

DROP TABLE IF EXISTS `insurance_coverage_list_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insurance_coverage_list_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `coverage_item` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `coverage_item_desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `effctv_dt` datetime DEFAULT NULL,
  `trmntn_dt` datetime DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `insurance_family_coverage_masters`
--

DROP TABLE IF EXISTS `insurance_family_coverage_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insurance_family_coverage_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `coverage` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `coverage_desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `insurance_policy_class_master_id` int NOT NULL,
  `policy_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `effctv_dt` datetime DEFAULT NULL,
  `trmntn_dt` datetime DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `insurance_group_masters`
--

DROP TABLE IF EXISTS `insurance_group_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insurance_group_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ip_group` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `effctv_dt` datetime DEFAULT NULL,
  `trmntn_dt` datetime DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `insurance_policy_class_masters`
--

DROP TABLE IF EXISTS `insurance_policy_class_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insurance_policy_class_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ip_class` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `effctv_dt` datetime DEFAULT NULL,
  `trmntn_dt` datetime DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `insurance_policy_details`
--

DROP TABLE IF EXISTS `insurance_policy_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insurance_policy_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `policy_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `insurance_policy_class_master_id` int DEFAULT NULL,
  `insurance_company_master_id` int DEFAULT NULL,
  `service_agency_master_id` int DEFAULT NULL,
  `policy_start_date` datetime DEFAULT NULL,
  `policy_end_date` datetime DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `premium_amount` decimal(12,2) DEFAULT NULL,
  `insurance_group_master_id` int DEFAULT NULL,
  `notes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `effctv_dt` datetime DEFAULT NULL,
  `trmntn_dt` datetime DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tpa_master_id` int DEFAULT NULL,
  `corp_master_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `insurance_family_coverage_master_id` int DEFAULT NULL,
  `req_sum_insured` float DEFAULT NULL,
  `sum_insured_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `si_for_corp_buff` float DEFAULT NULL,
  `cases_for_corp_buff` float DEFAULT NULL,
  `premium` float DEFAULT NULL,
  `tax` decimal(12,2) DEFAULT NULL,
  `tot_premium_paid` decimal(12,2) DEFAULT NULL,
  `claim_extract_date` datetime DEFAULT NULL,
  `e_e_reln_no_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `e_e_relationship` tinyint(1) DEFAULT NULL,
  `patient_master_id` int DEFAULT NULL,
  `is_group_policy` tinyint(1) DEFAULT '0',
  `id_card` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updates_json` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=987 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inventory_details`
--

DROP TABLE IF EXISTS `inventory_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `item_master_id` int NOT NULL,
  `remaining_qty` int NOT NULL,
  `recurrent` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `hospital_master_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_inventory_details_on_item_master_id` (`item_master_id`),
  CONSTRAINT `fk_rails_9c04f7300e` FOREIGN KEY (`item_master_id`) REFERENCES `item_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inventory_purchase_headers`
--

DROP TABLE IF EXISTS `inventory_purchase_headers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_purchase_headers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `purchase_dt` datetime DEFAULT NULL,
  `total_purchase_cost` float DEFAULT NULL,
  `cgst` float DEFAULT NULL,
  `sgst` float DEFAULT NULL,
  `receipt_img_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transportation_cost` float DEFAULT NULL,
  `invoice_img_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `purchase_discount` float DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `supplier` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hospital_master_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `invoice_details`
--

DROP TABLE IF EXISTS `invoice_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sale_order_header_id` int NOT NULL,
  `order_item_id` int DEFAULT NULL,
  `order_item_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `service_master_id` int NOT NULL,
  `promo_code_master_id` int DEFAULT NULL,
  `quantity` int NOT NULL,
  `unit_cost` decimal(12,2) DEFAULT NULL,
  `total_cost` decimal(12,2) DEFAULT NULL,
  `discount_price` decimal(12,2) DEFAULT NULL,
  `tax_value` decimal(12,2) DEFAULT NULL,
  `net_payable` decimal(12,2) DEFAULT NULL,
  `charge_code_master_id` int DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `effctv_dt` datetime NOT NULL,
  `trmntn_dt` datetime DEFAULT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_closed` tinyint(1) NOT NULL DEFAULT '0',
  `revenue_credit_hospital_id` int DEFAULT NULL,
  `appointment_tracking_id` int DEFAULT NULL,
  `comments` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54779 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ip_charge_configuration_details`
--

DROP TABLE IF EXISTS `ip_charge_configuration_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_charge_configuration_details` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `service_master_id` int DEFAULT NULL,
  `mapping_master_id` int DEFAULT NULL,
  `service_detail_id` int DEFAULT NULL,
  `room_type_master_id` int DEFAULT NULL,
  `payment_mode_id` int DEFAULT NULL,
  `payment_detail_id` int NOT NULL DEFAULT '0',
  `department_master_id` int DEFAULT NULL,
  `final_price` float DEFAULT NULL,
  `percent_increase` float DEFAULT '0',
  `flat_increase` float DEFAULT '0',
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_ip_charge_configuration_details_on_service_master_id` (`service_master_id`),
  KEY `index_ip_charge_configuration_details_on_mapping_master_id` (`mapping_master_id`),
  KEY `index_ip_charge_configuration_details_on_service_detail_id` (`service_detail_id`),
  KEY `index_ip_charge_configuration_details_on_room_type_master_id` (`room_type_master_id`),
  KEY `index_ip_charge_configuration_details_on_payment_mode_id` (`payment_mode_id`),
  KEY `index_ip_charge_configuration_details_on_payment_detail_id` (`payment_detail_id`),
  KEY `index_ip_charge_configuration_details_on_department_master_id` (`department_master_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `item_masters`
--

DROP TABLE IF EXISTS `item_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `care_delivery_program_master_id` int DEFAULT NULL,
  `item_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `item_desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `packet_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sub_item_count` int DEFAULT NULL,
  `total_item_price` decimal(12,2) DEFAULT NULL,
  `shrt_nm` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `recurrent` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_cost` decimal(12,2) DEFAULT NULL,
  `supplier` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `brand_nm` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `manufacturer` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `effctv_start_dt` datetime DEFAULT NULL,
  `effctv_end_dt` datetime DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `archive` tinyint DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hsncode` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tax_service_mapping_master_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_item_masters_on_item_name` (`item_name`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `item_order_details`
--

DROP TABLE IF EXISTS `item_order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_order_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `item_order_header_id` int NOT NULL,
  `item_master_id` int NOT NULL,
  `saathi_master_id` int NOT NULL,
  `qty_requested` int NOT NULL,
  `qty_issued` int DEFAULT NULL,
  `status` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `received_dt` datetime DEFAULT NULL,
  `uom` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_rails_6d38ceed1c` (`item_order_header_id`),
  KEY `fk_rails_2a54de9569` (`item_master_id`),
  KEY `fk_rails_f7d39185ff` (`saathi_master_id`),
  CONSTRAINT `fk_rails_2a54de9569` FOREIGN KEY (`item_master_id`) REFERENCES `item_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_6d38ceed1c` FOREIGN KEY (`item_order_header_id`) REFERENCES `item_order_headers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_f7d39185ff` FOREIGN KEY (`saathi_master_id`) REFERENCES `saathi_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4218 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `item_order_headers`
--

DROP TABLE IF EXISTS `item_order_headers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_order_headers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `saathi_master_id` int NOT NULL,
  `order_dt` datetime NOT NULL,
  `reqstd_delivery_dt` datetime NOT NULL,
  `status` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `issued_by_id` int DEFAULT NULL,
  `delivery_dt` datetime DEFAULT NULL,
  `received_by_id` int DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rails_6d9c893535` (`saathi_master_id`),
  CONSTRAINT `fk_rails_6d9c893535` FOREIGN KEY (`saathi_master_id`) REFERENCES `saathi_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2101273972 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `item_purchase_details`
--

DROP TABLE IF EXISTS `item_purchase_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_purchase_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hospital_master_id` int DEFAULT NULL,
  `item_master_id` int NOT NULL,
  `purchase_qty` int NOT NULL,
  `purchase_dt` datetime DEFAULT NULL,
  `unit_purchase_cost` decimal(12,2) DEFAULT NULL,
  `supplier` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transportation_cost` decimal(12,2) DEFAULT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_purchase_cost` decimal(12,2) DEFAULT NULL,
  `manufacturing_dt` datetime DEFAULT NULL,
  `expiry_dt` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `hsncode` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cgst` float DEFAULT NULL,
  `sgst` float DEFAULT NULL,
  `inventory_purchase_header_id` int DEFAULT NULL,
  `purchase_discount` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rails_b42f2dd389` (`item_master_id`),
  CONSTRAINT `fk_rails_b42f2dd389` FOREIGN KEY (`item_master_id`) REFERENCES `item_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `json_data`
--

DROP TABLE IF EXISTS `json_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `json_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ptnt_rgstrtn_id` varchar(21) COLLATE utf8_unicode_ci DEFAULT NULL,
  `screen_typ` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `screen_no` int DEFAULT NULL,
  `frst_nm` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lst_nm` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dsply_nm` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `dob_verified` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gndr` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `addrss` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `location_master_id` int DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nmbr` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `phn_nmbr_typ` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fthr_or_spuse_nm` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pn_cd` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ptnt_pht` mediumblob,
  `poi_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prf_of_idntty` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `poi_pht` mediumblob,
  `ethnicity` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_dbts` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_hyptn` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `on_mdctn` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hrt_attck` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `smoking` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prgnnt` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dbts_fam` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hyptn_fam` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dizzy` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `urntn` smallint DEFAULT NULL,
  `dry_tnge` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nmbness` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hght_ft` smallint DEFAULT NULL,
  `hght_in` smallint DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `waist` mediumint DEFAULT NULL,
  `bmi` float DEFAULT NULL,
  `bp_systlc` mediumint DEFAULT NULL,
  `bp_dstlc` mediumint DEFAULT NULL,
  `bld_sgr` mediumint DEFAULT NULL,
  `bld_sgr_ctgry` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pulse` mediumint DEFAULT NULL,
  `spo2` mediumint DEFAULT NULL,
  `tmprtur` float DEFAULT NULL,
  `bld_grp` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bld_grp_rh_fctr` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `haemoglobin` float DEFAULT NULL,
  `hba1c` float DEFAULT NULL,
  `prescription_img` mediumblob,
  `dummy1` int DEFAULT NULL,
  `dummy2` int DEFAULT NULL,
  `dummy3` float DEFAULT NULL,
  `dummy4` float DEFAULT NULL,
  `dummy5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lttd` decimal(10,7) DEFAULT NULL,
  `lgtd` decimal(10,7) DEFAULT NULL,
  `cmmts` varchar(5000) CHARACTER SET utf8 DEFAULT NULL,
  `tblt_crtd_at` datetime DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bp_rsk_lvl` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bp_rsk_scr` mediumint DEFAULT NULL,
  `bld_sgr_rsk_lvl` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bld_sgr_rsk_scr` mediumint DEFAULT NULL,
  `disease` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status_master_id` int DEFAULT NULL,
  `hospital_doctor_id` int DEFAULT NULL,
  `amt_paid` int DEFAULT NULL,
  `change_type` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `imei_code` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flag` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `visit_date` datetime DEFAULT NULL,
  `saathi_accompanied` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `referred_by` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `program_master_id` int DEFAULT NULL,
  `total_chol` float DEFAULT NULL,
  `hdl` float DEFAULT NULL,
  `ldl` float DEFAULT NULL,
  `triglycerides` decimal(5,2) DEFAULT NULL,
  `t3` float DEFAULT NULL,
  `t4` float DEFAULT NULL,
  `tsh` float DEFAULT NULL,
  `ddid` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy6` datetime DEFAULT NULL,
  `dummy7` datetime DEFAULT NULL,
  `screening_camp_master_id` int DEFAULT NULL,
  `patient_package_detail_id` bigint DEFAULT NULL,
  `group_id` int DEFAULT NULL,
  `pck_id` int DEFAULT NULL,
  `pck_start_date` datetime DEFAULT NULL,
  `pck_end_date` datetime DEFAULT NULL,
  `mnth_cnt` int DEFAULT NULL,
  `fam_mem_cnt` int DEFAULT NULL,
  `renewal_date` datetime DEFAULT NULL,
  `next_test_date` datetime DEFAULT NULL,
  `fam_head` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `full_questnr` tinyint(1) DEFAULT '0',
  `cnslng_durtn` int DEFAULT NULL,
  `db_rsk_scr` bigint DEFAULT NULL,
  `htn_systlc_rsk_scr` bigint DEFAULT NULL,
  `htn_dstlc_rsk_scr` bigint DEFAULT NULL,
  `ob_rsk_scr` bigint DEFAULT NULL,
  `alchl` int DEFAULT '0',
  `exercise_frq` float DEFAULT NULL,
  `hip` smallint DEFAULT NULL,
  `whr` float DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `allergies` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6385 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `json_data_histories`
--

DROP TABLE IF EXISTS `json_data_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `json_data_histories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ptnt_rgstrtn_id` varchar(21) COLLATE utf8_unicode_ci DEFAULT NULL,
  `screen_typ` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `screen_no` int DEFAULT NULL,
  `frst_nm` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lst_nm` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dsply_nm` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `dob_verified` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gndr` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `addrss` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `location_master_id` int DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nmbr` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `phn_nmbr_typ` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fthr_or_spuse_nm` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pn_cd` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ptnt_pht` mediumblob,
  `poi_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prf_of_idntty` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `poi_pht` mediumblob,
  `ethnicity` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_dbts` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_hyptn` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `on_mdctn` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hrt_attck` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `smoking` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prgnnt` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dbts_fam` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hyptn_fam` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dizzy` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `urntn` smallint DEFAULT NULL,
  `dry_tnge` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nmbness` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hght_ft` smallint DEFAULT NULL,
  `hght_in` smallint DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `waist` mediumint DEFAULT NULL,
  `bmi` float DEFAULT NULL,
  `bp_systlc` mediumint DEFAULT NULL,
  `bp_dstlc` mediumint DEFAULT NULL,
  `bld_sgr` mediumint DEFAULT NULL,
  `bld_sgr_ctgry` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pulse` mediumint DEFAULT NULL,
  `spo2` mediumint DEFAULT NULL,
  `tmprtur` float DEFAULT NULL,
  `bld_grp` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bld_grp_rh_fctr` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `haemoglobin` float DEFAULT NULL,
  `hba1c` float DEFAULT NULL,
  `prescription_img` mediumblob,
  `dummy1` int DEFAULT NULL,
  `dummy2` int DEFAULT NULL,
  `dummy3` float DEFAULT NULL,
  `dummy4` float DEFAULT NULL,
  `dummy5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lttd` decimal(10,7) DEFAULT NULL,
  `lgtd` decimal(10,7) DEFAULT NULL,
  `cmmts` varchar(5000) CHARACTER SET utf8 DEFAULT NULL,
  `tblt_crtd_at` datetime DEFAULT NULL,
  `created_by_id` int DEFAULT '31',
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bp_rsk_lvl` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bp_rsk_scr` mediumint DEFAULT NULL,
  `bld_sgr_rsk_lvl` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bld_sgr_rsk_scr` mediumint DEFAULT NULL,
  `disease` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status_master_id` int DEFAULT NULL,
  `hospital_doctor_id` int DEFAULT NULL,
  `amt_paid` int DEFAULT NULL,
  `change_type` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `imei_code` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flag` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `visit_date` datetime DEFAULT NULL,
  `saathi_accompanied` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `referred_by` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `program_master_id` int DEFAULT NULL,
  `total_chol` float DEFAULT NULL,
  `hdl` float DEFAULT NULL,
  `ldl` float DEFAULT NULL,
  `triglycerides` decimal(5,2) DEFAULT NULL,
  `t3` float DEFAULT NULL,
  `t4` float DEFAULT NULL,
  `tsh` float DEFAULT NULL,
  `ddid` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy6` datetime DEFAULT NULL,
  `dummy7` datetime DEFAULT NULL,
  `screening_camp_master_id` int DEFAULT NULL,
  `patient_package_detail_id` bigint DEFAULT NULL,
  `group_id` int DEFAULT NULL,
  `pck_id` int DEFAULT NULL,
  `pck_start_date` datetime DEFAULT NULL,
  `pck_end_date` datetime DEFAULT NULL,
  `mnth_cnt` int DEFAULT NULL,
  `fam_mem_cnt` int DEFAULT NULL,
  `renewal_date` datetime DEFAULT NULL,
  `next_test_date` datetime DEFAULT NULL,
  `fam_head` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `full_questnr` tinyint(1) DEFAULT '0',
  `cnslng_durtn` int DEFAULT NULL,
  `db_rsk_scr` bigint DEFAULT NULL,
  `htn_systlc_rsk_scr` bigint DEFAULT NULL,
  `htn_dstlc_rsk_scr` bigint DEFAULT NULL,
  `ob_rsk_scr` bigint DEFAULT NULL,
  `alchl` int DEFAULT '0',
  `exercise_frq` float DEFAULT NULL,
  `hip` smallint DEFAULT NULL,
  `whr` float DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `allergies` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2108 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_inventory_details`
--

DROP TABLE IF EXISTS `lab_inventory_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_inventory_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `item_master_id` int DEFAULT NULL,
  `batch` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiry_dt` datetime DEFAULT NULL,
  `remaining_qty` int DEFAULT NULL,
  `recurrent` mediumint DEFAULT NULL,
  `status` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `mrp` float DEFAULT NULL,
  `category` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `diagnostic_lab_master_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_purchase_headers`
--

DROP TABLE IF EXISTS `lab_purchase_headers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_purchase_headers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `purchase_dt` datetime DEFAULT NULL,
  `tax` float DEFAULT NULL,
  `transportation_cost` float DEFAULT NULL,
  `total_purchase_cost` float DEFAULT NULL,
  `address_detail_id` int DEFAULT NULL,
  `receipt_img_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `sgst` float DEFAULT NULL,
  `cgst` float DEFAULT NULL,
  `dealer` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invoice_img_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `purchase_discount` float DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `diagnostic_lab_master_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_purchase_lines`
--

DROP TABLE IF EXISTS `lab_purchase_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_purchase_lines` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lab_purchase_header_id` int DEFAULT NULL,
  `item_master_id` int DEFAULT NULL,
  `batch` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiry_dt` datetime DEFAULT NULL,
  `purchase_qty` int DEFAULT NULL,
  `purchase_unit_price` int DEFAULT NULL,
  `sale_unit_price` float DEFAULT NULL,
  `sale_discount_percent` float DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `tax` float DEFAULT NULL,
  `sgst` float DEFAULT NULL,
  `cgst` float DEFAULT NULL,
  `purchase_discount` float DEFAULT NULL,
  `total_price` float DEFAULT NULL,
  `hsncode` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mrp` float DEFAULT NULL,
  `free_itm_cnt` int DEFAULT '0',
  `category` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `language_masters`
--

DROP TABLE IF EXISTS `language_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `language` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `local_language` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `line_items`
--

DROP TABLE IF EXISTS `line_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `line_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cart_id` int NOT NULL,
  `item_id` int NOT NULL,
  `item_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `service_master_id` int DEFAULT NULL,
  `price` decimal(10,4) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `line_details` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rails_af645e8e5f` (`cart_id`),
  KEY `fk_rails_8761a4a5a0` (`service_master_id`),
  CONSTRAINT `fk_rails_8761a4a5a0` FOREIGN KEY (`service_master_id`) REFERENCES `service_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_af645e8e5f` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=49579 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `location_hospital_dietician_mapping_masters`
--

DROP TABLE IF EXISTS `location_hospital_dietician_mapping_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location_hospital_dietician_mapping_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `location_master_id` int NOT NULL,
  `hospital_dietician_id` int NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `effctv_dt` datetime NOT NULL,
  `trmntn_dt` datetime DEFAULT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fk_location_id_hospital_dietician_id` (`location_master_id`,`hospital_dietician_id`),
  KEY `fk_rails_f511b48499` (`hospital_dietician_id`),
  CONSTRAINT `fk_rails_8e53489d59` FOREIGN KEY (`location_master_id`) REFERENCES `location_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_f511b48499` FOREIGN KEY (`hospital_dietician_id`) REFERENCES `hospital_dieticians` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=439 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `location_hospital_doctor_mapping_masters`
--

DROP TABLE IF EXISTS `location_hospital_doctor_mapping_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location_hospital_doctor_mapping_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `location_master_id` int NOT NULL,
  `hospital_doctor_id` int NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `effctv_dt` datetime NOT NULL,
  `trmntn_dt` datetime DEFAULT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fk_location_id_hospital_doctor_id` (`location_master_id`,`hospital_doctor_id`),
  KEY `fk_rails_505873fb6d` (`hospital_doctor_id`),
  CONSTRAINT `fk_rails_505873fb6d` FOREIGN KEY (`hospital_doctor_id`) REFERENCES `hospital_doctors` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_95efa45245` FOREIGN KEY (`location_master_id`) REFERENCES `location_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=1697 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `location_masters`
--

DROP TABLE IF EXISTS `location_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lctn_nm` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lctn_shrt_nm` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dscrptn` text COLLATE utf8_unicode_ci,
  `area` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city_master_id` int DEFAULT NULL,
  `pn_cd` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `executive_master_id` int DEFAULT NULL,
  `effctv_dt` datetime NOT NULL DEFAULT '2018-03-15 10:20:57',
  `trmntn_dt` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `tablet_master_id` int DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `area_master_id` int NOT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `archived_at` datetime DEFAULT NULL,
  `archived_by_id` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_location_masters_on_executive_master_id` (`executive_master_id`),
  KEY `index_location_masters_on_tablet_master_id` (`tablet_master_id`),
  KEY `index_location_masters_on_created_by_id` (`created_by_id`),
  KEY `index_location_masters_on_updated_by_id` (`updated_by_id`),
  KEY `fk_rails_08a481838d` (`city_master_id`),
  KEY `fk_rails_51e9c0c501` (`area_master_id`),
  CONSTRAINT `fk_rails_08a481838d` FOREIGN KEY (`city_master_id`) REFERENCES `city_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_51e9c0c501` FOREIGN KEY (`area_master_id`) REFERENCES `area_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_aec67d15bb` FOREIGN KEY (`executive_master_id`) REFERENCES `executive_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_c55550f423` FOREIGN KEY (`tablet_master_id`) REFERENCES `tablet_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=701 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `location_phlebotomist_mapping_masters`
--

DROP TABLE IF EXISTS `location_phlebotomist_mapping_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location_phlebotomist_mapping_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `location_master_id` int NOT NULL,
  `phlebotomist_master_id` int NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `effctv_dt` datetime NOT NULL,
  `trmntn_dt` datetime DEFAULT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `location_program_maping_masters`
--

DROP TABLE IF EXISTS `location_program_maping_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location_program_maping_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `location_master_id` int NOT NULL,
  `program_master_id` int NOT NULL,
  `care_delivery_program_master_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `archived_by_id` int DEFAULT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `effctv_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `trmntn_dt` datetime DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_constraint1` (`location_master_id`,`program_master_id`,`care_delivery_program_master_id`),
  KEY `fk_rails_cf820b38d2` (`care_delivery_program_master_id`),
  KEY `fk_rails_7426734de1` (`program_master_id`),
  CONSTRAINT `fk_rails_7426734de1` FOREIGN KEY (`program_master_id`) REFERENCES `program_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_cf820b38d2` FOREIGN KEY (`care_delivery_program_master_id`) REFERENCES `care_delivery_program_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_ee7c5e1da9` FOREIGN KEY (`location_master_id`) REFERENCES `location_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=855 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `manufacturer_masters`
--

DROP TABLE IF EXISTS `manufacturer_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manufacturer_masters` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `manufacturer_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `marketing_users`
--

DROP TABLE IF EXISTS `marketing_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marketing_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `frst_nm` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `lst_nm` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `designation` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `prfl_sht_desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `prfl_ful_desc` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `role` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `pfl_img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `authentication_token` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_actv` tinyint(1) NOT NULL DEFAULT '1',
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `trmntn_dt` datetime DEFAULT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `effctv_dt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_marketing_users_on_email` (`email`),
  UNIQUE KEY `index_marketing_users_on_reset_password_token` (`reset_password_token`),
  UNIQUE KEY `index_marketing_users_on_authentication_token` (`authentication_token`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mediator_api_transaction_details`
--

DROP TABLE IF EXISTS `mediator_api_transaction_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mediator_api_transaction_details` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `target` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `origin` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `request_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `req_json_body` mediumblob,
  `resp_status_code` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `resp_json_body` mediumblob,
  `nh_event_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nh_event_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_mediator_api_transaction_details_on_target` (`target`),
  KEY `index_mediator_api_transaction_details_on_origin` (`origin`),
  KEY `index_mediator_api_transaction_details_on_request_id` (`request_id`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `medicine_data`
--

DROP TABLE IF EXISTS `medicine_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicine_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `brand_desc` text COLLATE utf8_unicode_ci,
  `type` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `medicine_type_master_id` int DEFAULT NULL,
  `route` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `unit_master_id` int DEFAULT NULL,
  `dose` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_price` decimal(7,2) DEFAULT NULL,
  `product_sales_channel_master_id` int DEFAULT NULL,
  `generic_master_id` int DEFAULT NULL,
  `generic_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `cost` decimal(7,2) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47975 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `medicine_type_masters`
--

DROP TABLE IF EXISTS `medicine_type_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicine_type_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `medicine_type_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `icon_img_url` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `effctv_dt` datetime NOT NULL,
  `trmntn_dt` datetime DEFAULT NULL,
  `archived_by_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_medicine_type_masters_on_medicine_type_name` (`medicine_type_name`),
  KEY `index_medicine_type_masters_on_archive` (`archive`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `message_masters`
--

DROP TABLE IF EXISTS `message_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `message` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `activity_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status_master_id` int DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `trmntn_dt` datetime DEFAULT NULL,
  `effctv_dt` datetime DEFAULT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `archived_at` datetime DEFAULT NULL,
  `archived_by_id` int DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_detail_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rails_4e7bfad65a` (`status_master_id`),
  FULLTEXT KEY `index_message_masters_on_message_and_status_master_id` (`message`),
  CONSTRAINT `fk_rails_4e7bfad65a` FOREIGN KEY (`status_master_id`) REFERENCES `status_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=473 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nano_parameter_masters`
--

DROP TABLE IF EXISTS `nano_parameter_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nano_parameter_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `param_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `param_val` int NOT NULL,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `trmntn_dt` datetime DEFAULT NULL,
  `effctv_dt` datetime NOT NULL,
  `archive` tinyint(1) DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `archived_by_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_nano_parameter_masters_on_param_name` (`param_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nanosafe_payments`
--

DROP TABLE IF EXISTS `nanosafe_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nanosafe_payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_master_id` int NOT NULL,
  `paid_date` datetime NOT NULL,
  `nanosafe_amt` float NOT NULL,
  `medication_amt` decimal(7,2) DEFAULT NULL,
  `pharma_bill_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prescription_img` mediumblob,
  `med_bill_img` mediumblob,
  `dgnss_amt` int DEFAULT NULL,
  `refund_reason` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by_id` int NOT NULL,
  `tblt_crtd_by_id` int DEFAULT NULL,
  `tblt_crtd_at` datetime DEFAULT NULL,
  `cmmts` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `patient_package_detail_id` int DEFAULT NULL,
  `renewal_date` datetime DEFAULT NULL,
  `is_approved` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `approved_by_id` int DEFAULT NULL,
  `nano_safe_detail_id` int DEFAULT NULL,
  `additional_test_amt` int DEFAULT NULL,
  `reciept_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pln_ren_date` datetime DEFAULT NULL,
  `proc_updated_at` datetime DEFAULT NULL,
  `payment_gateway_master_id` int NOT NULL,
  `txn_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `recieved_by_id` int DEFAULT NULL,
  `approved_dt` datetime DEFAULT NULL,
  `recieved_dt` datetime DEFAULT NULL,
  `payment_type_master_id` int NOT NULL DEFAULT '4',
  `appointment_tracking_id` int DEFAULT NULL,
  `sale_order_header_id` int DEFAULT NULL,
  `rcpt_img_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `authorization_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `claim_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updates_json` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rails_04fdded1cc` (`patient_master_id`),
  KEY `fk_rails_ad479c0479` (`payment_gateway_master_id`),
  KEY `fk_rails_f1f8be450b` (`payment_type_master_id`),
  KEY `fk_rails_7158b329a5` (`appointment_tracking_id`),
  KEY `fk_rails_44e59e6c8c` (`sale_order_header_id`),
  KEY `fk_rails_1970445c1e` (`patient_package_detail_id`),
  CONSTRAINT `fk_rails_04fdded1cc` FOREIGN KEY (`patient_master_id`) REFERENCES `patient_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_1970445c1e` FOREIGN KEY (`patient_package_detail_id`) REFERENCES `patient_package_details` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_44e59e6c8c` FOREIGN KEY (`sale_order_header_id`) REFERENCES `sale_order_headers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_7158b329a5` FOREIGN KEY (`appointment_tracking_id`) REFERENCES `appointment_trackings` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_ad479c0479` FOREIGN KEY (`payment_gateway_master_id`) REFERENCES `payment_gateway_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_f1f8be450b` FOREIGN KEY (`payment_type_master_id`) REFERENCES `payment_type_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=43529 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oral_cancer_screening_details`
--

DROP TABLE IF EXISTS `oral_cancer_screening_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oral_cancer_screening_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `screening_detail_id` int DEFAULT NULL,
  `patch_in_mouth` tinyint(1) DEFAULT NULL,
  `ulceratn_roughnd` tinyint(1) DEFAULT NULL,
  `dffclty_tolratng_spcy_fds` tinyint(1) DEFAULT NULL,
  `dffclty_openg_mouth` tinyint(1) DEFAULT NULL,
  `dffclty_protrudng_tnge` tinyint(1) DEFAULT NULL,
  `chng_voice` tinyint(1) DEFAULT NULL,
  `excssv_salvatn` tinyint(1) DEFAULT NULL,
  `dffclty_in_chw_swa_spk` tinyint(1) DEFAULT NULL,
  `status_master_id` int DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `rsk_scr` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=873 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_address_details`
--

DROP TABLE IF EXISTS `order_address_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_address_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address_line1` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `address_line2` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `area` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `landmark` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city_master_id` int NOT NULL,
  `pin_code` int NOT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `rfq_corp_master_id` int DEFAULT NULL,
  `corp_master_id` int DEFAULT NULL,
  `lttd` decimal(10,0) DEFAULT NULL,
  `lgtd` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rails_e0904cc4a1` (`city_master_id`),
  CONSTRAINT `fk_rails_e0904cc4a1` FOREIGN KEY (`city_master_id`) REFERENCES `city_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=16327 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_cart_status_masters`
--

DROP TABLE IF EXISTS `order_cart_status_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_cart_status_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cart_status_name` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_order_cart_status_masters_on_cart_status_name` (`cart_status_name`),
  KEY `index_order_cart_status_masters_on_archive` (`archive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `organ_masters`
--

DROP TABLE IF EXISTS `organ_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organ_masters` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `organ_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `organ_icon_img` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ot_assignment_details`
--

DROP TABLE IF EXISTS `ot_assignment_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ot_assignment_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_master_id` int DEFAULT NULL,
  `ot_room_table_master_id` int DEFAULT NULL,
  `in_patient_detail_id` int DEFAULT NULL,
  `operation_start_time` datetime DEFAULT NULL,
  `operation_end_time` datetime DEFAULT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updates_json` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=452 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ot_room_masters`
--

DROP TABLE IF EXISTS `ot_room_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ot_room_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ot_room_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` float DEFAULT NULL,
  `hospital_master_id` int DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ot_room_table_masters`
--

DROP TABLE IF EXISTS `ot_room_table_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ot_room_table_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ot_room_master_id` int DEFAULT NULL,
  `ot_table_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` float DEFAULT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `package_masters`
--

DROP TABLE IF EXISTS `package_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `care_delivery_program_master_id` int DEFAULT NULL,
  `pckg_nm` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `pckg_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `price` float DEFAULT NULL,
  `package_cost` float DEFAULT NULL,
  `is_pkg_detail` tinyint(1) DEFAULT '0',
  `monthly_amnt` int DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `clinic_ids` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fam_mem_increment` int DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `archived_at` datetime DEFAULT NULL,
  `archived_by_id` int DEFAULT NULL,
  `duration_in_days` int DEFAULT NULL,
  `gst_amt` float DEFAULT NULL,
  `total_amt` float DEFAULT NULL,
  `actual_price` float DEFAULT NULL,
  `website_master_id` int DEFAULT NULL,
  `package_group_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `package_group_icon_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `package_image_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `package_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `package_action_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `package_action_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_visible_web` tinyint(1) DEFAULT '0',
  `faqs` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `meta_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `sub_pckg_meta_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `app_img` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `app_bg_color` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `app_visibility` tinyint(1) DEFAULT '0',
  `og_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_ip` int DEFAULT '0',
  `charge_code_master_id` int NOT NULL DEFAULT '211',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `parameter_masters`
--

DROP TABLE IF EXISTS `parameter_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parameter_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parameter_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `parameter_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `column_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `field_type_master_id` int DEFAULT NULL,
  `options` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `parameter_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_parameter_masters_on_field_type_master_id` (`field_type_master_id`),
  CONSTRAINT `fk_rails_17f3e005f0` FOREIGN KEY (`field_type_master_id`) REFERENCES `field_type_masters` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `partner_json_data`
--

DROP TABLE IF EXISTS `partner_json_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partner_json_data` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `care_delivery_program_master_id` int DEFAULT NULL,
  `response_code` int DEFAULT NULL,
  `reference_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `partner_id` int DEFAULT NULL,
  `response_data` text COLLATE utf8_unicode_ci,
  `change_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flag` tinyint(1) DEFAULT NULL,
  `processed_at` datetime DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `partner_json_data_histories`
--

DROP TABLE IF EXISTS `partner_json_data_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partner_json_data_histories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `care_delivery_program_master_id` int NOT NULL,
  `response_code` int DEFAULT NULL,
  `reference_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `partner_id` int DEFAULT NULL,
  `response_data` text COLLATE utf8_unicode_ci,
  `change_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flag` tinyint(1) DEFAULT NULL,
  `processed_at` datetime DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `partner_parameter_masters`
--

DROP TABLE IF EXISTS `partner_parameter_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partner_parameter_masters` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `care_delivery_program_master_id` int NOT NULL,
  `source_table` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `partner_id` int NOT NULL,
  `parameter_master_id` int NOT NULL,
  `parameter_value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `partner_payment_details`
--

DROP TABLE IF EXISTS `partner_payment_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partner_payment_details` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `partner_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `service_master_id` int DEFAULT NULL,
  `partner_invoice_id` int DEFAULT NULL,
  `paid_amount` float DEFAULT NULL,
  `payment_gateway_master_id` int DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patient_care_team_details`
--

DROP TABLE IF EXISTS `patient_care_team_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_care_team_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_master_id` int DEFAULT NULL,
  `provider_role_id` int DEFAULT NULL,
  `provider_id` int DEFAULT NULL,
  `effctv_start_dt` datetime DEFAULT NULL,
  `effctv_end_dt` datetime DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updates_json` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_read_timetoken` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1395 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patient_category_masters`
--

DROP TABLE IF EXISTS `patient_category_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_category_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_actuve` tinyint(1) DEFAULT '0',
  `is_active` tinyint(1) unsigned zerofill NOT NULL DEFAULT '1',
  `trmntn_dt` datetime DEFAULT NULL,
  `effctv_dt` datetime NOT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `archived_at` datetime DEFAULT NULL,
  `archived_by_id` int DEFAULT NULL,
  `updated_by_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_patient_category_masters_on_category_name` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patient_counseling_details`
--

DROP TABLE IF EXISTS `patient_counseling_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_counseling_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ptnt_rgstrtn_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `location_master_id` int NOT NULL,
  `screen_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `time_spent_on` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `duration` int NOT NULL,
  `activity_detail_id` int DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rails_528f97df01` (`location_master_id`),
  CONSTRAINT `fk_rails_528f97df01` FOREIGN KEY (`location_master_id`) REFERENCES `location_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=86697 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patient_device_assignment_details`
--

DROP TABLE IF EXISTS `patient_device_assignment_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_device_assignment_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_master_id` int DEFAULT NULL,
  `device_master_id` int DEFAULT NULL,
  `desc` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updates_json` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patient_diseases`
--

DROP TABLE IF EXISTS `patient_diseases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_diseases` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_master_id` int NOT NULL,
  `disease_master_id` int NOT NULL,
  `patient_prescription_header_id` int DEFAULT NULL,
  `status_master_id` int NOT NULL,
  `screening_detail_id` int DEFAULT NULL,
  `doctor_visit_id` int DEFAULT NULL,
  `nano_safe_detail_id` int DEFAULT NULL,
  `created_by_id` int NOT NULL DEFAULT '31',
  `updated_by_id` int NOT NULL DEFAULT '31',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tblt_crtd_by_id` int DEFAULT NULL,
  `tblt_crtd_at` datetime DEFAULT NULL,
  `proc_updated_at` datetime DEFAULT NULL,
  `icd_cm_code_master_id` int DEFAULT NULL,
  `updates_json` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_patient_diseases_on_patient_master_id` (`patient_master_id`),
  KEY `index_patient_diseases_on_disease_master_id` (`disease_master_id`),
  KEY `index_patient_diseases_on_status_master_id` (`status_master_id`),
  KEY `index_patient_diseases_on_doctor_visit_id` (`doctor_visit_id`),
  KEY `patient_diseases_on_presc_header_id` (`patient_prescription_header_id`),
  CONSTRAINT `fk_rails_11733a720f` FOREIGN KEY (`patient_master_id`) REFERENCES `patient_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_a089016ce3` FOREIGN KEY (`status_master_id`) REFERENCES `status_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_b4caab4357` FOREIGN KEY (`doctor_visit_id`) REFERENCES `doctor_visits` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_fc02fdae40` FOREIGN KEY (`disease_master_id`) REFERENCES `disease_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=11754 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patient_earned_incentive_details`
--

DROP TABLE IF EXISTS `patient_earned_incentive_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_earned_incentive_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_master_id` int DEFAULT NULL,
  `incentive_type_master_id` int DEFAULT NULL,
  `incentive_value` int DEFAULT NULL,
  `service_master_id` int DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `effctv_dt` datetime DEFAULT NULL,
  `trmntn_dt` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updates_json` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patient_engagement_details`
--

DROP TABLE IF EXISTS `patient_engagement_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_engagement_details` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `patient_master_id` bigint DEFAULT NULL,
  `activity_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `activity_id` int DEFAULT NULL,
  `engagement_date_time` datetime DEFAULT NULL,
  `engmnt_method` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `global_status_master_id` tinyint DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `prfrd_followup_date_time` datetime DEFAULT NULL,
  `prfrd_followup_method` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `patient_message_detail_id` int DEFAULT NULL,
  `updates_json` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_patient_engagement_details_on_patient_master_id` (`patient_master_id`),
  KEY `idx_activity_type_activ_id_on_patient_engmendetas` (`activity_type`,`activity_id`),
  KEY `index_patient_engagement_details_on_patient_message_detail_id` (`patient_message_detail_id`),
  CONSTRAINT `fk_rails_4ae3f55ef0` FOREIGN KEY (`patient_message_detail_id`) REFERENCES `patient_message_details` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=185 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patient_family_member_details`
--

DROP TABLE IF EXISTS `patient_family_member_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_family_member_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_master_id` int NOT NULL,
  `family_member_id` int NOT NULL,
  `patient_relationship_master_id` int NOT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` tinyint(1) DEFAULT '0',
  `active_till_date` datetime DEFAULT NULL,
  `updates_json` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1705 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patient_favourite_order_details`
--

DROP TABLE IF EXISTS `patient_favourite_order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_favourite_order_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_master_id` int DEFAULT NULL,
  `service_master_id` int DEFAULT NULL,
  `favourite_provider_id` int DEFAULT NULL,
  `appointment_type_master_id` int DEFAULT NULL,
  `priority` int DEFAULT '1',
  `used_count` int DEFAULT NULL,
  `last_used_dt` datetime DEFAULT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updates_json` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rails_ef37c8cb66` (`patient_master_id`),
  KEY `fk_rails_eefd949647` (`service_master_id`),
  KEY `fk_rails_b92ff22c17` (`appointment_type_master_id`),
  CONSTRAINT `fk_rails_b92ff22c17` FOREIGN KEY (`appointment_type_master_id`) REFERENCES `appointment_type_masters` (`id`),
  CONSTRAINT `fk_rails_eefd949647` FOREIGN KEY (`service_master_id`) REFERENCES `service_masters` (`id`),
  CONSTRAINT `fk_rails_ef37c8cb66` FOREIGN KEY (`patient_master_id`) REFERENCES `patient_masters` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=350 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patient_feedback_details`
--

DROP TABLE IF EXISTS `patient_feedback_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_feedback_details` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `patient_master_id` int DEFAULT NULL,
  `appointment_tracking_id` int DEFAULT NULL,
  `interaction_count` int DEFAULT NULL,
  `questnr_master_id` int DEFAULT NULL,
  `result_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_rails_a022f1c515` (`patient_master_id`),
  KEY `fk_rails_293bc5350e` (`questnr_master_id`),
  KEY `fk_rails_7139647ae8` (`appointment_tracking_id`),
  CONSTRAINT `fk_rails_293bc5350e` FOREIGN KEY (`questnr_master_id`) REFERENCES `questnr_masters` (`id`),
  CONSTRAINT `fk_rails_7139647ae8` FOREIGN KEY (`appointment_tracking_id`) REFERENCES `appointment_trackings` (`id`),
  CONSTRAINT `fk_rails_a022f1c515` FOREIGN KEY (`patient_master_id`) REFERENCES `patient_masters` (`id`),
  CONSTRAINT `fk_rails_d3855b65a9` FOREIGN KEY (`appointment_tracking_id`) REFERENCES `appointment_trackings` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patient_group_or_event_mapping_details`
--

DROP TABLE IF EXISTS `patient_group_or_event_mapping_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_group_or_event_mapping_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_master_id` int DEFAULT NULL,
  `group_master_id` int DEFAULT NULL,
  `corporate_event_master_id` int DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `employee_master_id` int DEFAULT NULL,
  `updates_json` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1102 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patient_identity_type_masters`
--

DROP TABLE IF EXISTS `patient_identity_type_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_identity_type_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_master_id` int DEFAULT NULL,
  `identity_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `identity_no` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `identity_img` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updates_json` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patient_labresult_headers`
--

DROP TABLE IF EXISTS `patient_labresult_headers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_labresult_headers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `test_date` datetime DEFAULT NULL,
  `diagnostic_lab_master_id` int DEFAULT NULL,
  `patient_master_id` int NOT NULL,
  `location_master_id` int DEFAULT NULL,
  `diagnostic_test_master_id` int DEFAULT NULL,
  `bar_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `labresult_image_detail_id` int DEFAULT NULL,
  `cmmts` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `digitalized` tinyint(1) DEFAULT '0',
  `digitalized_by` int DEFAULT NULL,
  `digitalized_at` datetime DEFAULT NULL,
  `is_approved` tinyint(1) DEFAULT '0',
  `approved_by` int DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `archive` tinyint(1) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `smpl_clctd_at` datetime DEFAULT NULL,
  `smpl_clctd_by_id` int DEFAULT NULL,
  `woe_at` datetime DEFAULT NULL,
  `woe_by` int DEFAULT NULL,
  `thyrocare_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `delivered_at` datetime DEFAULT NULL,
  `delivered_by_id` int DEFAULT NULL,
  `rprt_rcvd_at` datetime DEFAULT NULL,
  `rprt_rcvd_by_id` int DEFAULT NULL,
  `appointment_tracking_id` int DEFAULT NULL,
  `doctor_visit_id` int DEFAULT NULL,
  `upload_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `tblt_crtd_by_id` int DEFAULT NULL,
  `tblt_crtd_at` datetime DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `reffered_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `delivery_charges` float DEFAULT NULL,
  `interaction_count` int DEFAULT NULL,
  `visibility` int DEFAULT '0',
  `updates_json` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_patient_labresult_headers_on_diagnostic_lab_master_id` (`diagnostic_lab_master_id`),
  KEY `index_patient_labresult_headers_on_patient_master_id` (`patient_master_id`),
  KEY `index_patient_labresult_headers_on_labresult_image_detail_id` (`labresult_image_detail_id`),
  KEY `index_patient_labresult_headers_on_digitalized` (`digitalized`),
  KEY `index_patient_labresult_headers_on_is_approved` (`is_approved`),
  KEY `index_patient_labresult_headers_on_archive` (`archive`),
  KEY `fk_rails_ea692e681a` (`location_master_id`),
  KEY `fk_rails_c75d814f76` (`diagnostic_test_master_id`),
  KEY `fk_rails_eaManish_idx` (`doctor_visit_id`),
  CONSTRAINT `fk_rails_4d217c2d38` FOREIGN KEY (`patient_master_id`) REFERENCES `patient_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_c75d814f76` FOREIGN KEY (`diagnostic_test_master_id`) REFERENCES `diagnostic_test_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_d4d9de601c` FOREIGN KEY (`diagnostic_lab_master_id`) REFERENCES `diagnostic_lab_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_ea692e681a` FOREIGN KEY (`location_master_id`) REFERENCES `location_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=13428 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patient_labresult_line_values`
--

DROP TABLE IF EXISTS `patient_labresult_line_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_labresult_line_values` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_labresult_line_id` int NOT NULL,
  `diagnostic_test_master_id` int DEFAULT NULL,
  `test_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `result_value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rsk_scr` int DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ideal_range` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `units` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `technology` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rails_71a0b5c634` (`patient_labresult_line_id`),
  KEY `fk_rails_fc6c272bba` (`diagnostic_test_master_id`),
  CONSTRAINT `fk_rails_71a0b5c634` FOREIGN KEY (`patient_labresult_line_id`) REFERENCES `patient_labresult_lines` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_fc6c272bba` FOREIGN KEY (`diagnostic_test_master_id`) REFERENCES `diagnostic_test_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=89835 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patient_labresult_lines`
--

DROP TABLE IF EXISTS `patient_labresult_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_labresult_lines` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_labresult_header_id` int NOT NULL,
  `patient_master_id` int NOT NULL,
  `diagnostic_test_master_id` int NOT NULL,
  `diagnostic_lab_master_id` int DEFAULT NULL,
  `test_date` datetime DEFAULT NULL,
  `performed_doctor_id` int DEFAULT NULL,
  `barcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `diagnostic_test_child_id` int DEFAULT NULL,
  `result_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `smpl_clctd_at` datetime DEFAULT NULL,
  `smpl_clctd_by_id` int DEFAULT NULL,
  `delivered_at` datetime DEFAULT NULL,
  `delivered_by_id` int DEFAULT NULL,
  `rprt_rcvd_at` datetime DEFAULT NULL,
  `rprt_rcvd_by_id` int DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `updates_json` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_patient_labresult_lines_on_patient_labresult_header_id` (`patient_labresult_header_id`),
  KEY `index_patient_labresult_lines_on_patient_master_id` (`patient_master_id`),
  KEY `index_patient_labresult_lines_on_diagnostic_test_master_id` (`diagnostic_test_master_id`),
  KEY `index_patient_labresult_lines_on_diagnostic_test_child_id` (`diagnostic_test_child_id`),
  KEY `fk_rails_79ebbf87b3` (`diagnostic_lab_master_id`),
  CONSTRAINT `fk_constraint18` FOREIGN KEY (`diagnostic_test_child_id`) REFERENCES `diagnostic_test_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_51589a55e0` FOREIGN KEY (`patient_labresult_header_id`) REFERENCES `patient_labresult_headers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_747b3f1dec` FOREIGN KEY (`patient_master_id`) REFERENCES `patient_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_79ebbf87b3` FOREIGN KEY (`diagnostic_lab_master_id`) REFERENCES `diagnostic_lab_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_815e5ef3c9` FOREIGN KEY (`diagnostic_test_master_id`) REFERENCES `diagnostic_test_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=53999 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patient_life_style_change_details`
--

DROP TABLE IF EXISTS `patient_life_style_change_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_life_style_change_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `doctor_visit_id` int DEFAULT NULL,
  `doctor_favourite_prescription_id` int DEFAULT NULL,
  `patient_master_id` int DEFAULT NULL,
  `patient_prescription_header_id` int DEFAULT NULL,
  `lifestyle_desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_from_favourite` tinyint(1) DEFAULT '0',
  `updates_json` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dietician_favourite_prescription_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10939 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patient_linked_devise_details`
--

DROP TABLE IF EXISTS `patient_linked_devise_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_linked_devise_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_master_id` int NOT NULL,
  `mobile_unique_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `source_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `effctv_start_date` datetime NOT NULL,
  `effctv_end_date` datetime DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_synced_time` datetime DEFAULT NULL,
  `updates_json` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=524 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patient_master_publics`
--

DROP TABLE IF EXISTS `patient_master_publics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_master_publics` (
  `id` int NOT NULL AUTO_INCREMENT,
  `frst_nm` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lst_nm` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gndr` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nmbr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fthr_or_spuse_nm` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prf_of_idntty` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `smoking` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bld_grp` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cmmts` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `form_master_id` int DEFAULT NULL,
  `country_master_id` int DEFAULT NULL,
  `profession` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dob` datetime DEFAULT NULL,
  `hght_ft` float DEFAULT NULL,
  `hght_in` float DEFAULT NULL,
  `location_program_maping_master_id` int DEFAULT NULL,
  `address_detail_id` int DEFAULT NULL,
  `patient_master_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patient_master_trackings`
--

DROP TABLE IF EXISTS `patient_master_trackings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_master_trackings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_master_id` int DEFAULT NULL,
  `track_date` datetime DEFAULT NULL,
  `lttd` decimal(10,7) DEFAULT NULL,
  `lgtd` decimal(10,7) DEFAULT NULL,
  `device_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `device_mac_id` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `captured_time` datetime DEFAULT NULL,
  `signal_strength` float DEFAULT NULL,
  `location_adpter_status` tinyint(1) DEFAULT NULL,
  `location_permission_status` tinyint DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updates_json` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=323589 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patient_masters`
--

DROP TABLE IF EXISTS `patient_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ptnt_rgstrtn_id` varchar(21) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'SC-',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `frst_nm` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `mdl_nm` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lst_nm` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `suffix` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dsply_nm` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dob` date NOT NULL,
  `dob_verified` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gndr` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `addrss` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location_master_id` int DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phn_nmbr_typ` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nmbr` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fthr_or_spuse_nm` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `poi_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prf_of_idntty` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hght_ft` smallint DEFAULT NULL,
  `hght_in` smallint DEFAULT NULL,
  `ethnicity` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_dbts` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_hyptn` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_lpd` tinyint(1) DEFAULT NULL,
  `is_thh` tinyint(1) DEFAULT NULL,
  `other_diseases` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `on_mdctn` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `on_mdctn_htn` tinyint(1) DEFAULT NULL,
  `on_mdctn_db` tinyint(1) DEFAULT NULL,
  `on_mdctn_lpd` tinyint(1) DEFAULT NULL,
  `on_mdctn_thh` tinyint(1) DEFAULT NULL,
  `on_mdctn_other` tinyint(1) DEFAULT NULL,
  `hrt_attck` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `smoking` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dbts_fam` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hyptn_fam` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bld_grp` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `bld_grp_rh_fctr` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nsf_join_dt` datetime DEFAULT NULL,
  `nsf_enrlld` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `trmntn_dt` datetime DEFAULT NULL,
  `disease` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `program_master_id` int NOT NULL,
  `status_master_id` int NOT NULL,
  `clinical_status_master_id` int DEFAULT NULL,
  `cmmts` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `reference` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `health_card_no` int DEFAULT NULL,
  `renewal_group_id` int DEFAULT NULL,
  `package_master_id` int DEFAULT NULL,
  `next_test_date` datetime DEFAULT NULL,
  `tblt_crtd_by_id` int DEFAULT NULL,
  `tblt_crtd_at` datetime DEFAULT NULL,
  `proc_updated_at` datetime DEFAULT NULL,
  `total_amount_paid` int DEFAULT NULL,
  `renewal_date` datetime DEFAULT NULL,
  `net_due_amt` int DEFAULT NULL,
  `patient_package_detail_id` int DEFAULT NULL,
  `fam_head` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extra_test_due` int DEFAULT NULL,
  `lttd` decimal(9,6) DEFAULT NULL,
  `lgtd` decimal(9,6) DEFAULT NULL,
  `prof_image_detail_id` int DEFAULT NULL,
  `poi_image_detail_id` int DEFAULT NULL,
  `alchl` int DEFAULT '0',
  `health_rsk_scr` bigint DEFAULT NULL,
  `location_program_maping_master_id` int NOT NULL,
  `archive` tinyint(1) DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `archived_by_id` int DEFAULT NULL,
  `is_active` int DEFAULT '1',
  `effctv_dt` datetime DEFAULT NULL,
  `other_diseases_bool` tinyint(1) DEFAULT NULL,
  `country_master_id` int DEFAULT NULL,
  `allergies` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `profession` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `interaction_count` int DEFAULT '0',
  `is_patient` tinyint(1) DEFAULT '1',
  `geo_flag` tinyint(1) DEFAULT '0',
  `in_patient_flag` tinyint(1) DEFAULT '1',
  `vital_question_ids` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `screening_camp_master_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_patient_masters_on_ptnt_rgstrtn_id` (`ptnt_rgstrtn_id`),
  KEY `index_patient_masters_on_frst_nm` (`frst_nm`),
  KEY `index_patient_masters_on_location_master_id` (`location_master_id`),
  KEY `index_patient_masters_on_phn_nmbr_typ` (`phn_nmbr_typ`),
  KEY `index_patient_masters_on_program_master_id` (`program_master_id`),
  KEY `index_patient_masters_on_status_master_id` (`status_master_id`),
  KEY `index_patient_masters_on_created_by_id` (`created_by_id`),
  KEY `index_patient_masters_on_updated_by_id` (`updated_by_id`),
  KEY `fk_rails_f882395df0` (`clinical_status_master_id`),
  KEY `fk_rails_b7a6dcc91b` (`renewal_group_id`),
  KEY `fk_rails_0b3ae82dcf` (`package_master_id`),
  KEY `fk_rails_c43cadfb7d` (`location_program_maping_master_id`),
  CONSTRAINT `fk_rails_0b3ae82dcf` FOREIGN KEY (`package_master_id`) REFERENCES `package_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_1f189e78ed` FOREIGN KEY (`location_master_id`) REFERENCES `location_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_4358764f08` FOREIGN KEY (`program_master_id`) REFERENCES `program_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_b7a6dcc91b` FOREIGN KEY (`renewal_group_id`) REFERENCES `renewal_groups` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_c43cadfb7d` FOREIGN KEY (`location_program_maping_master_id`) REFERENCES `location_program_maping_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_f2e0f35f10` FOREIGN KEY (`status_master_id`) REFERENCES `status_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_f882395df0` FOREIGN KEY (`clinical_status_master_id`) REFERENCES `status_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=140101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patient_message_details`
--

DROP TABLE IF EXISTS `patient_message_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_message_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_master_id` int DEFAULT NULL,
  `message_master_id` int DEFAULT NULL,
  `sent_via` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sent_by_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `updates_json` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1070 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patient_messages`
--

DROP TABLE IF EXISTS `patient_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_master_id` int NOT NULL,
  `location_master_id` int NOT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `visit_date` datetime DEFAULT NULL,
  `lttd` decimal(10,7) DEFAULT NULL,
  `lgtd` decimal(10,7) DEFAULT NULL,
  `tablet_master_id` int DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tblt_crtd_by_id` int DEFAULT NULL,
  `tblt_crtd_at` datetime DEFAULT NULL,
  `proc_updated_at` datetime DEFAULT NULL,
  `status_master_id` int DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `updated_by_id` int NOT NULL,
  `doctor_master_id` int DEFAULT NULL,
  `viewable_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `updates_json` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dietician_master_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rails_187b549e4d` (`patient_master_id`),
  KEY `fk_rails_7598aa8188` (`location_master_id`),
  KEY `fk_rails_3ddc8d8f95` (`tablet_master_id`),
  KEY `fk_rails_cb636a854b` (`status_master_id`),
  CONSTRAINT `fk_rails_187b549e4d` FOREIGN KEY (`patient_master_id`) REFERENCES `patient_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_3ddc8d8f95` FOREIGN KEY (`tablet_master_id`) REFERENCES `tablet_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_7598aa8188` FOREIGN KEY (`location_master_id`) REFERENCES `location_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_cb636a854b` FOREIGN KEY (`status_master_id`) REFERENCES `status_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=37591 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patient_monthly_score_details`
--

DROP TABLE IF EXISTS `patient_monthly_score_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_monthly_score_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_master_id` int NOT NULL,
  `disease_master_id` int NOT NULL,
  `mnth_cnt` int NOT NULL,
  `mnth_avg_score` decimal(10,7) NOT NULL,
  `score_dt` datetime NOT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `updates_json` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rails_ad76639a05` (`patient_master_id`),
  KEY `fk_rails_6eab7479d6` (`disease_master_id`),
  CONSTRAINT `fk_rails_6eab7479d6` FOREIGN KEY (`disease_master_id`) REFERENCES `disease_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_ad76639a05` FOREIGN KEY (`patient_master_id`) REFERENCES `patient_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=71694 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patient_package_assigned_lines`
--

DROP TABLE IF EXISTS `patient_package_assigned_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_package_assigned_lines` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_package_assignment_detail_id` int DEFAULT NULL,
  `service_master_id` int DEFAULT NULL,
  `activity_detail_id` int DEFAULT NULL,
  `where_recommendation_id` int DEFAULT NULL,
  `whose_resp_role_id` int DEFAULT NULL,
  `schedule_date_time` datetime DEFAULT NULL,
  `actual_date_time` datetime DEFAULT NULL,
  `status` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cmmts` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `appointment_tracking_id` int DEFAULT NULL,
  `interaction_count` int DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=530553 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patient_package_assignment_details`
--

DROP TABLE IF EXISTS `patient_package_assignment_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_package_assignment_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `package_master_id` int DEFAULT NULL,
  `patient_master_id` int DEFAULT NULL,
  `selection_date` datetime DEFAULT NULL,
  `sale_order_header_id` int DEFAULT NULL,
  `status` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `pkg_end_dt` datetime DEFAULT NULL,
  `updates_json` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1623 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patient_package_details`
--

DROP TABLE IF EXISTS `patient_package_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_package_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `package_master_id` int NOT NULL,
  `service_master_id` int DEFAULT NULL,
  `service_item_id` int DEFAULT NULL,
  `appointment_type_master_id` int DEFAULT NULL,
  `responsible_role_id` int DEFAULT NULL,
  `pkg_line_desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time_cycle` int DEFAULT NULL,
  `time_cycle_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gap_duration` int NOT NULL DEFAULT '1',
  `service_time` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `service_cost` float DEFAULT NULL,
  `min_pay` float DEFAULT NULL,
  `count` int DEFAULT NULL,
  `patient_master_id` int DEFAULT NULL,
  `location_master_id` int DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fam_mem_cnt` int DEFAULT NULL,
  `mnth_cnt` int DEFAULT NULL,
  `mnth_amt` int DEFAULT NULL,
  `pckg_amt` int DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `package_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tblt_crtd_by_id` int DEFAULT NULL,
  `tblt_crtd_at` datetime DEFAULT NULL,
  `proc_updated_at` datetime DEFAULT NULL,
  `aprx_next_date` datetime DEFAULT NULL,
  `gst_amt` float DEFAULT NULL,
  `updates_json` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rails_4bf3da0cb2` (`package_master_id`),
  KEY `fk_rails_6ad61500ab` (`patient_master_id`),
  KEY `fk_rails_2e09be93f2` (`location_master_id`),
  CONSTRAINT `fk_rails_2e09be93f2` FOREIGN KEY (`location_master_id`) REFERENCES `location_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_4bf3da0cb2` FOREIGN KEY (`package_master_id`) REFERENCES `package_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_6ad61500ab` FOREIGN KEY (`patient_master_id`) REFERENCES `patient_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=29800167 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patient_package_utilization_details`
--

DROP TABLE IF EXISTS `patient_package_utilization_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_package_utilization_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_package_detail_id` int DEFAULT NULL,
  `patient_master_id` int DEFAULT NULL,
  `appointment_tracking_id` int DEFAULT NULL,
  `status` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updates_json` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patient_parameter_details`
--

DROP TABLE IF EXISTS `patient_parameter_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_parameter_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_master_id` int DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `expiry_date` datetime DEFAULT NULL,
  `file_location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updates_json` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parameter_master_id` int DEFAULT NULL,
  `parameter_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_patient_parameter_details_on_parameter_master_id` (`parameter_master_id`),
  CONSTRAINT `fk_rails_1e04ff05eb` FOREIGN KEY (`parameter_master_id`) REFERENCES `parameter_masters` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=611 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patient_preference_details`
--

DROP TABLE IF EXISTS `patient_preference_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_preference_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_master_id` int NOT NULL,
  `preference_master_id` int NOT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updates_json` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1637 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patient_prescription_headers`
--

DROP TABLE IF EXISTS `patient_prescription_headers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_prescription_headers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `activity_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider_id` int DEFAULT NULL,
  `patient_master_id` int DEFAULT NULL,
  `in_patient_detail_id` int DEFAULT NULL,
  `location_master_id` int DEFAULT NULL,
  `visit_date` datetime DEFAULT NULL,
  `visit_type` int DEFAULT NULL,
  `next_visit_dt` datetime DEFAULT NULL,
  `symptoms` text COLLATE utf8_unicode_ci,
  `emergency_care` tinyint(1) DEFAULT NULL,
  `next_visit_mode` tinyint(1) DEFAULT NULL,
  `diagnosis` text COLLATE utf8_unicode_ci,
  `recommended_labs` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `packages_or_surgeries` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `presc_image_detail_id` int DEFAULT NULL,
  `status_master_id` int DEFAULT NULL,
  `clinical_status_master_id` int DEFAULT NULL,
  `digitalized` tinyint(1) DEFAULT '0',
  `digitalized_by` int DEFAULT NULL,
  `digitalized_at` datetime DEFAULT NULL,
  `is_approved` tinyint(1) DEFAULT '0',
  `approved_by` int DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `cmmts` text COLLATE utf8_unicode_ci,
  `dummy1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy2` int DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `archive` tinyint(1) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tblt_crtd_by_id` int DEFAULT NULL,
  `tblt_crtd_at` datetime DEFAULT NULL,
  `updated_by_id` int NOT NULL,
  `lttd` float DEFAULT NULL,
  `lgtd` float DEFAULT NULL,
  `patient_labresult_header_id` int DEFAULT NULL,
  `appointment_tracking_id` int DEFAULT NULL,
  `referral_hospital_id` int DEFAULT NULL,
  `referral_doctor_id` int DEFAULT NULL,
  `referral_reason` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ref_doctor_specialisation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `visited_public` tinyint(1) DEFAULT NULL,
  `referred_public` tinyint(1) DEFAULT NULL,
  `interaction_count` int DEFAULT NULL,
  `is_draft` tinyint(1) DEFAULT '0',
  `accompanied_with` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `health_history` text COLLATE utf8_unicode_ci,
  `langauge_preference_id` int DEFAULT NULL,
  `updates_json` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comorbidity` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provisional_diagnosis` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `course_or_treatment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `condition_on_discharge` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `advice_on_discharge` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_patient_prescription_headers_on_digitalized` (`digitalized`),
  KEY `index_patient_prescription_headers_on_is_approved` (`is_approved`),
  KEY `index_patient_prescription_headers_on_archive` (`archive`),
  KEY `fk_rails_cf995b54a3` (`location_master_id`),
  CONSTRAINT `fk_rails_cf995b54a3` FOREIGN KEY (`location_master_id`) REFERENCES `location_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=9163 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patient_prescription_lines`
--

DROP TABLE IF EXISTS `patient_prescription_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_prescription_lines` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_prescription_header_id` int NOT NULL,
  `brand_master_id` int DEFAULT NULL,
  `mrng` decimal(5,2) DEFAULT NULL,
  `aftn` decimal(5,2) DEFAULT NULL,
  `evng` decimal(5,2) DEFAULT NULL,
  `nyt` decimal(5,2) DEFAULT NULL,
  `route` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `med_time` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `end_duration` int DEFAULT NULL,
  `end_duration_type` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `total_price` int DEFAULT NULL,
  `dummy1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy2` int DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `archive` tinyint(1) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `note` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `brand_descript` text COLLATE utf8_unicode_ci,
  `frequency` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rails_30f4e4329f` (`patient_prescription_header_id`),
  KEY `fk_rails_cdf89e4490` (`brand_master_id`),
  CONSTRAINT `fk_rails_30f4e4329f` FOREIGN KEY (`patient_prescription_header_id`) REFERENCES `patient_prescription_headers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_cdf89e4490` FOREIGN KEY (`brand_master_id`) REFERENCES `brand_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=20136 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patient_promo_code_tracking_details`
--

DROP TABLE IF EXISTS `patient_promo_code_tracking_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_promo_code_tracking_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `applied_date` datetime DEFAULT NULL,
  `patient_master_id` int DEFAULT NULL,
  `promo_code_master_id` int DEFAULT NULL,
  `service_master_id` int DEFAULT NULL,
  `sale_order_header_id` int DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updates_json` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `archived_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rails_c85630dce5` (`patient_master_id`),
  KEY `fk_rails_f7ad0c14c4` (`promo_code_master_id`),
  KEY `fk_rails_73e52c9eea` (`service_master_id`),
  KEY `fk_rails_c22a905129` (`sale_order_header_id`),
  CONSTRAINT `fk_rails_73e52c9eea` FOREIGN KEY (`service_master_id`) REFERENCES `service_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_c22a905129` FOREIGN KEY (`sale_order_header_id`) REFERENCES `sale_order_headers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_c85630dce5` FOREIGN KEY (`patient_master_id`) REFERENCES `patient_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_f7ad0c14c4` FOREIGN KEY (`promo_code_master_id`) REFERENCES `promo_code_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=1736 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patient_questnr_value_detail_publics`
--

DROP TABLE IF EXISTS `patient_questnr_value_detail_publics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_questnr_value_detail_publics` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_master_public_id` int DEFAULT NULL,
  `questnr_master_id` int DEFAULT NULL,
  `result_value` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `risk_score` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `activity_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4408 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patient_questnr_value_details`
--

DROP TABLE IF EXISTS `patient_questnr_value_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_questnr_value_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `activity_date` datetime DEFAULT NULL,
  `patient_master_id` int DEFAULT NULL,
  `questnr_master_id` int DEFAULT NULL,
  `table_column_questnr_id` int DEFAULT NULL,
  `result_value` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `risk_score` int DEFAULT NULL,
  `interaction_count` int DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `proc_updated_at` datetime DEFAULT NULL,
  `appointment_tracking_id` int DEFAULT NULL,
  `updates_json` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_patient_questnr_value_details_on_patient_master_id` (`patient_master_id`),
  KEY `index_patient_questnr_value_details_on_questnr_master_id` (`questnr_master_id`),
  KEY `index_patient_questnr_value_details_on_interaction_count` (`interaction_count`)
) ENGINE=InnoDB AUTO_INCREMENT=5517022 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patient_rating_details`
--

DROP TABLE IF EXISTS `patient_rating_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_rating_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_master_id` int DEFAULT NULL,
  `rating_master_id` int DEFAULT NULL,
  `comments` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_role_id` int DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updates_json` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patient_relationship_masters`
--

DROP TABLE IF EXISTS `patient_relationship_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_relationship_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `relation_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gndr` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `crspndng_reltnshp_id` int DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `effctv_dt` datetime NOT NULL,
  `trmntn_dt` datetime DEFAULT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patient_room_assigned_details`
--

DROP TABLE IF EXISTS `patient_room_assigned_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_room_assigned_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_master_id` int DEFAULT NULL,
  `clinic_room_bed_master_id` int DEFAULT NULL,
  `admission_dt` datetime DEFAULT NULL,
  `discharge_dt` datetime DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `in_patient_detail_id` int DEFAULT NULL,
  `updates_json` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `patient_transfer_detail_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=733 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patient_status_details`
--

DROP TABLE IF EXISTS `patient_status_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_status_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_master_id` int NOT NULL,
  `location_master_id` int DEFAULT NULL,
  `status_master_id` int DEFAULT NULL,
  `clinical_status_master_id` int DEFAULT NULL,
  `activity_detail_id` int DEFAULT NULL,
  `status_change_date` datetime NOT NULL,
  `cmmts` text COLLATE utf8_unicode_ci,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by_id` int NOT NULL DEFAULT '31',
  `updated_by_id` int NOT NULL DEFAULT '31',
  `tblt_crtd_by_id` int DEFAULT NULL,
  `tblt_crtd_at` datetime DEFAULT NULL,
  `proc_updated_at` datetime DEFAULT NULL,
  `health_card_no` int DEFAULT NULL,
  `renewal_group_id` int DEFAULT NULL,
  `package_master_id` int DEFAULT NULL,
  `joining_fee` int DEFAULT NULL,
  `change_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `screen_no` int DEFAULT NULL,
  `interaction_count` int DEFAULT NULL,
  `updates_json` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_draft` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_patient_status_details_on_status_master_id` (`status_master_id`),
  KEY `index_patient_status_details_on_patient_master_id` (`patient_master_id`),
  KEY `index_patient_status_details_on_change_type` (`change_type`),
  KEY `index_patient_status_details_on_screen_no` (`screen_no`),
  KEY `fk_rails_58c5449e00` (`renewal_group_id`),
  KEY `fk_rails_51f16d0ebd` (`package_master_id`),
  KEY `fk_rails_918eb62099` (`location_master_id`),
  CONSTRAINT `fk_rails_395caea1e4` FOREIGN KEY (`status_master_id`) REFERENCES `status_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_51f16d0ebd` FOREIGN KEY (`package_master_id`) REFERENCES `package_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_58c5449e00` FOREIGN KEY (`renewal_group_id`) REFERENCES `renewal_groups` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_918eb62099` FOREIGN KEY (`location_master_id`) REFERENCES `location_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_f1a47e7d6c` FOREIGN KEY (`patient_master_id`) REFERENCES `patient_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=205519 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patient_template_details`
--

DROP TABLE IF EXISTS `patient_template_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_template_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `template_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `service_master_id` int DEFAULT NULL,
  `patient_master_id` int DEFAULT NULL,
  `appointment_tracking_id` int DEFAULT NULL,
  `template_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template_content` text COLLATE utf8_unicode_ci,
  `commts` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updates_json` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patient_test_recommendation_detail_publics`
--

DROP TABLE IF EXISTS `patient_test_recommendation_detail_publics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_test_recommendation_detail_publics` (
  `id` int NOT NULL AUTO_INCREMENT,
  `recommendation_type_master_id` int DEFAULT NULL,
  `service_master_id` int DEFAULT NULL,
  `activity_detail_id` int DEFAULT NULL,
  `where_recommendation_id` int DEFAULT NULL,
  `whose_resp_role_id` int DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source_info` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_patient` tinyint(1) DEFAULT NULL,
  `logic_ids` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `patient_master_public_id` int DEFAULT NULL,
  `risk_score` int DEFAULT '0',
  `risk_description` varchar(1000) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=354 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patient_test_recommendation_details`
--

DROP TABLE IF EXISTS `patient_test_recommendation_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_test_recommendation_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `recommendation_type_master_id` int DEFAULT NULL,
  `diagnostic_test_master_id` int DEFAULT NULL,
  `patient_master_id` int DEFAULT NULL,
  `service_master_id` int DEFAULT NULL,
  `activity_detail_id` int DEFAULT NULL,
  `lvl2_source_table` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lvl2_activity_detail_id` int DEFAULT NULL,
  `where_recommendation_id` int DEFAULT NULL,
  `whose_resp_role_id` int DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `status` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_visible` tinyint(1) DEFAULT '1',
  `source_info` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_patient` tinyint(1) DEFAULT '1',
  `logic_ids` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `repeat_scr` int NOT NULL DEFAULT '0',
  `appointment_tracking_id` int DEFAULT NULL,
  `activity_code` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `activity_id` int DEFAULT NULL,
  `cmmnt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `schedule_type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `schedule_start_date` datetime DEFAULT NULL,
  `schedule_end_date` datetime DEFAULT NULL,
  `risk_score` int DEFAULT NULL,
  `risk_description` varchar(1000) CHARACTER SET utf8 DEFAULT NULL,
  `updates_json` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rails_88802d5cd9` (`patient_master_id`),
  KEY `fk_rails_ce85c1efb2` (`appointment_tracking_id`),
  CONSTRAINT `fk_rails_88802d5cd9` FOREIGN KEY (`patient_master_id`) REFERENCES `patient_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_ce85c1efb2` FOREIGN KEY (`appointment_tracking_id`) REFERENCES `appointment_trackings` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=57850 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patient_transfer_details`
--

DROP TABLE IF EXISTS `patient_transfer_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_transfer_details` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `patient_master_id` int DEFAULT NULL,
  `transfer_detail_id` int DEFAULT NULL,
  `transfer_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `from_id` int DEFAULT NULL,
  `to_id` int DEFAULT NULL,
  `transfer_date` datetime DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `initiated_by_id` int DEFAULT NULL,
  `transferred_completed_by_id` int DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=208 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patient_wawas_earned_details`
--

DROP TABLE IF EXISTS `patient_wawas_earned_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_wawas_earned_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_master_id` int NOT NULL,
  `earned_date` datetime NOT NULL,
  `wawas_earned` decimal(12,2) NOT NULL,
  `earned_from` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT 'Wellness',
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updates_json` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7586 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patient_wellness_value_details`
--

DROP TABLE IF EXISTS `patient_wellness_value_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_wellness_value_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_master_id` int NOT NULL,
  `wellness_data_type_master_id` int NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `value_type_master_id` int DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `patient_linked_devise_detail_id` int DEFAULT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updates_json` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=978119 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payment_gateway_masters`
--

DROP TABLE IF EXISTS `payment_gateway_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_gateway_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `txn_id_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `txn_id_min_length` int DEFAULT NULL,
  `txn_id_max_length` int DEFAULT NULL,
  `dummy1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy2` int DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `effctv_dt` datetime NOT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `trmntn_dt` datetime DEFAULT NULL,
  `payment_icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_preferred` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_payment_gateway_masters_on_provider_name` (`provider_name`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payment_provider_masters`
--

DROP TABLE IF EXISTS `payment_provider_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_provider_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `txn_id_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `txn_id_min_length` int DEFAULT NULL,
  `txn_id_max_length` int DEFAULT NULL,
  `dummy1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy2` int DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_payment_provider_masters_on_provider_name` (`provider_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payment_type_masters`
--

DROP TABLE IF EXISTS `payment_type_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_type_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `payment_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `effctv_dt` datetime DEFAULT NULL,
  `trmntn_dt` datetime DEFAULT NULL,
  `archive` tinyint(1) DEFAULT NULL,
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_payment_type_masters_on_payment_type` (`payment_type`),
  UNIQUE KEY `index_payment_type_masters_on_payment_name` (`payment_name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `people`
--

DROP TABLE IF EXISTS `people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `people` (
  `id` int NOT NULL DEFAULT '0',
  `NAME` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `occupation` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `age` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `personalized_feeds`
--

DROP TABLE IF EXISTS `personalized_feeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personalized_feeds` (
  `id` int NOT NULL AUTO_INCREMENT,
  `feed_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `feed_desc` text COLLATE utf8_unicode_ci,
  `image_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `disease_master_id` int DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rails_c4deb72f01` (`disease_master_id`),
  CONSTRAINT `fk_rails_c4deb72f01` FOREIGN KEY (`disease_master_id`) REFERENCES `disease_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pharmacy_goods_received_details`
--

DROP TABLE IF EXISTS `pharmacy_goods_received_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pharmacy_goods_received_details` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `po_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gr_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pharmacy_master_id` int DEFAULT NULL,
  `supplier_pharmacy_master_id` int DEFAULT NULL,
  `pharmacy_purhase_order_detail_id` int DEFAULT NULL,
  `pharmacy_invoice_detail_id` int DEFAULT NULL,
  `pharmacy_purchase_header_id` int DEFAULT NULL,
  `brand_master_id` int DEFAULT NULL,
  `batch` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiry_dt` datetime DEFAULT NULL,
  `purchase_qty` int DEFAULT NULL,
  `purchase_unit_price` float DEFAULT NULL,
  `sale_unit_price` float DEFAULT NULL,
  `sale_discount_percent` float DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `gst_rate` float DEFAULT NULL,
  `tax` float DEFAULT NULL,
  `sgst` float DEFAULT NULL,
  `cgst` float DEFAULT NULL,
  `igst` float DEFAULT NULL,
  `purchase_discount` float DEFAULT NULL,
  `total_price` float DEFAULT NULL,
  `hsncode` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mrp` float DEFAULT NULL,
  `free_itm_cnt` int DEFAULT '0',
  `category` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `purchase_pck_qty` int DEFAULT NULL,
  `purchase_pck_cost` float DEFAULT NULL,
  `pck_mrp` float DEFAULT NULL,
  `qty_per_pck` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `received_dt` datetime DEFAULT NULL,
  `with_invoice` tinyint(1) DEFAULT '0',
  `invoice_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gr_doc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invoice_img_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `additional_discount` float DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=620 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pharmacy_inventory_details`
--

DROP TABLE IF EXISTS `pharmacy_inventory_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pharmacy_inventory_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pharmacy_master_id` int DEFAULT NULL,
  `invoice_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `brand_master_id` int DEFAULT NULL,
  `batch` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiry_dt` datetime DEFAULT NULL,
  `remaining_qty` int DEFAULT NULL,
  `recurrent` mediumint DEFAULT NULL,
  `status` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `mrp` float DEFAULT NULL,
  `category` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `purchase_unit_price` float NOT NULL DEFAULT '0',
  `updates` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1011 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pharmacy_invoice_details`
--

DROP TABLE IF EXISTS `pharmacy_invoice_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pharmacy_invoice_details` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `pharmacy_master_id` int DEFAULT NULL,
  `supplier_pharmacy_master_id` int DEFAULT NULL,
  `invoice_date` datetime DEFAULT NULL,
  `invoice_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `goods_received` tinyint(1) DEFAULT '0',
  `total_amount` float DEFAULT NULL,
  `paid_date` datetime DEFAULT NULL,
  `payment_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tax` float DEFAULT NULL,
  `sgst` float DEFAULT NULL,
  `cgst` float DEFAULT NULL,
  `igst` float DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pharmacy_masters`
--

DROP TABLE IF EXISTS `pharmacy_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pharmacy_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `care_delivery_program_master_id` int DEFAULT NULL,
  `pharmacy_name` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_detail_id` int DEFAULT NULL,
  `contact_detail_id` int DEFAULT NULL,
  `pharmacy_license_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `header_img_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `footer_img_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_retailer` tinyint(1) DEFAULT '0',
  `is_distributor` tinyint(1) DEFAULT '1',
  `invoice_img_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_eligible_for_gst` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `pharmacy_license_code_UNIQUE` (`pharmacy_license_code`)
) ENGINE=InnoDB AUTO_INCREMENT=258 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pharmacy_purchase_headers`
--

DROP TABLE IF EXISTS `pharmacy_purchase_headers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pharmacy_purchase_headers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `po_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invoice_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `retailer_pharmacy_master_id` int DEFAULT NULL,
  `purchase_dt` datetime DEFAULT NULL,
  `tax` float DEFAULT NULL,
  `transportation_cost` float DEFAULT NULL,
  `total_purchase_cost` float DEFAULT NULL,
  `address_detail_id` int DEFAULT NULL,
  `receipt_img_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sgst` float DEFAULT NULL,
  `cgst` float DEFAULT NULL,
  `igst` float DEFAULT NULL,
  `dealer` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `distributor_pharmacy_master_id` int DEFAULT NULL,
  `invoice_img_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `purchase_discount` float DEFAULT NULL,
  `global_status_master_id` int DEFAULT '1',
  `approved_date` datetime DEFAULT NULL,
  `approved_by_id` int DEFAULT NULL,
  `additional_discount` float DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=520 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pharmacy_purchase_lines`
--

DROP TABLE IF EXISTS `pharmacy_purchase_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pharmacy_purchase_lines` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pharmacy_purchase_header_id` int DEFAULT NULL,
  `brand_master_id` int DEFAULT NULL,
  `batch` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiry_dt` datetime DEFAULT NULL,
  `purchase_qty` int DEFAULT NULL,
  `purchase_unit_price` float DEFAULT NULL,
  `sale_unit_price` float DEFAULT NULL,
  `sale_discount_percent` float DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `gst_rate` float DEFAULT NULL,
  `tax` float DEFAULT NULL,
  `sgst` float DEFAULT NULL,
  `cgst` float DEFAULT NULL,
  `igst` float DEFAULT NULL,
  `purchase_discount` float DEFAULT NULL,
  `total_price` float DEFAULT NULL,
  `hsncode` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mrp` float DEFAULT NULL,
  `free_itm_cnt` int DEFAULT '0',
  `category` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `purchase_pck_qty` int DEFAULT NULL,
  `purchase_pck_cost` float DEFAULT NULL,
  `pck_mrp` float DEFAULT NULL,
  `qty_per_pck` int DEFAULT NULL,
  `with_goods` tinyint(1) DEFAULT '1',
  `invoice_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pharmacy_master_id` int DEFAULT NULL,
  `supplier_pharmacy_master_id` int DEFAULT NULL,
  `serial_numbers` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=603 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pharmacy_transfer_headers`
--

DROP TABLE IF EXISTS `pharmacy_transfer_headers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pharmacy_transfer_headers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `transfered_pharmacy_master_id` int DEFAULT NULL,
  `received_pharmacy_master_id` int DEFAULT NULL,
  `transfer_dt` datetime DEFAULT NULL,
  `status` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=317 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pharmacy_transfer_lines`
--

DROP TABLE IF EXISTS `pharmacy_transfer_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pharmacy_transfer_lines` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pharmacy_transfer_header_id` int DEFAULT NULL,
  `brand_master_id` int DEFAULT NULL,
  `batch` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hsncode` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiry_dt` datetime DEFAULT NULL,
  `mrp` float DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `received_qty` int DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `purchase_unit_price` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=342 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `phlebotomist_masters`
--

DROP TABLE IF EXISTS `phlebotomist_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phlebotomist_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `frst_nm` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `lst_nm` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dsply_nm` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `qualification` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nmbr` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phn_nmbr_typ` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `nanohealth_emp` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_detail_id` int DEFAULT NULL,
  `service_master_id` int DEFAULT NULL,
  `in_network` tinyint(1) DEFAULT NULL,
  `fee` int DEFAULT NULL,
  `cmmts` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `effctv_start_dt` datetime NOT NULL DEFAULT '2018-03-15 10:21:00',
  `trmntn_dt` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `archived_by_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_phlebotomist_masters_on_nanohealth_emp` (`nanohealth_emp`),
  KEY `fk_rails_ddccd6ac56` (`image_detail_id`),
  KEY `fk_rails_4ff61e59f1` (`service_master_id`),
  CONSTRAINT `fk_rails_4ff61e59f1` FOREIGN KEY (`service_master_id`) REFERENCES `service_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_ddccd6ac56` FOREIGN KEY (`image_detail_id`) REFERENCES `image_details` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `preference_masters`
--

DROP TABLE IF EXISTS `preference_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preference_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `preference_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `unit_master_id` int NOT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `effctv_dt` datetime NOT NULL,
  `trmntn_dt` datetime DEFAULT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prescription_field_masters`
--

DROP TABLE IF EXISTS `prescription_field_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescription_field_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `field_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_desc` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon_img` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prescription_order_lines`
--

DROP TABLE IF EXISTS `prescription_order_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescription_order_lines` (
  `id` int NOT NULL AUTO_INCREMENT,
  `prescription_sale_order_header_id` int NOT NULL,
  `brand_master_id` int NOT NULL,
  `mrng` int DEFAULT NULL,
  `aftn` int DEFAULT NULL,
  `evng` int DEFAULT NULL,
  `nyt` int DEFAULT NULL,
  `quantity` int NOT NULL,
  `dummy1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy2` int DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `archive` tinyint(1) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `batch` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiry_dt` datetime DEFAULT NULL,
  `sale_unit_price` float DEFAULT NULL,
  `sale_discount_percent` float DEFAULT NULL,
  `sale_total_price` float DEFAULT NULL,
  `sgst` float DEFAULT NULL,
  `cgst` float DEFAULT NULL,
  `igst` float DEFAULT NULL,
  `category` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hsncode` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `net_price` float DEFAULT NULL,
  `aggregate_total_discount` decimal(12,4) DEFAULT NULL,
  `serial_numbers` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rails_a0d8e9e4ff` (`prescription_sale_order_header_id`),
  KEY `fk_rails_607773448f` (`brand_master_id`),
  CONSTRAINT `fk_rails_607773448f` FOREIGN KEY (`brand_master_id`) REFERENCES `brand_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_a0d8e9e4ff` FOREIGN KEY (`prescription_sale_order_header_id`) REFERENCES `prescription_sale_order_headers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=8860 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prescription_order_updates`
--

DROP TABLE IF EXISTS `prescription_order_updates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescription_order_updates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `user_id` int NOT NULL,
  `prescription_sale_order_header_id` int NOT NULL,
  `cmmts` text COLLATE utf8_unicode_ci,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rails_19703ce8a0` (`user_id`),
  KEY `fk_rails_67d8fca558` (`prescription_sale_order_header_id`),
  CONSTRAINT `fk_rails_19703ce8a0` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_67d8fca558` FOREIGN KEY (`prescription_sale_order_header_id`) REFERENCES `prescription_sale_order_headers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4154 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prescription_reminder_details`
--

DROP TABLE IF EXISTS `prescription_reminder_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescription_reminder_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_master_id` int NOT NULL,
  `patient_prescription_header_id` int DEFAULT NULL,
  `brand_master_id` int NOT NULL,
  `prescription_reminder_master_id` int DEFAULT NULL,
  `mrng` decimal(5,2) DEFAULT NULL,
  `m_gen_time` datetime DEFAULT NULL,
  `mrng_rec_time` datetime DEFAULT NULL,
  `mrng_ignrd` tinyint(1) DEFAULT '0',
  `aftn` decimal(5,2) DEFAULT NULL,
  `a_gen_time` datetime DEFAULT NULL,
  `aftn_rec_time` datetime DEFAULT NULL,
  `aftn_ignrd` tinyint(1) DEFAULT '0',
  `evng` decimal(5,2) DEFAULT NULL,
  `e_gen_time` datetime DEFAULT NULL,
  `evng_rec_time` datetime DEFAULT NULL,
  `evng_ignrd` tinyint(1) DEFAULT '0',
  `nyt` decimal(5,2) DEFAULT NULL,
  `n_gen_time` datetime DEFAULT NULL,
  `nyt_rec_time` datetime DEFAULT NULL,
  `nyt_ignrd` tinyint(1) DEFAULT '0',
  `med_time` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `med_taken_date` date DEFAULT NULL,
  `day_score` float NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `cmmnts` text COLLATE utf8_unicode_ci,
  `dummy1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy2` int DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `updates_json` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `syncup` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_rails_a6bdf3aeed` (`patient_master_id`),
  KEY `fk_rails_7e61587b10` (`patient_prescription_header_id`),
  KEY `fk_rails_658aa1921f` (`brand_master_id`),
  KEY `fk_rails_b8ef4c30e7` (`prescription_reminder_master_id`),
  CONSTRAINT `fk_rails_658aa1921f` FOREIGN KEY (`brand_master_id`) REFERENCES `brand_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_7e61587b10` FOREIGN KEY (`patient_prescription_header_id`) REFERENCES `patient_prescription_headers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_a6bdf3aeed` FOREIGN KEY (`patient_master_id`) REFERENCES `patient_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_b8ef4c30e7` FOREIGN KEY (`prescription_reminder_master_id`) REFERENCES `prescription_reminder_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=9553 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prescription_reminder_masters`
--

DROP TABLE IF EXISTS `prescription_reminder_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescription_reminder_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_master_id` int NOT NULL,
  `patient_prescription_header_id` int DEFAULT NULL,
  `brand_master_id` int NOT NULL,
  `prscrbd_mrng` float DEFAULT NULL,
  `mrng_gen_time` datetime DEFAULT NULL,
  `prscrbd_aftn` float DEFAULT NULL,
  `aftn_gen_time` datetime DEFAULT NULL,
  `prscrbd_evng` float DEFAULT NULL,
  `evng_gen_time` datetime DEFAULT NULL,
  `prscrbd_nyt` float DEFAULT NULL,
  `nyt_gen_time` datetime DEFAULT NULL,
  `route` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `med_time` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `start_date_time` datetime NOT NULL DEFAULT '2018-03-15 10:21:06',
  `end_date_time` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updates_json` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rails_4a6c53a135` (`patient_master_id`),
  KEY `fk_rails_515b63a53e` (`brand_master_id`),
  KEY `fk_rails_11ec8fc129` (`patient_prescription_header_id`),
  CONSTRAINT `fk_rails_11ec8fc129` FOREIGN KEY (`patient_prescription_header_id`) REFERENCES `patient_prescription_headers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_4a6c53a135` FOREIGN KEY (`patient_master_id`) REFERENCES `patient_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_515b63a53e` FOREIGN KEY (`brand_master_id`) REFERENCES `brand_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prescription_sale_order_headers`
--

DROP TABLE IF EXISTS `prescription_sale_order_headers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescription_sale_order_headers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `patient_master_id` int NOT NULL,
  `patient_prescription_header_id` int DEFAULT NULL,
  `pharmacy_master_id` int DEFAULT NULL,
  `order_date` datetime NOT NULL,
  `promocode_master_id` int DEFAULT NULL,
  `order_value` decimal(12,2) DEFAULT NULL,
  `discount` decimal(12,2) DEFAULT NULL,
  `net_payable` decimal(12,2) DEFAULT NULL,
  `invoice_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `razorpay_payment_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order_address_detail_id` int DEFAULT NULL,
  `order_status` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `delivery_date` datetime DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `deleted_by_id` int DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `archive` tinyint(1) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `refill_date` datetime DEFAULT NULL,
  `patient_test_recommendation_detail_id` int DEFAULT NULL,
  `prev_order_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nanosafe_payment_id` int DEFAULT NULL,
  `sale_total_price` float DEFAULT NULL,
  `sgst` float DEFAULT NULL,
  `cgst` float DEFAULT NULL,
  `igst` float DEFAULT NULL,
  `doctor_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `salestype_counter` tinyint(1) DEFAULT NULL,
  `sale_order_header_id` int DEFAULT NULL,
  `referred_by_id` int DEFAULT NULL,
  `pharmacist_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updates_json` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_return` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_prescription_sale_order_headers_on_prev_order_id` (`prev_order_id`),
  KEY `fk_rails_73234c149a` (`patient_master_id`),
  KEY `fk_rails_510add1042` (`patient_prescription_header_id`),
  KEY `fk_rails_ab6bcb3514` (`promocode_master_id`),
  KEY `fk_rails_3d44eb6f8c` (`patient_test_recommendation_detail_id`),
  KEY `fk_rails_a96680eeef` (`nanosafe_payment_id`),
  KEY `fk_rails_c8d6577cb8` (`order_address_detail_id`),
  KEY `fk_rails_5925fc795c` (`pharmacy_master_id`),
  CONSTRAINT `fk_rails_3d44eb6f8c` FOREIGN KEY (`patient_test_recommendation_detail_id`) REFERENCES `patient_test_recommendation_details` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_510add1042` FOREIGN KEY (`patient_prescription_header_id`) REFERENCES `patient_prescription_headers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_5925fc795c` FOREIGN KEY (`pharmacy_master_id`) REFERENCES `pharmacy_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_73234c149a` FOREIGN KEY (`patient_master_id`) REFERENCES `patient_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_a96680eeef` FOREIGN KEY (`nanosafe_payment_id`) REFERENCES `nanosafe_payments` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_ab6bcb3514` FOREIGN KEY (`promocode_master_id`) REFERENCES `promo_code_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_c8d6577cb8` FOREIGN KEY (`order_address_detail_id`) REFERENCES `order_address_details` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4043 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_sales_channel_masters`
--

DROP TABLE IF EXISTS `product_sales_channel_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_sales_channel_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sales_channel_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `effctv_dt` datetime NOT NULL DEFAULT '2018-03-15 10:21:00',
  `trmntn_dt` datetime DEFAULT NULL,
  `archived_by_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_product_sales_channel_masters_on_sales_channel_name` (`sales_channel_name`),
  KEY `index_product_sales_channel_masters_on_archive` (`archive`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_service_relationship_masters`
--

DROP TABLE IF EXISTS `product_service_relationship_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_service_relationship_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `care_delivery_program_master_id` int NOT NULL DEFAULT '0',
  `product_type_master_id` int NOT NULL,
  `product_master_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `appointment_type_master_id` int NOT NULL,
  `provider_service_master_id` int NOT NULL,
  `provider_table` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider_id` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider_service_charges` float DEFAULT NULL,
  `slot_duration` int DEFAULT NULL,
  `visibility` int NOT NULL DEFAULT '0',
  `nh_visibility` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `program_event_details`
--

DROP TABLE IF EXISTS `program_event_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `program_event_details` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `program_master_id` int NOT NULL,
  `event_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `event_service_master_id` int DEFAULT NULL,
  `event_activity_id` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `screening_camp_master_ids` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `from_date` datetime NOT NULL,
  `to_date` datetime NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `promocode_master_id` int DEFAULT NULL,
  `insurance_policy_detail_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `program_group_questnr_mapping_masters`
--

DROP TABLE IF EXISTS `program_group_questnr_mapping_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `program_group_questnr_mapping_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `field_type_master_id` int DEFAULT NULL,
  `care_delivery_program_master_id` int DEFAULT NULL,
  `program_master_id` int DEFAULT NULL,
  `questnr_group_master_id` int DEFAULT NULL,
  `questnr_master_id` int DEFAULT NULL,
  `table_row_questnr_ids` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `questn_label_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_required` tinyint(1) DEFAULT '1',
  `options` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `unit_master_id` int DEFAULT NULL,
  `questn_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `min_val` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `max_val` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_dependent` tinyint(1) DEFAULT '0',
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `derived_questn_ids` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` int DEFAULT '0',
  `age_lwr_lmt` int DEFAULT '0',
  `age_upr_lmt` int DEFAULT '1800',
  `placeholder_label` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_viewable` int NOT NULL DEFAULT '1',
  `custom_logic` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `col_span_md` float DEFAULT NULL,
  `form_master_id` int DEFAULT NULL,
  `srce_logic` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_program_group_questnr_mapping_masters_on_unit_master_id` (`unit_master_id`),
  CONSTRAINT `fk_rails_7dad7b6a9d` FOREIGN KEY (`unit_master_id`) REFERENCES `unit_masters` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3787 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `program_hospital_referral_mapping_details`
--

DROP TABLE IF EXISTS `program_hospital_referral_mapping_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `program_hospital_referral_mapping_details` (
  `id` int NOT NULL,
  `hospital_master_id` int DEFAULT NULL,
  `refferal_master_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_constraint1` (`hospital_master_id`,`refferal_master_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `program_masters`
--

DROP TABLE IF EXISTS `program_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `program_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `program_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `program_comp` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `program_owner` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_dt` datetime DEFAULT '2018-03-15 10:21:01',
  `end_at` datetime DEFAULT NULL,
  `desc` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `patient_category_master_id` int DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `archived_at` datetime DEFAULT NULL,
  `archived_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `events` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `authentication_token` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `form_master_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_program_masters_on_program_name` (`program_name`),
  KEY `fk_rails_e2af4ee732` (`patient_category_master_id`),
  CONSTRAINT `fk_rails_e2af4ee732` FOREIGN KEY (`patient_category_master_id`) REFERENCES `patient_category_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `program_masters_users`
--

DROP TABLE IF EXISTS `program_masters_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `program_masters_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `program_master_id` int NOT NULL,
  `user_id` int NOT NULL,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rails_96cd455b22` (`program_master_id`),
  KEY `fk_rails_5e398e65d6` (`user_id`),
  CONSTRAINT `fk_rails_5e398e65d6` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_96cd455b22` FOREIGN KEY (`program_master_id`) REFERENCES `program_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `program_parameter_details`
--

DROP TABLE IF EXISTS `program_parameter_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `program_parameter_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `program_master_id` int NOT NULL,
  `parameter_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parameter_type_master_id` int DEFAULT NULL,
  `required` tinyint(1) NOT NULL,
  `int_val` int DEFAULT NULL,
  `string_val` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_val` datetime DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `parameter_master_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_constraint1` (`program_master_id`,`parameter_name`),
  CONSTRAINT `fk_rails_68991548e9` FOREIGN KEY (`program_master_id`) REFERENCES `program_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=335 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `promo_code_masters`
--

DROP TABLE IF EXISTS `promo_code_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promo_code_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_category_master_id` int DEFAULT NULL,
  `promo_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `discount` float DEFAULT NULL,
  `promo_desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `for_enrld` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `redem_limit` int DEFAULT NULL,
  `start_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_date` datetime DEFAULT NULL,
  `user_group_master_id` int DEFAULT NULL,
  `service_master_id` int DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `archived_by_id` int DEFAULT NULL,
  `care_delivery_program_master_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_promo_code_masters_on_user_group_master_id` (`user_group_master_id`),
  KEY `index_promo_code_masters_on_service_master_id` (`service_master_id`),
  KEY `index_promo_code_masters_on_created_by_id` (`created_by_id`),
  KEY `index_promo_code_masters_on_updated_by_id` (`updated_by_id`),
  KEY `fk_rails_c8c7d24147` (`patient_category_master_id`),
  CONSTRAINT `fk_rails_3828eba3cf` FOREIGN KEY (`user_group_master_id`) REFERENCES `user_group_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_b5576518ed` FOREIGN KEY (`service_master_id`) REFERENCES `service_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_c8c7d24147` FOREIGN KEY (`patient_category_master_id`) REFERENCES `patient_category_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `promo_code_service_details`
--

DROP TABLE IF EXISTS `promo_code_service_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promo_code_service_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `promo_code_master_id` int NOT NULL,
  `care_delivery_program_master_id` int DEFAULT NULL,
  `program_master_ids` varchar(255) COLLATE utf8_unicode_ci DEFAULT '0',
  `not_in_program_ids` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status_master_id` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `patient_category_master_id` int DEFAULT NULL,
  `service_master_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `custom_logic` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `discount` float DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `for_er` tinyint(1) NOT NULL DEFAULT '1',
  `created_by_id` int NOT NULL DEFAULT '31',
  `updated_by_id` int NOT NULL DEFAULT '31',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `amount` float DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `max_disc_amt` float DEFAULT NULL,
  `max_utilisation` int DEFAULT NULL,
  `is_family` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rails_9375e6788e` (`promo_code_master_id`),
  CONSTRAINT `fk_rails_9375e6788e` FOREIGN KEY (`promo_code_master_id`) REFERENCES `promo_code_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=215 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prostate_cancer_screening_details`
--

DROP TABLE IF EXISTS `prostate_cancer_screening_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prostate_cancer_screening_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `screening_detail_id` int DEFAULT NULL,
  `cmplt_bldr_aftr_urntn` int DEFAULT NULL,
  `urntn_in_two_hrs` int DEFAULT NULL,
  `urnry_hesitancy` int DEFAULT NULL,
  `dffclty_pst_pn_urntn` int DEFAULT NULL,
  `weak_urnry_stream` int DEFAULT NULL,
  `strn_to_bgn_urntn` int DEFAULT NULL,
  `status_master_id` int DEFAULT NULL,
  `rsk_scr` float DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `questnr_group_masters`
--

DROP TABLE IF EXISTS `questnr_group_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questnr_group_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_alias_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `header_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `questnr_masters`
--

DROP TABLE IF EXISTS `questnr_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questnr_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `field_type_master_id` int DEFAULT NULL,
  `table_row_questnr_ids` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `questn_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `questn_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `options` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_master_id` int DEFAULT NULL,
  `questn_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `min_val` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `max_val` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_dependent` tinyint(1) DEFAULT '0',
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `derived_questn_ids` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` int DEFAULT '0',
  `age_lwr_lmt` int DEFAULT '0',
  `age_upr_lmt` int DEFAULT '1800',
  `diagnostic_test_master_id` int DEFAULT NULL,
  `placeholder_label` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_viewable` int DEFAULT NULL,
  `visible_id` int DEFAULT '0',
  `srce_logic` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `target_logic` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `result_logic` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_questnr_masters_on_unit_master_id` (`unit_master_id`),
  CONSTRAINT `fk_rails_6e5d28a36d` FOREIGN KEY (`unit_master_id`) REFERENCES `unit_masters` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2210 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `questnr_unit_mapping_masters`
--

DROP TABLE IF EXISTS `questnr_unit_mapping_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questnr_unit_mapping_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `questnr_master_id` int DEFAULT NULL,
  `unit_master_id` int DEFAULT NULL,
  `base_unit_id` int DEFAULT NULL,
  `base_to_unit_logic` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_to_base_logic` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `index_questnr_unit_mapping_masters_on_questnr_master_id` (`questnr_master_id`),
  KEY `index_questnr_unit_mapping_masters_on_unit_master_id` (`unit_master_id`),
  KEY `fk_rails_c58f341df1` (`base_unit_id`),
  CONSTRAINT `fk_rails_6b2be70fd7` FOREIGN KEY (`unit_master_id`) REFERENCES `unit_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_af247777a9` FOREIGN KEY (`questnr_master_id`) REFERENCES `questnr_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_c58f341df1` FOREIGN KEY (`base_unit_id`) REFERENCES `unit_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rating_masters`
--

DROP TABLE IF EXISTS `rating_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rating_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `rating_desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `effctv_dt` datetime NOT NULL,
  `trmntn_dt` datetime DEFAULT NULL,
  `archived_by_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_rating_masters_on_rating_code` (`rating_code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recommendation_logic_masters`
--

DROP TABLE IF EXISTS `recommendation_logic_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recommendation_logic_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `care_delivery_program_master_id` int NOT NULL,
  `logic_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `gender` int NOT NULL DEFAULT '0',
  `age_lwr_lmt` int NOT NULL DEFAULT '0',
  `age_upr_lmt` int NOT NULL DEFAULT '1800',
  `service_master_id` int DEFAULT NULL,
  `questnr_master_id` int DEFAULT NULL,
  `expected_inputs` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `logic` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `logic_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `operational_status_ids` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '0',
  `clinical_status_ids` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '0',
  `medical_condition` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '0',
  `source_urls` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recommendation_logic_type_mapping_masters`
--

DROP TABLE IF EXISTS `recommendation_logic_type_mapping_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recommendation_logic_type_mapping_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `care_delivery_program_master_id` int DEFAULT '0',
  `program_master_id` int DEFAULT '0',
  `source_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '0',
  `source_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '0',
  `recommendation_logic_master_id` int NOT NULL,
  `recommendation_type_master_id` int NOT NULL,
  `due_days` int NOT NULL,
  `operational_status_id` int DEFAULT NULL,
  `clinical_status_id` int DEFAULT NULL,
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `risk_score` int DEFAULT NULL,
  `risk_description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_patient` tinyint(1) DEFAULT '1',
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `recommendation_logic_type_mapping_master_indexing` (`care_delivery_program_master_id`,`source_type`,`source_name`,`recommendation_logic_master_id`,`recommendation_type_master_id`),
  KEY `fk_rails_338f80fa9d` (`recommendation_logic_master_id`),
  KEY `fk_rails_8c2dcdd16f` (`recommendation_type_master_id`),
  CONSTRAINT `fk_rails_338f80fa9d` FOREIGN KEY (`recommendation_logic_master_id`) REFERENCES `recommendation_logic_masters` (`id`),
  CONSTRAINT `fk_rails_8c2dcdd16f` FOREIGN KEY (`recommendation_type_master_id`) REFERENCES `recommendation_type_masters` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=526 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recommendation_type_masters`
--

DROP TABLE IF EXISTS `recommendation_type_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recommendation_type_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `service_master_id` int NOT NULL,
  `activity_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activity_detail_id` int NOT NULL,
  `source_table` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `lvl2_source_table` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `lvl2_activity_detail_id` int DEFAULT NULL,
  `where_recommendation_id` int DEFAULT NULL,
  `whose_resp_role_id` int DEFAULT NULL,
  `desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `alert_flag` int DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UniqueKey` (`service_master_id`,`activity_detail_id`,`source_table`,`lvl2_source_table`,`lvl2_activity_detail_id`,`where_recommendation_id`,`whose_resp_role_id`),
  KEY `recommendation_type_master_indexing` (`service_master_id`,`activity_detail_id`,`source_table`)
) ENGINE=InnoDB AUTO_INCREMENT=817 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `referral_contact_details`
--

DROP TABLE IF EXISTS `referral_contact_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `referral_contact_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `referral_type_master_id` int DEFAULT NULL,
  `facility_type_master_id` int DEFAULT NULL,
  `referral_by_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cmmts` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=391 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `referral_details`
--

DROP TABLE IF EXISTS `referral_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `referral_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_master_id` int DEFAULT NULL,
  `referred_date` datetime DEFAULT NULL,
  `referral_contact_detail_id` int DEFAULT NULL,
  `referred_for` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updates_json` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=940 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `referral_type_masters`
--

DROP TABLE IF EXISTS `referral_type_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `referral_type_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `referral_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `renewal_groups`
--

DROP TABLE IF EXISTS `renewal_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `renewal_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_date` date NOT NULL DEFAULT '2018-03-15',
  `end_date` date DEFAULT NULL,
  `location_master_id` int DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` int DEFAULT NULL,
  `dummy3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy4` decimal(10,0) DEFAULT NULL,
  `dummy5` decimal(10,0) DEFAULT NULL,
  `dummy6` decimal(10,0) DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_day` int NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `archived_at` datetime DEFAULT NULL,
  `archived_by_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_renewal_groups_on_name` (`name`),
  KEY `fk_rails_9d50113573` (`location_master_id`),
  CONSTRAINT `fk_rails_9d50113573` FOREIGN KEY (`location_master_id`) REFERENCES `location_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_masters`
--

DROP TABLE IF EXISTS `report_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `report_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `report_heading` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `report_path` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `report_class` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rfq_claim_details`
--

DROP TABLE IF EXISTS `rfq_claim_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rfq_claim_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rfq_insurance_policy_detail_id` int NOT NULL,
  `ic_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `insurance_company_master_id` int DEFAULT NULL,
  `policy_start_date` datetime DEFAULT NULL,
  `policy_end_date` datetime DEFAULT NULL,
  `policy_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `corp_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rfq_corp_master_id` int DEFAULT NULL,
  `employee_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `patient` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `patient_gender` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `age` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `relation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uhc_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `insurance_card_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `claim_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `claim_Type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `claim_type_master_id` int DEFAULT NULL,
  `intimation_date` datetime DEFAULT NULL,
  `admission_date` datetime DEFAULT NULL,
  `discharge_date` datetime DEFAULT NULL,
  `lastauditdate` datetime DEFAULT NULL,
  `claim_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `claim_status_master_id` int DEFAULT NULL,
  `claim_amt` decimal(12,2) DEFAULT NULL,
  `approved_amount` decimal(12,2) DEFAULT NULL,
  `servicetax` decimal(12,2) DEFAULT NULL,
  `incurred_amount` decimal(12,2) DEFAULT NULL,
  `disease` float DEFAULT NULL,
  `icdcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icd_code_master_id` int DEFAULT NULL,
  `level1_icd_group` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level2_icd_group` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level3_icd_group` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hospital_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hospital_city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hospital_state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hospital_master_id` int DEFAULT NULL,
  `utr_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `utr_date` datetime DEFAULT NULL,
  `payment_mode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_gateway_master_id` int DEFAULT NULL,
  `paymnet_confirmation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `float_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `query_or_rejection_date` datetime DEFAULT NULL,
  `query_or_rejection_reason` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `nh_impact_prcnt` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=778 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rfq_corp_masters`
--

DROP TABLE IF EXISTS `rfq_corp_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rfq_corp_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `corp_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `corp_group_master_id` int DEFAULT NULL,
  `corp_business_type_master_id` int DEFAULT NULL,
  `e_e_relationship` tinyint(1) DEFAULT NULL,
  `e_e_reln_no_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `effctv_dt` datetime DEFAULT NULL,
  `trmntn_dt` datetime DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rfq_details`
--

DROP TABLE IF EXISTS `rfq_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rfq_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rfq_insurance_policy_detail_id` int NOT NULL,
  `service_agency_insurance_company_mapping_id` int NOT NULL,
  `rfq_sent_at` datetime DEFAULT NULL,
  `premium_received` tinyint(1) DEFAULT NULL,
  `premium_updated_at` datetime DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rfq_insurance_policy_details`
--

DROP TABLE IF EXISTS `rfq_insurance_policy_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rfq_insurance_policy_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `service_agency_master_id` int NOT NULL,
  `rfq_corp_master_id` int NOT NULL,
  `tpa_master_id` int NOT NULL,
  `user_id` int NOT NULL,
  `ic_type_id` int DEFAULT NULL,
  `policy_start_date` datetime DEFAULT NULL,
  `policy_end_date` datetime DEFAULT NULL,
  `req_sum_insured` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `corp_buffer` decimal(12,2) DEFAULT NULL,
  `past_policy_year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `insurance_family_coverage_master_id` int DEFAULT NULL,
  `si_for_corp_buff` decimal(12,2) DEFAULT NULL,
  `cases_for_corp_buff` float DEFAULT NULL,
  `is_renewal_req` tinyint(1) DEFAULT NULL,
  `sum_insured_type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `e_e_reln_no_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `e_e_relationship` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rfq_insurance_policy_pasts`
--

DROP TABLE IF EXISTS `rfq_insurance_policy_pasts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rfq_insurance_policy_pasts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rfq_insurance_policy_detail_id` int NOT NULL,
  `past_policy_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `past_insurance_group_master_id` int DEFAULT NULL,
  `past_insurance_policy_class_master_id` int DEFAULT NULL,
  `past_insurance_company_master_id` int DEFAULT NULL,
  `past_service_agency_master_id` int DEFAULT NULL,
  `past_tpa_master_id` int DEFAULT NULL,
  `floater` decimal(12,2) DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `policy_start_date` datetime DEFAULT NULL,
  `policy_end_date` datetime DEFAULT NULL,
  `premium_amount` decimal(12,2) DEFAULT NULL,
  `insurance_group_master_id` int DEFAULT NULL,
  `notes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT '0',
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `insurance_family_coverage_master_id` int DEFAULT NULL,
  `mems_at_inception` int DEFAULT NULL,
  `adtn_durng_yr` int DEFAULT NULL,
  `deltn_durng_yr` int DEFAULT NULL,
  `policy_duration` int DEFAULT NULL,
  `last_claim_dt` datetime DEFAULT NULL,
  `sa_contact_detail_id` int DEFAULT NULL,
  `tpa_contact_detail_id` int DEFAULT NULL,
  `depnds_at_inception` int DEFAULT NULL,
  `adtn_depnds_durng_yr` int DEFAULT NULL,
  `deltn_depnds_durng_yr` int DEFAULT NULL,
  `prm_deltn_durng_yr` decimal(12,2) DEFAULT NULL,
  `prm_adtn_durng_yr` decimal(12,2) DEFAULT NULL,
  `policy_prev_durtn` decimal(12,2) DEFAULT NULL,
  `sum_insured_type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_base_policy` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rfq_ip_request_coverage_details`
--

DROP TABLE IF EXISTS `rfq_ip_request_coverage_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rfq_ip_request_coverage_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rfq_insurance_policy_detail_id` int NOT NULL,
  `rfq_ipd_coverage_item` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `standard_iclist_id` int DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=386 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role_masters`
--

DROP TABLE IF EXISTS `role_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `role_desc` text COLLATE utf8_unicode_ci,
  `dummy1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy2` int DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `effctv_dt` datetime NOT NULL,
  `trmntn_dt` datetime DEFAULT NULL,
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `dashboard_master_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_role_masters_on_role_name` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rooms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `session_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `public` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sa_ipclass_details`
--

DROP TABLE IF EXISTS `sa_ipclass_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sa_ipclass_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `service_agency_master_id` int NOT NULL,
  `insurance_policy_class_master_id` int NOT NULL,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `saathi_inventory_details`
--

DROP TABLE IF EXISTS `saathi_inventory_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saathi_inventory_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `item_master_id` int NOT NULL,
  `qty` int NOT NULL,
  `updated_dt` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `location_master_id` int DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `hospital_master_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rails_1159a76292` (`item_master_id`),
  CONSTRAINT `fk_rails_1159a76292` FOREIGN KEY (`item_master_id`) REFERENCES `item_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=607 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `saathi_masters`
--

DROP TABLE IF EXISTS `saathi_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saathi_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_master_id` int NOT NULL,
  `frst_nm` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `lst_nm` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dsply_nm` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gndr` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `addrss` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `location_master_id` int DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phn_nmbr_typ` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nmbr` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fee_home_visit` int DEFAULT NULL,
  `slot_duration` int DEFAULT NULL,
  `days_in_advnce` int DEFAULT NULL,
  `time_sensivity` int DEFAULT NULL,
  `service_master_id` int DEFAULT NULL,
  `basic_sal` float DEFAULT NULL,
  `fthr_or_spuse_nm` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `poi_type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prf_of_idntty` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `marital_status` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `education` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `executive_master_id` int DEFAULT NULL,
  `training_modules` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `effctv_dt` datetime NOT NULL DEFAULT '2018-03-15 10:21:03',
  `trmntn_dt` datetime DEFAULT NULL,
  `cmmts` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `saathi_pht_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `saathi_pht_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `saathi_pht_file_size` int DEFAULT NULL,
  `saathi_pht_updated_at` datetime DEFAULT NULL,
  `saathi_poi_pht_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `saathi_poi_pht_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `saathi_poi_pht_file_size` int DEFAULT NULL,
  `saathi_poi_pht_updated_at` datetime DEFAULT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `archived_at` datetime DEFAULT NULL,
  `archived_by_id` int DEFAULT NULL,
  `care_delivery_program_master_id` int DEFAULT '1',
  `experience` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_saathi_masters_on_user_master_id` (`user_master_id`),
  KEY `index_saathi_masters_on_frst_nm` (`frst_nm`),
  KEY `index_saathi_masters_on_location_master_id` (`location_master_id`),
  KEY `index_saathi_masters_on_executive_master_id` (`executive_master_id`),
  KEY `index_saathi_masters_on_created_by_id` (`created_by_id`),
  KEY `index_saathi_masters_on_updated_by_id` (`updated_by_id`),
  KEY `fk_rails_67a7fccc64` (`service_master_id`),
  CONSTRAINT `fk_rails_05fe251325` FOREIGN KEY (`user_master_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_54526bfda9` FOREIGN KEY (`executive_master_id`) REFERENCES `executive_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_67a7fccc64` FOREIGN KEY (`service_master_id`) REFERENCES `service_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_a65917e319` FOREIGN KEY (`location_master_id`) REFERENCES `location_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=562 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `saathi_trackings`
--

DROP TABLE IF EXISTS `saathi_trackings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saathi_trackings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tablet_master_id` int NOT NULL,
  `location_master_id` int DEFAULT NULL,
  `visit_date` datetime NOT NULL,
  `lttd` decimal(9,6) NOT NULL,
  `lgtd` decimal(9,6) NOT NULL,
  `patient_master_id` int DEFAULT NULL,
  `change_type` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `tblt_crtd_by_id` int DEFAULT NULL,
  `tblt_crtd_at` datetime DEFAULT NULL,
  `proc_updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `updates_json` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1832355 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `saathi_work_days`
--

DROP TABLE IF EXISTS `saathi_work_days`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saathi_work_days` (
  `id` int NOT NULL AUTO_INCREMENT,
  `saathi_master_id` int NOT NULL,
  `no_of_days` int NOT NULL,
  `month` date NOT NULL,
  `new_screening_cnt` int DEFAULT NULL,
  `scnd_screening_cnt` int DEFAULT NULL,
  `dctr_visit_cnt` int DEFAULT NULL,
  `enroll_cnt` int DEFAULT NULL,
  `renewal_count` int DEFAULT NULL,
  `score_count` int DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_by_id` int NOT NULL DEFAULT '31',
  `updated_by_id` int NOT NULL DEFAULT '31',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `no_of_presc` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rails_97508fb575` (`saathi_master_id`),
  CONSTRAINT `fk_rails_97508fb575` FOREIGN KEY (`saathi_master_id`) REFERENCES `saathi_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=1619 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sale_order_discount_details`
--

DROP TABLE IF EXISTS `sale_order_discount_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale_order_discount_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sale_order_header_id` int DEFAULT NULL,
  `dscnt_srce_nm` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dscnt_srce_id` int DEFAULT NULL,
  `dscnt_pcnt` int DEFAULT NULL,
  `dscnt_amt` float DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3937 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sale_order_headers`
--

DROP TABLE IF EXISTS `sale_order_headers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale_order_headers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_master_id` int NOT NULL,
  `order_date` datetime NOT NULL,
  `promocode_master_id` int DEFAULT NULL,
  `order_value` decimal(12,2) NOT NULL,
  `discount` decimal(12,2) DEFAULT NULL,
  `net_payable` decimal(12,2) NOT NULL,
  `revenue_credit_hospital_id` int DEFAULT NULL,
  `currency_master_id` int NOT NULL DEFAULT '1',
  `due_amt` decimal(12,2) NOT NULL DEFAULT '0.00',
  `due_date` datetime DEFAULT NULL,
  `razorpay_ref_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `deleted_by_id` int DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `archive` tinyint(1) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `invoice_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_closed` tinyint(1) DEFAULT '0',
  `is_ip` tinyint(1) DEFAULT '0',
  `emi_pre_enquiry` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updates_json` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `claim_detail_id` int DEFAULT NULL,
  `pkg_disc` float DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_sale_order_headers_on_invoice_id` (`invoice_id`),
  KEY `fk_rails_322604c2ea` (`patient_master_id`),
  KEY `fk_rails_f8642dabcf` (`promocode_master_id`),
  KEY `fk_rails_f42b2af028` (`revenue_credit_hospital_id`),
  CONSTRAINT `fk_rails_322604c2ea` FOREIGN KEY (`patient_master_id`) REFERENCES `patient_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_f42b2af028` FOREIGN KEY (`revenue_credit_hospital_id`) REFERENCES `hospital_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_f8642dabcf` FOREIGN KEY (`promocode_master_id`) REFERENCES `promo_code_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=28897 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screening_camp_masters`
--

DROP TABLE IF EXISTS `screening_camp_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `screening_camp_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `care_delivery_program_master_id` int DEFAULT '0',
  `service_master_id` int DEFAULT NULL,
  `activity_detail_ids` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `camp_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sponsor_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location_master_id` int NOT NULL,
  `executive_master_id` int NOT NULL,
  `screening_start_date` datetime NOT NULL DEFAULT '2018-03-15 10:21:03',
  `screening_end_date` datetime DEFAULT NULL,
  `start_time` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `end_time` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `people_screened` int DEFAULT NULL,
  `people_enrolled` int DEFAULT '0',
  `doctor_attended` varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL DEFAULT '31',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tent_cost` int DEFAULT NULL,
  `snacks_cost` int DEFAULT NULL,
  `admin_cost` int DEFAULT NULL,
  `saathi_cost` int DEFAULT NULL,
  `sh_count` int DEFAULT NULL,
  `ri_count` int DEFAULT NULL,
  `rc_count` int DEFAULT NULL,
  `dc_count` int DEFAULT NULL,
  `cmmts` tinytext COLLATE utf8_unicode_ci,
  `revenue` decimal(7,2) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `diagnostic_test_master_id` int DEFAULT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `archived_at` datetime DEFAULT NULL,
  `archived_by_id` int DEFAULT NULL,
  `program_master_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `program_event_detail_id` int DEFAULT NULL,
  `rec_ids` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `capacity` int DEFAULT NULL,
  `assigned_counter` int DEFAULT '0',
  `age_lwr_lmt` int DEFAULT NULL,
  `age_upr_lmt` int DEFAULT NULL,
  `is_public` tinyint(1) DEFAULT NULL,
  `slot_duration` int DEFAULT NULL,
  `slot_capacity` int DEFAULT NULL,
  `address_detail_id` int DEFAULT NULL,
  `contact_detail_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_screening_camp_masters_on_location_master_id` (`location_master_id`),
  KEY `index_screening_camp_masters_on_executive_master_id` (`executive_master_id`),
  KEY `fk_rails_2bdaea9309` (`diagnostic_test_master_id`),
  KEY `index_screening_camp_masters_on_program_master_id` (`program_master_id`),
  CONSTRAINT `fk_rails_2bdaea9309` FOREIGN KEY (`diagnostic_test_master_id`) REFERENCES `diagnostic_test_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_691f08af06` FOREIGN KEY (`location_master_id`) REFERENCES `location_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_c7ee11b6cf` FOREIGN KEY (`executive_master_id`) REFERENCES `executive_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=335 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screening_camp_saathis`
--

DROP TABLE IF EXISTS `screening_camp_saathis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `screening_camp_saathis` (
  `id` int NOT NULL AUTO_INCREMENT,
  `screening_camp_master_id` int NOT NULL,
  `saathi_master_id` int NOT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `index_screening_camp_saathis_on_screening_camp_master_id` (`screening_camp_master_id`),
  KEY `index_screening_camp_saathis_on_saathi_master_id` (`saathi_master_id`),
  CONSTRAINT `fk_rails_c8da8416ab` FOREIGN KEY (`saathi_master_id`) REFERENCES `saathi_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_e83df1720e` FOREIGN KEY (`screening_camp_master_id`) REFERENCES `screening_camp_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `server_to_tab_api_data`
--

DROP TABLE IF EXISTS `server_to_tab_api_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `server_to_tab_api_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ptnt_rgstrtn_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ddid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `renewal_dt` datetime DEFAULT NULL,
  `next_test_dt` datetime DEFAULT NULL,
  `change_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `group_id` int DEFAULT NULL,
  `item_order_header_id` int DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qty_issued` int DEFAULT NULL,
  `location_master_id` int DEFAULT NULL,
  `saathi_master_id` int DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_by_id` int DEFAULT '31',
  `updated_by_id` int DEFAULT '31',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dummy4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy6` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flag` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91354 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `service_agency_category_masters`
--

DROP TABLE IF EXISTS `service_agency_category_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_agency_category_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `service_agency_category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `effctv_dt` datetime DEFAULT NULL,
  `trmntn_dt` datetime DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `service_agency_insurance_company_mappings`
--

DROP TABLE IF EXISTS `service_agency_insurance_company_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_agency_insurance_company_mappings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `service_agency_master_id` int NOT NULL,
  `insurance_company_master_id` int NOT NULL,
  `ic_contact_detail_id` int NOT NULL,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `service_agency_masters`
--

DROP TABLE IF EXISTS `service_agency_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_agency_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sa_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sa_short_Name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `license_code_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cert_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `service_agency_category_master_id` int DEFAULT NULL,
  `sa_address_detail_id` int NOT NULL,
  `service_agency_type_master_id` int DEFAULT NULL,
  `parent_company` int NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `effctv_dt` datetime DEFAULT NULL,
  `trmntn_dt` datetime DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `banner_logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `web_logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `water_mark_img` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=429 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `service_agency_tpa_mappings`
--

DROP TABLE IF EXISTS `service_agency_tpa_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_agency_tpa_mappings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `service_agency_master_id` int NOT NULL,
  `tpa_master_id` int NOT NULL,
  `tpa_contact_detail_id` int NOT NULL,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `service_agency_type_masters`
--

DROP TABLE IF EXISTS `service_agency_type_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_agency_type_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `service_agency_type` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `effctv_dt` datetime DEFAULT NULL,
  `trmntn_dt` datetime DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `service_masters`
--

DROP TABLE IF EXISTS `service_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `service_code` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `service_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `service_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `apmnt_type_ids` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source_table` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `service_desc` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `effctv_dt` datetime NOT NULL,
  `trmntn_dt` datetime DEFAULT NULL,
  `archived_by_id` int DEFAULT NULL,
  `service_label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_ip` int DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_service_masters_on_service_code` (`service_code`),
  UNIQUE KEY `index_service_masters_on_service_name` (`service_name`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `service_rating_details`
--

DROP TABLE IF EXISTS `service_rating_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_rating_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `service_master_id` int NOT NULL,
  `appointment_tracking_id` int NOT NULL,
  `rating_master_id` int NOT NULL,
  `appointer_id` int DEFAULT NULL,
  `cmmts` text COLLATE utf8_unicode_ci,
  `call_rating` int NOT NULL,
  `call_cmmts` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `call_feedback` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_service_rating_details_on_service_master_id` (`service_master_id`),
  KEY `index_service_rating_details_on_appointment_tracking_id` (`appointment_tracking_id`),
  KEY `index_service_rating_details_on_rating_master_id` (`rating_master_id`),
  KEY `index_service_rating_details_on_appointer_id` (`appointer_id`),
  CONSTRAINT `fk_rails_09ff1fa0e9` FOREIGN KEY (`appointment_tracking_id`) REFERENCES `appointment_trackings` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_155a2ed407` FOREIGN KEY (`rating_master_id`) REFERENCES `rating_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_b175942c09` FOREIGN KEY (`service_master_id`) REFERENCES `service_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shortened_urls`
--

DROP TABLE IF EXISTS `shortened_urls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shortened_urls` (
  `id` int NOT NULL AUTO_INCREMENT,
  `owner_id` int DEFAULT NULL,
  `recipient` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `owner_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` text COLLATE utf8_unicode_ci NOT NULL,
  `unique_key` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `otp_secret_key` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `string` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `use_count` int NOT NULL DEFAULT '0',
  `expires_at` datetime DEFAULT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_shortened_urls_on_unique_key` (`unique_key`)
) ENGINE=InnoDB AUTO_INCREMENT=31052 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `specialisation_masters`
--

DROP TABLE IF EXISTS `specialisation_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `specialisation_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `specialisation_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `specialisation_desc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dummy1` int DEFAULT NULL,
  `specialist` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon_img` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `effctv_dt` datetime NOT NULL,
  `trmntn_dt` datetime DEFAULT NULL,
  `archived_by_id` int DEFAULT NULL,
  `vital_question_ids` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `symptoms` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website_visibility` int DEFAULT '10',
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `og_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `form_master_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_specialisation_masters_on_specialisation_desc` (`specialisation_desc`),
  UNIQUE KEY `index_specialisation_masters_on_specialisation_code` (`specialisation_code`),
  KEY `index_specialisation_masters_on_archive` (`archive`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `state_masters`
--

DROP TABLE IF EXISTS `state_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `state_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `state_nm` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `state_shrt_nm` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `country_master_id` int NOT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `trmntn_dt` datetime DEFAULT NULL,
  `effctv_dt` datetime NOT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `archived_at` datetime DEFAULT NULL,
  `archived_by_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_state_masters_on_state_nm` (`state_nm`),
  KEY `fk_rails_5c9706ef1b` (`country_master_id`),
  CONSTRAINT `fk_rails_5c9706ef1b` FOREIGN KEY (`country_master_id`) REFERENCES `country_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `status_masters`
--

DROP TABLE IF EXISTS `status_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status_code` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `status_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status_description` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `next_step` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `can_change` tinyint(1) DEFAULT '0',
  `source_activity` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` tinyint(1) DEFAULT '1',
  `trmntn_dt` datetime DEFAULT NULL,
  `effctv_dt` datetime DEFAULT NULL,
  `archive` tinyint(1) DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `archived_by_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_status_masters_on_status_code` (`status_code`),
  UNIQUE KEY `index_status_masters_on_status_name` (`status_name`),
  KEY `index_status_masters_on_created_by_id` (`created_by_id`),
  KEY `index_status_masters_on_updated_by_id` (`updated_by_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `status_relation_details`
--

DROP TABLE IF EXISTS `status_relation_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status_relation_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status_code` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `nxt_status_code` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `surgery_masters`
--

DROP TABLE IF EXISTS `surgery_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `surgery_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `icd_code` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `charge_code_master_id` int DEFAULT NULL,
  `surgery_by_code` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `surgery_system` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `surgery_type` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `service_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT '1',
  `role_master_id` int DEFAULT NULL,
  `surgery_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `preauth_evidence` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `claim_evidence` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `package_amount_arogyasri` decimal(12,2) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `effctv_dt` datetime NOT NULL,
  `trmntn_dt` datetime DEFAULT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `adv_admit_hours` float DEFAULT NULL,
  `expected_admit_hours` float DEFAULT NULL,
  `approx_duration` int DEFAULT NULL,
  `hsncode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_template_pdf_detail_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=526 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tab_contact_details`
--

DROP TABLE IF EXISTS `tab_contact_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tab_contact_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `care_delivery_program_master_id` int DEFAULT NULL,
  `area_master_id` int DEFAULT NULL,
  `location_master_id` int DEFAULT NULL,
  `role_master_id` int NOT NULL,
  `contact_detail_id` int NOT NULL,
  `address_detail_id` int DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_rails_a9990b879e` (`area_master_id`),
  KEY `fk_rails_442bd19f09` (`location_master_id`),
  KEY `fk_rails_8dc2aa4318` (`role_master_id`),
  KEY `fk_rails_014da22824` (`contact_detail_id`),
  KEY `fk_rails_f60f23d24f` (`address_detail_id`),
  KEY `tab_conatct_indexing` (`care_delivery_program_master_id`,`area_master_id`,`location_master_id`),
  CONSTRAINT `fk_rails_014da22824` FOREIGN KEY (`contact_detail_id`) REFERENCES `contact_details` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_442bd19f09` FOREIGN KEY (`location_master_id`) REFERENCES `location_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_58ae846dec` FOREIGN KEY (`care_delivery_program_master_id`) REFERENCES `care_delivery_program_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_8dc2aa4318` FOREIGN KEY (`role_master_id`) REFERENCES `role_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_a9990b879e` FOREIGN KEY (`area_master_id`) REFERENCES `area_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_f60f23d24f` FOREIGN KEY (`address_detail_id`) REFERENCES `address_details` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tab_document_details`
--

DROP TABLE IF EXISTS `tab_document_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tab_document_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `care_delivery_program_master_id` int DEFAULT NULL,
  `location_master_id` int DEFAULT NULL,
  `program_master_id` int DEFAULT NULL,
  `document_type_master_id` int DEFAULT NULL,
  `document_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `img_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_download` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tablet_masters`
--

DROP TABLE IF EXISTS `tablet_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tablet_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `imei_code` varchar(150) CHARACTER SET utf8 DEFAULT NULL,
  `company` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `model_no` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `purchase_dt` datetime DEFAULT NULL,
  `opr_start_dt` datetime DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fcm_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `authentication_token` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `trmntn_dt` datetime DEFAULT NULL,
  `effctv_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `archived_at` datetime DEFAULT NULL,
  `archived_by_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_tablet_masters_on_fcm_token` (`fcm_token`),
  KEY `index_tablet_masters_on_company` (`company`),
  KEY `index_tablet_masters_on_created_by_id` (`created_by_id`),
  KEY `index_tablet_masters_on_updated_by_id` (`updated_by_id`)
) ENGINE=InnoDB AUTO_INCREMENT=491 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `target_masters`
--

DROP TABLE IF EXISTS `target_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `target_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mnth_cnt` int DEFAULT NULL,
  `new_scrn_cnt` int DEFAULT NULL,
  `cumulative_scrn_cnt` int DEFAULT NULL,
  `enrollments` int DEFAULT NULL,
  `cumulative_Er_cnt` int DEFAULT NULL,
  `actv_saathi_cnt` int DEFAULT NULL,
  `target_for` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by_id` smallint DEFAULT NULL,
  `updated_by_id` smallint DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tax_masters`
--

DROP TABLE IF EXISTS `tax_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tax_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tax_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tax_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `effctv_dt` datetime NOT NULL,
  `trmntn_dt` datetime DEFAULT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tax_service_mapping_masters`
--

DROP TABLE IF EXISTS `tax_service_mapping_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tax_service_mapping_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hsncode` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state_master_id` int DEFAULT NULL,
  `service_master_id` int DEFAULT NULL,
  `tax_master_id` int DEFAULT NULL,
  `value` float DEFAULT NULL,
  `cgst` float DEFAULT NULL,
  `sgst` float DEFAULT NULL,
  `igst` float DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `effctv_dt` datetime NOT NULL,
  `trmntn_dt` datetime DEFAULT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tax_service_mapping_uniq_constarint` (`hsncode`,`state_master_id`,`service_master_id`,`cgst`,`sgst`,`igst`)
) ENGINE=InnoDB AUTO_INCREMENT=348 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_doctor_visits`
--

DROP TABLE IF EXISTS `temp_doctor_visits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temp_doctor_visits` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `hospital_master_id` int DEFAULT NULL,
  `doctor_master_id` int DEFAULT NULL,
  `patient_master_id` int DEFAULT NULL,
  `location_master_id` int DEFAULT NULL,
  `status_master_id` int DEFAULT NULL,
  `clinical_status_master_id` int DEFAULT NULL,
  `disease` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `visit_date` datetime DEFAULT NULL,
  `visit_type` int DEFAULT NULL,
  `prescription_img` blob,
  `symptoms` text COLLATE utf8_unicode_ci,
  `diagnosis` text COLLATE utf8_unicode_ci,
  `recommended_labs` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `packages_or_surgeries` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `consultation_fees` int DEFAULT NULL,
  `saathi_accompanied` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cmmts` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `lttd` int DEFAULT NULL,
  `lgtd` int DEFAULT NULL,
  `tblt_crtd_at` datetime DEFAULT NULL,
  `tblt_crtd_by_id` int DEFAULT NULL,
  `proc_updated_at` datetime DEFAULT NULL,
  `patient_prescription_header_id` int DEFAULT NULL,
  `patient_past_prescription_header_id` int DEFAULT NULL,
  `patient_labresult_header_id` int DEFAULT NULL,
  `user_selfrecordtest_detail_id` int DEFAULT NULL,
  `appointment_tracking_id` int DEFAULT NULL,
  `hospital_doctor_id` int DEFAULT NULL,
  `next_visit_dt` datetime DEFAULT NULL,
  `nxt_vst_dur_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nxt_vst_dur` int DEFAULT NULL,
  `emergency_care` tinyint(1) DEFAULT NULL,
  `next_visit_mode` tinyint(1) DEFAULT NULL,
  `referral_hospital_id` int DEFAULT NULL,
  `referral_doctor_id` int DEFAULT NULL,
  `referral_reason` text COLLATE utf8_unicode_ci,
  `ref_doctor_specialisation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `visited_public` tinyint(1) DEFAULT NULL,
  `referred_public` tinyint(1) DEFAULT NULL,
  `lyf_style_chnge_rqd` tinyint(1) DEFAULT NULL,
  `interaction_count` int DEFAULT NULL,
  `is_draft` tinyint(1) DEFAULT '0',
  `accompanied_with` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `health_history` text COLLATE utf8_unicode_ci,
  `langauge_preference_id` int DEFAULT NULL,
  `updates_json` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icd_code_master_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icd_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remotipart_submitted` tinyint(1) DEFAULT '0',
  `comorbidity` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `template_masters`
--

DROP TABLE IF EXISTS `template_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `template_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `activity_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `trmntn_dt` datetime DEFAULT NULL,
  `effctv_dt` datetime NOT NULL DEFAULT '2018-02-20 15:32:42',
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `archived_at` datetime DEFAULT NULL,
  `archived_by_id` int DEFAULT NULL,
  `is_patient` tinyint(1) DEFAULT '1',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_detail_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test_recommendation_masters`
--

DROP TABLE IF EXISTS `test_recommendation_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_recommendation_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `disease_master_id` int NOT NULL,
  `diagnostic_test_master_id` int NOT NULL,
  `lwr_qtrly_cutoff` int DEFAULT NULL,
  `upr_qtrly_cutoff` int DEFAULT NULL,
  `lwr_hyrly_cutoff` int DEFAULT NULL,
  `upr_hyrly_cutoff` int DEFAULT NULL,
  `lst_qtr_lwr_cutoff` int DEFAULT NULL,
  `lst_qtr_upr_cutoff` int DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `trmntn_dt` datetime DEFAULT NULL,
  `effctv_dt` datetime NOT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `archived_at` datetime DEFAULT NULL,
  `archived_by_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rails_a463c8fc68` (`disease_master_id`),
  KEY `fk_rails_f9ff0f3596` (`diagnostic_test_master_id`),
  CONSTRAINT `fk_rails_a463c8fc68` FOREIGN KEY (`disease_master_id`) REFERENCES `disease_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_f9ff0f3596` FOREIGN KEY (`diagnostic_test_master_id`) REFERENCES `diagnostic_test_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tpa_masters`
--

DROP TABLE IF EXISTS `tpa_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tpa_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tpa_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tpa_short_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `registration_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tpa_address_detail_id` int DEFAULT NULL,
  `contact_detail_id` int DEFAULT NULL,
  `parent_company_id` int DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `effctv_dt` datetime DEFAULT NULL,
  `trmntn_dt` datetime DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tpa_xl_header_mapping_masters`
--

DROP TABLE IF EXISTS `tpa_xl_header_mapping_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tpa_xl_header_mapping_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tpa_master_id` int DEFAULT NULL,
  `row_starts_from` int DEFAULT NULL,
  `col_starts_from` int DEFAULT NULL,
  `source_table` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `xl_header_table_mapping` text COLLATE utf8_unicode_ci,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `effctv_dt` datetime DEFAULT NULL,
  `trmntn_dt` datetime DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `translation_word_details`
--

DROP TABLE IF EXISTS `translation_word_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `translation_word_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `translation_word_master_id` int DEFAULT NULL,
  `language_master_id` int DEFAULT NULL,
  `transltd_word` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `index_translation_word_details_on_translation_word_master_id` (`translation_word_master_id`),
  KEY `index_translation_word_details_on_language_master_id` (`language_master_id`),
  CONSTRAINT `fk_rails_45c5dcb680` FOREIGN KEY (`translation_word_master_id`) REFERENCES `translation_word_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_462aa21c63` FOREIGN KEY (`language_master_id`) REFERENCES `language_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `translation_word_masters`
--

DROP TABLE IF EXISTS `translation_word_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `translation_word_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `word` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `language_master_id` int DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `index_translation_word_masters_on_language_master_id` (`language_master_id`),
  CONSTRAINT `fk_rails_5d0c96deaf` FOREIGN KEY (`language_master_id`) REFERENCES `language_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `unit_masters`
--

DROP TABLE IF EXISTS `unit_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unit_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `unit_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `trmntn_dt` datetime DEFAULT NULL,
  `effctv_dt` datetime NOT NULL,
  `archived_by_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_unit_masters_on_unit_name` (`unit_name`),
  KEY `index_unit_masters_on_archive` (`archive`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_activity_details`
--

DROP TABLE IF EXISTS `user_activity_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_activity_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `role_master_id` int DEFAULT NULL,
  `login_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login_device` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `browser_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `app_version` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  `logout_time` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25948 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_add_details`
--

DROP TABLE IF EXISTS `user_add_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_add_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT '1',
  `care_delivery_program_master_id` int DEFAULT NULL,
  `service_master_id` int DEFAULT NULL,
  `add_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bg_color` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `appointment_type_master_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_conversations`
--

DROP TABLE IF EXISTS `user_conversations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_conversations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sender_id` int DEFAULT NULL,
  `recipient_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_group_masters`
--

DROP TABLE IF EXISTS `user_group_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_group_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_group_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `user_group_desc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `trmntn_dt` datetime DEFAULT NULL,
  `effctv_dt` datetime NOT NULL,
  `archived_by_id` int DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_user_group_masters_on_user_group_code` (`user_group_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_messages`
--

DROP TABLE IF EXISTS `user_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `body` text COLLATE utf8_unicode_ci,
  `user_conversation_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `index_user_messages_on_user_conversation_id` (`user_conversation_id`),
  KEY `index_user_messages_on_user_id` (`user_id`),
  CONSTRAINT `fk_rails_45f815858b` FOREIGN KEY (`user_conversation_id`) REFERENCES `user_conversations` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_7025807b7e` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_provider_details`
--

DROP TABLE IF EXISTS `user_provider_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_provider_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `provider_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `provider_uid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `profile_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rails_406068a9b9` (`user_id`),
  CONSTRAINT `fk_rails_406068a9b9` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=1799 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_role_details`
--

DROP TABLE IF EXISTS `user_role_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `role_master_id` int NOT NULL,
  `user_type_id` int DEFAULT NULL,
  `access_ids` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `program_master_ids` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `full_access` tinyint(1) DEFAULT '0',
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fcm_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dashboard_master_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `master_data_access` tinyint(1) DEFAULT '0',
  `is_patient_visible` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_rails_0e2327f326` (`user_id`),
  KEY `fk_rails_81ec0f695d` (`role_master_id`),
  CONSTRAINT `fk_rails_0e2327f326` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_81ec0f695d` FOREIGN KEY (`role_master_id`) REFERENCES `role_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=8266 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_selfrecordtest_details`
--

DROP TABLE IF EXISTS `user_selfrecordtest_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_selfrecordtest_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_master_id` int NOT NULL,
  `selftest_dt` datetime NOT NULL,
  `location_master_id` int DEFAULT NULL,
  `dizzy` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `urntn` int DEFAULT NULL,
  `dry_tnge` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nmbness` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prgnnt` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `weight` decimal(7,2) DEFAULT NULL,
  `waist` int DEFAULT NULL,
  `bmi` float DEFAULT NULL,
  `bp_systlc` int DEFAULT NULL,
  `bp_dstlc` int DEFAULT NULL,
  `bld_sgr_ctgry` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bld_sgr` int DEFAULT NULL,
  `pulse` int DEFAULT NULL,
  `bp_rsk_lvl` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bp_rsk_scr` int DEFAULT NULL,
  `bld_sgr_rsk_lvl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bld_sgr_rsk_scr` int DEFAULT NULL,
  `lttd` decimal(10,7) DEFAULT NULL,
  `lgtd` decimal(10,7) DEFAULT NULL,
  `spo2` int DEFAULT NULL,
  `tmprtur` decimal(5,2) DEFAULT NULL,
  `haemoglobin` decimal(5,2) DEFAULT NULL,
  `hba1c` decimal(5,2) DEFAULT NULL,
  `presc_image_detail_id` int DEFAULT NULL,
  `clndr_image_detail_id` int DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` int DEFAULT NULL,
  `dummy3` decimal(5,2) DEFAULT NULL,
  `dummy4` decimal(5,2) DEFAULT NULL,
  `dummy5` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy6` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy7` decimal(5,2) DEFAULT NULL,
  `dummy8` decimal(5,2) DEFAULT NULL,
  `dummy9` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy10` datetime DEFAULT NULL,
  `cmmts` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tablet_master_id` int DEFAULT NULL,
  `tblt_crtd_at` datetime DEFAULT NULL,
  `tblt_crtd_by_id` int DEFAULT NULL,
  `proc_updated_at` datetime DEFAULT NULL,
  `total_chol` decimal(5,2) DEFAULT NULL,
  `hdl` decimal(5,2) DEFAULT NULL,
  `ldl` decimal(5,2) DEFAULT NULL,
  `triglycerides` decimal(5,2) DEFAULT NULL,
  `t3` decimal(5,2) DEFAULT NULL,
  `t4` decimal(5,2) DEFAULT NULL,
  `tsh` decimal(5,2) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `db_rsk_scr` bigint DEFAULT NULL,
  `htn_systlc_rsk_scr` bigint DEFAULT NULL,
  `htn_dstlc_rsk_scr` bigint DEFAULT NULL,
  `ob_rsk_scr` bigint DEFAULT NULL,
  `alchl` tinyint(1) DEFAULT '0',
  `exercise_frq` float DEFAULT NULL,
  `hip` smallint DEFAULT NULL,
  `whr` float DEFAULT NULL,
  `htn_systlc_rght_arm` bigint DEFAULT NULL,
  `htn_dystlc_rght_arm` bigint DEFAULT NULL,
  `fat_pcnt` float DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `hght_ft` int DEFAULT NULL,
  `hght_in` int DEFAULT NULL,
  `height_cms` int DEFAULT NULL,
  `patient_prescription_header_id` int DEFAULT NULL,
  `updates_json` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_selfrecordtest_details_on_selftest_dt` (`selftest_dt`),
  KEY `index_user_selfrecord_on_patient_prescription_header_id` (`patient_prescription_header_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1932 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_type_masters`
--

DROP TABLE IF EXISTS `user_type_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_type_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_type_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `user_type_desc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `trmntn_dt` datetime DEFAULT NULL,
  `effctv_dt` datetime NOT NULL,
  `archived_by_id` int DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_user_type_masters_on_user_type_code` (`user_type_code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fulname` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `frst_nm` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `lst_nm` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dsply_nm` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_type_master_id` int DEFAULT NULL,
  `user_group_master_id` int DEFAULT NULL,
  `gender` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_detail_id` int DEFAULT NULL,
  `department` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `emp_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `role` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `confirmation_sent_at` datetime DEFAULT NULL,
  `unconfirmed_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `failed_attempts` int NOT NULL DEFAULT '0',
  `unlock_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locked_at` datetime DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `patient_master_id` int DEFAULT NULL,
  `authentication_token` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_actv` tinyint(1) NOT NULL DEFAULT '1',
  `otp_secret_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fcm_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `device_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `device_type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `trmntn_dt` datetime DEFAULT NULL,
  `effctv_dt` datetime NOT NULL,
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `referral_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `referred_by_id` int DEFAULT NULL,
  `signature` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cntry_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updates_json` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `web_auth_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`),
  UNIQUE KEY `index_users_on_confirmation_token` (`confirmation_token`),
  UNIQUE KEY `index_users_on_unlock_token` (`unlock_token`),
  UNIQUE KEY `index_users_on_authentication_token` (`authentication_token`),
  KEY `index_users_on_user_type_master_id` (`user_type_master_id`),
  KEY `index_users_on_user_group_master_id` (`user_group_master_id`),
  KEY `index_users_on_image_detail_id` (`image_detail_id`),
  CONSTRAINT `fk_rails_20fae99274` FOREIGN KEY (`user_group_master_id`) REFERENCES `user_group_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_4f27cccacc` FOREIGN KEY (`user_type_master_id`) REFERENCES `user_type_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rails_f4242f1b17` FOREIGN KEY (`image_detail_id`) REFERENCES `image_details` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=12279 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vaccination_schedule_masters`
--

DROP TABLE IF EXISTS `vaccination_schedule_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vaccination_schedule_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `brand_master_id` int DEFAULT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vccne_strt_day_frm_bth` int DEFAULT NULL,
  `vccne_end_day_frm_bth` int DEFAULT NULL,
  `fxd_intrvl_in_days` int DEFAULT NULL,
  `dosage` float DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vaccine_appointment_details`
--

DROP TABLE IF EXISTS `vaccine_appointment_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vaccine_appointment_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_master_id` int DEFAULT NULL,
  `vaccine_master_id` int DEFAULT NULL,
  `brand_master_id` int DEFAULT NULL,
  `vaccine_date` datetime DEFAULT NULL,
  `provider_service_master_id` int DEFAULT NULL,
  `provider_id` int DEFAULT NULL,
  `certificate_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updates_json` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `appointment_tracking_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rails_a89290867f` (`patient_master_id`),
  KEY `fk_rails_318fb8121a` (`vaccine_master_id`),
  KEY `fk_rails_7cc33c79bd` (`brand_master_id`),
  CONSTRAINT `fk_rails_318fb8121a` FOREIGN KEY (`vaccine_master_id`) REFERENCES `vaccine_masters` (`id`),
  CONSTRAINT `fk_rails_7cc33c79bd` FOREIGN KEY (`brand_master_id`) REFERENCES `brand_masters` (`id`),
  CONSTRAINT `fk_rails_a89290867f` FOREIGN KEY (`patient_master_id`) REFERENCES `patient_masters` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=714 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vaccine_masters`
--

DROP TABLE IF EXISTS `vaccine_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vaccine_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vaccine_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `form_master_ids` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `effctv_start_dt` datetime DEFAULT NULL,
  `effctv_end_dt` datetime DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vaccine_provider_relationship_masters`
--

DROP TABLE IF EXISTS `vaccine_provider_relationship_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vaccine_provider_relationship_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `brand_master_id` int DEFAULT NULL,
  `vaccine_master_id` int DEFAULT NULL,
  `hospital_master_id` int DEFAULT NULL,
  `service_master_id` int DEFAULT NULL,
  `provider_id` int DEFAULT NULL,
  `price` float DEFAULT NULL,
  `slot_duration` int DEFAULT NULL,
  `visibility` int DEFAULT NULL,
  `nh_visibility` int DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_rails_58f7736b72` (`brand_master_id`),
  KEY `fk_rails_34501c4a28` (`vaccine_master_id`),
  KEY `fk_rails_ca0c2ed7ec` (`hospital_master_id`),
  KEY `fk_rails_dfa9af7ead` (`service_master_id`),
  CONSTRAINT `fk_rails_34501c4a28` FOREIGN KEY (`vaccine_master_id`) REFERENCES `vaccine_masters` (`id`),
  CONSTRAINT `fk_rails_58f7736b72` FOREIGN KEY (`brand_master_id`) REFERENCES `brand_masters` (`id`),
  CONSTRAINT `fk_rails_ca0c2ed7ec` FOREIGN KEY (`hospital_master_id`) REFERENCES `hospital_masters` (`id`),
  CONSTRAINT `fk_rails_dfa9af7ead` FOREIGN KEY (`service_master_id`) REFERENCES `service_masters` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `video_consultations`
--

DROP TABLE IF EXISTS `video_consultations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `video_consultations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_master_id` int NOT NULL,
  `appointment_tracking_id` int DEFAULT NULL,
  `session_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `access_ids` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `session_strtd_at` datetime DEFAULT NULL,
  `session_end_at` datetime DEFAULT NULL,
  `updates_json` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_video_consultations_on_session_id` (`session_id`),
  KEY `fk_rails_bee618bbdf` (`patient_master_id`),
  CONSTRAINT `fk_rails_bee618bbdf` FOREIGN KEY (`patient_master_id`) REFERENCES `patient_masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=8410 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `w_section_content_details`
--

DROP TABLE IF EXISTS `w_section_content_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `w_section_content_details` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `w_section_master_id` int DEFAULT NULL,
  `section_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content_heading` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `content_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `content_body` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `action_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `action_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_w_section_content_details_on_w_section_master_id` (`w_section_master_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `w_section_mapping_masters`
--

DROP TABLE IF EXISTS `w_section_mapping_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `w_section_mapping_masters` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `website_master_id` int DEFAULT NULL,
  `w_section_master_id` int DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_w_section_mapping_masters_on_website_master_id` (`website_master_id`),
  KEY `index_w_section_mapping_masters_on_w_section_master_id` (`w_section_master_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `w_section_masters`
--

DROP TABLE IF EXISTS `w_section_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `w_section_masters` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `section_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `w_section_type_master_id` int DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `bg_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_w_section_masters_on_w_section_type_master_id` (`w_section_type_master_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `w_section_type_masters`
--

DROP TABLE IF EXISTS `w_section_type_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `w_section_type_masters` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `section_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `website_masters`
--

DROP TABLE IF EXISTS `website_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `website_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `domain_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo_img_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_detail_id` int DEFAULT NULL,
  `contact_detail_id` int DEFAULT NULL,
  `action_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `action_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `theme_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `primary_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `secondary_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `website_package_masters`
--

DROP TABLE IF EXISTS `website_package_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `website_package_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `website_master_id` int DEFAULT NULL,
  `package_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `package_icon_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `package_header` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `package_content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `package_action_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `package_action_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `website_service_masters`
--

DROP TABLE IF EXISTS `website_service_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `website_service_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `website_master_id` int DEFAULT NULL,
  `service_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `service_icon_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `service_header` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `service_content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `service_action_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `service_action_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `website_slider_masters`
--

DROP TABLE IF EXISTS `website_slider_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `website_slider_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website_master_id` int DEFAULT NULL,
  `slider_img_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slider_mobile_img` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slider_header` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slider_content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slider_action_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slider_action_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order_no` int DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wellness_data_type_masters`
--

DROP TABLE IF EXISTS `wellness_data_type_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wellness_data_type_masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `data_type_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `data_type_desc` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `effctv_dt` datetime NOT NULL,
  `trmntn_dt` datetime DEFAULT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `archived_by_id` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `dummy1` int DEFAULT NULL,
  `dummy2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy3` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-06 14:22:23
