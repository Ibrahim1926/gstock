-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 31 déc. 2024 à 13:07
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `iinekstock`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE `article` (
  `idArticle` int(11) NOT NULL,
  `designationArticle` varchar(100) NOT NULL,
  `Description` text NOT NULL,
  `idMarque` int(100) NOT NULL,
  `modeleArticle` varchar(100) NOT NULL,
  `IdCategorie` int(100) NOT NULL,
  `qteStock` int(11) NOT NULL,
  `seuilArticle` int(11) NOT NULL,
  `prixArticle` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`idArticle`, `designationArticle`, `Description`, `idMarque`, `modeleArticle`, `IdCategorie`, `qteStock`, `seuilArticle`, `prixArticle`) VALUES
(1, 'Ecran HP 24\"', 'Ecran', 1, '', 1, 10, 2, 500000),
(2, 'Tadiran', 'Tadiran', 1, '', 7, 0, 2, 1000000),
(3, 'Fortigate FG-60E', 'Firewall fortinet', 2, 'FG-60E', 5, 0, 2, 15000000),
(4, 'Clavier USB ', 'Clavier Filaire', 1, '', 6, 8, 3, 500000),
(5, 'Switch 2960 ', 'Catalyst + 4X1G 48Ports', 1, '', 1, 0, 2, 15000000),
(6, 'NVR HikVision ', ' Network Video RecorderHikVision ', 1, '', 1, 0, 2, 800000),
(7, 'ThinkPad 2021', 'Lenovo ', 4, 'Lenovo ', 1, 0, 2, 150000),
(8, 'Hp proliant 380 G10', 'SERVEUR ', 1, '380 G10', 2, 0, 2, 1700000);

-- --------------------------------------------------------

--
-- Structure de la table `categoriearticle`
--

CREATE TABLE `categoriearticle` (
  `IdCategorie` int(11) NOT NULL,
  `Libelle` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `categoriearticle`
--

INSERT INTO `categoriearticle` (`IdCategorie`, `Libelle`) VALUES
(1, 'Ordinateur'),
(2, 'Serveur'),
(3, 'Commutateur'),
(4, 'Routeur'),
(5, 'Pare-feu'),
(6, 'Accessoires'),
(7, 'Telephone IP'),
(8, 'Wi-fi'),
(9, 'Pointeuse'),
(10, 'Répéteur WI-FI');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `idClient` int(11) NOT NULL,
  `RefClient` varchar(20) NOT NULL,
  `nomClient` varchar(100) NOT NULL,
  `AddClient` text NOT NULL,
  `ContactClient` int(11) NOT NULL,
  `emailClient` varchar(100) NOT NULL,
  `EtatClient` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`idClient`, `RefClient`, `nomClient`, `AddClient`, `ContactClient`, `emailClient`, `EtatClient`) VALUES
(1, 'CLI-202400001', 'Ibrahima Camara', 'Boulbinet k1', 621442112, 'ibra95camara@gmail.com', 1);

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `idCommande` int(11) NOT NULL,
  `RefCommande` varchar(100) NOT NULL,
  `idFournisseur` int(11) NOT NULL,
  `dateCommande` date NOT NULL DEFAULT current_timestamp(),
  `dateLivraison` datetime DEFAULT NULL,
  `MontantCommande` int(100) NOT NULL,
  `idCompte` int(15) NOT NULL,
  `etatCommande` tinyint(1) NOT NULL DEFAULT 0,
  `etatPaiement` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`idCommande`, `RefCommande`, `idFournisseur`, `dateCommande`, `dateLivraison`, `MontantCommande`, `idCompte`, `etatCommande`, `etatPaiement`) VALUES
(1, 'CO2024110001', 2, '2024-11-21', '2024-11-21 00:00:00', 10100100, 0, 3, 1),
(2, 'CO2024110002', 2, '2024-11-22', '2024-11-22 00:00:00', 100000, 1, 3, 1),
(3, 'CO2024110003', 3, '2024-11-22', NULL, 200000, 0, 3, 0),
(4, 'CO2024110004', 3, '2024-11-22', '2024-11-22 00:00:00', 100000, 0, 3, 0),
(5, 'CO2024110005', 3, '2024-11-22', '2024-11-26 00:00:00', 100000, 1, 1, 1),
(6, 'CO2024110006', 3, '2024-11-22', '2024-11-26 00:00:00', 100000, 1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `compte`
--

CREATE TABLE `compte` (
  `idCompte` int(11) NOT NULL,
  `IntituleCompte` varchar(200) NOT NULL,
  `typeCompte` enum('Banque','Caisse','PaiementMobile') NOT NULL,
  `numCompte` int(100) NOT NULL,
  `soldeCompte` int(11) NOT NULL,
  `statusCompte` enum('actif','inactif','supprimé') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `compte`
--

INSERT INTO `compte` (`idCompte`, `IntituleCompte`, `typeCompte`, `numCompte`, `soldeCompte`, `statusCompte`) VALUES
(1, 'CAISSE', 'Caisse', 1, 10499900, 'actif');

-- --------------------------------------------------------

--
-- Structure de la table `fournisseur`
--

CREATE TABLE `fournisseur` (
  `idFournisseur` int(11) NOT NULL,
  `RefFournisseur` varchar(20) NOT NULL,
  `nomFournisseur` varchar(100) NOT NULL,
  `AddFournisseur` text NOT NULL,
  `ContactFournisseur` int(20) NOT NULL,
  `emailFournisseur` varchar(100) NOT NULL,
  `etatFournisseur` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `fournisseur`
--

INSERT INTO `fournisseur` (`idFournisseur`, `RefFournisseur`, `nomFournisseur`, `AddFournisseur`, `ContactFournisseur`, `emailFournisseur`, `etatFournisseur`) VALUES
(2, 'FO202400001', 'HP', 'dddd', 12345678, 'contact@hp.com', 0),
(3, 'FO202400003', 'HP', 'dddd', 12345678, 'HP@gmail.com', 1);

-- --------------------------------------------------------

--
-- Structure de la table `lignecommande`
--

CREATE TABLE `lignecommande` (
  `idligne` int(11) NOT NULL,
  `idCommande` int(11) NOT NULL,
  `idArticle` int(11) NOT NULL,
  `qteStock` int(11) DEFAULT NULL,
  `qteCommande` int(11) NOT NULL,
  `PrixAchat` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `lignecommande`
--

INSERT INTO `lignecommande` (`idligne`, `idCommande`, `idArticle`, `qteStock`, `qteCommande`, `PrixAchat`) VALUES
(1, 1, 8, NULL, 1, 10100100),
(2, 2, 4, NULL, 10, 10000),
(3, 3, 4, NULL, 10, 20000),
(4, 4, 4, NULL, 10, 10000),
(5, 5, 4, NULL, 10, 10000),
(6, 6, 1, NULL, 10, 10000);

-- --------------------------------------------------------

--
-- Structure de la table `lignevente`
--

CREATE TABLE `lignevente` (
  `idligne` int(11) NOT NULL,
  `idVente` int(11) NOT NULL,
  `idArticle` int(11) NOT NULL,
  `qteVente` int(11) NOT NULL,
  `prixVente` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `lignevente`
--

INSERT INTO `lignevente` (`idligne`, `idVente`, `idArticle`, `qteVente`, `prixVente`) VALUES
(1, 1, 4, 4, 500000),
(2, 2, 4, 1, 500000),
(3, 3, 4, 1, 500000);

-- --------------------------------------------------------

--
-- Structure de la table `marque`
--

CREATE TABLE `marque` (
  `idMarque` int(11) NOT NULL,
  `LibelleMarque` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `marque`
--

INSERT INTO `marque` (`idMarque`, `LibelleMarque`) VALUES
(1, 'HP'),
(2, 'FORTINET'),
(3, 'DELL'),
(4, 'LENOVO'),
(5, 'ACER'),
(6, 'CISCO');

-- --------------------------------------------------------

--
-- Structure de la table `opperationcompte`
--

CREATE TABLE `opperationcompte` (
  `idOperation` int(11) NOT NULL,
  `typeOperation` tinyint(1) NOT NULL,
  `soldeOperation` int(20) NOT NULL,
  `montantOperation` int(15) NOT NULL,
  `idCompte` int(11) NOT NULL,
  `dateOperation` datetime NOT NULL DEFAULT current_timestamp(),
  `intituleOperation` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `opperationcompte`
--

INSERT INTO `opperationcompte` (`idOperation`, `typeOperation`, `soldeOperation`, `montantOperation`, `idCompte`, `dateOperation`, `intituleOperation`) VALUES
(1, 1, 0, 1000000, 1, '2024-11-21 14:59:05', 'Allimentation du compte par '),
(2, 1, 1000000, 1000000, 1, '2024-11-21 15:00:34', 'Allimentation du compte par '),
(3, 1, 2000000, 1500000, 1, '2024-11-21 15:04:21', 'Allimentation du compte par root'),
(4, 0, 3500000, 100000, 1, '2024-11-21 15:16:37', 'Retrait de fond par root'),
(5, 1, 3400000, 15000000, 1, '2024-11-21 19:45:24', 'Allimentation du compte par root'),
(6, 0, 18400000, 10100100, 1, '2024-11-21 19:45:31', 'Paiement de la Commande N° CO2024110001'),
(7, 0, 8299900, 100000, 1, '2024-11-22 09:55:27', 'Paiement de la Commande N° CO2024110002'),
(8, 0, 8199900, 100000, 1, '2024-11-22 16:17:57', 'Paiement de la Commande N° CO2024110005'),
(9, 1, 8099900, 2000000, 1, '2024-11-26 13:45:24', 'Encaisement de la facture N° FACT00001'),
(10, 1, 10099900, 500000, 1, '2024-11-26 13:54:35', 'Encaisement de la facture N° FACT00003'),
(11, 0, 10599900, 100000, 1, '2024-11-26 22:04:50', 'Paiement de la Commande N° CO2024110006');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `idUser` int(11) NOT NULL,
  `Prenom` varchar(50) NOT NULL,
  `Nom` varchar(50) NOT NULL,
  `Login` varchar(100) NOT NULL,
  `Passwd` varchar(100) NOT NULL,
  `typeUser` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`idUser`, `Prenom`, `Nom`, `Login`, `Passwd`, `typeUser`) VALUES
(3, 'root', 'root', 'root', 'd6bd88a1cd93a3630b0e38f2a472473ef8944e46', 1),
(7, 'Ibrahima', 'Camara', 'ibou', '2f0ecc165b9d1976721a7fe0c38b9a275397a075', 1);

-- --------------------------------------------------------

--
-- Structure de la table `vente`
--

CREATE TABLE `vente` (
  `idVente` int(11) NOT NULL,
  `RefVente` varchar(20) NOT NULL,
  `idClient` int(11) NOT NULL,
  `dateVente` datetime NOT NULL DEFAULT current_timestamp(),
  `MontantVente` int(100) NOT NULL,
  `idCompte` tinyint(11) NOT NULL,
  `etatVente` enum('soumis','validée','annulée') NOT NULL DEFAULT 'soumis',
  `etatPaiement` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `vente`
--

INSERT INTO `vente` (`idVente`, `RefVente`, `idClient`, `dateVente`, `MontantVente`, `idCompte`, `etatVente`, `etatPaiement`) VALUES
(1, 'VEN-2024112500001', 1, '2024-11-25 13:02:04', 2000000, 0, 'validée', 1),
(2, 'VEN-2024112500002', 1, '2024-11-25 16:19:46', 500000, 0, 'annulée', 0),
(3, 'VEN-2024112600003', 1, '2024-11-26 13:15:51', 500000, 0, 'validée', 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`idArticle`),
  ADD KEY `idCategorie` (`IdCategorie`);

--
-- Index pour la table `categoriearticle`
--
ALTER TABLE `categoriearticle`
  ADD PRIMARY KEY (`IdCategorie`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`idClient`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`idCommande`),
  ADD KEY `idCompte` (`idCompte`);

--
-- Index pour la table `compte`
--
ALTER TABLE `compte`
  ADD PRIMARY KEY (`idCompte`);

--
-- Index pour la table `fournisseur`
--
ALTER TABLE `fournisseur`
  ADD PRIMARY KEY (`idFournisseur`);

--
-- Index pour la table `lignecommande`
--
ALTER TABLE `lignecommande`
  ADD PRIMARY KEY (`idligne`);

--
-- Index pour la table `lignevente`
--
ALTER TABLE `lignevente`
  ADD PRIMARY KEY (`idligne`);

--
-- Index pour la table `marque`
--
ALTER TABLE `marque`
  ADD PRIMARY KEY (`idMarque`);

--
-- Index pour la table `opperationcompte`
--
ALTER TABLE `opperationcompte`
  ADD PRIMARY KEY (`idOperation`),
  ADD KEY `isCompte` (`idCompte`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`idUser`);

--
-- Index pour la table `vente`
--
ALTER TABLE `vente`
  ADD PRIMARY KEY (`idVente`),
  ADD KEY `idClient` (`idClient`),
  ADD KEY `idCompte` (`idCompte`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `article`
--
ALTER TABLE `article`
  MODIFY `idArticle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `categoriearticle`
--
ALTER TABLE `categoriearticle`
  MODIFY `IdCategorie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `idClient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `compte`
--
ALTER TABLE `compte`
  MODIFY `idCompte` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `fournisseur`
--
ALTER TABLE `fournisseur`
  MODIFY `idFournisseur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `lignecommande`
--
ALTER TABLE `lignecommande`
  MODIFY `idligne` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `lignevente`
--
ALTER TABLE `lignevente`
  MODIFY `idligne` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `marque`
--
ALTER TABLE `marque`
  MODIFY `idMarque` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `opperationcompte`
--
ALTER TABLE `opperationcompte`
  MODIFY `idOperation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
