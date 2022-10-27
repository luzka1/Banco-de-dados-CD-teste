-- MariaDB dump 10.19  Distrib 10.4.25-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: db_cds
-- ------------------------------------------------------
-- Server version	10.4.25-MariaDB

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
-- Table structure for table `tb_artista`
--

DROP TABLE IF EXISTS `tb_artista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_artista` (
  `cod_Art` int(11) NOT NULL AUTO_INCREMENT,
  `nome_Art` varchar(100) NOT NULL,
  PRIMARY KEY (`cod_Art`),
  UNIQUE KEY `nome_Art` (`nome_Art`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_artista`
--

LOCK TABLES `tb_artista` WRITE;
/*!40000 ALTER TABLE `tb_artista` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_artista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_categoria`
--

DROP TABLE IF EXISTS `tb_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_categoria` (
  `cod_Cat` int(11) NOT NULL AUTO_INCREMENT,
  `nome_Cat` varchar(50) NOT NULL,
  PRIMARY KEY (`cod_Cat`),
  UNIQUE KEY `nome_Cat` (`nome_Cat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_categoria`
--

LOCK TABLES `tb_categoria` WRITE;
/*!40000 ALTER TABLE `tb_categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cidade`
--

DROP TABLE IF EXISTS `tb_cidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_cidade` (
  `cod_Cid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_sigla_Est` char(2) NOT NULL,
  `nome_Cid` varchar(100) NOT NULL,
  PRIMARY KEY (`cod_Cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cidade`
--

LOCK TABLES `tb_cidade` WRITE;
/*!40000 ALTER TABLE `tb_cidade` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_cidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cliente`
--

DROP TABLE IF EXISTS `tb_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_cliente` (
  `cod_Cliente` int(11) NOT NULL AUTO_INCREMENT,
  `fk_cod_Cid` int(11) NOT NULL,
  `nome_Cliente` varchar(100) NOT NULL,
  `end_Cliente` varchar(200) NOT NULL,
  `renda_Cliente` decimal(10,2) NOT NULL DEFAULT 0.00,
  `sexo_Cliente` enum('f','m') NOT NULL DEFAULT 'f',
  PRIMARY KEY (`cod_Cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cliente`
--

LOCK TABLES `tb_cliente` WRITE;
/*!40000 ALTER TABLE `tb_cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_conjuge`
--

DROP TABLE IF EXISTS `tb_conjuge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_conjuge` (
  `cod_Cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nome_Conj` varchar(100) NOT NULL,
  `renda_Conj` decimal(10,2) NOT NULL DEFAULT 0.00,
  `sexo_Conj` enum('f','m') NOT NULL DEFAULT 'm',
  PRIMARY KEY (`cod_Cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_conjuge`
--

LOCK TABLES `tb_conjuge` WRITE;
/*!40000 ALTER TABLE `tb_conjuge` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_conjuge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_dependente`
--

DROP TABLE IF EXISTS `tb_dependente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_dependente` (
  `cod_Dep` int(11) NOT NULL AUTO_INCREMENT,
  `nome_Dep` varchar(100) NOT NULL,
  `sexo_Dep` enum('f','m') NOT NULL DEFAULT 'm',
  `fk_cod_Func` int(11) NOT NULL,
  PRIMARY KEY (`cod_Dep`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_dependente`
--

LOCK TABLES `tb_dependente` WRITE;
/*!40000 ALTER TABLE `tb_dependente` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_dependente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_estado`
--

DROP TABLE IF EXISTS `tb_estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_estado` (
  `cod_Est` int(11) NOT NULL AUTO_INCREMENT,
  `sigla_Est` char(2) NOT NULL,
  `nome_Est` char(50) NOT NULL,
  PRIMARY KEY (`cod_Est`),
  UNIQUE KEY `sigla_Est` (`sigla_Est`),
  UNIQUE KEY `nome_Est` (`nome_Est`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_estado`
--

LOCK TABLES `tb_estado` WRITE;
/*!40000 ALTER TABLE `tb_estado` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_funcionario`
--

DROP TABLE IF EXISTS `tb_funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_funcionario` (
  `cod_Func` int(11) NOT NULL AUTO_INCREMENT,
  `nome_Func` varchar(100) NOT NULL,
  `end_Func` varchar(200) NOT NULL,
  `sal_Func` decimal(10,2) NOT NULL DEFAULT 0.00,
  `sexo_Func` enum('f','m') NOT NULL DEFAULT 'm',
  PRIMARY KEY (`cod_Func`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_funcionario`
--

LOCK TABLES `tb_funcionario` WRITE;
/*!40000 ALTER TABLE `tb_funcionario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_gravadora`
--

DROP TABLE IF EXISTS `tb_gravadora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_gravadora` (
  `cod_Grav` int(11) NOT NULL AUTO_INCREMENT,
  `nome_Grav` varchar(50) NOT NULL,
  PRIMARY KEY (`cod_Grav`),
  UNIQUE KEY `nome_Grav` (`nome_Grav`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_gravadora`
--

LOCK TABLES `tb_gravadora` WRITE;
/*!40000 ALTER TABLE `tb_gravadora` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_gravadora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pedido`
--

DROP TABLE IF EXISTS `tb_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_pedido` (
  `cod_Ped` int(11) NOT NULL AUTO_INCREMENT,
  `fk_cod_Cli` int(11) NOT NULL,
  `fk_cod_Fun` int(11) NOT NULL,
  `data_ped` datetime NOT NULL,
  `val_ped` decimal(10,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`cod_Ped`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pedido`
--

LOCK TABLES `tb_pedido` WRITE;
/*!40000 ALTER TABLE `tb_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_titulo`
--

DROP TABLE IF EXISTS `tb_titulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_titulo` (
  `cod_Tit` int(11) NOT NULL AUTO_INCREMENT,
  `fk_cod_Cat` int(11) NOT NULL,
  `fk_cod_Grav` int(11) NOT NULL,
  `nome_CD` varchar(100) NOT NULL,
  `val_CD` decimal(10,2) NOT NULL,
  `qtd_Estq` int(11) NOT NULL,
  PRIMARY KEY (`cod_Tit`),
  UNIQUE KEY `nome_CD` (`nome_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_titulo`
--

LOCK TABLES `tb_titulo` WRITE;
/*!40000 ALTER TABLE `tb_titulo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_titulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `titulo_artista`
--

DROP TABLE IF EXISTS `titulo_artista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `titulo_artista` (
  `fk_cod_art` int(11) NOT NULL,
  `fk_cod_tit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titulo_artista`
--

LOCK TABLES `titulo_artista` WRITE;
/*!40000 ALTER TABLE `titulo_artista` DISABLE KEYS */;
/*!40000 ALTER TABLE `titulo_artista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `titulo_pedido`
--

DROP TABLE IF EXISTS `titulo_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `titulo_pedido` (
  `num_ped` int(11) NOT NULL AUTO_INCREMENT,
  `fk_cod_tit` int(11) NOT NULL,
  `qtd_CD` int(11) NOT NULL DEFAULT 1,
  `val_CD` decimal(10,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`num_ped`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titulo_pedido`
--

LOCK TABLES `titulo_pedido` WRITE;
/*!40000 ALTER TABLE `titulo_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `titulo_pedido` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-26 22:25:52
