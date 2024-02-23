-- MariaDB dump 10.19  Distrib 10.4.27-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: sekolahku
-- ------------------------------------------------------
-- Server version	10.4.27-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbl_artikel`
--

DROP TABLE IF EXISTS `tbl_artikel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_artikel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `judul` varchar(255) DEFAULT NULL,
  `isi` text DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `id_kategori` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_kategori` (`id_kategori`),
  CONSTRAINT `tbl_artikel_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `tbl_kategori_artikel` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_artikel`
--

LOCK TABLES `tbl_artikel` WRITE;
/*!40000 ALTER TABLE `tbl_artikel` DISABLE KEYS */;
INSERT INTO `tbl_artikel` VALUES (18,'Coba artikel pertama web','<p>Ini adalah artikel percobaan</p>','2023-12-08','20231208-coba-artikel-pertama-web.jpg',3);
/*!40000 ALTER TABLE `tbl_artikel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_bukutamu`
--

DROP TABLE IF EXISTS `tbl_bukutamu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_bukutamu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(80) DEFAULT NULL,
  `email` varchar(90) DEFAULT NULL,
  `isi` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_bukutamu`
--

LOCK TABLES `tbl_bukutamu` WRITE;
/*!40000 ALTER TABLE `tbl_bukutamu` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_bukutamu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_ekskul`
--

DROP TABLE IF EXISTS `tbl_ekskul`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_ekskul` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_ekskul` varchar(50) DEFAULT NULL,
  `pembina` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pembina` (`pembina`),
  CONSTRAINT `tbl_ekskul_ibfk_1` FOREIGN KEY (`pembina`) REFERENCES `tbl_guru` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ekskul`
--

LOCK TABLES `tbl_ekskul` WRITE;
/*!40000 ALTER TABLE `tbl_ekskul` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_ekskul` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_guru`
--

DROP TABLE IF EXISTS `tbl_guru`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_guru` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) DEFAULT NULL,
  `nip` int(10) DEFAULT NULL,
  `jenis_kelamin` enum('L','P') DEFAULT NULL,
  `no_hp` varchar(12) DEFAULT NULL,
  `tempat_lahir` varchar(50) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `mata_pelajaran` varchar(50) DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_guru`
--

LOCK TABLES `tbl_guru` WRITE;
/*!40000 ALTER TABLE `tbl_guru` DISABLE KEYS */;
INSERT INTO `tbl_guru` VALUES (15,'Muhammad',2111222211,'L','082156978782','Rantau, kalimantan selatan, Indonesia','1998-06-27','TIK','Jalan Liangangang, kalsel','muhammad.jpg');
/*!40000 ALTER TABLE `tbl_guru` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_jurusan`
--

DROP TABLE IF EXISTS `tbl_jurusan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_jurusan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_jurusan` varchar(30) DEFAULT NULL,
  `ka_prodi` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_jurusan_ibfk_1` (`ka_prodi`),
  CONSTRAINT `tbl_jurusan_ibfk_1` FOREIGN KEY (`ka_prodi`) REFERENCES `tbl_guru` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_jurusan`
--

LOCK TABLES `tbl_jurusan` WRITE;
/*!40000 ALTER TABLE `tbl_jurusan` DISABLE KEYS */;
INSERT INTO `tbl_jurusan` VALUES (9,'Teknologi Informasi Komputer',15);
/*!40000 ALTER TABLE `tbl_jurusan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_kategori_artikel`
--

DROP TABLE IF EXISTS `tbl_kategori_artikel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_kategori_artikel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_kategori` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_kategori_artikel`
--

LOCK TABLES `tbl_kategori_artikel` WRITE;
/*!40000 ALTER TABLE `tbl_kategori_artikel` DISABLE KEYS */;
INSERT INTO `tbl_kategori_artikel` VALUES (3,'Kegiatan Sekolah'),(10,'Event');
/*!40000 ALTER TABLE `tbl_kategori_artikel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_pengguna`
--

DROP TABLE IF EXISTS `tbl_pengguna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_pengguna` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_pengguna`
--

LOCK TABLES `tbl_pengguna` WRITE;
/*!40000 ALTER TABLE `tbl_pengguna` DISABLE KEYS */;
INSERT INTO `tbl_pengguna` VALUES (4,'Muhammad','admin','$2y$10$wbTNow52vp/bPtseHDKyku7WeZBerhoXggW0Fk3krDn3h72Heho1C','muhammad.jpg');
/*!40000 ALTER TABLE `tbl_pengguna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_siswa`
--

DROP TABLE IF EXISTS `tbl_siswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_siswa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) DEFAULT NULL,
  `nis` int(4) DEFAULT NULL,
  `jenis_kelamin` enum('L','P') DEFAULT NULL,
  `tempat_lahir` varchar(80) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `no_hp` varchar(12) DEFAULT NULL,
  `foto` varchar(120) DEFAULT NULL,
  `id_jurusan` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_jurusan` (`id_jurusan`),
  CONSTRAINT `tbl_siswa_ibfk_1` FOREIGN KEY (`id_jurusan`) REFERENCES `tbl_jurusan` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_siswa`
--

LOCK TABLES `tbl_siswa` WRITE;
/*!40000 ALTER TABLE `tbl_siswa` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_siswa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tentang_website`
--

DROP TABLE IF EXISTS `tbl_tentang_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_tentang_website` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tentang_website` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tentang_website`
--

LOCK TABLES `tbl_tentang_website` WRITE;
/*!40000 ALTER TABLE `tbl_tentang_website` DISABLE KEYS */;
INSERT INTO `tbl_tentang_website` VALUES (1,'<p>test</p>');
/*!40000 ALTER TABLE `tbl_tentang_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_visi_misi`
--

DROP TABLE IF EXISTS `tbl_visi_misi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_visi_misi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visi_misi` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_visi_misi`
--

LOCK TABLES `tbl_visi_misi` WRITE;
/*!40000 ALTER TABLE `tbl_visi_misi` DISABLE KEYS */;
INSERT INTO `tbl_visi_misi` VALUES (1,'<p>Visi SLB Negeri 3 Martapura</p><p>Visi SLB A Negeri 3 Martapura adalah</p><p>Mewujudkan Siswa Berkarakter, Berkompeten, Serta Mampu Menembus Batas Disabilitas.</p><p>Misi SLB Negeri 3 Martapura</p><p>1.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Mewujudkan lulusan yang unggul dalam bidang akademik dan non akademik.</p><p>2.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Mewujudkan pendidikan yang mengedepankan komunitas belajar sepanjang hayat mulai dari guru, peserta didik, dan orang tua.</p><p>3.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Mewujudkan pendidikan yang mengedepankan pembentukan Profil Pelajar Pancasila.</p><p>4.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Mewujudkan pendidikan yang menjamin hak belajar bagi setiap peserta didik.</p><p>5.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Memfasilitasi pembelajaran dengan mengedepankan persamaan hak &ldquo;carring&rdquo; (peduli) dalam proses pembelajaran, dimana setiap peserta didik dibantu dan dibantu.</p><p>6.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Mewujudkan pendidikan menggunakan pendekatan atau model yang beragam.</p><p>7.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Mewujudkan pendidikan mengembangkan keterampilan abad 21, melakukan kegiatan belajar mengajar mengembangkan sikap kritis, kreatif, kolaboratif, komunikatif, dan melakukan kegiatan belajar mengajar dengan mengintegrasikan literasi dan numerasi.</p>');
/*!40000 ALTER TABLE `tbl_visi_misi` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-24  2:55:45
