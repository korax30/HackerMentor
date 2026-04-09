/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.8.3-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: social
-- ------------------------------------------------------
-- Server version	11.8.3-MariaDB-1+b1 from Debian

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `comments`
--
CREATE DATABASE IF NOT EXISTS social;

Use social;

CREATE USER IF NOT EXISTS 'socialuser'@'localhost' IDENTIFIED BY 'password123';

GRANT ALL PRIVILEGES ON social.* TO 'socialuser'@'localhost';
FLUSH PRIVILEGES;


DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `comments` VALUES
(1,3,5,'Carlos eso del upload no es seguro 😬','2026-04-09 17:19:18'),
(2,3,4,'Tranqui solo es temporal 👀','2026-04-09 17:19:18'),
(3,4,1,'JAJA siempre usas la misma contraseña','2026-04-09 17:19:18'),
(4,5,4,'No publiques tu correo aquí 😅','2026-04-09 17:19:18'),
(5,2,3,'Bro ese vuelo también lo tomé!','2026-04-09 17:19:18'),
(9,4,8,'Siii estuvo increíble 🔥 en mi casa siempre se arma lo mejor 😏','2026-04-09 18:51:57');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `caption` text DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `posts` VALUES
(1,1,'gym.jpg','Entrenando en SmartFit Chapinero 💪','Bogotá','2026-04-09 17:19:10'),
(2,2,'airport.jpg','Otra vez en El Dorado ✈️ rumbo a Medellín','Bogotá Airport','2026-04-09 17:19:10'),
(3,4,'code.jpg','Probando el sistema de upload nuevo 😅 solo validamos extensión por ahora...','Office','2026-04-09 17:19:10'),
(4,7,'party.jpg','Anoche fue una locura 😂 contraseña del wifi: semeolvido','Bogotá','2026-04-09 17:19:10'),
(5,8,'selfie.jpg','En casa como siempre 💕 escríbeme: cupon_HM@proton.me','Chapinero','2026-04-09 17:19:10');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `bio` text DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `profile_pic` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `users` VALUES
(1,'valeria.fit','valeria.fit@gmail.com','123456','Fitness 💪 | Bogotá | Gym lover','influencer','valeria.jpg'),
(2,'travelwithnico','nico.travel@gmail.com','password','🌍 viajando por el mundo | ✈️ El Dorado','influencer','nico.jpg'),
(3,'foodiejuan','juan.food@gmail.com','food123','🍔 foodie | Bogotá restaurants','influencer','juan.jpg'),
(4,'carlos.dev','carlos.dev@picshare.local','dev123','Backend dev 👨‍💻 en PicShare | trabajando en uploads 😅 | repo: github.com/carlosdev','employee','carlos.jpg'),
(5,'laura.support','laura@picshare.local','support123','Soporte PicShare 💬','employee','laura.jpg'),
(6,'admin.pics','admin@picshare.local','admin123','Admin','admin','admin.jpg'),
(7,'andres123','andres123@hotmail.com','andres123','Solo viviendo la vida 😎','user','andres.jpg'),
(8,'sofi_life','sofi@gmail.com','sofi123','📍Chapinero | Amo compartir todo 💕','user','sofi.jpg'),
(9,'crypto_mateo','mateo.crypto@gmail.com','btc123','Crypto & tech 🚀','user','mateo.jpg'),
(10,'diana.art','diana.art@gmail.com','art123','🎨 artista','user','diana.jpg');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
commit;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-04-09 18:16:21
