-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: map
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abstract` longtext COLLATE utf8mb4_unicode_ci,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_map`
--

DROP TABLE IF EXISTS `category_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_map` (
  `category_id` int NOT NULL,
  `map_id` int NOT NULL,
  PRIMARY KEY (`category_id`,`map_id`),
  KEY `IDX_B66F07E112469DE2` (`category_id`),
  KEY `IDX_B66F07E153C55F64` (`map_id`),
  CONSTRAINT `FK_B66F07E112469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_B66F07E153C55F64` FOREIGN KEY (`map_id`) REFERENCES `map` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_map`
--

LOCK TABLES `category_map` WRITE;
/*!40000 ALTER TABLE `category_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctrine_migration_versions`
--

LOCK TABLES `doctrine_migration_versions` WRITE;
/*!40000 ALTER TABLE `doctrine_migration_versions` DISABLE KEYS */;
INSERT INTO `doctrine_migration_versions` VALUES ('DoctrineMigrations\\Version20201017135731','2020-10-17 13:58:20',1267),('DoctrineMigrations\\Version20201118154340','2020-11-18 15:50:49',933),('DoctrineMigrations\\Version20201118155101','2020-11-18 15:51:12',52),('DoctrineMigrations\\Version20210106181751','2021-01-06 18:19:08',898),('DoctrineMigrations\\Version20210107114739','2021-01-07 11:47:59',868),('DoctrineMigrations\\Version20210107194527','2021-01-07 19:45:45',114);
/*!40000 ALTER TABLE `doctrine_migration_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map`
--

DROP TABLE IF EXISTS `map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `map` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `map_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sources` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map`
--

LOCK TABLES `map` WRITE;
/*!40000 ALTER TABLE `map` DISABLE KEYS */;
INSERT INTO `map` VALUES (1,'Carte générale du Japon, 1978','','../../cartes/japon_yagani.jpeg','Source gallica.bnf.fr  Bibliothèque nationale de France'),(2,'Growth of official cities 1935-1940','Department of State, Map Division États-Unis, 1947','../../cartes/Growth_of_official_cities_1935-1940.jpeg','Source gallica.bnf.fr  Bibliothèque nationale de France'),(3,'Japan sex ratios, 1940','Department of State, Map Division États-Unis','../../cartes/Japan_sex_ratios_1940.jpeg','Source gallica.bnf.fr  Bibliothèque nationale de France'),(4,'Plan de la ville de Tours aux diverses époques de son Histoire','Dressé Par le Dr Eugène Giraudet en 1872','../../cartes/Tours.jpeg','Source gallica.bnf.fr  Bibliothèque nationale de France'),(5,'Plan de Nagasaki, 1821','','../../cartes/Nagasaki_Tomijimaya.jpeg','Source gallica.bnf.fr  Bibliothèque nationale de France'),(6,'Grand incendie d\'Edo, 19ème siècle','','../../cartes/Grand_incendie_Edo.jpeg','Source gallica.bnf.fr  Bibliothèque nationale de France'),(7,'Royaume du Japon par P. Ph. Briet, 1668','','../../cartes/Royaume_du_Japon.jpeg','Source gallica.bnf.fr  Bibliothèque nationale de France'),(8,'Carte des Amériques, 1570','titre original:\"Americae sive novi orbis nova descriptio\"','../../cartes/ameriques_1570.jpeg','Source gallica.bnf.fr  Bibliothèque nationale de France'),(9,'Carte ecclésiastique des Etats-Unis d\'Amérique, 1877','','../../cartes/Carte_ecclesiastique_des_Etats-Unis_d_Amerique.jpeg','Source gallica.bnf.fr  Bibliothèque nationale de France'),(10,'Afrique, Chemins de fer et Navigation à vapeur, 1904','','../../cartes/Afrique_Chemins.jpeg','Source gallica.bnf.fr  Bibliothèque nationale de France'),(11,'Taux de natalité et âge moyen de la mère à la naissance en 2020, et nombre de naissances en 2019','','../../cartes/Taux_de_natalite2019.png','Insee, État civil, Estimations de population'),(12,'Part des diplômés d\'un BAC+2 dans la pop. non scolarisée de 15 ans ou + (%) 2017','','../../cartes/Part_des_diplomes_2017.png','Insee, Recensement de la population (RP), exploitation principale'),(13,'Part des maisons dans le nombre total de logements (%) 2017','','../../cartes/Part_des_maisons2017.png','Insee, Recensement de la population (RP), exploitation principale'),(14,'Écart salaire net horaire moyen des femmes par rapport aux hommes selon la catégorie socioprofessionnelle (%) 2018','','../../cartes/ecart_salaire_2018.png','Insee, Bases Tous salariés'),(15,'Taux d\'artificialisation des sols, 2018 (%)','','../../cartes/Taux_d_artificialisation.png','Union européenne - Ministère de la transition écologique - CORINE Land Cover'),(16,'Part des surfaces en agriculture biologique (%)2019','','../../cartes/surfaces_agriculture_2019.png','Ministère en charge de l\'agriculture, Service de la statistique et de la prospective (SSP), Agreste, Statistique agricole annuelle, Agence Bio'),(17,'Part des ménages ayant au moins 1 voiture (%)2017','','../../cartes/voiture_2017.png','Insee, Recensement de la population (RP), exploitation principale'),(18,'Réseau de proximité pôle emploi et réseau partenarial pôle emploi 2019','','../../cartes/pole_emploi_2019.png','Insee, Base permanente des équipements (Bpe)'),(19,'Salaire net horaire moyen (?) 2018','','../../cartes/Salaire_net_horaire2018.png','Insee, Bases Tous salariés'),(20,'Part des emplois salariés dans le nombre d?emplois au lieu de travail (%)2017','','../../cartes/Part_des_emplois_salaries.png','Insee, Recensement de la population (RP), exploitation principale'),(21,'Part des logements vacants dans le nombre total de logements (%)2017','','../../cartes/logement_vacant2017.png','Insee, séries historiques du RP, exploitation principale'),(22,'Part des diplômés d\'un BAC+5 ou plus dans la pop. non scolarisée de 15 ans ou + 2017','','../../cartes/Part_diplome_bac5.png','Insee, Recensement de la population (RP), exploitation principale'),(23,'Évolution annuelle moyenne de la population 2013-2018 (%)','','../../cartes/population_2013_2018.png',' Insee, Recensements de la population (RP)'),(24,'Part des personnes âgées moins de 15 ans dans la population (%)2017','','../../cartes/pers_moins_15ans_2017.png','Insee, Recensement de la population (RP), exploitation principale'),(25,'Part des personnes âgées de 25 à 64 ans dans la population (%)2017','','../../cartes/25_64ans_2017.png','Insee, Recensement de la population (RP), exploitation principale'),(26,'Part des personnes âgées de 80 ans ou plus (%)2017','','../../cartes/pers_agee_2017.png','Insee, Recensement de la population (RP), exploitation principale'),(27,'Taille moyenne des ménages en 2017','','../../cartes/Taille_moyenne_des_menages2017.png','Insee, séries historiques du RP, exploitation principale'),(28,'Densité de population, 1876','','../../cartes/Densite_1876.png','Insee, séries historiques du RP, exploitation principale'),(29,'Densité de population, 1975','','../../cartes/Densite_1975.png','Insee, séries historiques du RP, exploitation principale'),(31,'\"Cosmographia\"','Par Claudius Ptolomaeus 1450-1471','../../cartes/Cosmographia.jpeg','Source gallica.bnf.fr  Bibliothèque nationale de France'),(32,'Carte de l\'Océan Atlantique nord-est, 16ème siècle','','../../cartes/atlantique_nord.jpg','Source gallica.bnf.fr  Bibliothèque nationale de France'),(33,'Chemin de fer Paris-Cologne-Strasbourg, 1852','','../../cartes/chemin_fer.jpeg','Source gallica.bnf.fr  Bibliothèque nationale de France'),(34,'Carte de l\'Europe en 1556','Carte scolaire de 1821','../../cartes/Carte_de_l_Europe_en_1556.jpeg','Source gallica.bnf.fr  Bibliothèque nationale de France'),(35,'Carte de l\'empire de Charlemagne après le partage de 806','Carte de 1876','../../cartes/charlemagne.jpeg','Source gallica.bnf.fr  Bibliothèque nationale de France'),(36,'Comic map of the seat of war with entirely new features, 1854','','../../cartes/comic_map_1854.jpeg','Source gallica.bnf.fr  Bibliothèque nationale de France'),(37,'Nouvelle France, Nouvelle Angleterre, Acadie, 16ème siècle','','../../cartes/Nouvelle_France.jpeg','Source gallica.bnf.fr  Bibliothèque nationale de France'),(38,'Galliae regni potentiss. nova descriptio, 1570','','../../cartes/Galliae_regni_potentiss_nova descriptio.jpeg','Source gallica.bnf.fr  Bibliothèque nationale de France'),(39,'Descriptio Germaniae inferioris, 1570','','../../cartes/Descriptio_Germaniae_inferioris.jpeg','Source gallica.bnf.fr  Bibliothèque nationale de France'),(40,'Carte nautique des côtes du Canada à la hauteur de l\'embouchure du Saint-Laurent, 16ème siècle','','../../cartes/canada_st_laurent.jpeg','Source gallica.bnf.fr  Bibliothèque nationale de France');
/*!40000 ALTER TABLE `map` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-22 13:06:31
