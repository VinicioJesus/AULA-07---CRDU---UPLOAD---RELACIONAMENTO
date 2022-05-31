CREATE DATABASE  IF NOT EXISTS `dbcoffeeshop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dbcoffeeshop`;
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: dbcoffeeshop
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `tblcategoria`
--

DROP TABLE IF EXISTS `tblcategoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblcategoria` (
  `idcategoria` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) NOT NULL,
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcategoria`
--

LOCK TABLES `tblcategoria` WRITE;
/*!40000 ALTER TABLE `tblcategoria` DISABLE KEYS */;
INSERT INTO `tblcategoria` VALUES (1,'Macchiato'),(2,'Macchiato Gelado'),(3,'Café Gelado');
/*!40000 ALTER TABLE `tblcategoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcontatos`
--

DROP TABLE IF EXISTS `tblcontatos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblcontatos` (
  `idcontato` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) NOT NULL,
  `email` varchar(320) NOT NULL,
  `mensagem` text NOT NULL,
  PRIMARY KEY (`idcontato`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcontatos`
--

LOCK TABLES `tblcontatos` WRITE;
/*!40000 ALTER TABLE `tblcontatos` DISABLE KEYS */;
INSERT INTO `tblcontatos` VALUES (1,'Luiz','luiz@gmail.com','testando o mysql 3'),(5,'Maria','maria@gmail.com','testando o mysql 1'),(6,'Joao','joao@gmail.com','testando o mysql 2');
/*!40000 ALTER TABLE `tblcontatos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-30 17:00:14
CREATE DATABASE  IF NOT EXISTS `dbvideolocadora20221` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dbvideolocadora20221`;
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: dbvideolocadora20221
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `tblator`
--

DROP TABLE IF EXISTS `tblator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblator` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) NOT NULL,
  `nomeArtistico` varchar(80) NOT NULL,
  `dataNascimento` date NOT NULL,
  `dataFalecimento` date DEFAULT NULL,
  `biografia` text,
  `idSexo` int unsigned NOT NULL,
  `qtdeOscar` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK_Sexo_Ator` (`idSexo`),
  CONSTRAINT `FK_Sexo_Ator` FOREIGN KEY (`idSexo`) REFERENCES `tblsexo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblator`
--

LOCK TABLES `tblator` WRITE;
/*!40000 ALTER TABLE `tblator` DISABLE KEYS */;
INSERT INTO `tblator` VALUES (3,'MARLON BRANDO','MARLON BRANDO','1924-04-03','2004-07-01','- Trabalhou como ascensorista de elevador em uma loja por 4 dias, antes de se tornar famoso.- Possui uma ilha particular no oceano Pacífico, na Polinésia, desde 1966.- O Oscar que ganhou por \"Sindicato dos Ladrões\" foi roubado de sua casa, com o ator tendo solicitado à Academia de Artes e Ciências Cinematográficas a reposição da estatueta, em 1970.- Recusou o Oscar recebido por \"O Poderoso Chefão\", em protesto pelo modo como os Estados Unidos e, especialmente, Hollywood vinham discriminando os índios nativos do país. Brando não compareceu à cerimônia de entrega do Oscar e enviou em seu lugar a atriz Sacheen Littlefeather, que subiu ao palco para receber a estatueta do ator como se fosse uma índia verdadeira, divulgando seu protesto.- Em determinado momento das filmagens de \"A Cartada Final\", se recusava a estar no mesmo set que o diretor Frank Oz.- Possui uma estrela na ...',6,5),(4,'Daniel Wroughton Craig','DANIEL CRAIG','1968-02-03',NULL,'Daniel Craig tornou-se conhecido por interpretar James Bond desde 2006. Ex-aluno da National Youth Theatre, se formou na Guildhall School of Music and Drama em Londres, iniciando sua carreira como ator de teatro. Sua primeiras aparições no cinema foram nos filmes Elizabeth, The Power of One e A Kid in King Arthur\"s Court, e na televisão nas séries Sharpe\"s Eagle e Zorro. Estrelou no papel de James Bond em 007: Cassino Royale (2006) e seguiu em 007 - Quantum of Solace (2008 ), 007 - Operação Skyfall (2012), 007 Contra Specter (2015) e Sem Tempo Para Morrer (2021). Seu interesse em atuar foi incentivado por visitas ao Liverpool Everyman Theatre com sua mãe e aos 6 anos, Craig começou a atuar em peças escolares, estreando na produção de \"Oliver!\" de sua escola primária. O primeiro filme de 007 que ele assistiu no cinema foi Viva e Deixe Morrer (1973) de Roger Moore, com seu pai. ...',6,4),(5,'Loyd Foger','Twilight','1989-02-03',NULL,'The master spy codenamed <Twilight> has spent his days on undercover missions, all for the dream of a better world. But one day, he receives a particularly difficult new order from command. For his mission, he must form a temporary family and start a new life?! A Spy/Action/Comedy about a one-of-a-kind family!',6,10),(6,'Loyd Foger','Twilight','1989-02-03',NULL,'The master spy codenamed <Twilight> has spent his days on undercover missions, all for the dream of a better world. But one day, he receives a particularly difficult new order from command. For his mission, he must form a temporary family and start a new life?! A Spy/Action/Comedy about a one-of-a-kind family!',6,20),(7,'Loyd Foger','Twilight','1989-02-03',NULL,'The master spy codenamed <Twilight> has spent his days on undercover missions, all for the dream of a better world. But one day, he receives a particularly difficult new order from command. For his mission, he must form a temporary family and start a new life?! A Spy/Action/Comedy about a one-of-a-kind family!',6,37);
/*!40000 ALTER TABLE `tblator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblatornacionalidade`
--

DROP TABLE IF EXISTS `tblatornacionalidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblatornacionalidade` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `idAtor` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK_Ator_AtorNacionalidade` (`idAtor`),
  CONSTRAINT `FK_Ator_AtorNacionalidade` FOREIGN KEY (`idAtor`) REFERENCES `tblator` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblatornacionalidade`
--

LOCK TABLES `tblatornacionalidade` WRITE;
/*!40000 ALTER TABLE `tblatornacionalidade` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblatornacionalidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblfilme`
--

DROP TABLE IF EXISTS `tblfilme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblfilme` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) NOT NULL,
  `duracao` time NOT NULL,
  `dataLancamento` date NOT NULL,
  `dataRelancamento` date DEFAULT NULL,
  `sinopse` text,
  `nomeOriginal` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblfilme`
--

LOCK TABLES `tblfilme` WRITE;
/*!40000 ALTER TABLE `tblfilme` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblfilme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblfilmeator`
--

DROP TABLE IF EXISTS `tblfilmeator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblfilmeator` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `idFilme` int unsigned NOT NULL,
  `idAtor` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK_Filme_FilmeAtor` (`idFilme`),
  KEY `FK_Ator_FilmeAtor` (`idAtor`),
  CONSTRAINT `FK_Ator_FilmeAtor` FOREIGN KEY (`idAtor`) REFERENCES `tblator` (`id`),
  CONSTRAINT `FK_Filme_FilmeAtor` FOREIGN KEY (`idFilme`) REFERENCES `tblfilme` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblfilmeator`
--

LOCK TABLES `tblfilmeator` WRITE;
/*!40000 ALTER TABLE `tblfilmeator` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblfilmeator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblfilmegenero`
--

DROP TABLE IF EXISTS `tblfilmegenero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblfilmegenero` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `idFilme` int unsigned NOT NULL,
  `idGenero` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK_Filme_FilmeGenero` (`idFilme`),
  KEY `FK_Genero_FilmeGenero` (`idGenero`),
  CONSTRAINT `FK_Filme_FilmeGenero` FOREIGN KEY (`idFilme`) REFERENCES `tblfilme` (`id`),
  CONSTRAINT `FK_Genero_FilmeGenero` FOREIGN KEY (`idGenero`) REFERENCES `tblgenero` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblfilmegenero`
--

LOCK TABLES `tblfilmegenero` WRITE;
/*!40000 ALTER TABLE `tblfilmegenero` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblfilmegenero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblgenero`
--

DROP TABLE IF EXISTS `tblgenero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblgenero` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblgenero`
--

LOCK TABLES `tblgenero` WRITE;
/*!40000 ALTER TABLE `tblgenero` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblgenero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblnacionalidade`
--

DROP TABLE IF EXISTS `tblnacionalidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblnacionalidade` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `id_2` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblnacionalidade`
--

LOCK TABLES `tblnacionalidade` WRITE;
/*!40000 ALTER TABLE `tblnacionalidade` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblnacionalidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsexo`
--

DROP TABLE IF EXISTS `tblsexo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblsexo` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(25) NOT NULL,
  `sigla` varchar(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsexo`
--

LOCK TABLES `tblsexo` WRITE;
/*!40000 ALTER TABLE `tblsexo` DISABLE KEYS */;
INSERT INTO `tblsexo` VALUES (1,'FEMININO','F'),(2,'FEMININO','F'),(3,'MASCULINO','M'),(4,'FEMININO','O'),(5,'FEMININO','F'),(6,'MASCULINO','M'),(7,'FEMININO','O'),(8,'MASCULINO','M'),(9,'Outros','O'),(10,'MASCULINO','M'),(11,'Outros','O'),(12,'MASCULINO','M'),(13,'Outros','O'),(14,'Masculino','M'),(15,'Outros','O');
/*!40000 ALTER TABLE `tblsexo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblstreaming`
--

DROP TABLE IF EXISTS `tblstreaming`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblstreaming` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblstreaming`
--

LOCK TABLES `tblstreaming` WRITE;
/*!40000 ALTER TABLE `tblstreaming` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblstreaming` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-30 17:00:15
CREATE DATABASE  IF NOT EXISTS `dbcontatos` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dbcontatos`;
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: dbcontatos
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `tblcategoria`
--

DROP TABLE IF EXISTS `tblcategoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblcategoria` (
  `idcategoria` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) NOT NULL,
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcategoria`
--

LOCK TABLES `tblcategoria` WRITE;
/*!40000 ALTER TABLE `tblcategoria` DISABLE KEYS */;
INSERT INTO `tblcategoria` VALUES (1,'Macchiato'),(2,'Macchiato Gelado'),(3,'Café Gelado');
/*!40000 ALTER TABLE `tblcategoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcontatos`
--

DROP TABLE IF EXISTS `tblcontatos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblcontatos` (
  `idcontato` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) NOT NULL,
  `telefone` varchar(18) DEFAULT NULL,
  `celular` varchar(19) NOT NULL,
  `email` varchar(320) NOT NULL,
  `obs` text,
  `foto` varchar(50) DEFAULT NULL,
  `idestado` int unsigned NOT NULL,
  PRIMARY KEY (`idcontato`),
  KEY `FK_Estado_Contatos` (`idestado`),
  CONSTRAINT `FK_Estado_Contatos` FOREIGN KEY (`idestado`) REFERENCES `tblestado` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcontatos`
--

LOCK TABLES `tblcontatos` WRITE;
/*!40000 ALTER TABLE `tblcontatos` DISABLE KEYS */;
INSERT INTO `tblcontatos` VALUES (18,'fernando','11971657461','11971657461','fernando@gmail.com','skjfnka','',1),(19,'Vinicio','11971657461','11971657461','vinicio@gmail.com','mandando','',2);
/*!40000 ALTER TABLE `tblcontatos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblestado`
--

DROP TABLE IF EXISTS `tblestado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblestado` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sigla` varchar(2) NOT NULL,
  `nome` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblestado`
--

LOCK TABLES `tblestado` WRITE;
/*!40000 ALTER TABLE `tblestado` DISABLE KEYS */;
INSERT INTO `tblestado` VALUES (1,'SP','São Paulo'),(2,'RJ','Rio de Janeiro');
/*!40000 ALTER TABLE `tblestado` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-30 17:00:15
