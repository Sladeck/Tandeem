-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Dim 22 Mai 2016 à 23:21
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `tandeem`
--

-- --------------------------------------------------------

--
-- Structure de la table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `content` varchar(1080) COLLATE utf8_unicode_ci NOT NULL,
  `Likes` int(11) DEFAULT NULL,
  `posts_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5F9E962AA76ED395` (`user_id`),
  KEY `IDX_5F9E962AD5E258C5` (`posts_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Structure de la table `fos_user`
--

CREATE TABLE IF NOT EXISTS `fos_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `locked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `credentials_expired` tinyint(1) NOT NULL,
  `credentials_expire_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_957A647992FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_957A6479A0D96FBF` (`email_canonical`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Contenu de la table `fos_user`
--

INSERT INTO `fos_user` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `locked`, `expired`, `expires_at`, `confirmation_token`, `password_requested_at`, `roles`, `credentials_expired`, `credentials_expire_at`) VALUES
(1, 'Killick', 'killick', 'gm.moulin@hotmail.fr', 'gm.moulin@hotmail.fr', 1, 'ra41n3a5pgggs08g0gkc8o4gco8gsk8', '$2y$13$ra41n3a5pgggs08g0gkc8eRA5a73Wt70Cm7ND1C87uXDR8HFcquKG', '2016-05-22 23:04:16', 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_ADMIN";}', 0, NULL),
(2, 'Jean', 'jean', 'test@test.fr', 'test@test.fr', 1, 'j5c1hv78f5wgocg8c0c4soc8o0w0444', '$2y$13$j5c1hv78f5wgocg8c0c4sePsjbCOaSdUWLNt8XhmPCwOVC1nZKYe.', '2016-05-22 23:15:35', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Description` varchar(5000) COLLATE utf8_unicode_ci NOT NULL,
  `Date` date NOT NULL,
  `images` varchar(510) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Contenu de la table `posts`
--

INSERT INTO `posts` (`id`, `Title`, `Description`, `Date`, `images`) VALUES
(4, 'Test Création', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vestibulum felis semper tellus semper finibus. Vestibulum in nibh rhoncus, porttitor arcu vitae, pretium lorem. Proin varius sagittis neque ut congue. Nulla non nisi at est vestibulum fringilla ac eu nisi. Maecenas nec lorem eu nibh convallis lobortis. Maecenas interdum, risus a finibus mattis, dui eros iaculis neque, vitae vulputate nulla ipsum ut justo. Nullam orci turpis, cursus id ullamcorper dignissim, congue ut purus. Nullam interdum, purus id egestas viverra, urna orci scelerisque mauris, eget feugiat ligula tellus vel justo. Duis sed arcu sagittis, finibus mi in, lacinia neque. Duis pretium lectus ut orci elementum imperdiet. Vestibulum gravida nec lectus id mattis. Cras ullamcorper lorem nec turpis fringilla, a consectetur ante eleifend.\r\n\r\nSed sed tortor posuere, posuere augue at, sagittis nisl. Proin interdum vulputate luctus. Duis consequat, augue eget varius tempor, lectus lectus finibus massa, nec pharetra mauris enim vel nisl. Sed cursus gravida metus, eget pulvinar dui hendrerit vitae. Cras porta, diam eu lobortis sodales, tellus enim auctor leo, nec aliquam ligula quam id ante. Morbi facilisis purus at nisl porta, in gravida nibh finibus. Vivamus ante enim, tincidunt sed tincidunt in, maximus in massa. Suspendisse semper placerat porttitor. Etiam eget iaculis purus. Pellentesque nec lacus metus. Nullam vitae ante libero.', '2016-05-22', 'http://i.imgur.com/RRUe0Mo.png'),
(5, 'Rien de tel que de l''herbe pour courir !', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vestibulum felis semper tellus semper finibus. Vestibulum in nibh rhoncus, porttitor arcu vitae, pretium lorem. Proin varius sagittis neque ut congue. Nulla non nisi at est vestibulum fringilla ac eu nisi. Maecenas nec lorem eu nibh convallis lobortis. Maecenas interdum, risus a finibus mattis, dui eros iaculis neque, vitae vulputate nulla ipsum ut justo. Nullam orci turpis, cursus id ullamcorper dignissim, congue ut purus. Nullam interdum, purus id egestas viverra, urna orci scelerisque mauris, eget feugiat ligula tellus vel justo. Duis sed arcu sagittis, finibus mi in, lacinia neque. Duis pretium lectus ut orci elementum imperdiet. Vestibulum gravida nec lectus id mattis. Cras ullamcorper lorem nec turpis fringilla, a consectetur ante eleifend.\r\n\r\nSed sed tortor posuere, posuere augue at, sagittis nisl. Proin interdum vulputate luctus. Duis consequat, augue eget varius tempor, lectus lectus finibus massa, nec pharetra mauris enim vel nisl. Sed cursus gravida metus, eget pulvinar dui hendrerit vitae. Cras porta, diam eu lobortis sodales, tellus enim auctor leo, nec aliquam ligula quam id ante. Morbi facilisis purus at nisl porta, in gravida nibh finibus. Vivamus ante enim, tincidunt sed tincidunt in, maximus in massa. Suspendisse semper placerat porttitor. Etiam eget iaculis purus. Pellentesque nec lacus metus. Nullam vitae ante libero.', '2016-05-22', 'https://static.pexels.com/photos/479/landscape-nature-sunset-trees.jpg');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `FK_5F9E962AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `fos_user` (`id`),
  ADD CONSTRAINT `FK_5F9E962AD5E258C5` FOREIGN KEY (`posts_id`) REFERENCES `posts` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
