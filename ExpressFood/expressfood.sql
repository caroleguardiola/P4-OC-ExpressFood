-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mar. 24 oct. 2017 à 19:59
-- Version du serveur :  5.7.19
-- Version de PHP :  5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `expressfood`
--
CREATE DATABASE IF NOT EXISTS `expressfood` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `expressfood`;

-- --------------------------------------------------------

--
-- Structure de la table `administrateur`
--

DROP TABLE IF EXISTS `administrateur`;
CREATE TABLE IF NOT EXISTS `administrateur` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `fk_utilisateur_id` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uniq_fk_utilisateur_id` (`fk_utilisateur_id`) USING BTREE,
  KEY `idx_fk_utilisateur_id` (`fk_utilisateur_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `administrateur`
--

INSERT INTO `administrateur` (`id`, `fk_utilisateur_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `adresse`
--

DROP TABLE IF EXISTS `adresse`;
CREATE TABLE IF NOT EXISTS `adresse` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `destinataire` varchar(255) NOT NULL,
  `numero_voie` int(11) UNSIGNED DEFAULT NULL,
  `voie` varchar(45) NOT NULL,
  `code_postal` char(5) NOT NULL,
  `localite` varchar(45) NOT NULL,
  `latitude` decimal(11,8) NOT NULL,
  `longitude` decimal(10,8) NOT NULL,
  `date_creation` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_desactivation` datetime DEFAULT NULL,
  `fk_client_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_fk_client_id` (`fk_client_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `adresse`
--

INSERT INTO `adresse` (`id`, `destinataire`, `numero_voie`, `voie`, `code_postal`, `localite`, `latitude`, `longitude`, `date_creation`, `date_desactivation`, `fk_client_id`) VALUES
(1, 'Elisabeth', 23, 'cours Gambetta', '69003', 'LYON', '45.75504000', '4.84429300', '2017-10-19 20:41:07', NULL, 3),
(2, 'Sandra', 14, 'rue Edouard Herriot', '69002', 'LYON', '45.75585700', '4.83069600', '2017-10-19 20:47:30', NULL, 1),
(3, 'Louis', 33, 'cours Lafayette', '69003', 'LYON', '45.76376600', '4.84678800', '2017-10-19 20:53:08', NULL, 2),
(4, 'Noémie', 26, 'Boulevard des Belges', '69006', 'LYON', '45.77493700', '4.84790000', '2017-10-23 09:43:25', NULL, 4),
(5, 'Anaïs', 14, 'rue de Brest', '69002', 'LYON', '45.76388400', '4.83298300', '2017-10-23 09:43:25', NULL, 5);

-- --------------------------------------------------------

--
-- Structure de la table `changement_position_livreur`
--

DROP TABLE IF EXISTS `changement_position_livreur`;
CREATE TABLE IF NOT EXISTS `changement_position_livreur` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `date_changement_position` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `nouvelle_latitude` decimal(10,8) NOT NULL,
  `nouvelle_longitude` decimal(11,8) NOT NULL,
  `fk_livreur_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_fk_livreur_id` (`fk_livreur_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `changement_position_livreur`
--

INSERT INTO `changement_position_livreur` (`id`, `date_changement_position`, `nouvelle_latitude`, `nouvelle_longitude`, `fk_livreur_id`) VALUES
(1, '2017-10-20 11:23:30', '45.75671500', '4.83155100', 1),
(2, '2017-10-20 11:23:30', '45.75994500', '4.85804200', 2);

-- --------------------------------------------------------

--
-- Structure de la table `chang_compo_sac_livreur`
--

DROP TABLE IF EXISTS `chang_compo_sac_livreur`;
CREATE TABLE IF NOT EXISTS `chang_compo_sac_livreur` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `fk_livreur_id` int(10) UNSIGNED NOT NULL,
  `fk_produit_id` int(10) UNSIGNED NOT NULL,
  `nouvelle_quantite` int(10) UNSIGNED NOT NULL,
  `date_chang_compo_sac` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_fk_produit_id` (`fk_produit_id`),
  KEY `idx_fk_livreur_id` (`fk_livreur_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `chang_compo_sac_livreur`
--

INSERT INTO `chang_compo_sac_livreur` (`id`, `fk_livreur_id`, `fk_produit_id`, `nouvelle_quantite`, `date_chang_compo_sac`) VALUES
(1, 2, 1, 4, '2017-10-20 11:00:00'),
(2, 2, 2, 4, '2017-10-20 11:00:00'),
(3, 2, 3, 4, '2017-10-20 11:00:00'),
(4, 2, 4, 4, '2017-10-20 11:00:00'),
(5, 1, 1, 4, '2017-10-20 11:00:00'),
(6, 1, 2, 4, '2017-10-20 11:00:00'),
(7, 1, 3, 4, '2017-10-20 11:00:00'),
(8, 1, 4, 4, '2017-10-20 11:00:00'),
(9, 2, 2, 2, '2017-10-20 11:40:00'),
(10, 2, 4, 2, '2017-10-20 11:40:00'),
(11, 1, 1, 3, '2017-10-20 12:20:00'),
(12, 1, 3, 3, '2017-10-20 12:20:00');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `fk_utilisateur_id` int(11) UNSIGNED NOT NULL,
  `numero_client` int(11) UNSIGNED ZEROFILL NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `telephone` int(10) UNSIGNED ZEROFILL NOT NULL,
  `date_creation` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modification` datetime DEFAULT NULL,
  `date_desactivation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uniq_numero_client` (`numero_client`) USING BTREE,
  UNIQUE KEY `idx_uniq_fk_utilisateur_id` (`fk_utilisateur_id`) USING BTREE,
  KEY `idx_fk_utilisateur_id` (`fk_utilisateur_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`, `fk_utilisateur_id`, `numero_client`, `nom`, `prenom`, `telephone`, `date_creation`, `date_modification`, `date_desactivation`) VALUES
(1, 3, 00000000001, 'Najon', 'Sandra', 0645364512, '2017-10-19 20:19:55', NULL, NULL),
(2, 4, 00000000002, 'Vagnet', 'Louis', 0645781265, '2017-10-19 20:21:30', NULL, NULL),
(3, 5, 00000000003, 'Monin', 'Elisabeth', 0632741532, '2017-10-19 20:21:30', NULL, NULL),
(4, 9, 00000000004, 'Galla', 'Noémie', 0615745216, '2017-10-23 09:37:06', NULL, NULL),
(5, 10, 00000000005, 'Crelo', 'Anaïs', 0676521453, '2017-10-23 09:37:06', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `numero_commande` int(11) UNSIGNED ZEROFILL NOT NULL,
  `date_commande_paiement` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modification` datetime DEFAULT NULL,
  `quatre_derniers_chiffres_cb` int(4) UNSIGNED ZEROFILL NOT NULL,
  `montant_paye` decimal(7,2) NOT NULL,
  `fk_client_id` int(10) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uniq_numero` (`numero_commande`),
  KEY `idx_fk_client_id` (`fk_client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id`, `numero_commande`, `date_commande_paiement`, `date_modification`, `quatre_derniers_chiffres_cb`, `montant_paye`, `fk_client_id`) VALUES
(1, 00000000001, '2017-10-19 22:07:26', NULL, 4368, '22.00', 3),
(2, 00000000002, '2017-10-19 22:07:26', NULL, 4368, '44.00', 3),
(3, 00000000003, '2017-10-19 22:07:26', NULL, 5114, '22.00', 2),
(4, 00000000004, '2017-10-23 09:49:34', NULL, 4574, '38.50', 1),
(5, 00000000005, '2017-10-23 09:49:34', NULL, 4178, '110.00', 2),
(6, 00000000006, '2017-10-23 09:50:40', NULL, 4332, '115.50', 4),
(7, 00000000007, '2017-10-23 09:51:54', NULL, 4771, '77.00', 5);

-- --------------------------------------------------------

--
-- Structure de la table `ligne_commande`
--

DROP TABLE IF EXISTS `ligne_commande`;
CREATE TABLE IF NOT EXISTS `ligne_commande` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `fk_commande_id` int(10) UNSIGNED NOT NULL,
  `fk_produit_id` int(10) UNSIGNED NOT NULL,
  `quantite` int(11) NOT NULL,
  `date_creation` datetime DEFAULT CURRENT_TIMESTAMP,
  `date_modification` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uniq_fk_commande_produit_id` (`fk_commande_id`,`fk_produit_id`),
  KEY `idx_fk_produit_id` (`fk_produit_id`),
  KEY `idx_fk_commande_id` (`fk_commande_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `ligne_commande`
--

INSERT INTO `ligne_commande` (`id`, `fk_commande_id`, `fk_produit_id`, `quantite`, `date_creation`, `date_modification`) VALUES
(1, 1, 1, 1, '2017-10-19 22:07:26', NULL),
(2, 1, 3, 1, '2017-10-19 22:07:26', NULL),
(3, 2, 2, 2, '2017-10-19 22:07:26', NULL),
(4, 2, 4, 2, '2017-10-19 22:07:26', NULL),
(5, 3, 1, 1, '2017-10-19 22:07:26', NULL),
(6, 3, 4, 1, '2017-10-19 22:07:26', NULL),
(7, 4, 5, 2, '2017-10-23 09:49:34', NULL),
(8, 4, 7, 1, '2017-10-23 09:49:34', NULL),
(9, 5, 6, 5, '2017-10-23 09:49:34', NULL),
(10, 5, 8, 5, '2017-10-23 09:49:34', NULL),
(11, 6, 6, 5, '2017-10-23 09:50:40', NULL),
(12, 6, 7, 6, '2017-10-23 09:50:40', NULL),
(13, 7, 5, 3, '2017-10-23 09:51:54', NULL),
(14, 7, 8, 5, '2017-10-23 09:51:54', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `livraison`
--

DROP TABLE IF EXISTS `livraison`;
CREATE TABLE IF NOT EXISTS `livraison` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `date_debut_livraison` datetime DEFAULT NULL,
  `date_fin_livraison` datetime DEFAULT NULL,
  `fk_commande_id` int(11) UNSIGNED NOT NULL,
  `fk_livreur_id` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uniq_fk_commande_id` (`fk_commande_id`) USING BTREE,
  KEY `idx_fk_commande_id` (`fk_commande_id`) USING BTREE,
  KEY `idx_fk_livreur_id` (`fk_livreur_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `livraison`
--

INSERT INTO `livraison` (`id`, `date_debut_livraison`, `date_fin_livraison`, `fk_commande_id`, `fk_livreur_id`) VALUES
(1, '2017-10-20 12:00:00', '2017-10-20 12:20:00', 1, 1),
(2, '2017-10-20 11:30:00', '2017-10-20 11:40:00', 2, 2),
(3, '2017-10-20 13:00:00', '2017-10-20 13:15:00', 3, 5),
(4, '2017-10-23 12:00:00', NULL, 4, 3),
(5, '2017-10-23 12:00:00', NULL, 5, 4),
(6, '2017-10-23 12:30:00', NULL, 6, 1),
(7, '2017-10-23 13:00:00', NULL, 7, 4);

-- --------------------------------------------------------

--
-- Structure de la table `livreur`
--

DROP TABLE IF EXISTS `livreur`;
CREATE TABLE IF NOT EXISTS `livreur` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `fk_utilisateur_id` int(11) UNSIGNED NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `telephone` int(10) UNSIGNED ZEROFILL NOT NULL,
  `date_creation` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modification` datetime DEFAULT NULL,
  `date_desactivation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uniq_fk_utilisateur_id` (`fk_utilisateur_id`),
  KEY `idx_fk_utilisateur_id` (`fk_utilisateur_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `livreur`
--

INSERT INTO `livreur` (`id`, `fk_utilisateur_id`, `nom`, `prenom`, `telephone`, `date_creation`, `date_modification`, `date_desactivation`) VALUES
(1, 2, 'Durand', 'Stéphane', 0612857845, '2017-10-19 20:30:48', NULL, NULL),
(2, 6, 'Duval', 'Agnès', 0685147264, '2017-10-19 20:34:22', NULL, NULL),
(3, 7, 'Loud', 'Pascal', 0618743245, '2017-10-23 09:31:56', NULL, NULL),
(4, 8, 'Pare', 'Claire', 0671381176, '2017-10-23 09:31:56', NULL, NULL),
(5, 11, 'Nome', 'Jean', 0612435273, '2017-10-23 09:32:30', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `reference_produit` char(12) NOT NULL,
  `type` enum('plat','dessert') NOT NULL,
  `nom` varchar(255) NOT NULL,
  `descriptif` text NOT NULL,
  `prix_unitaire_ht` decimal(5,2) NOT NULL,
  `taux_tva_100` decimal(3,1) NOT NULL,
  `date_creation` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modification` datetime DEFAULT NULL,
  `date_mise_en_ligne` datetime DEFAULT NULL,
  `date_hors_ligne` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uniq_reference` (`reference_produit`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id`, `reference_produit`, `type`, `nom`, `descriptif`, `prix_unitaire_ht`, `taux_tva_100`, `date_creation`, `date_modification`, `date_mise_en_ligne`, `date_hors_ligne`) VALUES
(1, 'PLA120171019', 'plat', 'Filet de Dorade Royale au Citron Confit', 'Filet de Dorade Royale au Citron Confit\r\nMarinade au Sumac, Gingembre et Safran, Écrasé de Pommes de Terre,\r\nOlives Noires et Tomates', '15.00', '10.0', '2017-10-18 10:32:26', NULL, '2017-10-20 00:00:00', '2017-10-21 00:00:00'),
(2, 'PLA220171019', 'plat', 'Filet de Boeuf poêlé', 'Filet de Boeuf poêlé, oignons frits accompagné de Frites \"maison\" ou légumes, sauce au choix (poivre, béarnaise ou cèpes)', '15.00', '10.0', '2017-10-18 10:32:26', NULL, '2017-10-20 00:00:00', '2017-10-21 00:00:00'),
(3, 'DES120171019', 'dessert', 'Tartelette \"Framboise-Citron\"', 'Tartelette \"Framboise-Citron\"\r\net Coulis framboise', '5.00', '10.0', '2017-10-18 10:32:26', NULL, '2017-10-20 00:00:00', '2017-10-21 00:00:00'),
(4, 'DES220171019', 'dessert', 'Mi-Choco-Caramel Croustillant', 'Mi-Choco-Caramel Croustillant\r\nEt son Lait Mousseux à la Vanille', '5.00', '10.0', '2017-10-18 10:32:26', NULL, '2017-10-20 00:00:00', '2017-10-21 00:00:00'),
(5, 'PLA120171023', 'plat', 'Filet de truite poêlée', 'Filet de truite poêlée, quinoa, citron et petits légumes', '15.00', '10.0', '2017-10-22 10:32:26', NULL, '2017-10-23 00:00:00', NULL),
(6, 'PLA220171023', 'plat', 'Magret de canard rôti', 'Magret de canard rôti, gratin de patate douce au comté et sauce morilles', '15.00', '10.0', '2017-10-22 10:32:26', NULL, '2017-10-23 00:00:00', NULL),
(7, 'DES120171023', 'dessert', 'Madeleines Tièdes au Miel', 'Madeleines Tièdes au Miel\r\nCoulis d’Oranges Amères', '5.00', '10.0', '2017-10-22 10:32:26', NULL, '2017-10-23 00:00:00', NULL),
(8, 'DES220171023', 'dessert', 'Délice au citron sur pain de Gènes', 'Délice au citron sur pain de Gènes', '5.00', '10.0', '2017-10-22 10:32:26', NULL, '2017-10-23 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `mot_passe` varchar(255) NOT NULL,
  `date_creation` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modification` datetime DEFAULT NULL,
  `date_desactivation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uniq_email` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `email`, `mot_passe`, `date_creation`, `date_modification`, `date_desactivation`) VALUES
(1, 'bertrand.dupont@expressfood.fr', 'bdupontexpress', '2017-10-19 18:22:58', NULL, NULL),
(2, 'stephane.durand@expressfood.fr', 'sdurandexpress', '2017-10-19 18:22:58', NULL, NULL),
(3, 'sandra.najon@gmail.com', 'sandra', '2017-10-19 18:22:58', NULL, NULL),
(4, 'louis.vagnet@gmail.com', 'louisv', '2017-10-19 20:24:27', NULL, NULL),
(5, 'elisabeth.monin@gmail.com', 'momo', '2017-10-19 20:25:03', NULL, NULL),
(6, 'agnes.duval@gmail.com', 'agnesexpress', '2017-10-19 20:33:30', NULL, NULL),
(7, 'pascal.loud@gmail.com', 'pascalexpress', '2017-10-23 09:21:15', NULL, NULL),
(8, 'claire.pare@gmail.com', 'claireexpress', '2017-10-23 09:22:22', NULL, NULL),
(9, 'noemie.galla@gmail.com', 'noga', '2017-10-23 09:23:11', NULL, NULL),
(10, 'anais.crelo@gmai.com', 'anais', '2017-10-23 09:23:50', NULL, NULL),
(11, 'jean.nome@gmail.com', 'jeanexpress', '2017-10-23 09:25:22', NULL, NULL);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `administrateur`
--
ALTER TABLE `administrateur`
  ADD CONSTRAINT `fk_utilisateur_id` FOREIGN KEY (`fk_utilisateur_id`) REFERENCES `utilisateur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `adresse`
--
ALTER TABLE `adresse`
  ADD CONSTRAINT `fk_adresse_client_id` FOREIGN KEY (`fk_client_id`) REFERENCES `client` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `changement_position_livreur`
--
ALTER TABLE `changement_position_livreur`
  ADD CONSTRAINT `fk_position_livreur_id` FOREIGN KEY (`fk_livreur_id`) REFERENCES `livreur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `chang_compo_sac_livreur`
--
ALTER TABLE `chang_compo_sac_livreur`
  ADD CONSTRAINT `fk_sac_livreur_id` FOREIGN KEY (`fk_livreur_id`) REFERENCES `livreur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_sac_produit_id` FOREIGN KEY (`fk_produit_id`) REFERENCES `produit` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `fk_client_utilisateur_id` FOREIGN KEY (`fk_utilisateur_id`) REFERENCES `utilisateur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `fk_commande_client_id` FOREIGN KEY (`fk_client_id`) REFERENCES `client` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `ligne_commande`
--
ALTER TABLE `ligne_commande`
  ADD CONSTRAINT `fk_ligne_commande_id` FOREIGN KEY (`fk_commande_id`) REFERENCES `commande` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ligne_produit_id` FOREIGN KEY (`fk_produit_id`) REFERENCES `produit` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `livraison`
--
ALTER TABLE `livraison`
  ADD CONSTRAINT `fk_livraison_commande_id` FOREIGN KEY (`fk_commande_id`) REFERENCES `commande` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_livraison_livreur_id` FOREIGN KEY (`fk_livreur_id`) REFERENCES `livreur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `livreur`
--
ALTER TABLE `livreur`
  ADD CONSTRAINT `fk_admin_utilisateur_id` FOREIGN KEY (`fk_utilisateur_id`) REFERENCES `utilisateur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
