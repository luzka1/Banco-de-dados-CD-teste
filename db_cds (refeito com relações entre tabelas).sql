-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: db_cds
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

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
-- Table structure for table `artista`
--

DROP TABLE IF EXISTS `artista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artista` (
  `id_art` int(11) NOT NULL AUTO_INCREMENT,
  `nome_art` varchar(100) NOT NULL,
  PRIMARY KEY (`id_art`),
  UNIQUE KEY `uk_artista` (`nome_art`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `id_cat` int(11) NOT NULL AUTO_INCREMENT,
  `nome_cat` varchar(50) NOT NULL,
  PRIMARY KEY (`id_cat`),
  UNIQUE KEY `uk_cat` (`nome_cat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cidade`
--

DROP TABLE IF EXISTS `cidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cidade` (
  `id_cid` int(11) NOT NULL AUTO_INCREMENT,
  `sigla_est` char(2) NOT NULL,
  `nome_cid` varchar(100) NOT NULL,
  PRIMARY KEY (`id_cid`),
  KEY `fk_sigla_est` (`sigla_est`),
  CONSTRAINT `fk_sigla_est` FOREIGN KEY (`sigla_est`) REFERENCES `estado` (`sigla_est`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `id_Cli` int(11) NOT NULL AUTO_INCREMENT,
  `id_cid` int(11) NOT NULL,
  `nome_cli` varchar(100) NOT NULL,
  `end_cli` varchar(200) NOT NULL,
  `renda_cli` decimal(10,2) NOT NULL DEFAULT 0.00,
  `sexo_cli` enum('f','m') NOT NULL DEFAULT 'f',
  PRIMARY KEY (`id_Cli`),
  KEY `fk_cid` (`id_cid`),
  CONSTRAINT `fk_cid` FOREIGN KEY (`id_cid`) REFERENCES `cidade` (`id_cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conjuge`
--

DROP TABLE IF EXISTS `conjuge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conjuge` (
  `id_conj` int(11) NOT NULL AUTO_INCREMENT,
  `id_cli` int(11) NOT NULL,
  `nome_conj` varchar(100) NOT NULL,
  `renda_conj` decimal(10,2) NOT NULL DEFAULT 0.00,
  `sexo_conj` enum('f','m') DEFAULT 'm',
  PRIMARY KEY (`id_conj`),
  KEY `id_cli` (`id_cli`),
  CONSTRAINT `conjuge_ibfk_1` FOREIGN KEY (`id_cli`) REFERENCES `cliente` (`id_Cli`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dependente`
--

DROP TABLE IF EXISTS `dependente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dependente` (
  `id_dep` int(11) NOT NULL AUTO_INCREMENT,
  `id_func` int(11) NOT NULL,
  `nome_dep` varchar(100) NOT NULL,
  `sexo_dep` enum('f','m') DEFAULT 'm',
  PRIMARY KEY (`id_dep`),
  KEY `id_func` (`id_func`),
  CONSTRAINT `dependente_ibfk_1` FOREIGN KEY (`id_func`) REFERENCES `funcionario` (`id_func`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado` (
  `sigla_est` char(2) NOT NULL,
  `nome_cid` varchar(100) NOT NULL,
  PRIMARY KEY (`sigla_est`),
  UNIQUE KEY `uk_nome_cidade` (`nome_cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funcionario` (
  `id_func` int(11) NOT NULL AUTO_INCREMENT,
  `nome_func` varchar(100) NOT NULL,
  `end_func` varchar(200) NOT NULL,
  `sal_func` decimal(10,2) NOT NULL DEFAULT 0.00,
  `sexo_func` enum('f','m') NOT NULL DEFAULT 'm',
  PRIMARY KEY (`id_func`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gravadora`
--

DROP TABLE IF EXISTS `gravadora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gravadora` (
  `id_grav` int(11) NOT NULL AUTO_INCREMENT,
  `nome_grav` varchar(50) NOT NULL,
  PRIMARY KEY (`id_grav`),
  UNIQUE KEY `uk_grav` (`nome_grav`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedido` (
  `id_ped` int(11) NOT NULL AUTO_INCREMENT,
  `id_func` int(11) NOT NULL,
  `data_ped` datetime NOT NULL,
  `val_ped` decimal(10,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id_ped`),
  KEY `id_func` (`id_func`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_func`) REFERENCES `funcionario` (`id_func`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `titulo`
--

DROP TABLE IF EXISTS `titulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `titulo` (
  `id_tit` int(11) NOT NULL AUTO_INCREMENT,
  `id_cat` int(11) NOT NULL,
  `id_grav` int(11) NOT NULL,
  `nome_cd` varchar(100) NOT NULL,
  `val_cd` decimal(10,2) NOT NULL,
  `qtd_estq` int(11) NOT NULL,
  PRIMARY KEY (`id_tit`),
  UNIQUE KEY `nome_cd` (`nome_cd`),
  KEY `id_cat` (`id_cat`),
  KEY `id_grav` (`id_grav`),
  CONSTRAINT `titulo_ibfk_1` FOREIGN KEY (`id_cat`) REFERENCES `categoria` (`id_cat`),
  CONSTRAINT `titulo_ibfk_2` FOREIGN KEY (`id_grav`) REFERENCES `gravadora` (`id_grav`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `titulo_artista`
--

DROP TABLE IF EXISTS `titulo_artista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `titulo_artista` (
  `id_titArt` int(11) NOT NULL AUTO_INCREMENT,
  `id_tit` int(11) NOT NULL,
  `id_art` int(11) NOT NULL,
  PRIMARY KEY (`id_titArt`),
  KEY `id_tit` (`id_tit`),
  KEY `id_art` (`id_art`),
  CONSTRAINT `titulo_artista_ibfk_1` FOREIGN KEY (`id_tit`) REFERENCES `titulo` (`id_tit`),
  CONSTRAINT `titulo_artista_ibfk_2` FOREIGN KEY (`id_art`) REFERENCES `artista` (`id_art`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `titulo_pedido`
--

DROP TABLE IF EXISTS `titulo_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `titulo_pedido` (
  `id_titPedido` int(11) NOT NULL AUTO_INCREMENT,
  `id_tit` int(11) NOT NULL,
  `id_ped` int(11) NOT NULL,
  `qtd_cd` int(11) NOT NULL DEFAULT 1,
  `val_cd` decimal(10,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id_titPedido`),
  KEY `id_tit` (`id_tit`),
  KEY `id_ped` (`id_ped`),
  CONSTRAINT `titulo_pedido_ibfk_1` FOREIGN KEY (`id_tit`) REFERENCES `titulo` (`id_tit`),
  CONSTRAINT `titulo_pedido_ibfk_2` FOREIGN KEY (`id_ped`) REFERENCES `pedido` (`id_ped`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-27 11:49:17
