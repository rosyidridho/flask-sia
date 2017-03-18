-- MySQL dump 10.13  Distrib 5.7.13, for linux-glibc2.5 (x86_64)
--
-- Host: localhost    Database: sia
-- ------------------------------------------------------
-- Server version	5.7.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `add_krs`
--

DROP TABLE IF EXISTS `add_krs`;
/*!50001 DROP VIEW IF EXISTS `add_krs`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `add_krs` AS SELECT 
 1 AS `kls_1`,
 1 AS `kls_2`,
 1 AS `mkl_2`,
 1 AS `dsn_3`,
 1 AS `mkl_3`,
 1 AS `mkl_4`,
 1 AS `kls_3`,
 1 AS `kls_4`,
 1 AS `kls_6`,
 1 AS `prodi_1`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `fklts_prodi`
--

DROP TABLE IF EXISTS `fklts_prodi`;
/*!50001 DROP VIEW IF EXISTS `fklts_prodi`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `fklts_prodi` AS SELECT 
 1 AS `prodi_1`,
 1 AS `fklts_2`,
 1 AS `prodi_2`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `form_kelas`
--

DROP TABLE IF EXISTS `form_kelas`;
/*!50001 DROP VIEW IF EXISTS `form_kelas`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `form_kelas` AS SELECT 
 1 AS `kls_1`,
 1 AS `kls_2`,
 1 AS `mkl_1`,
 1 AS `mkl_2`,
 1 AS `prodi_2`,
 1 AS `kls_3`,
 1 AS `kls_4`,
 1 AS `kls_6`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `form_makul`
--

DROP TABLE IF EXISTS `form_makul`;
/*!50001 DROP VIEW IF EXISTS `form_makul`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `form_makul` AS SELECT 
 1 AS `mkl_1`,
 1 AS `mkl_2`,
 1 AS `fklts_1`,
 1 AS `fklts_2`,
 1 AS `prodi_1`,
 1 AS `prodi_2`,
 1 AS `mkl_3`,
 1 AS `mkl_4`,
 1 AS `mkl_5`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `form_mhs`
--

DROP TABLE IF EXISTS `form_mhs`;
/*!50001 DROP VIEW IF EXISTS `form_mhs`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `form_mhs` AS SELECT 
 1 AS `mhs_1`,
 1 AS `mhs_2`,
 1 AS `mhs_3`,
 1 AS `fklts_2`,
 1 AS `prodi_1`,
 1 AS `prodi_2`,
 1 AS `mhs_4`,
 1 AS `mhs_5`,
 1 AS `mhs_6`,
 1 AS `mhs_8`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `form_prodi`
--

DROP TABLE IF EXISTS `form_prodi`;
/*!50001 DROP VIEW IF EXISTS `form_prodi`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `form_prodi` AS SELECT 
 1 AS `prodi_1`,
 1 AS `prodi_2`,
 1 AS `fklts_1`,
 1 AS `fklts_2`,
 1 AS `prodi_3`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `input_nilai`
--

DROP TABLE IF EXISTS `input_nilai`;
/*!50001 DROP VIEW IF EXISTS `input_nilai`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `input_nilai` AS SELECT 
 1 AS `mhs_2`,
 1 AS `mhs_3`,
 1 AS `nil_4`,
 1 AS `nil_2`,
 1 AS `nil_3`,
 1 AS `nil_5`,
 1 AS `nil_6`,
 1 AS `nil_7`,
 1 AS `nil_9`,
 1 AS `nil_8`,
 1 AS `nil_1`,
 1 AS `mhs_1`,
 1 AS `kls_1`,
 1 AS `abl_kls_2`,
 1 AS `abl_kls_3`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `kelas_dosen`
--

DROP TABLE IF EXISTS `kelas_dosen`;
/*!50001 DROP VIEW IF EXISTS `kelas_dosen`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `kelas_dosen` AS SELECT 
 1 AS `ampu_1`,
 1 AS `kls_2`,
 1 AS `mkl_2`,
 1 AS `prodi_2`,
 1 AS `mkl_3`,
 1 AS `mkl_4`,
 1 AS `kls_3`,
 1 AS `kls_4`,
 1 AS `dsn_1`,
 1 AS `kls_1`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `khs`
--

DROP TABLE IF EXISTS `khs`;
/*!50001 DROP VIEW IF EXISTS `khs`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `khs` AS SELECT 
 1 AS `nil_1`,
 1 AS `mkl_1`,
 1 AS `mkl_2`,
 1 AS `mkl_3`,
 1 AS `mkl_4`,
 1 AS `kls_2`,
 1 AS `nil_4`,
 1 AS `nil_2`,
 1 AS `nil_3`,
 1 AS `nil_5`,
 1 AS `nil_6`,
 1 AS `nil_7`,
 1 AS `nil_9`,
 1 AS `nil_8`,
 1 AS `mhs_1`,
 1 AS `abl_kls_2`,
 1 AS `abl_kls_3`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `krs`
--

DROP TABLE IF EXISTS `krs`;
/*!50001 DROP VIEW IF EXISTS `krs`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `krs` AS SELECT 
 1 AS `abl_kls_1`,
 1 AS `mkl_2`,
 1 AS `dsn_3`,
 1 AS `kls_2`,
 1 AS `mkl_3`,
 1 AS `mkl_4`,
 1 AS `mhs_1`,
 1 AS `kls_1`,
 1 AS `abl_kls_2`,
 1 AS `abl_kls_3`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `pilih_kelas`
--

DROP TABLE IF EXISTS `pilih_kelas`;
/*!50001 DROP VIEW IF EXISTS `pilih_kelas`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `pilih_kelas` AS SELECT 
 1 AS `dsn_1`,
 1 AS `kls_2`,
 1 AS `mkl_2`,
 1 AS `prodi_2`,
 1 AS `kls_1`,
 1 AS `mkl_3`,
 1 AS `mkl_4`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `prodi_makul`
--

DROP TABLE IF EXISTS `prodi_makul`;
/*!50001 DROP VIEW IF EXISTS `prodi_makul`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `prodi_makul` AS SELECT 
 1 AS `mkl_1`,
 1 AS `prodi_2`,
 1 AS `mkl_2`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `profil_mhs`
--

DROP TABLE IF EXISTS `profil_mhs`;
/*!50001 DROP VIEW IF EXISTS `profil_mhs`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `profil_mhs` AS SELECT 
 1 AS `mhs_1`,
 1 AS `mhs_2`,
 1 AS `mhs_3`,
 1 AS `fklts_2`,
 1 AS `prodi_2`,
 1 AS `mhs_4`,
 1 AS `mhs_5`,
 1 AS `mhs_6`,
 1 AS `mhs_7`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `tambah_kelas`
--

DROP TABLE IF EXISTS `tambah_kelas`;
/*!50001 DROP VIEW IF EXISTS `tambah_kelas`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `tambah_kelas` AS SELECT 
 1 AS `kls_1`,
 1 AS `kls_2`,
 1 AS `mkl_2`,
 1 AS `prodi_2`,
 1 AS `mkl_3`,
 1 AS `mkl_4`,
 1 AS `kls_3`,
 1 AS `kls_4`,
 1 AS `kls_6`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `tb_ambil_kls`
--

DROP TABLE IF EXISTS `tb_ambil_kls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_ambil_kls` (
  `abl_kls_1` int(11) NOT NULL AUTO_INCREMENT,
  `mhs_1` int(11) DEFAULT NULL,
  `kls_1` int(11) DEFAULT NULL,
  `abl_kls_2` varchar(10) DEFAULT NULL,
  `abl_kls_3` varchar(10) DEFAULT NULL,
  `abl_kls_4` datetime DEFAULT NULL,
  PRIMARY KEY (`abl_kls_1`),
  KEY `mhs_1` (`mhs_1`),
  KEY `kls_1` (`kls_1`),
  CONSTRAINT `tb_ambil_kls_ibfk_1` FOREIGN KEY (`mhs_1`) REFERENCES `tb_mhs` (`mhs_1`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_ambil_kls_ibfk_2` FOREIGN KEY (`kls_1`) REFERENCES `tb_kelas` (`kls_1`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_ambil_kls`
--

LOCK TABLES `tb_ambil_kls` WRITE;
/*!40000 ALTER TABLE `tb_ambil_kls` DISABLE KEYS */;
INSERT INTO `tb_ambil_kls` VALUES (1,1,5,'2016/2017','GANJIL','2017-03-18 00:53:30'),(2,1,7,'2016/2017','GANJIL','2017-03-18 00:53:35'),(4,4,7,'2016/2017','GANJIL','2017-03-18 00:54:32'),(5,4,5,'2016/2017','GANJIL','2017-03-18 00:55:05'),(6,2,3,'2016/2017','GANJIL','2017-03-18 00:55:41'),(7,2,4,'2016/2017','GANJIL','2017-03-18 00:55:44'),(8,3,4,'2016/2017','GANJIL','2017-03-18 00:56:25'),(9,3,3,'2016/2017','GANJIL','2017-03-18 00:56:28'),(10,3,1,'2016/2017','GENAP','2017-03-18 01:48:58'),(11,3,2,'2016/2017','GENAP','2017-03-18 01:49:01');
/*!40000 ALTER TABLE `tb_ambil_kls` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER after_ins_tb_ambil_kls
AFTER INSERT ON tb_ambil_kls
FOR EACH ROW
BEGIN
	UPDATE tb_kelas SET kls_4=(kls_4-1) WHERE kls_1=new.kls_1;
    INSERT INTO tb_nilai (abl_kls_1, nil_2, nil_3, nil_4, nil_5, nil_6, nil_7, nil_8, nil_9) VALUES (new.abl_kls_1, 0, 0, 0, 0, "0", "0", 0, "0");
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tb_dosen`
--

DROP TABLE IF EXISTS `tb_dosen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_dosen` (
  `dsn_1` int(11) NOT NULL AUTO_INCREMENT,
  `dsn_2` varchar(30) DEFAULT NULL,
  `dsn_3` varchar(100) DEFAULT NULL,
  `dsn_4` varchar(30) DEFAULT NULL,
  `dsn_5` date DEFAULT NULL,
  `dsn_6` varchar(200) DEFAULT NULL,
  `dsn_7` varchar(100) DEFAULT NULL,
  `dsn_8` datetime DEFAULT NULL,
  PRIMARY KEY (`dsn_1`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_dosen`
--

LOCK TABLES `tb_dosen` WRITE;
/*!40000 ALTER TABLE `tb_dosen` DISABLE KEYS */;
INSERT INTO `tb_dosen` VALUES (1,'DSN20171','Dr. Dosen TI','Yogyakarrta','1982-04-11','ad fuaiufg apsf psfiu','male_cartoon_avatar_by_ahninniah-d6ib8p2.png','2017-03-18 00:16:02'),(2,'DSN20172','Dr. Dosen M','Jakarta','1988-09-15','jagsd faufiaufias f','images_1.jpg','2017-03-18 00:17:00');
/*!40000 ALTER TABLE `tb_dosen` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER create_user_dosen
AFTER INSERT ON tb_dosen
FOR EACH ROW
BEGIN
	INSERT INTO tb_user (usr_2, usr_3, usr_4, usr_5, usr_6, usr_7)
	VALUES (new.dsn_2, new.dsn_2, 3, 1, new.dsn_1, new.dsn_8);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tb_fakultas`
--

DROP TABLE IF EXISTS `tb_fakultas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_fakultas` (
  `fklts_1` int(11) NOT NULL AUTO_INCREMENT,
  `fklts_2` varchar(50) DEFAULT NULL,
  `fklts_3` datetime DEFAULT NULL,
  PRIMARY KEY (`fklts_1`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_fakultas`
--

LOCK TABLES `tb_fakultas` WRITE;
/*!40000 ALTER TABLE `tb_fakultas` DISABLE KEYS */;
INSERT INTO `tb_fakultas` VALUES (1,'Fakultas Bisnis dan Teknologi Informasi','2017-03-17 23:59:38'),(2,'Fakultas Ekonomi','2017-03-18 00:00:05');
/*!40000 ALTER TABLE `tb_fakultas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_kelas`
--

DROP TABLE IF EXISTS `tb_kelas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_kelas` (
  `kls_1` int(11) NOT NULL AUTO_INCREMENT,
  `kls_2` varchar(20) DEFAULT NULL,
  `mkl_1` int(11) DEFAULT NULL,
  `kls_3` int(11) DEFAULT NULL,
  `kls_4` int(11) DEFAULT NULL,
  `kls_5` datetime DEFAULT NULL,
  `kls_6` int(11) DEFAULT NULL,
  PRIMARY KEY (`kls_1`),
  KEY `mkl_1` (`mkl_1`),
  CONSTRAINT `tb_kelas_ibfk_1` FOREIGN KEY (`mkl_1`) REFERENCES `tb_makul` (`mkl_1`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_kelas`
--

LOCK TABLES `tb_kelas` WRITE;
/*!40000 ALTER TABLE `tb_kelas` DISABLE KEYS */;
INSERT INTO `tb_kelas` VALUES (1,'A',6,50,48,'2017-03-18 00:29:11',2),(2,'A',8,50,48,'2017-03-18 00:29:24',2),(3,'A',2,50,48,'2017-03-18 00:29:36',2),(4,'A',4,50,48,'2017-03-18 00:29:53',2),(5,'B',3,50,48,'2017-03-18 00:30:09',1),(6,'B',5,50,50,'2017-03-18 00:30:24',1),(7,'B',1,50,48,'2017-03-18 00:30:58',1),(8,'B',7,50,50,'2017-03-18 00:31:09',1);
/*!40000 ALTER TABLE `tb_kelas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_makul`
--

DROP TABLE IF EXISTS `tb_makul`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_makul` (
  `mkl_1` int(11) NOT NULL AUTO_INCREMENT,
  `prodi_1` int(11) DEFAULT NULL,
  `mkl_2` varchar(100) DEFAULT NULL,
  `mkl_3` int(11) DEFAULT NULL,
  `mkl_4` varchar(10) DEFAULT NULL,
  `mkl_5` datetime DEFAULT NULL,
  PRIMARY KEY (`mkl_1`),
  KEY `prodi_1` (`prodi_1`),
  CONSTRAINT `tb_makul_ibfk_1` FOREIGN KEY (`prodi_1`) REFERENCES `tb_prodi` (`prodi_1`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_makul`
--

LOCK TABLES `tb_makul` WRITE;
/*!40000 ALTER TABLE `tb_makul` DISABLE KEYS */;
INSERT INTO `tb_makul` VALUES (1,1,'APTI 1',2,'1','2017-03-18 00:17:57'),(2,3,'APTI 1',2,'1','2017-03-18 00:18:11'),(3,1,'Algoritma Pemrograman',3,'1','2017-03-18 00:19:36'),(4,3,'Ngitung Pajak',3,'1','2017-03-18 00:19:41'),(5,1,'Pendidikan Agama Islam',2,'2','2017-03-18 00:20:14'),(6,3,'Pendidikan Agama Islam',2,'2','2017-03-18 00:20:36'),(7,1,'Pemrograman Terstruktur',3,'2','2017-03-18 00:21:25'),(8,3,'Keuangan',3,'2','2017-03-18 00:21:52');
/*!40000 ALTER TABLE `tb_makul` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_mhs`
--

DROP TABLE IF EXISTS `tb_mhs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_mhs` (
  `mhs_1` int(11) NOT NULL AUTO_INCREMENT,
  `mhs_2` varchar(30) DEFAULT NULL,
  `mhs_3` varchar(100) DEFAULT NULL,
  `prodi_1` int(11) DEFAULT NULL,
  `mhs_4` varchar(30) DEFAULT NULL,
  `mhs_5` date DEFAULT NULL,
  `mhs_6` varchar(200) DEFAULT NULL,
  `mhs_7` varchar(100) DEFAULT NULL,
  `mhs_8` datetime DEFAULT NULL,
  PRIMARY KEY (`mhs_1`),
  KEY `prodi_1` (`prodi_1`),
  CONSTRAINT `tb_mhs_ibfk_1` FOREIGN KEY (`prodi_1`) REFERENCES `tb_prodi` (`prodi_1`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_mhs`
--

LOCK TABLES `tb_mhs` WRITE;
/*!40000 ALTER TABLE `tb_mhs` DISABLE KEYS */;
INSERT INTO `tb_mhs` VALUES (1,'20171','Aris Supriyanto',1,'Rembang','1995-12-25','sd asugd u iudg a d da diau g','MyAvatar.png','2017-03-18 00:11:40'),(2,'20172','Ayu Dewi',3,'Magelang','1997-04-18','ajd fu gfiu fe fisgf faoufga ifi','Avatar_girl_face.png','2017-03-18 00:12:52'),(3,'20173','Hanief Murdoko',3,'Purwokerto','1996-10-21','dfsidufs df9ps','e061a-4.png','2017-03-18 00:13:50'),(4,'20174','Aji Kurniawan',1,'Klaten','1996-03-10','udgai id asyfdayayf d','Avatar-The-Last-Airbender.png','2017-03-18 00:15:08');
/*!40000 ALTER TABLE `tb_mhs` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER create_user_mhs
AFTER INSERT ON tb_mhs
FOR EACH ROW 
BEGIN
	INSERT INTO tb_user (usr_2, usr_3, usr_4, usr_5, usr_6, usr_7)
	VALUES (new.mhs_2, new.mhs_2, 2, 1, new.mhs_1, new.mhs_8);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tb_nilai`
--

DROP TABLE IF EXISTS `tb_nilai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_nilai` (
  `nil_1` int(11) NOT NULL AUTO_INCREMENT,
  `abl_kls_1` int(11) DEFAULT NULL,
  `nil_2` int(11) DEFAULT NULL,
  `nil_3` int(11) DEFAULT NULL,
  `nil_4` int(11) DEFAULT NULL,
  `nil_5` int(11) DEFAULT NULL,
  `nil_6` varchar(10) DEFAULT NULL,
  `nil_7` varchar(5) DEFAULT NULL,
  `nil_8` int(11) DEFAULT NULL,
  `nil_9` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`nil_1`),
  KEY `abl_kls_1` (`abl_kls_1`),
  CONSTRAINT `tb_nilai_ibfk_1` FOREIGN KEY (`abl_kls_1`) REFERENCES `tb_ambil_kls` (`abl_kls_1`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_nilai`
--

LOCK TABLES `tb_nilai` WRITE;
/*!40000 ALTER TABLE `tb_nilai` DISABLE KEYS */;
INSERT INTO `tb_nilai` VALUES (1,1,90,90,90,14,'91.00','A',12,'4'),(2,2,80,75,80,14,'80.25','A',8,'4'),(4,4,78,80,80,13,'80.59','A',8,'4'),(5,5,90,90,90,13,'90.29','A',12,'4'),(6,6,80,80,80,13,'81.29','A',8,'4'),(7,7,80,86,90,13,'85.39','A',12,'4'),(8,8,75,80,85,12,'79.82','B',9,'3'),(9,9,90,90,90,14,'91.00','A',8,'4'),(10,10,88,88,88,12,'87.77','A',8,'4'),(11,11,98,78,80,12,'86.17','A',12,'4');
/*!40000 ALTER TABLE `tb_nilai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pengampu`
--

DROP TABLE IF EXISTS `tb_pengampu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_pengampu` (
  `ampu_1` int(11) NOT NULL AUTO_INCREMENT,
  `dsn_1` int(11) DEFAULT NULL,
  `kls_1` int(11) DEFAULT NULL,
  `ampu_2` datetime DEFAULT NULL,
  PRIMARY KEY (`ampu_1`),
  KEY `dsn_1` (`dsn_1`),
  KEY `kls_1` (`kls_1`),
  CONSTRAINT `tb_pengampu_ibfk_1` FOREIGN KEY (`dsn_1`) REFERENCES `tb_dosen` (`dsn_1`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_pengampu_ibfk_2` FOREIGN KEY (`kls_1`) REFERENCES `tb_kelas` (`kls_1`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pengampu`
--

LOCK TABLES `tb_pengampu` WRITE;
/*!40000 ALTER TABLE `tb_pengampu` DISABLE KEYS */;
INSERT INTO `tb_pengampu` VALUES (1,1,5,'2017-03-18 00:32:27'),(2,1,6,'2017-03-18 00:32:31'),(3,1,7,'2017-03-18 00:32:34'),(4,1,8,'2017-03-18 00:32:38'),(5,2,4,'2017-03-18 00:37:38'),(6,2,3,'2017-03-18 00:37:42'),(7,2,2,'2017-03-18 00:37:45'),(8,2,1,'2017-03-18 00:37:49');
/*!40000 ALTER TABLE `tb_pengampu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_prodi`
--

DROP TABLE IF EXISTS `tb_prodi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_prodi` (
  `prodi_1` int(11) NOT NULL AUTO_INCREMENT,
  `fklts_1` int(11) DEFAULT NULL,
  `prodi_2` varchar(50) DEFAULT NULL,
  `prodi_3` datetime DEFAULT NULL,
  PRIMARY KEY (`prodi_1`),
  KEY `fklts_1` (`fklts_1`),
  CONSTRAINT `tb_prodi_ibfk_1` FOREIGN KEY (`fklts_1`) REFERENCES `tb_fakultas` (`fklts_1`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_prodi`
--

LOCK TABLES `tb_prodi` WRITE;
/*!40000 ALTER TABLE `tb_prodi` DISABLE KEYS */;
INSERT INTO `tb_prodi` VALUES (1,1,'Teknik Informatika','2017-03-18 00:03:05'),(2,1,'Sistem Informasi','2017-03-18 00:03:40'),(3,2,'Manajemen','2017-03-18 00:04:03'),(4,2,'Akuntansi','2017-03-18 00:11:51');
/*!40000 ALTER TABLE `tb_prodi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_setting`
--

DROP TABLE IF EXISTS `tb_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_setting` (
  `set_1` int(11) NOT NULL AUTO_INCREMENT,
  `set_2` varchar(100) DEFAULT NULL,
  `set_3` varchar(10) DEFAULT NULL,
  `set_4` varchar(10) DEFAULT NULL,
  `set_5` int(11) DEFAULT NULL,
  `set_6` datetime DEFAULT NULL,
  `set_7` varchar(150) DEFAULT NULL,
  `set_8` int(11) DEFAULT NULL,
  PRIMARY KEY (`set_1`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_setting`
--

LOCK TABLES `tb_setting` WRITE;
/*!40000 ALTER TABLE `tb_setting` DISABLE KEYS */;
INSERT INTO `tb_setting` VALUES (1,'Universitas Teknologi Jepara','2016/2017','GANJIL',0,'2017-03-18 00:05:52','1e948700995555f0c7512350c77ab485.jpg',0),(2,'Universitas Teknologi Jepara','2016/2017','GENAP',0,'2017-03-18 00:23:22','1e948700995555f0c7512350c77ab485.jpg',0),(3,'Universitas Teknologi Jepara','2016/2017','GANJIL',0,'2017-03-18 00:23:38','1e948700995555f0c7512350c77ab485.jpg',0),(4,'Universitas Teknologi Jepara','2016/2017','GANJIL',0,'2017-03-18 00:41:56','1e948700995555f0c7512350c77ab485.jpg',1),(5,'Universitas Teknologi Jepara','2016/2017','GENAP',0,'2017-03-18 00:42:17','1e948700995555f0c7512350c77ab485.jpg',1),(6,'Universitas Teknologi Jepara','2016/2017','GANJIL',0,'2017-03-18 00:53:20','1e948700995555f0c7512350c77ab485.jpg',1),(7,'Universitas Teknologi Jepara','2016/2017','GANJIL',0,'2017-03-18 01:46:37','1e948700995555f0c7512350c77ab485.jpg',0),(8,'Universitas Teknologi Jepara','2016/2017','GENAP',0,'2017-03-18 01:47:41','1e948700995555f0c7512350c77ab485.jpg',0),(9,'Universitas Teknologi Jepara','2016/2017','GENAP',0,'2017-03-18 01:47:49','1e948700995555f0c7512350c77ab485.jpg',1),(10,'Universitas Teknologi Jepara','2016/2017','GANJIL',0,'2017-03-18 01:48:11','1e948700995555f0c7512350c77ab485.jpg',1),(11,'Universitas Teknologi Jepara','2016/2017','GENAP',0,'2017-03-18 01:48:51','1e948700995555f0c7512350c77ab485.jpg',1),(12,'Universitas Teknologi Jepara','2016/2017','GENAP',0,'2017-03-18 01:49:14','1e948700995555f0c7512350c77ab485.jpg',0),(13,'Universitas Teknologi Jepara','2016/2017','GENAP',0,'2017-03-18 08:21:32','1e948700995555f0c7512350c77ab485.jpg',1),(14,'Universitas Teknologi Jepara','2016/2017','GENAP',1,'2017-03-18 08:22:46','1e948700995555f0c7512350c77ab485.jpg',0);
/*!40000 ALTER TABLE `tb_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user`
--

DROP TABLE IF EXISTS `tb_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_user` (
  `usr_1` int(11) NOT NULL AUTO_INCREMENT,
  `usr_2` varchar(30) DEFAULT NULL,
  `usr_3` varchar(100) DEFAULT NULL,
  `usr_4` int(11) DEFAULT NULL,
  `usr_5` int(11) DEFAULT NULL,
  `usr_6` int(11) DEFAULT NULL,
  `usr_7` datetime DEFAULT NULL,
  PRIMARY KEY (`usr_1`),
  UNIQUE KEY `usr_2` (`usr_2`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user`
--

LOCK TABLES `tb_user` WRITE;
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` VALUES (1,'admin','admin123',1,1,0,'2017-03-18 06:57:42'),(2,'20171','20171',2,1,1,'2017-03-18 00:11:40'),(3,'20172','20172',2,1,2,'2017-03-18 00:12:52'),(4,'20173','20173',2,1,3,'2017-03-18 00:13:50'),(5,'20174','20174',2,1,4,'2017-03-18 00:15:08'),(6,'DSN20171','DSN20171',3,1,1,'2017-03-18 00:16:02'),(7,'DSN20172','DSN20172',3,1,2,'2017-03-18 00:16:53');
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'sia'
--

--
-- Dumping routines for database 'sia'
--
/*!50003 DROP PROCEDURE IF EXISTS `delete_dsn_usr` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_dsn_usr`(IN id_dosen INT)
BEGIN
DECLARE id_user int;
SELECT tb_user.usr_1 INTO id_user FROM tb_user WHERE usr_6=id_dosen AND usr_4=3;
DELETE FROM tb_user WHERE usr_1=id_user;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_mhs_usr` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_mhs_usr`(IN id_mhs INT)
BEGIN
DECLARE id_user int;
SELECT tb_user.usr_1 INTO id_user FROM tb_user WHERE usr_6=id_mhs AND usr_4=2;
DELETE FROM tb_user WHERE usr_1=id_user;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `add_krs`
--

/*!50001 DROP VIEW IF EXISTS `add_krs`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `add_krs` AS select `tb_kelas`.`kls_1` AS `kls_1`,`tb_kelas`.`kls_2` AS `kls_2`,`tb_makul`.`mkl_2` AS `mkl_2`,`tb_dosen`.`dsn_3` AS `dsn_3`,`tb_makul`.`mkl_3` AS `mkl_3`,`tb_makul`.`mkl_4` AS `mkl_4`,`tb_kelas`.`kls_3` AS `kls_3`,`tb_kelas`.`kls_4` AS `kls_4`,`tb_kelas`.`kls_6` AS `kls_6`,`tb_prodi`.`prodi_1` AS `prodi_1` from (((`tb_kelas` join `tb_makul` on((`tb_kelas`.`mkl_1` = `tb_makul`.`mkl_1`))) join `tb_prodi` on((`tb_makul`.`prodi_1` = `tb_prodi`.`prodi_1`))) join `tb_dosen`) where (`tb_kelas`.`kls_6` = `tb_dosen`.`dsn_1`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `fklts_prodi`
--

/*!50001 DROP VIEW IF EXISTS `fklts_prodi`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `fklts_prodi` AS select `tb_prodi`.`prodi_1` AS `prodi_1`,`tb_fakultas`.`fklts_2` AS `fklts_2`,`tb_prodi`.`prodi_2` AS `prodi_2` from (`tb_prodi` join `tb_fakultas` on((`tb_prodi`.`fklts_1` = `tb_fakultas`.`fklts_1`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `form_kelas`
--

/*!50001 DROP VIEW IF EXISTS `form_kelas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `form_kelas` AS select `tb_kelas`.`kls_1` AS `kls_1`,`tb_kelas`.`kls_2` AS `kls_2`,`tb_kelas`.`mkl_1` AS `mkl_1`,`tb_makul`.`mkl_2` AS `mkl_2`,`tb_prodi`.`prodi_2` AS `prodi_2`,`tb_kelas`.`kls_3` AS `kls_3`,`tb_kelas`.`kls_4` AS `kls_4`,`tb_kelas`.`kls_6` AS `kls_6` from ((`tb_kelas` join `tb_makul` on((`tb_kelas`.`mkl_1` = `tb_makul`.`mkl_1`))) join `tb_prodi` on((`tb_makul`.`prodi_1` = `tb_prodi`.`prodi_1`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `form_makul`
--

/*!50001 DROP VIEW IF EXISTS `form_makul`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `form_makul` AS select `tb_makul`.`mkl_1` AS `mkl_1`,`tb_makul`.`mkl_2` AS `mkl_2`,`tb_fakultas`.`fklts_1` AS `fklts_1`,`tb_fakultas`.`fklts_2` AS `fklts_2`,`tb_makul`.`prodi_1` AS `prodi_1`,`tb_prodi`.`prodi_2` AS `prodi_2`,`tb_makul`.`mkl_3` AS `mkl_3`,`tb_makul`.`mkl_4` AS `mkl_4`,`tb_makul`.`mkl_5` AS `mkl_5` from ((`tb_makul` join `tb_prodi` on((`tb_makul`.`prodi_1` = `tb_prodi`.`prodi_1`))) join `tb_fakultas` on((`tb_prodi`.`fklts_1` = `tb_fakultas`.`fklts_1`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `form_mhs`
--

/*!50001 DROP VIEW IF EXISTS `form_mhs`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `form_mhs` AS select `tb_mhs`.`mhs_1` AS `mhs_1`,`tb_mhs`.`mhs_2` AS `mhs_2`,`tb_mhs`.`mhs_3` AS `mhs_3`,`tb_fakultas`.`fklts_2` AS `fklts_2`,`tb_mhs`.`prodi_1` AS `prodi_1`,`tb_prodi`.`prodi_2` AS `prodi_2`,`tb_mhs`.`mhs_4` AS `mhs_4`,`tb_mhs`.`mhs_5` AS `mhs_5`,`tb_mhs`.`mhs_6` AS `mhs_6`,`tb_mhs`.`mhs_8` AS `mhs_8` from ((`tb_mhs` join `tb_prodi` on((`tb_mhs`.`prodi_1` = `tb_prodi`.`prodi_1`))) join `tb_fakultas` on((`tb_prodi`.`fklts_1` = `tb_fakultas`.`fklts_1`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `form_prodi`
--

/*!50001 DROP VIEW IF EXISTS `form_prodi`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `form_prodi` AS select `tb_prodi`.`prodi_1` AS `prodi_1`,`tb_prodi`.`prodi_2` AS `prodi_2`,`tb_prodi`.`fklts_1` AS `fklts_1`,`tb_fakultas`.`fklts_2` AS `fklts_2`,`tb_prodi`.`prodi_3` AS `prodi_3` from (`tb_prodi` join `tb_fakultas` on((`tb_prodi`.`fklts_1` = `tb_fakultas`.`fklts_1`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `input_nilai`
--

/*!50001 DROP VIEW IF EXISTS `input_nilai`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `input_nilai` AS select `tb_mhs`.`mhs_2` AS `mhs_2`,`tb_mhs`.`mhs_3` AS `mhs_3`,`tb_nilai`.`nil_4` AS `nil_4`,`tb_nilai`.`nil_2` AS `nil_2`,`tb_nilai`.`nil_3` AS `nil_3`,`tb_nilai`.`nil_5` AS `nil_5`,`tb_nilai`.`nil_6` AS `nil_6`,`tb_nilai`.`nil_7` AS `nil_7`,`tb_nilai`.`nil_9` AS `nil_9`,`tb_nilai`.`nil_8` AS `nil_8`,`tb_nilai`.`nil_1` AS `nil_1`,`tb_ambil_kls`.`mhs_1` AS `mhs_1`,`tb_ambil_kls`.`kls_1` AS `kls_1`,`tb_ambil_kls`.`abl_kls_2` AS `abl_kls_2`,`tb_ambil_kls`.`abl_kls_3` AS `abl_kls_3` from ((`tb_nilai` join `tb_ambil_kls` on((`tb_nilai`.`abl_kls_1` = `tb_ambil_kls`.`abl_kls_1`))) join `tb_mhs` on((`tb_ambil_kls`.`mhs_1` = `tb_mhs`.`mhs_1`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `kelas_dosen`
--

/*!50001 DROP VIEW IF EXISTS `kelas_dosen`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `kelas_dosen` AS select `tb_pengampu`.`ampu_1` AS `ampu_1`,`tb_kelas`.`kls_2` AS `kls_2`,`tb_makul`.`mkl_2` AS `mkl_2`,`tb_prodi`.`prodi_2` AS `prodi_2`,`tb_makul`.`mkl_3` AS `mkl_3`,`tb_makul`.`mkl_4` AS `mkl_4`,`tb_kelas`.`kls_3` AS `kls_3`,`tb_kelas`.`kls_4` AS `kls_4`,`tb_pengampu`.`dsn_1` AS `dsn_1`,`tb_pengampu`.`kls_1` AS `kls_1` from (((`tb_pengampu` join `tb_kelas` on((`tb_pengampu`.`kls_1` = `tb_kelas`.`kls_1`))) join `tb_makul` on((`tb_kelas`.`mkl_1` = `tb_makul`.`mkl_1`))) join `tb_prodi` on((`tb_makul`.`prodi_1` = `tb_prodi`.`prodi_1`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `khs`
--

/*!50001 DROP VIEW IF EXISTS `khs`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `khs` AS select `tb_nilai`.`nil_1` AS `nil_1`,`tb_makul`.`mkl_1` AS `mkl_1`,`tb_makul`.`mkl_2` AS `mkl_2`,`tb_makul`.`mkl_3` AS `mkl_3`,`tb_makul`.`mkl_4` AS `mkl_4`,`tb_kelas`.`kls_2` AS `kls_2`,`tb_nilai`.`nil_4` AS `nil_4`,`tb_nilai`.`nil_2` AS `nil_2`,`tb_nilai`.`nil_3` AS `nil_3`,`tb_nilai`.`nil_5` AS `nil_5`,`tb_nilai`.`nil_6` AS `nil_6`,`tb_nilai`.`nil_7` AS `nil_7`,`tb_nilai`.`nil_9` AS `nil_9`,`tb_nilai`.`nil_8` AS `nil_8`,`tb_ambil_kls`.`mhs_1` AS `mhs_1`,`tb_ambil_kls`.`abl_kls_2` AS `abl_kls_2`,`tb_ambil_kls`.`abl_kls_3` AS `abl_kls_3` from (((`tb_nilai` join `tb_ambil_kls` on((`tb_nilai`.`abl_kls_1` = `tb_ambil_kls`.`abl_kls_1`))) join `tb_kelas` on((`tb_ambil_kls`.`kls_1` = `tb_kelas`.`kls_1`))) join `tb_makul` on((`tb_kelas`.`mkl_1` = `tb_makul`.`mkl_1`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `krs`
--

/*!50001 DROP VIEW IF EXISTS `krs`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `krs` AS select `tb_ambil_kls`.`abl_kls_1` AS `abl_kls_1`,`tb_makul`.`mkl_2` AS `mkl_2`,`tb_dosen`.`dsn_3` AS `dsn_3`,`tb_kelas`.`kls_2` AS `kls_2`,`tb_makul`.`mkl_3` AS `mkl_3`,`tb_makul`.`mkl_4` AS `mkl_4`,`tb_ambil_kls`.`mhs_1` AS `mhs_1`,`tb_kelas`.`kls_1` AS `kls_1`,`tb_ambil_kls`.`abl_kls_2` AS `abl_kls_2`,`tb_ambil_kls`.`abl_kls_3` AS `abl_kls_3` from (((`tb_ambil_kls` join `tb_kelas` on((`tb_ambil_kls`.`kls_1` = `tb_kelas`.`kls_1`))) join `tb_makul` on((`tb_kelas`.`mkl_1` = `tb_makul`.`mkl_1`))) join `tb_dosen` on((`tb_kelas`.`kls_6` = `tb_dosen`.`dsn_1`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `pilih_kelas`
--

/*!50001 DROP VIEW IF EXISTS `pilih_kelas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pilih_kelas` AS select `tb_pengampu`.`dsn_1` AS `dsn_1`,`tb_kelas`.`kls_2` AS `kls_2`,`tb_makul`.`mkl_2` AS `mkl_2`,`tb_prodi`.`prodi_2` AS `prodi_2`,`tb_kelas`.`kls_1` AS `kls_1`,`tb_makul`.`mkl_3` AS `mkl_3`,`tb_makul`.`mkl_4` AS `mkl_4` from (((`tb_pengampu` join `tb_kelas` on((`tb_pengampu`.`kls_1` = `tb_kelas`.`kls_1`))) join `tb_makul` on((`tb_kelas`.`mkl_1` = `tb_makul`.`mkl_1`))) join `tb_prodi` on((`tb_makul`.`prodi_1` = `tb_prodi`.`prodi_1`))) order by `tb_makul`.`mkl_2` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `prodi_makul`
--

/*!50001 DROP VIEW IF EXISTS `prodi_makul`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `prodi_makul` AS select `tb_makul`.`mkl_1` AS `mkl_1`,`tb_prodi`.`prodi_2` AS `prodi_2`,`tb_makul`.`mkl_2` AS `mkl_2` from (`tb_makul` join `tb_prodi` on((`tb_makul`.`prodi_1` = `tb_prodi`.`prodi_1`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `profil_mhs`
--

/*!50001 DROP VIEW IF EXISTS `profil_mhs`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `profil_mhs` AS select `tb_mhs`.`mhs_1` AS `mhs_1`,`tb_mhs`.`mhs_2` AS `mhs_2`,`tb_mhs`.`mhs_3` AS `mhs_3`,`tb_fakultas`.`fklts_2` AS `fklts_2`,`tb_prodi`.`prodi_2` AS `prodi_2`,`tb_mhs`.`mhs_4` AS `mhs_4`,`tb_mhs`.`mhs_5` AS `mhs_5`,`tb_mhs`.`mhs_6` AS `mhs_6`,`tb_mhs`.`mhs_7` AS `mhs_7` from ((`tb_mhs` join `tb_prodi` on((`tb_mhs`.`prodi_1` = `tb_prodi`.`prodi_1`))) join `tb_fakultas` on((`tb_prodi`.`fklts_1` = `tb_fakultas`.`fklts_1`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `tambah_kelas`
--

/*!50001 DROP VIEW IF EXISTS `tambah_kelas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `tambah_kelas` AS select `tb_kelas`.`kls_1` AS `kls_1`,`tb_kelas`.`kls_2` AS `kls_2`,`tb_makul`.`mkl_2` AS `mkl_2`,`tb_prodi`.`prodi_2` AS `prodi_2`,`tb_makul`.`mkl_3` AS `mkl_3`,`tb_makul`.`mkl_4` AS `mkl_4`,`tb_kelas`.`kls_3` AS `kls_3`,`tb_kelas`.`kls_4` AS `kls_4`,`tb_kelas`.`kls_6` AS `kls_6` from ((`tb_kelas` join `tb_makul` on((`tb_kelas`.`mkl_1` = `tb_makul`.`mkl_1`))) join `tb_prodi` on((`tb_makul`.`prodi_1` = `tb_prodi`.`prodi_1`))) */;
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

-- Dump completed on 2017-03-18 16:01:55
