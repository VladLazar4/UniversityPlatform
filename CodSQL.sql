-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: facultate
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `activitate_didactica`
--

DROP TABLE IF EXISTS `activitate_didactica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activitate_didactica` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idProfesor` int DEFAULT NULL,
  `idMaterie` int DEFAULT NULL,
  `Curs` int DEFAULT NULL,
  `Seminar` int DEFAULT NULL,
  `Laborator` int DEFAULT NULL,
  `Examen` int DEFAULT NULL,
  `Colocviu` int DEFAULT NULL,
  `DataInceput` varchar(45) DEFAULT NULL,
  `DataFinal` varchar(45) DEFAULT NULL,
  `NrMaximParticipanti` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_activitate_didactica_idx` (`idMaterie`),
  KEY `fk_activitate_didactica2_idx` (`idProfesor`),
  CONSTRAINT `fk_activitate_didactica` FOREIGN KEY (`idMaterie`) REFERENCES `materie` (`id`),
  CONSTRAINT `fk_activitate_didactica2` FOREIGN KEY (`idProfesor`) REFERENCES `profesor` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activitate_didactica`
--

LOCK TABLES `activitate_didactica` WRITE;
/*!40000 ALTER TABLE `activitate_didactica` DISABLE KEYS */;
INSERT INTO `activitate_didactica` VALUES (1,3,14,1,0,0,0,0,'2023-01-13 09:00','2023-01-13 11:00',119),(2,7,11,0,1,0,0,0,'2023-01-13 14:00','2023-01-13 16:00',149),(3,3,14,1,0,0,0,0,'2023-01-13 09:00','2023-01-13 11:00',119),(4,7,11,0,1,0,0,0,'2023-01-13 14:00','2023-01-13 16:00',150),(5,2,8,0,0,1,0,0,'2023-01-13 10:00','2023-01-13 12:00',109),(6,1,1,1,0,0,0,0,'2023-01-13 09:00','2023-01-13 12:00',100),(7,2,2,0,1,0,0,0,'2023-01-13 14:00','2023-01-13 17:00',119),(8,5,12,1,0,0,0,0,'2023-01-13 09:00','2023-01-13 12:00',14),(9,5,11,1,0,0,0,0,'2023-01-13 09:00','2023-01-13 11:00',141),(10,14,13,0,1,0,0,0,'2023-01-13 14:00','2023-01-13 16:00',178);
/*!40000 ALTER TABLE `activitate_didactica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activitate_grup`
--

DROP TABLE IF EXISTS `activitate_grup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activitate_grup` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nume` varchar(45) DEFAULT NULL,
  `nrMin` int DEFAULT NULL,
  `nrMax` int DEFAULT NULL,
  `nrPersInscrise` int DEFAULT NULL,
  `id_grup` int DEFAULT NULL,
  `inceputActivitate` varchar(45) DEFAULT NULL,
  `sfarsitActivitate` varchar(45) DEFAULT NULL,
  `dataCreare` varchar(45) DEFAULT NULL,
  `dataExpirare` varchar(45) DEFAULT NULL,
  `id_profesor` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_activitate_grup_idx` (`id_grup`),
  KEY `fk_id_profesor_idx` (`id_profesor`),
  CONSTRAINT `fk_activitate_grup` FOREIGN KEY (`id_grup`) REFERENCES `grup_studenti` (`id`),
  CONSTRAINT `fk_id_profesor` FOREIGN KEY (`id_profesor`) REFERENCES `profesor` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activitate_grup`
--

LOCK TABLES `activitate_grup` WRITE;
/*!40000 ALTER TABLE `activitate_grup` DISABLE KEYS */;
INSERT INTO `activitate_grup` VALUES (3,'Activitate 3',15,20,17,1,'2023-01-13 10:00','2023-01-13 12:00','2022-12-01 10:00','2023-01-13 12:00',4),(4,'Activitate 4',10,15,12,2,'2023-01-13 14:00','2023-01-13 16:00','2022-12-01 14:00','2023-01-13 16:00',7),(14,'Activitate 1',15,20,17,1,'2023-01-13 10:00','2023-01-13 12:00','2022-12-01 10:00','2023-01-12 12:00',4);
/*!40000 ALTER TABLE `activitate_grup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrator` (
  `id` int NOT NULL AUTO_INCREMENT,
  `CNP` varchar(45) DEFAULT NULL,
  `nume` varchar(45) DEFAULT NULL,
  `prenume` varchar(45) DEFAULT NULL,
  `adresa` varchar(45) DEFAULT NULL,
  `numarDeTelefon` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `IBAN` varchar(45) DEFAULT NULL,
  `superadministrator_bool` bit(1) DEFAULT NULL,
  `nrContract` int DEFAULT NULL,
  `parola` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` VALUES (1,'2910202000123','Ion','Popescu','Str. Mihai Eminescu nr. 12','0723456789','ionpopescu@gmail.com','RO29INGB0000999999012345',_binary '\0',123,'1234'),(2,'2910202000456','Maria','Ionescu','Str. Alexandru Ioan Cuza nr. 34','0723456789','mariaionescu@gmail.com','RO29INGB00009999990465',_binary '',456,'parola2'),(3,'2910202000789','Dan','Georgescu','Str. Victoriei nr. 56','0723456789','dangeorgescu@gmail.com','RO29INGB00009999990789',_binary '\0',789,'parola3'),(4,'2910202000101','Ana','Vasilescu','Str. Independentei nr. 78','0723456789','anavasilescu@gmail.com','RO29INGB00009999990101',_binary '',101,'parola4');
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog`
--

DROP TABLE IF EXISTS `catalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_student` int DEFAULT NULL,
  `id_materie` int DEFAULT NULL,
  `notaCurs` int DEFAULT NULL,
  `notaSeminar` int DEFAULT NULL,
  `notaLaborator` int DEFAULT NULL,
  `notaFinala` float(3,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_catalog_materie_idx` (`id_materie`),
  KEY `fk_catlog_student_idx` (`id_student`),
  CONSTRAINT `fk_catalog_materie` FOREIGN KEY (`id_materie`) REFERENCES `materie` (`id`),
  CONSTRAINT `fk_catlog_student` FOREIGN KEY (`id_student`) REFERENCES `student` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog`
--

LOCK TABLES `catalog` WRITE;
/*!40000 ALTER TABLE `catalog` DISABLE KEYS */;
INSERT INTO `catalog` VALUES (1,1,5,9,8,7,8.30),(2,2,8,6,7,8,7.30),(3,3,14,9,8,7,8.30),(4,4,2,8,9,8,8.30),(5,5,7,9,7,8,8.00),(6,11,3,6,4,5,5.00),(7,15,14,10,9,8,9.00),(8,2,1,7,8,9,8.00),(18,1,11,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `catalog` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `catalog_AFTER_INSERT` AFTER INSERT ON `catalog` FOR EACH ROW BEGIN
UPDATE materie
    SET nrMaxStudenti=nrMaxStudenti-1
    WHERE materie.id=new.id_materie;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat` (
  `id` int NOT NULL AUTO_INCREMENT,
  `text` varchar(100) DEFAULT NULL,
  `idGrup` int DEFAULT NULL,
  `idStudent` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_chat_idx` (`idStudent`),
  KEY `fk_chat2_idx` (`idGrup`),
  CONSTRAINT `fk_chat` FOREIGN KEY (`idStudent`) REFERENCES `student` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_chat2` FOREIGN KEY (`idGrup`) REFERENCES `grup_studenti` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat`
--

LOCK TABLES `chat` WRITE;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
INSERT INTO `chat` VALUES (1,'Salut, cine vrea sa mergem la o cafea?',2,5),(2,'Cine are tema la mate?',3,11),(3,'Azi am o intalnire la ora 16:00',1,14),(4,'Are cineva idei pentru proiectul de la programare?',10,17),(5,'Salut, ce faci?',5,8),(6,'Cine vrea sa ia notite impreuna pentru examen?',3,12),(7,'Are cineva materialele pentru seminarul de saptamana viitoare?',10,17),(8,'Cine se alatura echipei pentru proiectul final?',1,6);
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grup_studenti`
--

DROP TABLE IF EXISTS `grup_studenti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grup_studenti` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nume` varchar(45) DEFAULT NULL,
  `id_materie` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_grup_materie_idx` (`id_materie`),
  CONSTRAINT `fk_grup_materie` FOREIGN KEY (`id_materie`) REFERENCES `materie` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grup_studenti`
--

LOCK TABLES `grup_studenti` WRITE;
/*!40000 ALTER TABLE `grup_studenti` DISABLE KEYS */;
INSERT INTO `grup_studenti` VALUES (1,'Grupul de programare',3),(2,'Grupul de inteligenta artificiala',7),(3,'Grupul de sisteme distribuite',12),(4,'Grupul de securitate',8),(5,'Grupul de baze de date',14),(6,'Grupul de algoritmi',2),(7,'Grupul de programare functionala',5),(8,'Grupul de analiza si proiectare',10),(9,'Grupul de sisteme inteligente',1),(10,'Grupul de sisteme mobile',11);
/*!40000 ALTER TABLE `grup_studenti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscris_activitate_didactica`
--

DROP TABLE IF EXISTS `inscris_activitate_didactica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inscris_activitate_didactica` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idActivitateDidactica` int DEFAULT NULL,
  `idStudent` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_inscris_activitate_didactica_idx` (`idActivitateDidactica`),
  KEY `fk_inscris_activitate_didactica2_idx` (`idStudent`),
  CONSTRAINT `fk_inscris_activitate_didactica2` FOREIGN KEY (`idStudent`) REFERENCES `student` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_inscris_activitate_didactica3` FOREIGN KEY (`idActivitateDidactica`) REFERENCES `activitate_didactica` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscris_activitate_didactica`
--

LOCK TABLES `inscris_activitate_didactica` WRITE;
/*!40000 ALTER TABLE `inscris_activitate_didactica` DISABLE KEYS */;
INSERT INTO `inscris_activitate_didactica` VALUES (1,5,12),(2,8,14),(3,2,17),(4,7,1),(5,3,8),(6,10,16),(7,1,6);
/*!40000 ALTER TABLE `inscris_activitate_didactica` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `inscris_activitate_didactica_AFTER_INSERT` AFTER INSERT ON `inscris_activitate_didactica` FOR EACH ROW BEGIN
UPDATE activitate_didactica
    SET NrMaximParticipanti=NrMaximParticipanti-1
    WHERE activitate_didactica.id=new.idActivitateDidactica;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `inscris_activitate_grup`
--

DROP TABLE IF EXISTS `inscris_activitate_grup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inscris_activitate_grup` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_student` int DEFAULT NULL,
  `id_activitate` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_inscris_activitate_student_idx` (`id_student`),
  KEY `fk_inscris_activitate_activitate_idx` (`id_activitate`),
  CONSTRAINT `fk_inscris_activitate_activitate` FOREIGN KEY (`id_activitate`) REFERENCES `activitate_grup` (`id`),
  CONSTRAINT `fk_inscris_activitate_student` FOREIGN KEY (`id_student`) REFERENCES `student` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscris_activitate_grup`
--

LOCK TABLES `inscris_activitate_grup` WRITE;
/*!40000 ALTER TABLE `inscris_activitate_grup` DISABLE KEYS */;
INSERT INTO `inscris_activitate_grup` VALUES (3,17,4),(4,1,3),(7,6,4);
/*!40000 ALTER TABLE `inscris_activitate_grup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscris_grup`
--

DROP TABLE IF EXISTS `inscris_grup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inscris_grup` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_student` int DEFAULT NULL,
  `id_grup` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_inscris_student_idx` (`id_student`),
  KEY `fk_inscris_grup_idx` (`id_grup`),
  CONSTRAINT `fk_inscris_grup_grup` FOREIGN KEY (`id_grup`) REFERENCES `grup_studenti` (`id`),
  CONSTRAINT `fk_inscris_grup_student` FOREIGN KEY (`id_student`) REFERENCES `student` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscris_grup`
--

LOCK TABLES `inscris_grup` WRITE;
/*!40000 ALTER TABLE `inscris_grup` DISABLE KEYS */;
INSERT INTO `inscris_grup` VALUES (1,12,7),(2,14,10),(3,17,2),(4,1,8),(5,8,6),(6,16,3),(7,6,1),(8,1,1);
/*!40000 ALTER TABLE `inscris_grup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscris_profesor_materie`
--

DROP TABLE IF EXISTS `inscris_profesor_materie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inscris_profesor_materie` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_profesor` int DEFAULT NULL,
  `id_materie` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_inscris_profesor_materie_idx` (`id_profesor`),
  KEY `fk_inscris_profesor_materie2_idx` (`id_materie`),
  CONSTRAINT `fk_inscris_profesor_materie` FOREIGN KEY (`id_profesor`) REFERENCES `profesor` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_inscris_profesor_materie2` FOREIGN KEY (`id_materie`) REFERENCES `materie` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscris_profesor_materie`
--

LOCK TABLES `inscris_profesor_materie` WRITE;
/*!40000 ALTER TABLE `inscris_profesor_materie` DISABLE KEYS */;
INSERT INTO `inscris_profesor_materie` VALUES (1,5,14),(2,8,11),(3,2,8),(4,1,14),(5,7,1),(6,16,13),(7,17,4),(8,12,14),(9,9,6),(10,14,10),(15,7,5),(16,1,5),(17,7,12),(18,1,12);
/*!40000 ALTER TABLE `inscris_profesor_materie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materie`
--

DROP TABLE IF EXISTS `materie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materie` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nume` varchar(45) DEFAULT NULL,
  `oreCurs` int DEFAULT NULL,
  `oreSeminar` int DEFAULT NULL,
  `oreLaborator` int DEFAULT NULL,
  `procentCurs` int DEFAULT NULL,
  `procentSeminar` int DEFAULT NULL,
  `procentLaborator` int DEFAULT NULL,
  `descriere` varchar(500) DEFAULT NULL,
  `nrMaxStudenti` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materie`
--

LOCK TABLES `materie` WRITE;
/*!40000 ALTER TABLE `materie` DISABLE KEYS */;
INSERT INTO `materie` VALUES (1,'msi',2,2,0,45,20,35,'Analiza 2',199),(2,'af',2,0,2,50,40,10,'Algoritmi+structuri de date+programare',149),(3,'Algoritmi evolutivi',4,2,2,40,30,30,'Studierea algoritmilor bazati pe principiul evolutiei',29),(4,'Retele neuronale',6,2,4,40,20,40,'Studierea si aplicarea retelelor neuronale in inteligenta artificiala',45),(5,'Sisteme distribuite',4,4,4,30,30,40,'Analiza si proiectarea sistemelor distribuite',59),(6,'Securitatea informatiei',3,2,3,30,30,40,'Studierea si aplicarea tehnicilor de securitate pentru protectia informatiilor',35),(7,'Programare functionala',4,2,2,40,20,40,'Introducere in programarea functionala si limbajele de programare specifice',24),(8,'Baze de date avansate',6,2,4,40,20,40,'Studierea si aplicarea tehnicilor avansate pentru proiectarea si administrarea bazelor de date',53),(9,'Analiza si proiectarea sistemelor',5,2,3,40,20,40,'Analiza si proiectarea sistemelor informatice in diferite domenii',40),(10,'Algoritmi evolutivi',4,2,2,40,30,30,'Studierea algoritmilor bazati pe principiul evolutiei',30),(11,'Retele neuronale',6,2,4,40,20,40,'Studierea si aplicarea retelelor neuronale in inteligenta artificiala',43),(12,'Sisteme distribuite',4,4,4,30,30,40,'Analiza si proiectarea sistemelor distribuite',60),(13,'Securitatea informatiei',3,2,3,30,30,40,'Studierea si aplicarea tehnicilor de securitate pentru protectia informatiilor',34),(14,'Programare functionala',4,2,2,40,20,40,'Introducere in programarea functionala si limbajele de programare specifice',23),(15,'Baze de date avansate',6,2,4,40,20,40,'Studierea si aplicarea tehnicilor avansate pentru proiectarea si administrarea bazelor de date',55),(16,'Analiza si proiectarea sistemelor',5,2,3,40,20,40,'Analiza si proiectarea sistemelor informatice in diferite domenii',40);
/*!40000 ALTER TABLE `materie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesor`
--

DROP TABLE IF EXISTS `profesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `CNP` varchar(45) DEFAULT NULL,
  `nume` varchar(45) DEFAULT NULL,
  `prenume` varchar(45) DEFAULT NULL,
  `adresa` varchar(45) DEFAULT NULL,
  `nrDeTelefon` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `IBAN` varchar(45) DEFAULT NULL,
  `nrContract` int DEFAULT NULL,
  `OreMin` int DEFAULT NULL,
  `OreMax` int DEFAULT NULL,
  `Departament` varchar(45) DEFAULT NULL,
  `parola` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesor`
--

LOCK TABLES `profesor` WRITE;
/*!40000 ALTER TABLE `profesor` DISABLE KEYS */;
INSERT INTO `profesor` VALUES (1,'1234567890123','John','Doe','123 Main St','123-456-7890','johndoe@gmail.com','1234567890123456789',1,15,25,'Matematica','1234'),(2,'23456789012345','Jane','Doe','456 Park Ave','234-567-8901','janedoe@email.com','2345678901234567890',2,20,30,'Stiinta calculatoarelor','password2'),(3,'34567890123456','Bob','Smith','789 Elm St','345-678-9012','bobsmith@email.com','345678901234567891',3,25,35,'Fizica','password3'),(4,'45678901234567','Samantha','Johnson','321 Oak St','456-789-0123','samanthaj@email.com','45678901234567890',4,30,40,'Matematica','password4'),(5,'56789012345678','Michael','Williams','654 Pine St','567-890-1234','michaelw@email.com','56789012345678901',5,35,45,'Stiinta calculatoarelor','password5'),(6,'67890123456789','Emily','Jones','987 Cedar St','678-901-2345','emilyj@email.com','678901234567890',6,40,50,'Fizica','password6'),(7,'1234567890123','John','Doe','123 Main St','555-555-5555','johndoe@email.com','1234567890',1,15,25,'Matematica','password1'),(8,'2345678901234','Jane','Smith','456 Park Ave','555-555-5556','janesmith@email.com','2345678901',2,20,30,'Stiinta calculatoarelor','password2'),(9,'3456789012345','Bob','Johnson','789 Elm St','555-555-5557','bobjohnson@email.com','34567890',3,25,35,'Fizica','password3'),(10,'4567890123456','Samantha','Williams','321 Oak St','555-555-5558','samanthawilliams@email.com','45678901',4,30,40,'Matematica','password4'),(11,'5678901234567','Michael','Jones','654 Pine St','555-555-5559','michaeljones@email.com','567890',5,35,45,'Stiinta calculatoarelor','password5'),(12,'6789012345678','Emily','Brown','987 Cedar St','555-555-5560','emilybrown@email.com','67890',6,40,50,'Fizica','password6'),(13,'1234567890123','John','Smith','123 Main St','555-555-5555','john.smith@email.com','DE89370400440532013000',1,15,25,'Matematica','password1'),(14,'23456789012345','Jane','Doe','456 Park Ave','555-555-5555','jane.doe@email.com','DE89370400440532013001',2,20,30,'Stiinta calculatoarelor','password2'),(15,'34567890123456','Bob','Johnson','789 Elm St','555-555-5555','bob.johnson@email.com','DE89370400440532013002',3,25,35,'Fizica','password3'),(16,'45678901234567','Samantha','Williams','321 Oak St','555-555-5555','samantha.williams@email.com','DE89370400440532013003',4,30,40,'Matematica','password4'),(17,'56789012345678','Michael','Jones','159 Pine St','555-555-5555','michael.jones@email.com','DE89370400440532013004',5,35,45,'Stiinta calculatoarelor','password5');
/*!40000 ALTER TABLE `profesor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `id` int NOT NULL AUTO_INCREMENT,
  `CNP` varchar(45) DEFAULT NULL,
  `nume` varchar(45) DEFAULT NULL,
  `prenume` varchar(45) DEFAULT NULL,
  `adresa` varchar(45) DEFAULT NULL,
  `nrDeTelefon` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `IBAN` varchar(45) DEFAULT NULL,
  `nrContract` int DEFAULT NULL,
  `anDeStudiu` int DEFAULT NULL,
  `nrDeOre` int DEFAULT NULL,
  `parola` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'1234567890123','John','Doe','123 Main St','555-555-5555','johndoe@gmail.com','1234567890',1,2,15,'1234'),(2,'2345678901234','Jane','Smith','456 Park Ave','555-555-5556','janesmith@email.com','2345678901',2,3,25,'password2'),(3,'3456789012345','Bob','Johnson','789 Elm St','555-555-5557','bobjohnson@email.com','34567890',3,4,40,'password3'),(4,'4567890123456','Samantha','Williams','321 Oak St','555-555-5558','samanthawilliams@email.com','45678901',4,1,50,'password4'),(5,'1234567890123','John','Doe','1234 Main St','555-555-5555','johndoe@example.com','IBAN123456789',1,2,20,'password1'),(6,'2345678901234','Jane','Smith','5678 Park Ave','555-555-5556','janesmith@example.com','IBAN234567890',2,3,40,'password2'),(7,'3456789012345','Boby','Johnson','91011 Elm St','555-555-5557','bobjohnson@example.com','IBAN34567890',3,4,50,'password3'),(8,'4567890123456','Samantha','Williams','1213 Oak St','555-555-5558','samanthawilliams@example.com','IBAN45678901',4,1,30,'password4'),(9,'5678901234567','Michael','Brown','1415 Pine St','555-555-5559','michaelbrown@example.com','IBAN56789012',5,2,20,'password5'),(10,'6789012345678','Emily','Jones','1617 Cedar St','555-555-5560','emilyjones@example.com','IBAN67890123',6,3,40,'password6'),(11,'7890123456789','Matthew','Miller','1819 Birch St','555-555-5561','matthewmiller@example.com','IBAN78901234',7,4,50,'password7'),(12,'1234567890123','John','Doe','123 Main St','555-555-5555','johndoe@example.com','1234567890123456789',1,2,20,'password1'),(13,'23456789012345','Jane','Smith','456 Park Ave','555-555-5556','janesmith@example.com','2345678901234567890',2,3,30,'password2'),(14,'34567890123456','Bobul','Johnson','789 Elm St','555-555-5557','bobjohnson@example.com','3456789012345678901',3,1,40,'password3'),(15,'45678901234567','Alice','Williams','321 Oak St','555-555-5558','alicewilliams@example.com','45678901234567890',4,4,50,'password4'),(16,'56789012345678','Charlie','Jones','159 Pine St','555-555-5559','charliejones@example.com','56789012345678901',1,2,15,'password5'),(17,'67890123456789','David','Brown','753 Cedar St','555-555-5560','davidbrown@example.com','678901234567890',2,3,25,'password6');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'facultate'
--

--
-- Dumping routines for database 'facultate'
--
/*!50003 DROP PROCEDURE IF EXISTS `ACTIVITATI_DIDACTICE_ZIUA_CURENTA_PROFESOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ACTIVITATI_DIDACTICE_ZIUA_CURENTA_PROFESOR`(username_profesor varchar(45))
BEGIN
	/*profesor*/
    SELECT materie.nume, activitate_didactica.Curs, activitate_didactica.Seminar, activitate_didactica.Laborator, activitate_didactica.Examen, activitate_didactica.Colocviu, activitate_didactica.DataInceput, activitate_didactica.DataFinal
    FROM activitate_didactica,profesor,materie
    WHERE profesor.email=username_profesor AND profesor.id=activitate_didactica.idProfesor AND "2023-01-13"=SUBSTRING(activitate_didactica.DataInceput,1,10) 
    AND materie.id=activitate_didactica.idMaterie;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ACTIVITATI_DIDACTICE_ZIUA_CURENTA_STUDENT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ACTIVITATI_DIDACTICE_ZIUA_CURENTA_STUDENT`(username_student varchar(45))
BEGIN
	/*student*/
    SELECT materie.nume, activitate_didactica.Curs, activitate_didactica.Seminar, activitate_didactica.Laborator, activitate_didactica.Examen, activitate_didactica.Colocviu, activitate_didactica.DataInceput, activitate_didactica.DataFinal
    FROM activitate_didactica,student,inscris_activitate_didactica,materie
    WHERE student.email=username_student AND student.id=inscris_activitate_didactica.idStudent AND inscris_activitate_didactica.idActivitateDidactica=activitate_didactica.id AND "2023-01-13"=SUBSTRING(activitate_didactica.DataInceput,1,10) 
    AND materie.id=activitate_didactica.idMaterie;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ADAUGA_ACTIVITATE_GRUP_STUDIU` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ADAUGA_ACTIVITATE_GRUP_STUDIU`(nume_activitate varchar(45), NrMin varchar(45), NrMax varchar(45), nume_grup_activitate varchar(45), inceput_activitate varchar(45), sfarsit_activitate varchar(45), data_expirare_activitate varchar(45))
BEGIN
	/*student*/
    SET @ID_GRUP=null;
    SELECT @ID_GRUP:=id FROM grup_studenti WHERE grup_studenti.nume=nume_grup_activitate;
    
    SET @ID_PROFESOR=null;
    SELECT @ID_PROFESOR:=id FROM profesor WHERE profesor.nume=Nume_profesor AND profesor.prenume=Prenume_profesor;
    
    IF @ID_GRUP=null THEN
    BEGIN
    END;
    ELSE
    BEGIN
		IF(@ID_PROFESOR=null) THEN
        BEGIN
		INSERT INTO activitate_grup (nume,nrMin,nrMax,nrPersInscrise,id_grup,inceputActivitate,sfarsitActivitate,dataCreare,dataExpirare)
		VALUES (nume_activitate,NrMin,NrMax,0,@ID_GRUP,inceput_activitate,sfarsit_activitate,"2023-01-13 08:00",data_expirare_activitate);
        END;
        ELSE
        BEGIN
			INSERT INTO activitate_grup (nume,nrMin,nrMax,nrPersInscrise,id_grup,inceputActivitate,sfarsitActivitate,dataCreare,dataExpirare,id_profesor)
			VALUES (nume_activitate,NrMin,NrMax,0,@ID_GRUP,inceput_activitate,sfarsit_activitate,"2023-01-13 08:00",data_expirare_activitate,@ID_PROFESOR);
        END;
        END IF;
    END;
    END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ADAUGA_ADMINISTRATOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ADAUGA_ADMINISTRATOR`(CNP varchar(45), nume varchar(45), prenume varchar(45), adresa varchar(45), numarDeTelefon varchar(45), email varchar(45), IBAN varchar(45), nrContract int, parola varchar(45))
BEGIN
	/*superadmin*/
	INSERT INTO administrator(CNP,nume,prenume,adresa,numarDeTelefon,email,IBAN,superadministrator_bool,nrContract,parola)
    VALUES (CNP,nume,prenume,adresa,numarDeTelefon,email,IBAN,0,nrContract,parola);
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ADAUGA_PROFESOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ADAUGA_PROFESOR`(CNP varchar(45), nume varchar(45), prenume varchar(45), adresa varchar(45), nrDeTelefon varchar(45), email varchar(45), IBAN varchar(45), nrContract int, OreMin int, OreMax int, Departament varchar(45), parola varchar(45))
BEGIN
	/*admin*/
    INSERT INTO profesor(CNP,nume,prenume,adresa,nrDeTelefon,email,IBAN,nrContract,OreMin,OreMax,Departament,parola)
    VALUES (CNP,nume,prenume,adresa,nrDeTelefon,email,IBAN,nrContract,OreMin,OreMax,Departament,parola);
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ADAUGA_STUDENT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ADAUGA_STUDENT`(CNP varchar(45), nume varchar(45), prenume varchar(45), adresa varchar(45), nrDeTelefon varchar(45), email varchar(45), IBAN varchar(45), nrContract int, anDeStudiu int, nrDeOre int, parola varchar(45))
BEGIN
	/*admin*/
    INSERT INTO student(CNP,nume,prenume,adresa,nrDeTelefon,email,IBAN,nrContract,anDeStudiu,nrDeOre,parola)
    VALUES (CNP,nume,prenume,adresa,nrDeTelefon,email,IBAN,nrContract,anDeStudiu,nrDeOre,parola);
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AFISARE_ADMINISTRATOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AFISARE_ADMINISTRATOR`()
BEGIN
	/*Administrator*/
    SELECT * FROM administrator;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AFISARE_PROFESOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AFISARE_PROFESOR`()
BEGIN
	/*administrator*/
    SELECT * FROM profesor;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AFISARE_STUDENT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AFISARE_STUDENT`()
BEGIN
	/*Administrator*/
    SELECT * FROM student;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AFISARE_SUGESTII_PARTICIPANTI_GRUP_STUDIU_EXCLUSI` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AFISARE_SUGESTII_PARTICIPANTI_GRUP_STUDIU_EXCLUSI`(nume_grup varchar(45))
BEGIN
	/*student*/
    SELECT student.id,student.nume,student.prenume,student.email
    FROM student,catalog,materie,grup_studenti,inscris_grup
    WHERE grup_studenti.nume=nume_grup AND grup_studenti.id_materie=materie.id 
    AND catalog.id_materie=materie.id AND catalog.id_student=student.id
    AND student.id=inscris_grup.id_student AND inscris_grup.id_grup=grup_studenti.id;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AFISARE_SUGESTII_PARTICIPANTI_GRUP_STUDIU_TOTI` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AFISARE_SUGESTII_PARTICIPANTI_GRUP_STUDIU_TOTI`(nume_grup varchar(45))
BEGIN
	/*student*/
    SELECT student.id,student.nume,student.prenume,student.email
    FROM student,catalog,materie,grup_studenti
    WHERE grup_studenti.nume=nume_grup AND grup_studenti.id_materie=materie.id 
    AND catalog.id_materie=materie.id AND catalog.id_student=student.id;
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AFISARE_TOATE_CURSURILE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AFISARE_TOATE_CURSURILE`(username_student varchar(45))
BEGIN
	/*student*/
    SELECT *
    FROM materie;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AFISARE_TOATE_GRUPURILE_DE_STUDENTI` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AFISARE_TOATE_GRUPURILE_DE_STUDENTI`(username_student varchar(45))
BEGIN
	/*student*/
    SELECT grup_studenti.nume,materie.nume
    FROM grup_studenti,materie
    WHERE materie.id=grup_studenti.id_materie;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AFISARE_UTILIZATORI_NUME_ADMINISTRATOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AFISARE_UTILIZATORI_NUME_ADMINISTRATOR`(nume_user Varchar(45),prenume_user Varchar(45))
BEGIN
	/*Administrator*/
       
    SELECT * FROM administrator
	WHERE administrator.nume=nume_user AND administrator.prenume=prenume_user;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AFISARE_UTILIZATORI_NUME_PROFESOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AFISARE_UTILIZATORI_NUME_PROFESOR`(nume_user Varchar(45),prenume_user Varchar(45))
BEGIN
	/*Administrator*/
    SELECT * FROM profesor
	WHERE profesor.nume=nume_user AND profesor.prenume=prenume_user;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AFISARE_UTILIZATORI_NUME_STUDENT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AFISARE_UTILIZATORI_NUME_STUDENT`(nume_user Varchar(45),prenume_user Varchar(45))
BEGIN
	/*Administrator*/
    SELECT * FROM student
	WHERE student.nume=nume_user AND student.prenume=prenume_user;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ASIGNARE_PROFESOR_MATERIE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ASIGNARE_PROFESOR_MATERIE`(nume_profesor Varchar(45),prenume_profesor Varchar(45),nume_materie varchar(45))
BEGIN
/* Administrator */

INSERT INTO inscris_profesor_materie (id_profesor,id_materie)
SELECT profesor.id,materie.id
FROM profesor,materie
WHERE profesor.nume=nume_profesor AND profesor.prenume=prenume_profesor AND materie.nume=nume_materie;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CALCUL_NOTA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CALCUL_NOTA`(username_student varchar(45), nume_materieS varchar(45))
BEGIN
	/*profesor*/
    SET @ID_STUDENT=NULL, @ID_MATERIE=NULL;
    SELECT @ID_STUDENT := id FROM student WHERE (email=username_student);
    SELECT @ID_MATERIE := id FROM materie WHERE nume=nume_materieS;
    IF(@ID_STUDENT IS NOT NULL AND @ID_MATERIE IS NOT NULL) THEN
		SET @NOTA_CURS=NULL, @NOTA_LABORATOR=NULL, @NOTA_SEMINAR=NULL;
		SELECT @NOTA_CURS := notaCurs FROM catalog WHERE (id_student = @ID_STUDENT AND id_materie = @ID_MATERIE);
		SELECT @NOTA_LABORATOR := notaLaborator FROM catalog WHERE (id_student = @ID_STUDENT AND id_materie = @ID_MATERIE);
		SELECT @NOTA_SEMINAR := notaSeminar FROM catalog WHERE (id_student = @ID_STUDENT AND id_materie = @ID_MATERIE);
        
        SET @PROCENT_CURS=NULL, @PROCENT_LABORATOR=NULL, @PROCENT_SEMINAR=NULL;
        SELECT @PROCENT_CURS := procentCurs FROM materie WHERE (id = @ID_MATERIE);
		SELECT @PROCENT_LABORATOR := procentLaborator FROM materie WHERE (id = @ID_MATERIE);
		SELECT @PROCENT_SEMINAR := procentSeminar FROM materie WHERE (id = @ID_MATERIE);
		
		SET @MEDIA = (@NOTA_CURS*@PROCENT_CURS + @NOTA_LABORATOR*@PROCENT_LABORATOR +  @NOTA_SEMINAR*@PROCENT_SEMINAR)/100 ;
		UPDATE catalog SET notaFinala = @MEDIA WHERE (id_student = @ID_STUDENT AND id_materie = @ID_MATERIE);
	ELSE ROLLBACK;
    END IF;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CAUTARE_ADMINISTRATOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CAUTARE_ADMINISTRATOR`(user_email varchar(45),parola varchar(45))
BEGIN
    SELECT * FROM administrator WHERE (administrator.email=user_email AND administrator.parola=parola);
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CAUTARE_NUME_CURS_PROFESOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CAUTARE_NUME_CURS_PROFESOR`(nume_curs varchar(45))
BEGIN

    SELECT *
    FROM profesor,materie,inscris_profesor_materie
    WHERE (facultate.materie.nume=nume_curs && inscris_profesor_materie.id_materie=materie.id && inscris_profesor_materie.id_profesor=profesor.id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CAUTARE_NUME_CURS_STUDENT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CAUTARE_NUME_CURS_STUDENT`(nume_curs varchar(45))
BEGIN
    SELECT *
    FROM student,materie,catalog
    WHERE (materie.nume=nume_curs && catalog.id_materie=materie.id && catalog.id_student=student.id);
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CAUTARE_PROFESOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CAUTARE_PROFESOR`(user_email varchar(45),parola varchar(45))
BEGIN
	/* Toti */
	DECLARE result BIT;

	SET @ID_PROFESOR=NULL;
    SELECT * FROM profesor WHERE (profesor.email=user_email AND profesor.parola=parola);
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CAUTARE_STUDENT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CAUTARE_STUDENT`(user_email varchar(45),parola varchar(45))
BEGIN
    SELECT * FROM student WHERE (student.email=user_email AND student.parola=parola);
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DATE_PERSONALE_ADMINISTRATOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DATE_PERSONALE_ADMINISTRATOR`(username Varchar(45))
BEGIN
	/*student*/
    SELECT * FROM administrator
	WHERE administrator.email=username;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DATE_PERSONALE_PROFESOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DATE_PERSONALE_PROFESOR`(username Varchar(45))
BEGIN
	/*profesor*/
    SELECT * FROM profesor
	WHERE profesor.email=username;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DATE_PERSONALE_STUDENT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DATE_PERSONALE_STUDENT`(username Varchar(45))
BEGIN
	/*student*/
    SELECT * FROM student
	WHERE student.email=username;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IMPARTIRE_PROCENTUALA_ACTIVITATI` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `IMPARTIRE_PROCENTUALA_ACTIVITATI`(nume_materie varchar(45), procentCurs int,procentSeminar int, procentLaborator int)
BEGIN
	/* Profesor */

	SET @ID_MATERIE=NULL;
    SELECT @ID_MATERIE := id FROM materie WHERE (nume=nume_materie);
	IF(@ID_MATERIE IS NOT NULL) THEN
		UPDATE materie
		SET
			procentCurs = procentCurs,
            procentSeminar=procentSeminar,
            procentLaborator=procentLaborator
		WHERE (id=@ID_MATERIE);
    ELSE ROLLBACK;
    END IF;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `INSCRIERE_ACTIVITATE_DIDACTICA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `INSCRIERE_ACTIVITATE_DIDACTICA`(username_student varchar(45), nume_materie varchar(45), nume_profesor varchar(45), prenume_profesor varchar(45), curs INT,seminar INT,laborator INT,examen INT,colocviu INT,data_inceput varchar(45),data_final varchar(45))
BEGIN
	/*student*/
    SET @ID_STUDENT=null,@ID_PROFESOR=null,@ID_MATERIE=null,@ID_ACTIVITATE=null;
    SELECT @ID_STUDENT:=id FROM student WHERE student.email=username_student;
    SELECT @ID_PROFESOR:=id FROM profesor WHERE profesor.nume=nume_profesor AND profesor.prenume=prenume_profesor;
    SELECT @ID_MATERIE:=id FROM materie WHERE materie.nume=nume_materie;
    SELECT @ID_ACTIVITATE:=id FROM activitate_didactica WHERE activitate_didactica.idProfesor=@ID_PROFESOR 
    AND activitate_didactica.idMaterie=@ID_MATERIE 
    AND activitate_didactica.Curs=curs
    AND activitate_didactica.Seminar=seminar
    AND activitate_didactica.Laborator=laborator
    AND activitate_didactica.Examen=examen
    AND activitate_didactica.Colocviu=colocviu
    AND activitate_didactica.DataInceput=data_inceput
    AND activitate_didactica.DataFinal=data_final;
    
    IF @ID_ACTIVITATE IS NOT NULL THEN
    BEGIN
    INSERT INTO inscris_activitate_didactica (idActivitateDidactica,idStudent)
		VALUES (@ID_ACTIVITATE,@ID_STUDENT);
    END;
    END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `INSCRIERE_AUTOMATA_STUDENTI_ACT_DIDACTICA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `INSCRIERE_AUTOMATA_STUDENTI_ACT_DIDACTICA`(MATERIE_NUME varchar(45),EMAIL_STUDENT varchar(45))
BEGIN
/*
CREATE DEFINER = CURRENT_USER TRIGGER `facultate`.`catalog_AFTER_INSERT_1` AFTER INSERT ON `catalog` FOR EACH ROW
*/
	/*student*/
	SET @ID_ACTIVITATE=null;
    SELECT @ID_ACTIVITATE:=activitate_didactica.id
    FROM activitate_didactica,materie
    WHERE materie.nume=MATERIE_NUME AND activitate_didactica.idMaterie=materie.id;
    
    SET @ID_STUDENT=null;
    SELECT @ID_STUDENT:=student.id
    FROM student
    WHERE student.email=EMAIL_STUDENT;

	INSERT INTO inscris_activitate_didactica (idActivitateDidactica,idStudent)
    values (@ID_ACTIVITATE,@ID_STUDENT);
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `INSCRIERE_GRUP_STUDIU` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `INSCRIERE_GRUP_STUDIU`(username_student varchar(45),nume_grup_studenti varchar(45),nume_materie varchar(45))
BEGIN
	/*student*/
	SET @ID_GRUP=NULL,@ID_STUDENT=NULL,@ID_MATERIE=NULL,@ID_CATALOG=NULL;
    SELECT @ID_GRUP := id FROM grup_studenti WHERE grup_studenti.nume=nume_grup_studenti;
    SELECT @ID_STUDENT := id FROM student WHERE student.email=username_student;
    SELECT @ID_MATERIE := id FROM materie WHERE materie.nume=nume_materie;
    SELECT @ID_CATALOG := id FROM catalog WHERE catalog.id_materie=@ID_MATERIE AND catalog.id_student=@ID_STUDENT;
    
	INSERT INTO inscris_grup (inscris_grup.id_student,inscris_grup.id_grup)
	VALUES (@ID_STUDENT,@ID_GRUP);
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `INSCRIERE_STUDENT_LA_CURS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `INSCRIERE_STUDENT_LA_CURS`(username varchar(45), nume_materie varchar(45))
BEGIN
	/*STUDENT*/
	SET @ID_STUDENT=NULL, @ID_MATERIE=NULL;
    SELECT @ID_STUDENT := id FROM student WHERE email=username;
    SELECT @ID_MATERIE := id FROM materie WHERE nume=nume_materie;
    IF(@ID_STUDENT IS NOT NULL AND @ID_MATERIE IS NOT NULL) THEN
		INSERT INTO catalog (id_student,id_materie) VALUES (@ID_STUDENT,@ID_MATERIE);
	END IF;
    
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MATERII_PREDATE_DE_PROFESOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `MATERII_PREDATE_DE_PROFESOR`(username_profesor varchar(45))
BEGIN
	/*profesor*/
    SELECT materie.nume
    FROM materie,profesor,inscris_profesor_materie
    WHERE (profesor.email=username_profesor AND profesor.id=inscris_profesor_materie.id_profesor AND materie.id=inscris_profesor_materie.id_materie);
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MODIFICARE_ADMINISTRATOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `MODIFICARE_ADMINISTRATOR`(CNP varchar(45), nume varchar(45), prenume varchar(45), adresa varchar(45), numarDeTelefon varchar(45), email varchar(45), IBAN varchar(45), nrContract int)
BEGIN
	/*superadmin*/
	UPDATE administrator
    SET
		adresa=adresa,
        numarDeTelefon=numarDeTelefon,
        email=email,
        IBAN=IBAN,
        superadministrator_bool = 0,
        nrContract=nrContract
    WHERE (administrator.CNP = CNP AND administrator.nume = nume AND administrator.prenume = prenume);
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MODIFICARE_PROFESOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `MODIFICARE_PROFESOR`(CNP varchar(45), nume varchar(45), prenume varchar(45), adresa varchar(45), nrDeTelefon varchar(45), email varchar(45), IBAN varchar(45), nrContract int, OreMin int, OreMax int, Departament varchar(45))
BEGIN
	/*admin*/
    UPDATE profesor
    SET
		adresa=adresa,
        nrDeTelefon=nrDeTelefon,
        email=email,
        IBAN=IBAN,
        nrContract=nrContract,
        OreMin=OreMin,
        OreMax=OreMax,
        Departament=Departament
    WHERE (profesor.CNP = CNP AND profesor.nume = nume AND profesor.prenume = prenume);
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MODIFICARE_STUDENT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `MODIFICARE_STUDENT`(CNP varchar(45), nume varchar(45), prenume varchar(45), adresa varchar(45), nrDeTelefon varchar(45), email varchar(45), IBAN varchar(45), nrContract int, anDeStudiu int, nrDeOre int)
BEGIN
	/*admin*/
    UPDATE student
    SET
		adresa=adresa,
        nrDeTelefon=nrDeTelefon,
        email=email,
        IBAN=IBAN,
        nrContract=nrContract,
        anDeStudiu=anDeStudiu,
        nrDeOre=nrDeOre
    WHERE (student.CNP = CNP AND student.nume = nume AND student.prenume = prenume);
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PROGRAMARE_ACTIVITATE_DIDACTICA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROGRAMARE_ACTIVITATE_DIDACTICA`(email_profesor varchar(45), nume_materie varchar(45), Curs int, Seminar int, Laborator int, Examen int, Colocviu int, DataInceput varchar(45), DataFinal varchar(45), NrMaximParticipanti int)
BEGIN
	/* Profesor */

	SET @ID_MATERIE=NULL, @ID_PROFESOR = NULL;
    SELECT @ID_MATERIE := id FROM materie WHERE (nume=nume_materie);
    SELECT @ID_PROFESOR := id FROM profesor WHERE (email=email_profesor);
	IF(@ID_MATERIE IS NOT NULL AND @ID_PROFESOR IS NOT NULL) THEN
		INSERT INTO activitate_didactica(idMaterie,idProfesor,Curs,Seminar,Laborator,Examen,Colocviu,DataInceput,DataFinal,NrMaximParticipanti)
        VALUES (@ID_MATERIE,@ID_PROFESOR,Curs,Seminar,Laborator,Examen,Colocviu,DataInceput,DataFinal,NrMaximParticipanti);
    ELSE ROLLBACK;
    END IF;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RENUNTARE_STUDENT_LA_CURS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RENUNTARE_STUDENT_LA_CURS`(username varchar(45), nume_materie varchar(45))
BEGIN
	/*student*/
    SET @ID_STUDENT=NULL, @ID_MATERIE=NULL;
    SELECT @ID_STUDENT := id FROM student WHERE email=username;
    SELECT @ID_MATERIE := id FROM materie WHERE nume=nume_materie;
    IF(@ID_STUDENT IS NOT NULL AND @ID_MATERIE IS NOT NULL) THEN
		DELETE FROM catalog
		WHERE (catalog.id_materie=@ID_MATERIE AND catalog.id_student=@ID_STUDENT);
	END IF;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SALVARE_NOTA_CATALOG_PROFESOR_LA_STUDENT_LA_MATERIE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SALVARE_NOTA_CATALOG_PROFESOR_LA_STUDENT_LA_MATERIE`(username_profesor varchar(45),nume_materie varchar(45),
nume_student varchar(45),prenume_student varchar(45),nota_curs INT,nota_seminar INT,nota_laborator INT)
BEGIN
	/*profesor*/
    
    SET @ID_STUDENT=NULL, @ID_MATERIE=NULL, @ID_PROFESOR=NULL, @ID_CATALOG=NULL;
    SELECT @ID_STUDENT := id FROM student WHERE (nume=nume_student AND prenume=prenume_student);
    SELECT @ID_MATERIE := id FROM materie WHERE nume=nume_materie;
    SELECT @ID_PROFESOR := id FROM profesor WHERE email=username_profesor;
    SELECT @ID_CATALOG := id FROM catalog WHERE (id_student=@ID_STUDENT AND id_materie=@ID_MATERIE);
    
    UPDATE catalog
    SET catalog.notaCurs=nota_curs, catalog.notaSeminar=nota_seminar, catalog.notaLaborator=nota_laborator
	WHERE(catalog.id=@ID_CATALOG);
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SELECT_USER` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SELECT_USER`(nume_user Varchar(45),prenume_user Varchar(45),filtru int)
BEGIN
/* Administrator */
/*0-user,1-profesor,2-student*/
IF(filtru=0)THEN
BEGIN
SELECT * FROM profesor
WHERE profesor.nume=nume_user AND profesor.prenume=prenume_user;
SELECT * FROM student
WHERE student.nume=nume_user AND student.prenume=prenume_user;
END;
ELSEIF(filtru=1)THEN
		BEGIN
		SELECT * FROM profesor
		WHERE profesor.nume=nume_user AND profesor.prenume=prenume_user;
		END;
	ELSE
	BEGIN
	SELECT * FROM student
	WHERE student.nume=nume_user AND student.prenume=prenume_user;
	END;
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `STERGERE_ADMINISTRATOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `STERGERE_ADMINISTRATOR`(CNP varchar(45), nume varchar(45), prenume varchar(45))
BEGIN
	/*superadmin*/
	DELETE FROM administrator WHERE administrator.CNP=CNP AND administrator.Nume=nume AND administrator.Prenume=prenume;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `STERGERE_PROFESOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `STERGERE_PROFESOR`(CNP varchar(45), nume varchar(45), prenume varchar(45))
BEGIN
	/*admin*/
    DELETE FROM profesor WHERE profesor.CNP=CNP AND profesor.Nume=nume AND profesor.Prenume=prenume;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `STERGERE_STUDENT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `STERGERE_STUDENT`(CNP varchar(45), nume varchar(45), prenume varchar(45))
BEGIN
	/*admin*/
   DELETE FROM student WHERE student.CNP=CNP AND student.Nume=nume AND student.Prenume=prenume;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `STUDENTII_UNUI_PROFESOR_LA_MATERIE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `STUDENTII_UNUI_PROFESOR_LA_MATERIE`(username_profesor varchar(45),nume_materie varchar(45))
BEGIN
	/*profesor*/
    SELECT student.nume,student.prenume
    FROM materie,profesor,inscris_profesor_materie,catalog,student
    WHERE (profesor.email=username_profesor AND profesor.id=inscris_profesor_materie.id_profesor AND materie.id=inscris_profesor_materie.id_materie 
    AND materie.id=catalog.id_materie AND catalog.id_student=student.id AND nume_materie=materie.nume);
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SUGESTI_FERESTRE_ACTIVITATI_GRUP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SUGESTI_FERESTRE_ACTIVITATI_GRUP`(email_student varchar(45))
BEGIN
	/*student*/
    SELECT activitate_grup.*
    FROM student,inscris_activitate_didactica,inscris_grup,grup_studenti,activitate_grup,activitate_didactica
    WHERE student.email=email_student AND student.id=inscris_activitate_didactica.idStudent AND 
    inscris_activitate_didactica.idActivitateDidactica=activitate_didactica.id AND
    student.id=inscris_grup.id_student AND inscris_grup.id_grup=grup_studenti.id
    AND activitate_grup.id_grup=grup_studenti.id
    AND activitate_grup.inceputActivitate<>activitate_didactica.DataInceput;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TRIMITE_MESAJ` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TRIMITE_MESAJ`(username_student varchar(45),mesaj varchar(100),nume_grup_studenti varchar(45) )
BEGIN
	/*student*/
     SET @ID_GRUP=NULL,@ID_STUDENT=NULL;
    SELECT @ID_GRUP := id FROM grup_studenti WHERE grup_studenti.nume=nume_grup_studenti;
    SELECT @ID_STUDENT := id FROM student WHERE student.email=username_student;
    
    INSERT INTO chat (chat.text,chat.idGrup,chat.idStudent)
    VALUES (mesaj,@ID_GRUP,@ID_STUDENT);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `VERIFICARE_STUDENT_INSCRIS_MATERIE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `VERIFICARE_STUDENT_INSCRIS_MATERIE`(username_student varchar(45),nume_grup_studenti varchar(45),nume_materie varchar(45))
BEGIN
	/*student*/
    
    SELECT * 
    FROM catalog,student,materie
    WHERE student.email=username_student AND student.id=catalog.id_student AND  catalog.id_materie=materie.id AND materie.nume=nume_materie;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `VERIFICARE_TIMP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `VERIFICARE_TIMP`(data_prezenta varchar(45))
BEGIN
	/*student*/
    SET @ID_ACTIVITATE_GRUP=null;
    SELECT @ID_ACTIVITATE_GRUP:=id 
    FROM activitate_grup
    WHERE activitate_grup.dataExpirare<data_prezenta AND activitate_grup.nrMin>activitate_grup.nrPersInscrise;
    
    DELETE
    FROM inscris_activitate_grup
    WHERE inscris_activitate_grup.id_activitate=@ID_ACTIVITATE_GRUP;
    
    DELETE
    FROM activitate_grup
    WHERE activitate_grup.id=@ID_ACTIVITATE_GRUP;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `VIZUALIZARE_ACTIVITATI_GRUP_STUDIU` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `VIZUALIZARE_ACTIVITATI_GRUP_STUDIU`(nume_grup varchar(45))
BEGIN
	/*student*/
    SELECT *
    FROM activitate_grup,grup_studenti
    WHERE grup_studenti.nume=nume_grup AND grup_studenti.id=activitate_grup.id_grup;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `VIZUALIZARE_MEMBRII_GRUP_STUDIU` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `VIZUALIZARE_MEMBRII_GRUP_STUDIU`(nume_grup varchar(45))
BEGIN
	/*student*/
    SELECT student.*
    FROM student,grup_studenti,inscris_grup
    WHERE grup_studenti.nume=nume_grup AND grup_studenti.id=inscris_grup.id_grup 
    AND inscris_grup.id_student=student.id;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `VIZUALIZARE_NOTE_DE_STUDENT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `VIZUALIZARE_NOTE_DE_STUDENT`(username_student varchar(45))
BEGIN
	/*student*/
    SELECT materie.nume,catalog.notaCurs,catalog.notaSeminar,catalog.notaLaborator,catalog.notaFinala
    FROM catalog,materie,student
    WHERE student.email=username_student AND student.id=catalog.id_student AND catalog.id_materie=materie.id;
    
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

-- Dump completed
