-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: db_hrm
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `branches`
--

CREATE DATABASE IF NOT EXISTS db_hrm;
USE db_hrm;

DROP TABLE IF EXISTS `branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branches` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Contoh: Bandung, Garut, Sukabumi',
  `code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Kode unik, contoh: BDG, GRT, SKB',
  `parent_id` bigint unsigned DEFAULT NULL COMMENT 'FK ke branches.id (hierarki wilayah)',
  `address` text COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=aktif, 0=nonaktif',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_branches_code` (`code`),
  KEY `idx_branches_parent_id` (`parent_id`),
  KEY `idx_branches_is_active` (`is_active`),
  CONSTRAINT `fk_branches_parent` FOREIGN KEY (`parent_id`) REFERENCES `branches` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branches`
--

LOCK TABLES `branches` WRITE;
/*!40000 ALTER TABLE `branches` DISABLE KEYS */;
INSERT INTO `branches` VALUES (1,'Kantor Pusat','HQ',NULL,'Jakarta',1,'2026-06-11 00:24:34','2026-06-11 00:24:34'),(2,'Area Jawa Barat','JBR',1,'Bandung',1,'2026-06-11 00:24:34','2026-06-11 00:24:34'),(3,'Cabang Bandung','BDG',2,'Jl. Sudirman No.1 Bandung',1,'2026-06-11 00:24:34','2026-06-11 00:24:34'),(4,'Cabang Garut','GRT',2,'Jl. Ahmad Yani No.5 Garut',1,'2026-06-11 00:24:34','2026-06-11 00:24:34'),(5,'Cabang Sukabumi','SKB',2,'Jl. Merdeka No.3 Sukabumi',1,'2026-06-11 00:24:34','2026-06-11 00:24:34'),(8,'Cabang Tasik','TSK',2,'Kantor Utama',1,'2026-06-13 21:14:21','2026-06-13 21:14:21');
/*!40000 ALTER TABLE `branches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL COMMENT 'Logical ref to db_auth.users.id',
  `nama_lengkap` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nomor_induk_karyawan` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Format: YYYY.MM.XXXXX — unik',
  `alamat` text COLLATE utf8mb4_unicode_ci,
  `branch_id` bigint unsigned NOT NULL,
  `position_id` bigint unsigned NOT NULL,
  `tanggal_gabung` date NOT NULL,
  `tanggal_mulai_kontrak` date NOT NULL,
  `tanggal_akhir_kontrak` date DEFAULT NULL COMMENT 'NULL = karyawan tetap',
  `status` enum('aktif','nonaktif','kontrak_berakhir') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'aktif',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT 'Soft delete timestamp',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_employees_nik` (`nomor_induk_karyawan`),
  KEY `idx_employees_user_id` (`user_id`),
  KEY `idx_employees_branch_id` (`branch_id`),
  KEY `idx_employees_position_id` (`position_id`),
  KEY `idx_employees_status` (`status`),
  KEY `idx_employees_akhir_kontrak` (`tanggal_akhir_kontrak`),
  KEY `idx_employees_deleted_at` (`deleted_at`),
  CONSTRAINT `fk_employees_branch` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`),
  CONSTRAINT `fk_employees_position` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,1,'Budi Santoso','2024.01.00001','Jl. Cihampelas No. 12, Bandung',3,2,'2024-01-15','2024-01-15',NULL,'aktif',NULL,'2024-01-15 01:00:00','2024-01-15 01:00:00'),(2,2,'Dewi Rahayu','2024.02.00002','Jl. Buah Batu No. 45, Bandung',3,3,'2024-02-01','2024-02-01','2026-02-01','aktif',NULL,'2024-02-01 01:00:00','2024-02-01 01:00:00'),(3,3,'Rizky Firmansyah','2024.03.00003','Jl. Dipatiukur No. 7, Bandung',3,4,'2024-03-10','2024-03-10','2025-09-10','kontrak_berakhir',NULL,'2024-03-10 01:00:00','2025-09-10 17:00:00'),(4,4,'Siti Nurhaliza','2024.04.00004','Jl. Ahmad Yani No. 88, Garut',4,7,'2024-04-05','2024-04-05',NULL,'aktif',NULL,'2024-04-05 01:00:00','2024-04-05 01:00:00'),(5,5,'Ahmad Fauzi','2024.05.00005','Jl. Merdeka No. 22, Sukabumi',5,10,'2024-05-20','2024-05-20','2026-07-11','aktif',NULL,'2024-05-20 01:00:00','2024-05-20 01:00:00');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positions`
--

DROP TABLE IF EXISTS `positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `positions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Contoh: Staff IT, Supervisor IT, Manager IT',
  `level` tinyint NOT NULL COMMENT '1=Staff, 2=Supervisor, 3=Manager, 4=Direktur',
  `division` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Contoh: Operasional, Supporting, Finance, IT',
  `parent_position_id` bigint unsigned DEFAULT NULL COMMENT 'FK ke positions.id (hierarki atasan)',
  `branch_id` bigint unsigned DEFAULT NULL COMMENT 'Scope jabatan per cabang (NULL = global)',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_positions_level` (`level`),
  KEY `idx_positions_division` (`division`),
  KEY `idx_positions_branch_id` (`branch_id`),
  KEY `idx_positions_parent_position` (`parent_position_id`),
  CONSTRAINT `fk_positions_branch` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_positions_parent` FOREIGN KEY (`parent_position_id`) REFERENCES `positions` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions`
--

LOCK TABLES `positions` WRITE;
/*!40000 ALTER TABLE `positions` DISABLE KEYS */;
INSERT INTO `positions` VALUES (1,'Direktur Operasional',4,'Operasional',NULL,NULL,'2026-06-11 00:24:34','2026-06-11 00:24:34'),(2,'Manager IT',3,'IT',1,NULL,'2026-06-11 00:24:34','2026-06-11 00:24:34'),(3,'Supervisor IT',2,'IT',2,NULL,'2026-06-11 00:24:34','2026-06-11 00:24:34'),(4,'Staff IT',1,'IT',3,NULL,'2026-06-11 00:24:34','2026-06-11 00:24:34'),(5,'Manager Finance',3,'Finance',1,NULL,'2026-06-11 00:24:34','2026-06-11 00:24:34'),(6,'Supervisor Finance',2,'Finance',5,NULL,'2026-06-11 00:24:34','2026-06-11 00:24:34'),(7,'Staff Finance',1,'Finance',6,NULL,'2026-06-11 00:24:34','2026-06-11 00:24:34'),(8,'Manager Operasional',3,'Operasional',1,NULL,'2026-06-11 00:24:34','2026-06-11 00:24:34'),(9,'Supervisor Operasional',2,'Operasional',8,NULL,'2026-06-11 00:24:34','2026-06-11 00:24:34'),(10,'Staff Operasional',1,'Operasional',9,NULL,'2026-06-11 00:24:34','2026-06-11 00:24:34');
/*!40000 ALTER TABLE `positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'db_hrm'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-14 23:40:24
