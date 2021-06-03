-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: firma_transportowa
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `kierowcy`
--

DROP TABLE IF EXISTS `kierowcy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kierowcy` (
  `ID_kierowcy` mediumint NOT NULL AUTO_INCREMENT,
  `Imie` varchar(50) DEFAULT NULL,
  `Nazwisko` varchar(50) DEFAULT NULL,
  `PESEL` varchar(11) DEFAULT NULL,
  `Stawka` float DEFAULT NULL,
  `Nr_telefonu` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`ID_kierowcy`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kierowcy`
--

LOCK TABLES `kierowcy` WRITE;
/*!40000 ALTER TABLE `kierowcy` DISABLE KEYS */;
INSERT INTO `kierowcy` VALUES (1,'Edmund','Nowak','85868622529',1.8,'957 566 922'),(2,'Jan','Siwy','94741317238',1.5,'626 871 388'),(3,'Krzysztof','Nowy','97323293572',2,'177 763 887'),(4,'Andrzej','Kowal','28495157935',1.2,'429 832 993'),(5,'Zbigniew','Sprytny','77996827711',1.7,'997 239 155'),(7,'Feliks','Zawodny','65463583547',2,'984 835 314');
/*!40000 ALTER TABLE `kierowcy` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `dodanie_rekordu_kierowcy` BEFORE INSERT ON `kierowcy` FOR EACH ROW BEGIN
        -- Check that name and countrycode are given
        IF NEW.id_kierowcy=0 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Id_kierowcy nie moze byc zerem!';
        #END IF;
        ELSEIF NEW.nazwisko LIKE '' THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Nazwisko musi byc uzupelnione!';
        #END IF;
		ELSEIF NEW.pesel LIKE '' THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Pesel musi byc uzupelniony!';
        #END IF;
		ELSEIF NEW.Stawka<=0 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Stawka musi byc dodatnia!';
        #END IF;
        ELSEIF NEW.Nr_telefonu LIKE '' THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Numer telefonu musi byc uzupelniony!';
        END IF;
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `zmiana_id_kierowcy` AFTER UPDATE ON `kierowcy` FOR EACH ROW begin
SET FOREIGN_KEY_CHECKS=0;
update trasy
set trasy.ID_kierowcy=new.id_kierowcy
where trasy.ID_kierowcy=old.id_kierowcy;
SET FOREIGN_KEY_CHECKS=1;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `kto_kiedy_czym_jechal`
--

DROP TABLE IF EXISTS `kto_kiedy_czym_jechal`;
/*!50001 DROP VIEW IF EXISTS `kto_kiedy_czym_jechal`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `kto_kiedy_czym_jechal` AS SELECT 
 1 AS `ID_kursu`,
 1 AS `Imie`,
 1 AS `Nazwisko`,
 1 AS `NR_rejestracyjny`,
 1 AS `Data`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `pojazdy`
--

DROP TABLE IF EXISTS `pojazdy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pojazdy` (
  `ID_pojazdu` mediumint NOT NULL AUTO_INCREMENT,
  `NR_rejestracyjny` varchar(10) DEFAULT NULL,
  `stawka` float DEFAULT NULL,
  `Spalanie` float DEFAULT NULL,
  PRIMARY KEY (`ID_pojazdu`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pojazdy`
--

LOCK TABLES `pojazdy` WRITE;
/*!40000 ALTER TABLE `pojazdy` DISABLE KEYS */;
INSERT INTO `pojazdy` VALUES (1,'WW12345',4,15),(2,'CT44466',5,16),(3,'CIN151R',7,17),(4,'NOS222Y',5,14),(5,'GD54321',4.5,14),(6,'DW98765',8,20);
/*!40000 ALTER TABLE `pojazdy` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `dodanie_rekordu_pojazdu` BEFORE INSERT ON `pojazdy` FOR EACH ROW BEGIN
        -- Check that name and countrycode are given
        IF NEW.id_pojazdu=0 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Id_pojazdu nie moze byc zerem!';
        #END IF;
        ELSEIF NEW.NR_rejestracyjny LIKE '' THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Numer rejestracyjny musi byc uzupelniony!';
		ELSEIF NEW.Spalanie<=0 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Spalanie musi byc dodatnie!';
		ELSEIF NEW.Stawka<=0 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Stawka musi byc dodatnia!';
		END IF;
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `zmiana_id_pojazdu` AFTER UPDATE ON `pojazdy` FOR EACH ROW begin
SET FOREIGN_KEY_CHECKS=0;
update trasy
set trasy.ID_pojazdu=new.id_pojazdu
where trasy.ID_pojazdu=old.id_pojazdu;
SET FOREIGN_KEY_CHECKS=1;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `trasy`
--

DROP TABLE IF EXISTS `trasy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trasy` (
  `ID_kursu` mediumint NOT NULL AUTO_INCREMENT,
  `ID_pojazdu` mediumint NOT NULL,
  `Data` date DEFAULT NULL,
  `km` int DEFAULT NULL,
  `ID_kierowcy` mediumint NOT NULL,
  `Cena_paliwa` float DEFAULT NULL,
  PRIMARY KEY (`ID_kursu`),
  KEY `ID_kierowcy` (`ID_kierowcy`),
  KEY `ID_pojazdu` (`ID_pojazdu`),
  CONSTRAINT `trasy_ibfk_1` FOREIGN KEY (`ID_kierowcy`) REFERENCES `kierowcy` (`ID_kierowcy`),
  CONSTRAINT `trasy_ibfk_2` FOREIGN KEY (`ID_pojazdu`) REFERENCES `pojazdy` (`ID_pojazdu`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trasy`
--

LOCK TABLES `trasy` WRITE;
/*!40000 ALTER TABLE `trasy` DISABLE KEYS */;
INSERT INTO `trasy` VALUES (1,2,'2010-01-01',20,1,5.1),(2,4,'2010-01-04',10,2,5.1),(3,5,'2010-01-07',11,3,5.1),(4,3,'2010-01-10',50,4,5.1),(5,6,'2010-01-13',10,5,5.1),(6,2,'2010-01-16',90,7,5.1),(7,1,'2010-01-19',18,7,5.1),(8,3,'2010-01-22',90,1,5.1),(9,4,'2010-01-25',96,2,5.1),(10,6,'2010-01-28',10,3,5.1),(11,3,'2010-01-31',67,4,5.1),(12,2,'2010-02-03',10,5,5.1),(13,4,'2010-02-06',356,1,5.1),(14,5,'2010-02-09',90,2,5.1),(15,3,'2010-02-12',56,3,5.1),(16,2,'2010-02-15',47,4,5.1),(17,4,'2010-02-18',276,5,5.1),(18,3,'2010-02-21',69,7,5.1),(19,5,'2010-02-24',45,1,5.1),(20,4,'2010-02-27',63,2,5.1);
/*!40000 ALTER TABLE `trasy` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `dodanie_rekordu_trasy` BEFORE INSERT ON `trasy` FOR EACH ROW BEGIN
        IF NEW.id_kursu=0 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Id_kursu nie moze byc zerem!';
        #END IF;
        ELSEIF NEW.id_pojazdu=0 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Id_pojazdu nie moze byc zerem!';
		ELSEIF NEW.id_kierowcy=0 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Id_kierowcy nie moze byc zerem!';
		ELSEIF NEW.km<=0 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Ilosc kilometrow musi byc dodatnia!';
		ELSEIF NEW.cena_paliwa<=0 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Cena paliwa musi byc dodatnia!';
		END IF;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `wykaz_tras_pojazdow`
--

DROP TABLE IF EXISTS `wykaz_tras_pojazdow`;
/*!50001 DROP VIEW IF EXISTS `wykaz_tras_pojazdow`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `wykaz_tras_pojazdow` AS SELECT 
 1 AS `ID_pojazdu`,
 1 AS `NR_rejestracyjny`,
 1 AS `Data`,
 1 AS `Suma_kilometrów`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `wykaz_tras_pracownikow`
--

DROP TABLE IF EXISTS `wykaz_tras_pracownikow`;
/*!50001 DROP VIEW IF EXISTS `wykaz_tras_pracownikow`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `wykaz_tras_pracownikow` AS SELECT 
 1 AS `ID_kierowcy`,
 1 AS `Imie`,
 1 AS `Nazwisko`,
 1 AS `Data`,
 1 AS `Suma_kilometrów`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `zarobki_pojazdow`
--

DROP TABLE IF EXISTS `zarobki_pojazdow`;
/*!50001 DROP VIEW IF EXISTS `zarobki_pojazdow`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `zarobki_pojazdow` AS SELECT 
 1 AS `ID_pojazdu`,
 1 AS `NR_rejestracyjny`,
 1 AS `Rok`,
 1 AS `Miesiac`,
 1 AS `Suma_Kilometrów`,
 1 AS `Zarobki`,
 1 AS `Wydatki_na_paliwo`,
 1 AS `zarobki_na_czysto`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `zarobki_pracownikow`
--

DROP TABLE IF EXISTS `zarobki_pracownikow`;
/*!50001 DROP VIEW IF EXISTS `zarobki_pracownikow`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `zarobki_pracownikow` AS SELECT 
 1 AS `Imie`,
 1 AS `Nazwisko`,
 1 AS `Rok`,
 1 AS `Miesiac`,
 1 AS `Suma_kilometrów`,
 1 AS `Zarobki_pracownika`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `zysk`
--

DROP TABLE IF EXISTS `zysk`;
/*!50001 DROP VIEW IF EXISTS `zysk`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `zysk` AS SELECT 
 1 AS `Rok`,
 1 AS `Miesiąc`,
 1 AS `Zarobki_pojazdow`,
 1 AS `Zarobki_pracowników`,
 1 AS `Zysk`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'firma_transportowa'
--
/*!50003 DROP PROCEDURE IF EXISTS `dodanie_kierowcy` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `dodanie_kierowcy`(
IN id mediumint, IN im varchar(50), IN nz varchar(50), IN ps varchar(11), IN stw float, IN nr varchar(11))
begin
insert into `kierowcy` (`ID_kierowcy`,`Imie`,`Nazwisko`,`PESEL`,`Stawka`,`Nr_telefonu`) 
  values (id,im,nz,ps, stw,nr) ;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `dodanie_kursu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `dodanie_kursu`(
IN id mediumint, IN id_poj mediumint, IN dat_yyyy_mm_dd varchar(10), IN k_m int, id_kier mediumint, cena float)
begin
insert into `trasy` values (id,id_poj,dat_yyyy_mm_dd,k_m,id_kier, cena);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `dodanie_pojazdu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `dodanie_pojazdu`(
IN id mediumint, IN nr varchar(50), IN stw float, IN sp float)
begin
insert into pojazdy (ID_pojazdu,NR_rejestracyjny,stawka,Spalanie) 
  values (id, nr,stw,sp) ;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pokaz_trasy_kierowcy_danym_pojazdem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pokaz_trasy_kierowcy_danym_pojazdem`(
IN id_kier mediumint, IN id_poj mediumint)
begin
select id_kierowcy as id, stawka as stawka_i_cenapaliwa from kierowcy where id_kierowcy=id_kier union all 
select id_pojazdu, stawka from pojazdy where id_pojazdu=id_poj union all 
select id_kursu, Cena_paliwa from trasy where ID_kierowcy=id_kier and ID_pojazdu=id_poj;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usuniecie_kierowcy` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usuniecie_kierowcy`(
IN id mediumint)
begin
delete from kierowcy where id_kierowcy=id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usuniecie_kursu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usuniecie_kursu`(
IN id mediumint)
begin
delete from trasy where id_kursu=id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usuniecie_pojazdu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usuniecie_pojazdu`(
IN id mediumint)
begin
delete from pojazdy where id_pojazdu=id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `zarobki_pojazdu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `zarobki_pojazdu`(
IN numer_rej varchar(10))
begin
SELECT Pojazdy.ID_pojazdu, Pojazdy.NR_rejestracyjny, Year(Data) as Rok, Month(Data) AS Miesiac, Sum(Trasy.km) 
AS Suma_Kilometrów, Round(Sum(km*stawka),0) AS Zarobki, Round(Sum(km/100*Spalanie*Cena_paliwa),0) 
AS Wydatki_na_paliwo, Round(Sum(km*stawka-km/100*Spalanie*Cena_paliwa),0) AS zarobki_na_czysto
FROM Pojazdy INNER JOIN Trasy ON Pojazdy.ID_pojazdu = Trasy.ID_pojazdu
GROUP BY Pojazdy.ID_pojazdu, Pojazdy.NR_rejestracyjny, Rok, Miesiac
HAVING (((Pojazdy.NR_rejestracyjny)=numer_rej))
ORDER BY Pojazdy.ID_pojazdu, Rok DESC , Miesiac DESC;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `zarobki_pracownika` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `zarobki_pracownika`(
IN imie1 varchar(50), IN nazwisko1 varchar(50))
begin
SELECT Imie, Nazwisko, Year(Data) AS Rok, Month(Data) AS Miesiac, Sum(Trasy.km) AS Suma_kilometrów, round(Sum(km*Stawka),2)
AS Zarobki_pracownika
FROM Kierowcy INNER JOIN Trasy ON Kierowcy.ID_kierowcy = Trasy.ID_kierowcy
GROUP BY Imie,Nazwisko, Rok, Miesiac, Kierowcy.Nazwisko, Kierowcy.Imie
HAVING Imie=imie1 and Nazwisko=nazwisko1
ORDER BY Kierowcy.Nazwisko, Kierowcy.Imie, Rok DESC , Miesiac DESC;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `zarobki_pracownikow_w_miesiacu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `zarobki_pracownikow_w_miesiacu`(
IN rok1 int, IN miesiac1 int)
begin
SELECT Imie, Nazwisko, Year(Data) as Rok, Month(Data) as Miesiac,
Sum(Trasy.km) AS Suma_kilometrów, round(Sum(km*Stawka),2) AS Zarobki_pracownika
FROM Kierowcy INNER JOIN Trasy ON Kierowcy.ID_kierowcy = Trasy.ID_kierowcy
GROUP BY Imie,Nazwisko, Rok, Miesiac, Kierowcy.Nazwisko, Kierowcy.Imie
HAVING Rok=rok1 and Miesiac= miesiac1
ORDER BY Kierowcy.Nazwisko, Kierowcy.Imie, Rok DESC , Miesiac DESC;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `kto_kiedy_czym_jechal`
--

/*!50001 DROP VIEW IF EXISTS `kto_kiedy_czym_jechal`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `kto_kiedy_czym_jechal` AS select `trasy`.`ID_kursu` AS `ID_kursu`,`kierowcy`.`Imie` AS `Imie`,`kierowcy`.`Nazwisko` AS `Nazwisko`,`pojazdy`.`NR_rejestracyjny` AS `NR_rejestracyjny`,`trasy`.`Data` AS `Data` from (`pojazdy` join (`kierowcy` join `trasy` on((`kierowcy`.`ID_kierowcy` = `trasy`.`ID_kierowcy`))) on((`pojazdy`.`ID_pojazdu` = `trasy`.`ID_pojazdu`))) order by `trasy`.`Data` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `wykaz_tras_pojazdow`
--

/*!50001 DROP VIEW IF EXISTS `wykaz_tras_pojazdow`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `wykaz_tras_pojazdow` AS select `pojazdy`.`ID_pojazdu` AS `ID_pojazdu`,`pojazdy`.`NR_rejestracyjny` AS `NR_rejestracyjny`,`trasy`.`Data` AS `Data`,sum(`trasy`.`km`) AS `Suma_kilometrów` from (`pojazdy` join (`kierowcy` join `trasy` on((`kierowcy`.`ID_kierowcy` = `trasy`.`ID_kierowcy`))) on((`pojazdy`.`ID_pojazdu` = `trasy`.`ID_pojazdu`))) group by `pojazdy`.`ID_pojazdu`,`pojazdy`.`NR_rejestracyjny`,`trasy`.`Data` order by `trasy`.`Data` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `wykaz_tras_pracownikow`
--

/*!50001 DROP VIEW IF EXISTS `wykaz_tras_pracownikow`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `wykaz_tras_pracownikow` AS select `kierowcy`.`ID_kierowcy` AS `ID_kierowcy`,`kierowcy`.`Imie` AS `Imie`,`kierowcy`.`Nazwisko` AS `Nazwisko`,`trasy`.`Data` AS `Data`,sum(`trasy`.`km`) AS `Suma_kilometrów` from (`pojazdy` join (`kierowcy` join `trasy` on((`kierowcy`.`ID_kierowcy` = `trasy`.`ID_kierowcy`))) on((`pojazdy`.`ID_pojazdu` = `trasy`.`ID_pojazdu`))) group by `kierowcy`.`ID_kierowcy`,`kierowcy`.`Imie`,`kierowcy`.`Nazwisko`,`trasy`.`Data` order by `trasy`.`Data` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `zarobki_pojazdow`
--

/*!50001 DROP VIEW IF EXISTS `zarobki_pojazdow`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `zarobki_pojazdow` AS select `pojazdy`.`ID_pojazdu` AS `ID_pojazdu`,`pojazdy`.`NR_rejestracyjny` AS `NR_rejestracyjny`,year(`trasy`.`Data`) AS `Rok`,month(`trasy`.`Data`) AS `Miesiac`,sum(`trasy`.`km`) AS `Suma_Kilometrów`,round(sum((`trasy`.`km` * `pojazdy`.`stawka`)),0) AS `Zarobki`,round(sum((((`trasy`.`km` / 100) * `pojazdy`.`Spalanie`) * `trasy`.`Cena_paliwa`)),0) AS `Wydatki_na_paliwo`,round(sum(((`trasy`.`km` * `pojazdy`.`stawka`) - (((`trasy`.`km` / 100) * `pojazdy`.`Spalanie`) * `trasy`.`Cena_paliwa`))),0) AS `zarobki_na_czysto` from (`pojazdy` join `trasy` on((`pojazdy`.`ID_pojazdu` = `trasy`.`ID_pojazdu`))) group by `pojazdy`.`ID_pojazdu`,`pojazdy`.`NR_rejestracyjny`,year(`trasy`.`Data`),month(`trasy`.`Data`),year(`trasy`.`Data`),month(`trasy`.`Data`) order by `pojazdy`.`ID_pojazdu`,year(`trasy`.`Data`) desc,month(`trasy`.`Data`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `zarobki_pracownikow`
--

/*!50001 DROP VIEW IF EXISTS `zarobki_pracownikow`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `zarobki_pracownikow` AS select `kierowcy`.`Imie` AS `Imie`,`kierowcy`.`Nazwisko` AS `Nazwisko`,year(`trasy`.`Data`) AS `Rok`,month(`trasy`.`Data`) AS `Miesiac`,sum(`trasy`.`km`) AS `Suma_kilometrów`,round(sum((`trasy`.`km` * `kierowcy`.`Stawka`)),2) AS `Zarobki_pracownika` from (`kierowcy` join `trasy` on((`kierowcy`.`ID_kierowcy` = `trasy`.`ID_kierowcy`))) group by `kierowcy`.`Imie`,`kierowcy`.`Nazwisko`,`kierowcy`.`Nazwisko`,`kierowcy`.`Imie`,year(`trasy`.`Data`),month(`trasy`.`Data`),year(`trasy`.`Data`),month(`trasy`.`Data`) order by `kierowcy`.`Nazwisko`,`kierowcy`.`Imie`,year(`trasy`.`Data`) desc,month(`trasy`.`Data`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `zysk`
--

/*!50001 DROP VIEW IF EXISTS `zysk`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `zysk` AS select year(`trasy`.`Data`) AS `Rok`,month(`trasy`.`Data`) AS `Miesiąc`,sum(`zarobki_pojazdow`.`zarobki_na_czysto`) AS `Zarobki_pojazdow`,sum(round(`zarobki_pracownikow`.`Zarobki_pracownika`,0)) AS `Zarobki_pracowników`,sum(round((`zarobki_pojazdow`.`zarobki_na_czysto` - `zarobki_pracownikow`.`Zarobki_pracownika`),0)) AS `Zysk` from ((`trasy` join `zarobki_pojazdow` on(((`trasy`.`ID_pojazdu` = `zarobki_pojazdow`.`ID_pojazdu`) and (`trasy`.`ID_pojazdu` = `zarobki_pojazdow`.`ID_pojazdu`)))) join `zarobki_pracownikow` on(((`zarobki_pojazdow`.`Rok` = `zarobki_pracownikow`.`Rok`) and (`zarobki_pojazdow`.`Miesiac` = `zarobki_pracownikow`.`Miesiac`)))) group by year(`trasy`.`Data`),month(`trasy`.`Data`),year(`trasy`.`Data`),month(`trasy`.`Data`) order by year(`trasy`.`Data`) desc,month(`trasy`.`Data`) desc */;
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

-- Dump completed on 2021-05-16 18:31:21
