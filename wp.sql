-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for wp
CREATE DATABASE IF NOT EXISTS `wp` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `wp`;

-- Dumping structure for table wp.admin
CREATE TABLE IF NOT EXISTS `admin` (
  `id_admin` int NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL,
  PRIMARY KEY (`id_admin`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table wp.alternatif
CREATE TABLE IF NOT EXISTS `alternatif` (
  `id_alternatif` int NOT NULL AUTO_INCREMENT,
  `nama_alternatif` varchar(50) NOT NULL,
  PRIMARY KEY (`id_alternatif`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table wp.hasil
CREATE TABLE IF NOT EXISTS `hasil` (
  `id_hasil` int NOT NULL AUTO_INCREMENT,
  `id_alternatif` int NOT NULL,
  `nilai` decimal(11,11) NOT NULL,
  PRIMARY KEY (`id_hasil`),
  KEY `id_alternatif` (`id_alternatif`),
  CONSTRAINT `hasil_ibfk_1` FOREIGN KEY (`id_alternatif`) REFERENCES `alternatif` (`id_alternatif`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table wp.kriteria
CREATE TABLE IF NOT EXISTS `kriteria` (
  `id_kriteria` int NOT NULL AUTO_INCREMENT,
  `kode_kriteria` varchar(5) NOT NULL,
  `nama_kriteria` varchar(50) NOT NULL,
  `bobot` float NOT NULL DEFAULT '0',
  `tipe` enum('cost','benefit') NOT NULL,
  PRIMARY KEY (`id_kriteria`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table wp.opt_alternatif
CREATE TABLE IF NOT EXISTS `opt_alternatif` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_alternatif` int NOT NULL,
  `id_kriteria` int NOT NULL,
  `id_subkriteria` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_alternatif` (`id_alternatif`),
  KEY `id_kriteria` (`id_kriteria`),
  KEY `id_subkriteria` (`id_subkriteria`),
  CONSTRAINT `opt_alternatif_ibfk_1` FOREIGN KEY (`id_alternatif`) REFERENCES `alternatif` (`id_alternatif`) ON DELETE CASCADE,
  CONSTRAINT `opt_alternatif_ibfk_2` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`) ON DELETE CASCADE,
  CONSTRAINT `opt_alternatif_ibfk_3` FOREIGN KEY (`id_subkriteria`) REFERENCES `subkriteria` (`id_subkriteria`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1 COMMENT='Tabel ini digunakan agar kriteria nya bisa dinamis';

-- Data exporting was unselected.

-- Dumping structure for table wp.subkriteria
CREATE TABLE IF NOT EXISTS `subkriteria` (
  `id_subkriteria` int NOT NULL AUTO_INCREMENT,
  `id_kriteria` int NOT NULL,
  `nama_subkriteria` varchar(50) NOT NULL,
  `bobot` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_subkriteria`),
  KEY `id_kriteria` (`id_kriteria`),
  CONSTRAINT `subkriteria_ibfk_1` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
