-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: db_purchasing
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
-- Table structure for table `items`
--

CREATE DATABASE IF NOT EXISTS db_purchasing;
USE db_purchasing;

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Kode unik, contoh: ITM-0001',
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `category` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ATK, Elektronik, Furnitur, Kebersihan, dll',
  `unit` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'pcs, box, rim, unit, kg, liter, dll',
  `default_vendor_id` bigint unsigned DEFAULT NULL COMMENT 'Logical FK ke vendors.id',
  `last_price` decimal(15,2) DEFAULT NULL COMMENT 'Harga terakhir — diperbarui otomatis saat PO received',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_items_code` (`code`),
  KEY `idx_items_name` (`name`),
  KEY `idx_items_category` (`category`),
  KEY `idx_items_is_active` (`is_active`),
  KEY `idx_items_default_vendor` (`default_vendor_id`),
  CONSTRAINT `fk_items_default_vendor` FOREIGN KEY (`default_vendor_id`) REFERENCES `vendors` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,'ITM-0001','Kertas HVS A4 80gsm','Kertas fotokopi/cetak ukuran A4, gramatur 80gsm, 500 lembar per rim','ATK','rim',1,25000.00,1,'2024-01-20 01:00:00','2026-06-14 10:34:57'),(2,'ITM-0002','Pulpen Ballpoint Hitam','Pulpen tinta hitam, ujung 0.5mm, per dus isi 12 pcs','ATK','dus',1,18000.00,1,'2024-01-20 01:05:00','2024-01-20 01:05:00'),(3,'ITM-0003','Spidol Whiteboard','Spidol untuk papan tulis whiteboard, warna hitam/merah/biru, per set 3 warna','ATK','set',1,22500.00,1,'2024-01-20 01:10:00','2024-01-20 01:10:00'),(4,'ITM-0004','Map Snelhechter Plastik','Map plastik dengan penjepit, ukuran folio, warna transparan','ATK','pcs',1,3500.00,1,'2024-01-20 01:15:00','2024-01-20 01:15:00'),(5,'ITM-0005','Tinta Printer HP 680 Black','Cartridge tinta hitam untuk printer HP DeskJet, original','ATK','pcs',1,95000.00,1,'2024-01-20 01:20:00','2024-01-20 01:20:00'),(6,'ITM-0006','Staples No. 10','Staples ukuran No.10, per kotak isi 1000 buah','ATK','box',1,8500.00,1,'2024-01-20 01:25:00','2024-01-20 01:25:00'),(7,'ITM-0007','Laptop Lenovo ThinkPad E14','Laptop bisnis 14 inch, Intel Core i5 Gen 12, RAM 8GB, SSD 512GB, Windows 11 Pro','Elektronik','unit',2,8500000.00,1,'2024-02-01 02:00:00','2024-02-01 02:00:00'),(8,'ITM-0008','Monitor LED 22 inch','Monitor LED Full HD 1920x1080, panel IPS, HDMI+VGA, merk LG/Samsung','Elektronik','unit',2,1850000.00,1,'2024-02-01 02:05:00','2024-02-01 02:05:00'),(9,'ITM-0009','Mouse Wireless Logitech M185','Mouse nirkabel 2.4GHz, USB nano receiver, baterai AA, plug-and-play','Elektronik','pcs',2,125000.00,1,'2024-02-01 02:10:00','2024-02-01 02:10:00'),(10,'ITM-0010','Keyboard USB Standar','Keyboard kabel USB membrane, layout Indonesia, compatible Windows/Linux','Elektronik','pcs',2,95000.00,1,'2024-02-01 02:15:00','2024-02-01 02:15:00'),(11,'ITM-0011','UPS 650VA','Uninterruptible Power Supply 650VA/360W, 4 output socket, proteksi lonjakan arus','Elektronik','unit',2,650000.00,1,'2024-02-01 02:20:00','2024-02-01 02:20:00'),(12,'ITM-0012','Printer Epson L3210','Printer inkjet multifungsi (print/scan/copy), sistem ink tank, A4','Elektronik','unit',2,2350000.00,1,'2024-02-01 02:25:00','2024-02-01 02:25:00'),(13,'ITM-0013','Kursi Kerja Ergonomis','Kursi kantor dengan sandaran punggung adjustable, dudukan busa tebal, roda 5 kaki','Furnitur','unit',3,1250000.00,1,'2024-02-15 01:00:00','2024-02-15 01:00:00'),(14,'ITM-0014','Meja Kerja 120x60cm','Meja kerja kayu MDF finishing HPL, ukuran 120x60x75cm, warna coklat/hitam','Furnitur','unit',3,850000.00,1,'2024-02-15 01:05:00','2024-02-15 01:05:00'),(15,'ITM-0015','Lemari Arsip 2 Pintu','Lemari penyimpanan dokumen 2 pintu kaca, kunci, 4 rak, ukuran 90x40x180cm','Furnitur','unit',3,1750000.00,1,'2024-02-15 01:10:00','2024-02-15 01:10:00'),(16,'ITM-0016','Papan Tulis Whiteboard 120x80cm','Whiteboard magnetic, frame aluminium, ukuran 120x80cm, lengkap dengan tray spidol','Furnitur','unit',3,350000.00,1,'2024-02-15 01:15:00','2024-02-15 01:15:00'),(17,'ITM-0017','Sabun Cuci Tangan Cair 500ml','Sabun cuci tangan antibakteri, refill 500ml, aroma lemon/lavender','Kebersihan','pcs',4,18000.00,1,'2024-03-01 01:00:00','2024-03-01 01:00:00'),(18,'ITM-0018','Tisu Facial Box 200 lembar','Tisu wajah lembut, 2 ply, per kotak 200 lembar, merk Tessa/Paseo','Kebersihan','box',4,12500.00,1,'2024-03-01 01:05:00','2024-03-01 01:05:00'),(19,'ITM-0019','Cairan Pembersih Lantai 1 Liter','Cairan pel lantai antiseptik, aroma pine/citrus, konsentrat 1 liter','Kebersihan','liter',4,22000.00,1,'2024-03-01 01:10:00','2024-03-01 01:10:00'),(20,'ITM-0020','Kantong Sampah Hitam 60x100cm','Kantong sampah plastik hitam tebal, ukuran 60x100cm, per roll isi 10 lembar','Kebersihan','roll',4,8000.00,1,'2024-03-01 01:15:00','2024-03-01 01:15:00'),(21,'ITM-0021','Hand Sanitizer 500ml','Hand sanitizer gel alkohol 70%, botol pump 500ml','Kebersihan','pcs',4,35000.00,1,'2024-03-01 01:20:00','2024-03-01 01:20:00'),(22,'ITM-0022','Air Mineral Galon 19L',NULL,'Konsumsi','pcs',5,22000.00,1,'2024-03-10 01:00:00','2026-06-13 23:01:51'),(23,'ITM-0023','Kopi Sachet per Dus','Kopi instan sachet, per dus isi 20 sachet, merk Nescafe/Kapal Api','Konsumsi','dus',5,2500.00,1,'2024-03-10 01:05:00','2026-06-14 03:24:06'),(24,'ITM-0024','Gula Pasir 1 kg',NULL,'Konsumsi','pcs',5,16000.00,1,'2024-03-10 01:10:00','2026-06-13 23:34:29'),(25,'ITM-0025','Snack Box Rapat (per paket)','Paket snack rapat: 1 minuman + 2 kue, siap saji, minimal order 10 paket','Konsumsi','paket',5,25000.00,1,'2024-03-10 01:15:00','2024-03-10 01:15:00'),(26,'ITM-0026','Lampu LED 10W Philips','Lampu LED bulb 10 Watt, cahaya putih 6500K, base E27, usia pakai 15.000 jam','Spare Part','pcs',7,32000.00,1,'2024-04-01 01:00:00','2024-04-01 01:00:00'),(27,'ITM-0027','Stop Kontak 4 Lubang + Kabel 3m','Stop kontak/terminal listrik 4 lubang, kabel 3 meter, dilengkapi saklar on/off','Spare Part','pcs',7,55000.00,1,'2024-04-01 01:05:00','2024-04-01 01:05:00'),(28,'ITM-0028','Filter AC Split 1/2 PK','Filter udara pengganti AC split kapasitas 1/2 hingga 1 PK, universal','Spare Part','pcs',7,45000.00,1,'2024-04-01 01:10:00','2026-06-14 10:44:33'),(29,'ITM-0029','Banner Roll-Up 60x160cm','Banner promosi roll-up, bahan albatros 340gsm, frame aluminium, full colour','Promosi','pcs',8,185000.00,1,'2024-04-15 01:00:00','2024-04-15 01:00:00'),(30,'ITM-0030','Nota / Faktur NCR 3 Ply','Nota penjualan NCR 3 rangkap, ukuran 1/4 folio, per buku isi 50 lembar, custom logo','ATK','buku',1,NULL,0,'2023-12-01 01:00:00','2024-05-31 17:00:00'),(31,'MED-0001','Kotak P3K Kantor','Kotak P3K lengkap sesuai standar K3 untuk kebutuhan kantor.','Kesehatan','unit',10,350000.00,1,'2026-06-14 16:27:48','2026-06-14 16:27:48'),(32,'MED-0002','Masker Medis 3 Ply (Box)','Masker medis sekali pakai isi 50 pcs.','Kesehatan','box',10,45000.00,1,'2026-06-14 16:27:48','2026-06-14 16:27:48'),(33,'MED-0003','Obat P3K Lengkap','Paket obat dan perlengkapan P3K untuk operasional kantor.','Kesehatan','set',10,275000.00,1,'2026-06-14 16:27:48','2026-06-14 16:27:48'),(34,'MED-0004','Digital Thermometer','Thermometer digital inframerah untuk pemeriksaan suhu tubuh.','Kesehatan','pcs',10,185000.00,1,'2026-06-14 16:27:48','2026-06-14 16:27:48');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `po_number_sequences`
--

DROP TABLE IF EXISTS `po_number_sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `po_number_sequences` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` smallint NOT NULL,
  `last_seq` int unsigned NOT NULL DEFAULT '0',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_seq_branch_year` (`branch_code`,`year`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `po_number_sequences`
--

LOCK TABLES `po_number_sequences` WRITE;
/*!40000 ALTER TABLE `po_number_sequences` DISABLE KEYS */;
/*!40000 ALTER TABLE `po_number_sequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_order_items`
--

DROP TABLE IF EXISTS `purchase_order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase_order_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `purchase_order_id` bigint unsigned NOT NULL,
  `item_id` bigint unsigned NOT NULL,
  `item_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Snapshot nama item saat PO dibuat',
  `quantity` decimal(10,2) NOT NULL,
  `unit` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Snapshot satuan dari items.unit',
  `unit_price` decimal(15,2) NOT NULL,
  `subtotal` decimal(15,2) NOT NULL COMMENT 'quantity × unit_price — dihitung otomatis',
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_poi_po_id` (`purchase_order_id`),
  KEY `idx_poi_item_id` (`item_id`),
  CONSTRAINT `fk_poi_item` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`),
  CONSTRAINT `fk_poi_po` FOREIGN KEY (`purchase_order_id`) REFERENCES `purchase_orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_order_items`
--

LOCK TABLES `purchase_order_items` WRITE;
/*!40000 ALTER TABLE `purchase_order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase_order_items` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_poi_subtotal_insert` BEFORE INSERT ON `purchase_order_items` FOR EACH ROW BEGIN

    SET NEW.subtotal = NEW.quantity * NEW.unit_price;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_po_total_after_poi_insert` AFTER INSERT ON `purchase_order_items` FOR EACH ROW BEGIN

    UPDATE purchase_orders

    SET total_amount = (

        SELECT COALESCE(SUM(subtotal), 0)

        FROM purchase_order_items

        WHERE purchase_order_id = NEW.purchase_order_id

    )

    WHERE id = NEW.purchase_order_id;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_poi_subtotal_update` BEFORE UPDATE ON `purchase_order_items` FOR EACH ROW BEGIN

    SET NEW.subtotal = NEW.quantity * NEW.unit_price;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_po_total_after_poi_update` AFTER UPDATE ON `purchase_order_items` FOR EACH ROW BEGIN

    UPDATE purchase_orders

    SET total_amount = (

        SELECT COALESCE(SUM(subtotal), 0)

        FROM purchase_order_items

        WHERE purchase_order_id = NEW.purchase_order_id

    )

    WHERE id = NEW.purchase_order_id;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_po_total_after_poi_delete` AFTER DELETE ON `purchase_order_items` FOR EACH ROW BEGIN

    UPDATE purchase_orders

    SET total_amount = (

        SELECT COALESCE(SUM(subtotal), 0)

        FROM purchase_order_items

        WHERE purchase_order_id = OLD.purchase_order_id

    )

    WHERE id = OLD.purchase_order_id;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `purchase_orders`
--

DROP TABLE IF EXISTS `purchase_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase_orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `po_number` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Format: PO/{KODE_CABANG}/{TAHUN}/{NOMOR_URUT}',
  `branch_id` bigint unsigned NOT NULL COMMENT 'Logical ref ke db_hrm.branches.id',
  `branch_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Snapshot nama cabang saat PO dibuat',
  `branch_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Snapshot kode cabang saat PO dibuat',
  `vendor_id` bigint unsigned NOT NULL,
  `requested_by` bigint unsigned NOT NULL COMMENT 'user_id pengaju (dari JWT claim)',
  `status` enum('draft','submitted','approved','rejected','received','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draft',
  `tanggal_po` date NOT NULL,
  `tanggal_dibutuhkan` date DEFAULT NULL,
  `tanggal_pengiriman` date DEFAULT NULL COMMENT 'Tanggal realisasi pengiriman dari vendor',
  `total_amount` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT 'Dihitung dari po_items',
  `catatan` text COLLATE utf8mb4_unicode_ci,
  `rejection_reason` text COLLATE utf8mb4_unicode_ci COMMENT 'Wajib diisi saat rejected',
  `approved_by` bigint unsigned DEFAULT NULL COMMENT 'user_id yang menyetujui',
  `approved_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_po_number` (`po_number`),
  KEY `idx_po_branch_id` (`branch_id`),
  KEY `idx_po_vendor_id` (`vendor_id`),
  KEY `idx_po_status` (`status`),
  KEY `idx_po_requested_by` (`requested_by`),
  KEY `idx_po_tanggal_po` (`tanggal_po`),
  KEY `idx_po_branch_status` (`branch_id`,`status`),
  CONSTRAINT `fk_po_vendor` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_orders`
--

LOCK TABLES `purchase_orders` WRITE;
/*!40000 ALTER TABLE `purchase_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase_orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_update_last_price_on_received` AFTER UPDATE ON `purchase_orders` FOR EACH ROW BEGIN

    IF NEW.status = 'received' AND OLD.status != 'received' THEN

        UPDATE items i

        INNER JOIN purchase_order_items poi ON poi.item_id = i.id

        SET i.last_price = poi.unit_price,

            i.updated_at = NOW()

        WHERE poi.purchase_order_id = NEW.id;

    END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `vendors`
--

DROP TABLE IF EXISTS `vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Nama vendor/supplier',
  `code` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Kode unik, contoh: VND-001',
  `contact_person` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `npwp` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_term_days` smallint NOT NULL DEFAULT '30' COMMENT 'Jangka waktu pembayaran (hari)',
  `is_active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=aktif, 0=nonaktif',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_vendors_code` (`code`),
  KEY `idx_vendors_name` (`name`),
  KEY `idx_vendors_is_active` (`is_active`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendors`
--

LOCK TABLES `vendors` WRITE;
/*!40000 ALTER TABLE `vendors` DISABLE KEYS */;
INSERT INTO `vendors` VALUES (1,'PT Sinar Stationery Indonesia','VND-001','Andi Prasetyo','022-4201001','sales@ssi.co.id','Jl. Soekarno Hatta No. 120, Bandung','01.111.222.3-444.000',30,1,'2026-06-14 16:29:29','2026-06-14 16:29:29'),(2,'PT Teknologi Komputama Nusantara','VND-002','Budi Santoso','021-5501234','marketing@teknokomputama.co.id','Jl. Gatot Subroto Kav. 55, Jakarta','02.222.333.4-555.000',30,1,'2026-06-14 16:29:29','2026-06-14 16:29:29'),(3,'PT Furnindo Kreasi Office','VND-003','Rizky Kurniawan','024-7654321','sales@furnindo.co.id','Jl. Pemuda No. 88, Semarang','03.333.444.5-666.000',45,1,'2026-06-14 16:29:29','2026-06-14 16:29:29'),(4,'PT Hygiene Solusi Indonesia','VND-004','Yulia Maharani','022-6012345','cs@hygienesolusi.co.id','Jl. Kopo Permai No. 77, Bandung','04.444.555.6-777.000',14,1,'2026-06-14 16:29:29','2026-06-14 16:29:29'),(5,'PT Konsumsi Prima Sejahtera','VND-005','Dian Permatasari','0812-3456-7890','sales@konsumsi-prima.co.id','Jl. Otto Iskandardinata No. 33, Bandung','05.555.666.7-888.000',14,1,'2026-06-14 16:29:29','2026-06-14 16:29:29'),(6,'PT Office Supply Nusantara','VND-006','Rina Amelia','021-88889999','order@officesupply.co.id','Jl. Palmerah Selatan No. 25, Jakarta Barat','06.666.777.8-999.000',30,1,'2026-06-14 16:29:29','2026-06-14 16:29:29'),(7,'PT Indo Teknik Electrical','VND-007','Fajar Nugroho','031-4567890','support@indoteknikelectrical.co.id','Jl. Rungkut Industri No. 10, Surabaya','07.777.888.9-111.000',30,1,'2026-06-14 16:29:29','2026-06-14 16:29:29'),(8,'PT Digital Printing Media','VND-008','Melissa Anggraini','022-2109876','sales@digitalprintingmedia.co.id','Jl. Braga No. 18, Bandung','08.888.999.0-222.000',30,1,'2026-06-14 16:29:29','2026-06-14 16:29:29'),(9,'PT Cepat Kirim Logistik Indonesia','VND-009','Rudi Hartono','0811-9876-5432','rudi@cepatkirim.co.id','Jl. Gatot Subroto No. 45, Jakarta Selatan','09.999.111.2-333.000',21,1,'2026-06-14 16:29:29','2026-06-14 16:29:29'),(10,'PT Faruqi Medika Amanah','VND-010','Faruq Hidayat','021-7700123','sales@medikasehat.co.id','Jl. RS Fatmawati No. 99, Jakarta Selatan','10.111.222.3-444.000',30,1,'2026-06-14 16:29:29','2026-06-14 16:29:50');
/*!40000 ALTER TABLE `vendors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'db_purchasing'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_next_po_number` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_next_po_number`(

    IN  p_branch_code VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,

    IN  p_year        SMALLINT,

    OUT p_po_number   VARCHAR(50)

)
BEGIN

    DECLARE v_seq INT UNSIGNED DEFAULT 0;



    INSERT INTO po_number_sequences (branch_code, year, last_seq)

    VALUES (p_branch_code, p_year, 1)

    ON DUPLICATE KEY UPDATE last_seq = last_seq + 1;



    SELECT last_seq INTO v_seq

    FROM po_number_sequences

    WHERE branch_code = p_branch_code AND year = p_year;



    SET p_po_number = CONCAT('PO/', p_branch_code, '/', p_year, '/', LPAD(v_seq, 4, '0'));

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-14 23:40:24
