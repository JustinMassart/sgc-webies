-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 04 déc. 2020 à 10:37
-- Version du serveur :  8.0.21
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `sgc_webies`
--

-- --------------------------------------------------------

--
-- Structure de la table `articles`
--

DROP TABLE IF EXISTS `articles`;
CREATE TABLE IF NOT EXISTS `articles` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` json NOT NULL,
  `slug` json NOT NULL,
  `excerpt` json NOT NULL,
  `content` json NOT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `articles`
--

INSERT INTO `articles` (`id`, `title`, `slug`, `excerpt`, `content`, `published_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '{\"fr\": \"FR title\", \"nl\": \"NL title\"}', '{\"fr\": \"FR slug\", \"nl\": \"NL slug\"}', '{\"fr\": \"FR excerpt\", \"nl\": \"NL excerpt\"}', '{\"fr\": \"FR content\", \"nl\": \"NL content\"}', '2020-11-10 13:55:25', '2020-11-29 13:56:46', '2020-11-29 13:56:46', NULL),
(2, '{\"fr\": \"FR title\", \"nl\": \"NL title\"}', '{\"fr\": \"FR slug\", \"nl\": \"NL slug\"}', '{\"fr\": \"FR excerpt\", \"nl\": \"NL excerpt\"}', '{\"fr\": \"FR content\", \"nl\": \"NL content\"}', '2020-11-26 13:55:25', '2020-11-29 13:56:46', '2020-11-29 13:56:46', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `discounts`
--

DROP TABLE IF EXISTS `discounts`;
CREATE TABLE IF NOT EXISTS `discounts` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `percentage` float(5,2) NOT NULL,
  `conditions` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `activated` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `discounts`
--

INSERT INTO `discounts` (`id`, `percentage`, `conditions`, `activated`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 10.00, 'Avoir un compte', 1, '2020-11-29 13:53:23', '2020-11-29 13:53:23', NULL),
(2, 30.00, 'Aucune', 1, '2020-11-29 13:53:23', '2020-11-29 13:53:23', NULL),
(3, 50.00, 'Réserver entre 12:00 et 13:00', 1, '2020-11-29 13:54:44', '2020-11-29 13:54:44', NULL),
(4, 80.00, 'Avoir la carte super premium plus', 1, '2020-11-29 13:54:44', '2020-11-29 13:54:44', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `genres`
--

DROP TABLE IF EXISTS `genres`;
CREATE TABLE IF NOT EXISTS `genres` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `label` json NOT NULL,
  `slug` json NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `genres`
--

INSERT INTO `genres` (`id`, `label`, `slug`, `created_at`, `updated_at`) VALUES
(1, '{\"fr\": \"FR genre1\", \"nl\": \"NL genre1\"}', '{\"fr\": \"FR slug\", \"nl\": \"NL slug\"}', '2020-11-29 13:48:04', '2020-11-29 13:48:04'),
(2, '{\"fr\": \"FR 2\", \"nl\": \"NL genre2\"}', '{\"fr\": \"FR slug\", \"nl\": \"NL slug\"}', '2020-11-29 13:48:04', '2020-11-29 13:48:04'),
(3, '{\"fr\": \"FR genre3\", \"nl\": \"NL genre3\"}', '{\"fr\": \"FR slug\", \"nl\": \"NL slug\"}', '2020-11-29 13:48:45', '2020-11-29 13:48:45'),
(4, '{\"fr\": \"FR 4\", \"nl\": \"NL genre4\"}', '{\"fr\": \"FR slug\", \"nl\": \"NL slug\"}', '2020-11-29 13:48:45', '2020-11-29 13:48:45');

-- --------------------------------------------------------

--
-- Structure de la table `genre_movie`
--

DROP TABLE IF EXISTS `genre_movie`;
CREATE TABLE IF NOT EXISTS `genre_movie` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `movie_id` int UNSIGNED NOT NULL,
  `genre_id` int UNSIGNED NOT NULL,
  `order` int UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_genre_movie_movies` (`movie_id`),
  KEY `fk_genre_movie_genres` (`genre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `genre_movie`
--

INSERT INTO `genre_movie` (`id`, `movie_id`, `genre_id`, `order`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 2, 1, '2020-11-29 14:06:59', '2020-11-29 14:06:59', NULL),
(2, 2, 3, 2, '2020-11-29 14:06:59', '2020-11-29 14:06:59', NULL),
(3, 3, 4, 3, '2020-11-29 14:07:33', '2020-11-29 14:07:33', NULL),
(4, 4, 1, 4, '2020-11-29 14:07:33', '2020-11-29 14:07:33', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `movies`
--

DROP TABLE IF EXISTS `movies`;
CREATE TABLE IF NOT EXISTS `movies` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `public_id` int UNSIGNED DEFAULT NULL,
  `meta_keywords` json DEFAULT NULL,
  `meta_description` json DEFAULT NULL,
  `meta_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `teased` tinyint(1) NOT NULL DEFAULT '0',
  `title` json NOT NULL,
  `slug` json NOT NULL,
  `description` json NOT NULL,
  `featured_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `featured_alt` json DEFAULT NULL,
  `cover_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `cover_alt` json NOT NULL,
  `trailer_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `released_at` datetime DEFAULT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  `published_until` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_movies_publics` (`public_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `movies`
--

INSERT INTO `movies` (`id`, `public_id`, `meta_keywords`, `meta_description`, `meta_img`, `featured`, `teased`, `title`, `slug`, `description`, `featured_img`, `featured_alt`, `cover_img`, `cover_alt`, `trailer_url`, `released_at`, `published_at`, `published_until`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, '{\"fr\": \"FR Keywords\", \"nl\": \"NL keywords\"}', '{\"fr\": \"FR description\", \"nl\": \"NL description\"}', 'meta-img 1', 1, 1, '{\"fr\": \"FR title1\", \"nl\": \"NL title1\"}', '{\"fr\": \"FR slug\", \"nl\": \"NL slug\"}', '{\"fr\": \"FR description\", \"nl\": \"NL description\"}', '.\\images\\f1.jpg', '{\"fr\": \"FR alt\", \"nl\": \"NL alt\"}', 'cover-img 1', '{\"fr\": \"FR cover-alt\", \"nl\": \"NL cover-alt\"}', 'https://www.youtube.com/watch?v=slGYJfPtW7c', '2020-11-02 12:35:18', '2020-11-03 11:35:18', '2020-11-26 12:35:18', '2020-11-27 11:39:10', '2020-11-27 11:39:10', NULL),
(2, 2, '{\"fr\": \"FR Keywords\", \"nl\": \"NL keywords\"}', '{\"fr\": \"FR description\", \"nl\": \"NL description\"}', 'meta-img 2', 1, 1, '{\"fr\": \"FR title2\", \"nl\": \"NL title2\"}', '{\"fr\": \"FR slug\", \"nl\": \"NL slug\"}', '{\"fr\": \"FR description\", \"nl\": \"NL description\"}', '.\\images\\f2.jpg', '{\"fr\": \"FR alt\", \"nl\": \"NL alt\"}', 'cover-img 2', '{\"fr\": \"FR cover-alt\", \"nl\": \"NL cover-alt\"}', 'https://www.youtube.com/watch?v=-FZ-pPFAjYY', '2020-11-01 14:37:27', '2020-11-02 13:37:27', '2020-11-19 14:37:27', '2020-11-29 13:40:16', '2020-11-29 13:40:16', NULL),
(3, 3, '{\"fr\": \"FR Keywords\", \"nl\": \"NL keywords\"}', '{\"fr\": \"FR description\", \"nl\": \"NL description\"}', 'meta-img 3', 1, 1, '{\"fr\": \"FR title3\", \"nl\": \"NL title3\"}', '{\"fr\": \"FR slug\", \"nl\": \"NL slug\"}', '{\"fr\": \"FR description\", \"nl\": \"NL description\"}', '.\\images\\f3.jpg', '{\"fr\": \"FR alt\", \"nl\": \"NL alt\"}', 'cover-img 3', '{\"fr\": \"FR cover-alt\", \"nl\": \"NL cover-alt\"}', 'https://www.youtube.com/watch?v=fk8IPWfaxVQ', '2020-11-10 14:40:39', '2020-11-13 13:40:39', '2020-11-23 14:40:39', '2020-11-29 13:42:16', '2020-11-29 13:42:16', NULL),
(4, 2, '{\"fr\": \"FR Keywords\", \"nl\": \"NL keywords\"}', '{\"fr\": \"FR description\", \"nl\": \"NL description\"}', 'meta-img 4', 1, 1, '{\"fr\": \"FR title4\", \"nl\": \"NL title4\"}', '{\"fr\": \"FR slug\", \"nl\": \"NL slug\"}', '{\"fr\": \"FR description\", \"nl\": \"NL description\"}', '.\\images\\f4.jpg', '{\"fr\": \"FR alt\", \"nl\": \"NL alt\"}', 'cover-img 4', '{\"fr\": \"FR cover-alt\", \"nl\": \"NL cover-alt\"}', 'https://www.youtube.com/watch?v=6U3BwAE7m6I', '2020-11-13 14:42:24', '2020-11-14 13:42:24', '2020-11-28 14:42:24', '2020-11-29 13:44:00', '2020-11-29 13:44:00', NULL),
(5, 3, '{\"fr\": \"FR Keywords\", \"nl\": \"NL keywords\"}', '{\"fr\": \"FR description\", \"nl\": \"NL description\"}', 'meta-img 5', 1, 1, '{\"fr\": \"FR title5\", \"nl\": \"NL title5\"}', '{\"fr\": \"FR slug\", \"nl\": \"NL slug\"}', '{\"fr\": \"FR description\", \"nl\": \"NL description\"}', '.\\images\\f5.jpg', '{\"fr\": \"FR alt\", \"nl\": \"NL alt\"}', 'C:\\wamp64\\www\\sgc-webies\\images\\f5.jpg', '{\"fr\": \"FR cover-alt\", \"nl\": \"NL cover-alt\"}', 'https://www.youtube.com/watch?v=n9xhJrPXop4', '2020-12-01 10:40:18', '2020-12-02 09:40:18', '2020-12-08 10:40:18', '2020-12-04 09:49:05', '2020-12-04 09:49:05', NULL),
(6, 1, '{\"fr\": \"FR Keywords\", \"nl\": \"NL keywords\"}', '{\"fr\": \"FR description\", \"nl\": \"NL description\"}', 'meta-img 6', 1, 1, '{\"fr\": \"FR title6\", \"nl\": \"NL title6\"}', '{\"fr\": \"FR slug\", \"nl\": \"NL slug\"}', '{\"fr\": \"FR description\", \"nl\": \"NL description\"}', '.\\images\\f6.jpg', '{\"fr\": \"FR alt\", \"nl\": \"NL alt\"}', 'C:\\wamp64\\www\\sgc-webies\\images\\f6.jpg', '{\"fr\": \"FR cover-alt\", \"nl\": \"NL cover-alt\"}', 'https://www.youtube.com/watch?v=Yd_nsFJAXV4', '2020-11-24 10:40:18', '2020-12-17 09:40:18', '2020-12-31 10:40:18', '2020-12-04 09:49:05', '2020-12-04 09:49:05', NULL),
(7, 2, '{\"fr\": \"FR Keywords\", \"nl\": \"NL keywords\"}', '{\"fr\": \"FR description\", \"nl\": \"NL description\"}', 'meta-img 7', 1, 1, '{\"fr\": \"FR title7\", \"nl\": \"NL title7\"}', '{\"fr\": \"FR slug\", \"nl\": \"NL slug\"}', '{\"fr\": \"FR description\", \"nl\": \"NL description\"}', '.\\images\\f7.jpg', '{\"fr\": \"FR alt\", \"nl\": \"NL alt\"}', 'C:\\wamp64\\www\\sgc-webies\\images\\f7.jpg', '{\"fr\": \"FR cover-alt\", \"nl\": \"NL cover-alt\"}', 'https://www.youtube.com/watch?v=1M8s0w1Fzm4', '2020-11-22 10:50:16', '2020-12-21 09:50:16', '2020-12-26 10:50:16', '2020-12-04 09:53:11', '2020-12-04 09:53:11', NULL),
(8, 1, '{\"fr\": \"FR Keywords\", \"nl\": \"NL keywords\"}', '{\"fr\": \"FR description\", \"nl\": \"NL description\"}', 'meta-img 8', 1, 1, '{\"fr\": \"FR title8\", \"nl\": \"NL title8\"}', '{\"fr\": \"FR slug\", \"nl\": \"NL slug\"}', '{\"fr\": \"FR description\", \"nl\": \"NL description\"}', '.\\images\\f8.jpg', '{\"fr\": \"FR alt\", \"nl\": \"NL alt\"}', 'C:\\wamp64\\www\\sgc-webies\\images\\f8.jpg', '{\"fr\": \"FR cover-alt\", \"nl\": \"NL cover-alt\"}', 'https://www.youtube.com/watch?v=0dt523AHZWY', '2020-11-10 10:50:16', '2020-11-18 09:50:16', '2020-11-28 10:50:16', '2020-12-04 09:53:11', '2020-12-04 09:53:11', NULL),
(9, 2, '{\"fr\": \"FR Keywords\", \"nl\": \"NL keywords\"}', '{\"fr\": \"FR description\", \"nl\": \"NL description\"}', 'meta-img9', 1, 1, '{\"fr\": \"FR title9\", \"nl\": \"NL title9\"}', '{\"fr\": \"FR slug\", \"nl\": \"NL slug\"}', '{\"fr\": \"FR description\", \"nl\": \"NL description\"}', '.\\images\\f9.jpg', '{\"fr\": \"FR alt\", \"nl\": \"NL alt\"}', 'C:\\wamp64\\www\\sgc-webies\\images\\f9.jpg', '{\"fr\": \"FR cover-alt\", \"nl\": \"NL cover-alt\"}', 'https://www.youtube.com/watch?v=Z9bw8MGkB-A', '2020-11-29 10:57:30', '2020-12-01 09:57:30', '2020-12-03 10:57:30', '2020-12-04 10:00:49', '2020-12-04 10:00:49', NULL),
(10, 3, '{\"fr\": \"FR Keywords\", \"nl\": \"NL keywords\"}', '{\"fr\": \"FR description\", \"nl\": \"NL description\"}', 'meta-img10', 1, 1, '{\"fr\": \"FR title10\", \"nl\": \"NL title10\"}', '{\"fr\": \"FR slug\", \"nl\": \"NL slug\"}', '{\"fr\": \"FR description\", \"nl\": \"NL description\"}', '.\\images\\f10.jpg', '{\"fr\": \"FR alt\", \"nl\": \"NL alt\"}', 'C:\\wamp64\\www\\sgc-webies\\images\\f10.jpg', '{\"fr\": \"FR cover-alt\", \"nl\": \"NL cover-alt\"}', 'https://www.youtube.com/watch?v=tI01wBXGHUs', '2020-11-17 10:57:30', '2020-11-18 09:57:30', '2020-12-01 10:57:30', '2020-12-04 10:00:49', '2020-12-04 10:00:49', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `movie_producer`
--

DROP TABLE IF EXISTS `movie_producer`;
CREATE TABLE IF NOT EXISTS `movie_producer` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `movie_id` int UNSIGNED NOT NULL,
  `producer_id` int UNSIGNED NOT NULL,
  `order` int UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_movie_producer_movies` (`movie_id`),
  KEY `fk_movie_producer_producers` (`producer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `movie_producer`
--

INSERT INTO `movie_producer` (`id`, `movie_id`, `producer_id`, `order`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 1, '2020-11-29 14:05:26', '2020-11-29 14:05:26'),
(2, 2, 1, 2, '2020-11-29 14:05:26', '2020-11-29 14:05:26'),
(3, 3, 2, 3, '2020-11-29 14:06:17', '2020-11-29 14:06:17'),
(4, 4, 4, 4, '2020-11-29 14:06:17', '2020-11-29 14:06:17'),
(5, 5, 3, 5, '2020-12-04 10:09:35', '2020-12-04 10:09:35'),
(6, 6, 1, 6, '2020-12-04 10:09:35', '2020-12-04 10:09:35'),
(7, 7, 4, 7, '2020-12-04 10:10:20', '2020-12-04 10:10:20'),
(8, 8, 4, 8, '2020-12-04 10:10:20', '2020-12-04 10:10:20'),
(9, 9, 3, 9, '2020-12-04 10:11:14', '2020-12-04 10:11:14'),
(10, 10, 2, 10, '2020-12-04 10:11:14', '2020-12-04 10:11:14');

-- --------------------------------------------------------

--
-- Structure de la table `navigation_links`
--

DROP TABLE IF EXISTS `navigation_links`;
CREATE TABLE IF NOT EXISTS `navigation_links` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `order` int UNSIGNED NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `label` json NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `producers`
--

DROP TABLE IF EXISTS `producers`;
CREATE TABLE IF NOT EXISTS `producers` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `lastname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `producers`
--

INSERT INTO `producers` (`id`, `firstname`, `lastname`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Steven', ' SpielBerg', '2020-11-29 13:50:20', '2020-11-29 13:50:20', NULL),
(2, 'Jerry', 'Bruckheimer', '2020-11-29 13:50:20', '2020-11-29 13:50:20', NULL),
(3, 'Robert', 'Zemeckis', '2020-11-29 13:50:59', '2020-11-29 13:50:59', NULL),
(4, 'Kathleen', 'Kennedy', '2020-11-29 13:50:59', '2020-11-29 13:50:59', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `publics`
--

DROP TABLE IF EXISTS `publics`;
CREATE TABLE IF NOT EXISTS `publics` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `label` json NOT NULL,
  `slug` json NOT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `publics`
--

INSERT INTO `publics` (`id`, `label`, `slug`, `color`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '{\"fr\": \"FR enfant\", \"nl\": \"NL enfant\"}', '{\"fr\": \"FR slug\", \"nl\": \"NL slug\"}', 'green', '2020-11-29 13:59:19', '2020-11-29 13:59:19', NULL),
(2, '{\"fr\": \"FR ados\", \"nl\": \"NL ados\"}', '{\"fr\": \"FR slug\", \"nl\": \"NL slug\"}', 'orange', '2020-11-29 13:59:19', '2020-11-29 13:59:19', NULL),
(3, '{\"fr\": \"FR adulte\", \"nl\": \"NL adulte\"}', '{\"fr\": \"FR slug\", \"nl\": \"NL slug\"}', 'red', '2020-11-29 14:00:11', '2020-11-29 14:00:11', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
CREATE TABLE IF NOT EXISTS `reviews` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `movie_id` int UNSIGNED NOT NULL,
  `cookie_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `rating` int UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_reviews_movies` (`movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `genre_movie`
--
ALTER TABLE `genre_movie`
  ADD CONSTRAINT `fk_genre_movie_genres` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_genre_movie_movies` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `movies`
--
ALTER TABLE `movies`
  ADD CONSTRAINT `fk_movies_publics` FOREIGN KEY (`public_id`) REFERENCES `publics` (`id`) ON DELETE RESTRICT;

--
-- Contraintes pour la table `movie_producer`
--
ALTER TABLE `movie_producer`
  ADD CONSTRAINT `fk_movie_producer_movies` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_movie_producer_producers` FOREIGN KEY (`producer_id`) REFERENCES `producers` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `fk_reviews_movies` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
