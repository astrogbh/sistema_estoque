-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: projeto_final_bd
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `tbl_categorias`
--

DROP TABLE IF EXISTS `tbl_categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_categorias` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nome_categoria` varchar(100) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_categorias`
--

LOCK TABLES `tbl_categorias` WRITE;
/*!40000 ALTER TABLE `tbl_categorias` DISABLE KEYS */;
INSERT INTO `tbl_categorias` VALUES (1,'Ferramentas'),(2,'Elétrica'),(3,'Hidráulica'),(4,'Tintas'),(5,'Construção Pesada'),(6,'Acabamento'),(7,'Madeiras'),(8,'Iluminação'),(9,'Jardinagem'),(10,'Pisos e Revestimentos');
/*!40000 ALTER TABLE `tbl_categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_clientes`
--

DROP TABLE IF EXISTS `tbl_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nome_cliente` varchar(100) NOT NULL,
  `cpf_cliente` varchar(14) NOT NULL,
  `telefone_cliente` varchar(20) NOT NULL,
  `email_cliente` varchar(100) NOT NULL,
  `senha_cliente` varchar(20) NOT NULL,
  `endereco_cliente` varchar(150) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `cpf_cliente` (`cpf_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_clientes`
--

LOCK TABLES `tbl_clientes` WRITE;
/*!40000 ALTER TABLE `tbl_clientes` DISABLE KEYS */;
INSERT INTO `tbl_clientes` VALUES (1,'João Pereira','123.456.789-09','(11) 91234-5678','joao@gmail.com','joao123','SP, Taboão da Serra, Rua das Palmeiras, 27'),(2,'Maria Oliveira','987.654.321-00','(21) 98183-1122','maria@email.com','maria456','RJ, Duque de Caxias, Rua do Sol, 189'),(3,'Lucas Ferreira','111.222.333-96','(31) 99888-7766','lucas@email.com','lucas321','MG, Belo Horizonte, Rua das Acácias, 45'),(4,'Camila Dias','456.789.123-68','(71) 98500-3322','camila@gmail.com','camila987','BA, Salvador, Rua da Luz, 103'),(5,'Rafael Gomes','321.654.987-70','(41) 98700-2233','rafael@email.com','rafael12','PR, Curitiba, Rua dos Ipês, 98'),(6,'Juliana Costa','741.852.963-20','(81) 98811-3344','juliana@gmail.com','juliana88','PE, Recife, Rua das Rosas, 56'),(7,'Bruno Lima','852.963.741-15','(51) 98765-4321','bruno@yahoo.com.br','bruno789','RS, Porto Alegre, Rua das Laranjeiras, 71'),(8,'Patrícia Nunes','159.357.486-01','(85) 99123-4567','patricia@email.com','pat123','CE, Fortaleza, Rua do Mar, 212'),(9,'Gustavo Moraes','369.258.147-92','(62) 99777-0000','gustavo@email.com','gus001','GO, Goiânia, Rua das Oliveiras, 134'),(10,'Aline Martins','204.618.357-36','(48) 99666-1122','aline@email.com','aline999','SC, Florianópolis, Rua do Cedro, 62'),(11,'Gabriel Veríssimo','400.999.168-27','(11)98880-9863','gabrielverissimogs@gmail.com','212121','SP, Taboão Da Serra, Rua Sebastião Tiburcío Gonçalves, 72'),(12,'Lucas Molinas','000000000-00','11932559714','lucaspmolinari0110@gmail.com','1234','Rua Antônio Teixeira pinto 105');
/*!40000 ALTER TABLE `tbl_clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_estoque_produtos`
--

DROP TABLE IF EXISTS `tbl_estoque_produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_estoque_produtos` (
  `id_produto` int NOT NULL AUTO_INCREMENT,
  `nome_produto` varchar(100) NOT NULL,
  `desc_produto` varchar(100) DEFAULT NULL,
  `qtd_produto` int NOT NULL,
  `valor_produto` decimal(10,2) NOT NULL,
  `qtd_minima_produto` int NOT NULL,
  `fk_tbl_categorias_id_categoria` int DEFAULT NULL,
  `fk_tbl_funcionarios_id_funcionario` int DEFAULT NULL,
  PRIMARY KEY (`id_produto`),
  KEY `FK_tbl_estoque_produtos_2` (`fk_tbl_categorias_id_categoria`),
  KEY `FK_tbl_estoque_produtos_3` (`fk_tbl_funcionarios_id_funcionario`),
  CONSTRAINT `FK_tbl_estoque_produtos_2` FOREIGN KEY (`fk_tbl_categorias_id_categoria`) REFERENCES `tbl_categorias` (`id_categoria`) ON DELETE RESTRICT,
  CONSTRAINT `FK_tbl_estoque_produtos_3` FOREIGN KEY (`fk_tbl_funcionarios_id_funcionario`) REFERENCES `tbl_funcionarios` (`id_funcionario`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_estoque_produtos`
--

LOCK TABLES `tbl_estoque_produtos` WRITE;
/*!40000 ALTER TABLE `tbl_estoque_produtos` DISABLE KEYS */;
INSERT INTO `tbl_estoque_produtos` VALUES (1,'Martelo Darcan','Martelo de aço com cabo emborrachado',50,29.90,20,1,1),(2,'Chave de Fenda Darcan','Chave média com ponta imantada',101,9.50,40,1,2),(3,'Interruptor Simples Darcan','Interruptor 10A branco',228,4.80,90,2,3),(4,'Tinta Acrílica Darcan 18L','Tinta branca para parede',0,159.99,10,4,4),(5,'Cimento Darcan II 50kg','Saco de cimento',112,42.00,50,5,5),(6,'Torneira de Metal','Torneira para pia cozinha',63,35.00,30,3,6),(7,'Porcelanato 60x60','Piso claro brilhante',27,69.90,40,10,7),(8,'Rolo de Pintura Darcan','Rolo de lã para tinta acrílica',18,18.90,20,4,8),(9,'Luminária LED Darcan','Luminária de sobrepor 18W',40,45.00,20,8,9),(10,'Caixa d’água Darcan 500L','Caixa em polietileno',7,320.00,3,3,10);
/*!40000 ALTER TABLE `tbl_estoque_produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_funcionarios`
--

DROP TABLE IF EXISTS `tbl_funcionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_funcionarios` (
  `id_funcionario` int NOT NULL AUTO_INCREMENT,
  `nome_funcionario` varchar(20) NOT NULL,
  `senha_funcionario` varchar(20) NOT NULL,
  `acesso_gestor` tinyint(1) NOT NULL,
  `login_funcionario` varchar(100) NOT NULL,
  PRIMARY KEY (`id_funcionario`),
  UNIQUE KEY `login_funcionario` (`login_funcionario`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_funcionarios`
--

LOCK TABLES `tbl_funcionarios` WRITE;
/*!40000 ALTER TABLE `tbl_funcionarios` DISABLE KEYS */;
INSERT INTO `tbl_funcionarios` VALUES (1,'Gabriel Veríssimo','craftbiel2121',1,'gverissimo'),(2,'João Dorramires','29112025',1,'jpdorramires'),(3,'Lucas Molinari','29112025',1,'lumolinari'),(4,'Letícia Lima','29112025',0,'lelima'),(5,'Diego Freitas','29112025',0,'dfreitas'),(6,'Paula Mendes','29112025',0,'pmendes'),(7,'Tiago Santos','29112025',0,'tsantos'),(8,'Fernanda Luz','29112025',0,'fluz'),(9,'Julio Reis','29112025',0,'jreis'),(10,'Daniel Souza','29112025',0,'dsouza');
/*!40000 ALTER TABLE `tbl_funcionarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_itens_pedido_estoque_pedido`
--

DROP TABLE IF EXISTS `tbl_itens_pedido_estoque_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_itens_pedido_estoque_pedido` (
  `id_item_pedido` int NOT NULL AUTO_INCREMENT,
  `qtd_item_pedido` int NOT NULL,
  `preco_unitario_item_pedido` decimal(10,2) NOT NULL,
  `fk_tbl_estoque_produtos_id_produto` int DEFAULT NULL,
  `fk_tbl_pedidos_id_pedido` int DEFAULT NULL,
  PRIMARY KEY (`id_item_pedido`),
  KEY `FK_tbl_itens_pedido_estoque_pedido_2` (`fk_tbl_estoque_produtos_id_produto`),
  KEY `FK_tbl_itens_pedido_estoque_pedido_3` (`fk_tbl_pedidos_id_pedido`),
  CONSTRAINT `FK_tbl_itens_pedido_estoque_pedido_2` FOREIGN KEY (`fk_tbl_estoque_produtos_id_produto`) REFERENCES `tbl_estoque_produtos` (`id_produto`),
  CONSTRAINT `FK_tbl_itens_pedido_estoque_pedido_3` FOREIGN KEY (`fk_tbl_pedidos_id_pedido`) REFERENCES `tbl_pedidos` (`id_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_itens_pedido_estoque_pedido`
--

LOCK TABLES `tbl_itens_pedido_estoque_pedido` WRITE;
/*!40000 ALTER TABLE `tbl_itens_pedido_estoque_pedido` DISABLE KEYS */;
INSERT INTO `tbl_itens_pedido_estoque_pedido` VALUES (1,2,42.00,5,1),(2,2,4.80,3,2),(3,1,29.90,1,3),(4,1,9.50,2,3),(5,2,35.00,6,4),(6,1,45.00,9,4),(7,2,69.90,7,5),(8,1,159.99,4,6),(9,2,18.90,8,7),(10,2,45.00,9,8),(11,1,18.90,8,9),(12,2,320.00,10,10),(13,1,53.00,1,11),(14,1,102.00,2,11),(15,1,8.00,10,11),(16,1,41.00,9,11),(17,1,29.90,1,12),(18,1,69.90,7,12),(19,1,29.90,1,13);
/*!40000 ALTER TABLE `tbl_itens_pedido_estoque_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_pedidos`
--

DROP TABLE IF EXISTS `tbl_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_pedidos` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `data_pedido` date NOT NULL,
  `valor_pedido` decimal(10,2) NOT NULL,
  `fk_tbl_clientes_id_cliente` int DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `FK_tbl_pedidos_2` (`fk_tbl_clientes_id_cliente`),
  CONSTRAINT `FK_tbl_pedidos_2` FOREIGN KEY (`fk_tbl_clientes_id_cliente`) REFERENCES `tbl_clientes` (`id_cliente`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_pedidos`
--

LOCK TABLES `tbl_pedidos` WRITE;
/*!40000 ALTER TABLE `tbl_pedidos` DISABLE KEYS */;
INSERT INTO `tbl_pedidos` VALUES (1,'2025-05-01',84.00,1),(2,'2025-05-02',9.60,2),(3,'2025-05-03',39.40,3),(4,'2025-05-04',115.00,4),(5,'2025-05-05',139.80,5),(6,'2025-05-06',159.99,6),(7,'2025-05-07',37.80,7),(8,'2025-05-08',90.00,8),(9,'2025-05-09',18.90,9),(10,'2025-05-10',640.00,10),(11,'2025-11-24',204.00,11),(12,'2025-11-25',99.80,11),(13,'2025-11-25',29.90,11);
/*!40000 ALTER TABLE `tbl_pedidos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-26 15:08:52
