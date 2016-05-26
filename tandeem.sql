-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Ven 27 Mai 2016 à 00:30
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Contenu de la table `fos_user`
--

INSERT INTO `fos_user` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `locked`, `expired`, `expires_at`, `confirmation_token`, `password_requested_at`, `roles`, `credentials_expired`, `credentials_expire_at`) VALUES
(1, 'Killick', 'killick', 'gm.moulin@hotmail.fr', 'gm.moulin@hotmail.fr', 1, 'ra41n3a5pgggs08g0gkc8o4gco8gsk8', '$2y$13$ra41n3a5pgggs08g0gkc8eRA5a73Wt70Cm7ND1C87uXDR8HFcquKG', '2016-05-22 23:04:16', 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_ADMIN";}', 0, NULL),
(2, 'Jean', 'jean', 'test@test.fr', 'test@test.fr', 1, 'j5c1hv78f5wgocg8c0c4soc8o0w0444', '$2y$13$j5c1hv78f5wgocg8c0c4sePsjbCOaSdUWLNt8XhmPCwOVC1nZKYe.', '2016-05-22 23:15:35', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(3, 'admin', 'admin', 'admin@admin.fr', 'admin@admin.fr', 1, 'pplug49x6m84sw8s00448o84wkcs8kc', '$2y$13$pplug49x6m84sw8s00448eGyaR2qKIPD5RMXr82x.qk96mvLfk8fa', '2016-05-25 13:44:52', 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_ADMIN";}', 0, NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Contenu de la table `posts`
--

INSERT INTO `posts` (`id`, `Title`, `Description`, `Date`, `images`) VALUES
(6, 'Salle CMG SPORTS CLUB « Be brilliant together » ', 'Vous avez envie de faire du sport en salle ? Mais vous ne savez pas quelle salle choisir ? Nous avons des adresses de salles haut-gamme avec une ambiance très cool, où vous pourrez que vous épanouir !  Avec près de 80 activités sportives différentes incluses dans votre abonnement, soit 2 600 heures de cours par semaine, vous n’avez que l’embarras du choix ! Certaines activités sont de véritables rassemblements chargés d’énergie, d’autres plus confidentielles appellent à la sérénité et au calme absolu. Venez les découvrir parmi les 23 salles en Ile-de-France : 23 clubs de sport parisiens - 2 studios de CrossFit - 2 CycleClub - 1 BoxingClub - 7 piscines - 2500 heures d''activités collectives par semaine - Cardio Training - Musculation - Hammam Sauna', '2016-05-23', 'http://www.ousebouger.com/photos/etablissement_1366_3.jpg'),
(7, 'Fitness park « Le sport pour tous »', 'Envie de faire du sport à moindre coût avec des équipements haut de gamme ?  De conserver votre ligne ou simplement de rester en bonne santé, Fitness Park est votre meilleur allié. Des salles de sport conviviales, spacieuses de 800 à 2000 m² avec des espaces dédiés pour tous les plaisirs. Cardio, musculation guidée et libre, et plus de 140 cours collectifs de renforcement musculaire, d’assouplissement, de relaxation, de fitness et de tonification projetés sur écran géant par semaine. En plus les casiers, douches et vestiaires sont gratuits ! Venez découvrir les 92 salles partout en France ', '2016-05-23', 'http://www.fitness-park-reze.com/medias/accueil1.jpg'),
(8, 'Bien se nourrir : quelques habitudes à mettre en place au quotidien', 'Faire un repas plus riche le matin que le soir. Retenir l’adage « le matin un repas de roi, à midi un repas de prince et le soir un repas de pauvre ».\r\nMâcher longuement les aliments. On évite ainsi les problèmes de digestion, on apprécie les saveurs et on met en route les signaux de satiété.\r\nManger le plus frais possible. Oui aux produits locaux, de saison ; transport, stockage, conservation… nuisent à la qualité des aliments. Une nouvelle façon de faire ses courses, une nouvelle organisation… pour son bien-être.\r\nPréférer les fruits crus en dehors des repas. Pris pendant les repas, ils ralentissent la digestion. Pensez-y vers 10 -11h et 17-18h.\r\nConsommer les aliments crus en début de repas. Ils déclenchent alors des enzymes digestives bienfaitrices.', '2016-05-23', 'https://expertfitnesstips.files.wordpress.com/2014/12/dollarphotoclub_50619773.jpg'),
(9, 'Comment faire un régime detox ?', 'Différent du jeûne, le régime detox axe son programme sur une consommation de fruits, de légumes et d''aliments à IG (indice glycémique, ndlr) bas. Pendant 5 ou 6 jours, on supprime les aliments "nocifs", on réduit les glucides, les graisses saturées et on fonce sur les ingrédients drainants et antitoxines.\r\nLe régime s’accompagne d’une activité physique quotidienne (30 à 60 min) natation, marche raide, jogging... pour élimer les toxines et brûler les graisses plus rapidement.\r\n', '2016-05-23', 'http://www.femmeactuelle.fr/var/femmeactuelle/storage/images/minceur/astuces-minceur/regime-detox-jus-citron-maigrir/12649497-1-fre-FR/regime-detox-le-jus-de-citron-pour-maigrir-et-retrouver-la-forme.jpg');

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
