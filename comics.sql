-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mer. 24 août 2022 à 07:14
-- Version du serveur : 5.7.33
-- Version de PHP : 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `comics`
--

-- --------------------------------------------------------

--
-- Structure de la table `collections`
--

CREATE TABLE `collections` (
  `Id` int(11) NOT NULL,
  `Nom` varchar(255) NOT NULL,
  `Prestige` varchar(255) NOT NULL,
  `DateParution` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `comics`
--

CREATE TABLE `comics` (
  `Id` int(11) NOT NULL,
  `ISBN` int(11) NOT NULL,
  `Titre` varchar(255) NOT NULL,
  `Resume` text NOT NULL,
  `DatePublication` date NOT NULL,
  `NombrePages` int(11) NOT NULL,
  `Id_epoques` int(11) NOT NULL,
  `Id_collections` int(11) NOT NULL,
  `Id_univers` int(11) NOT NULL,
  `Id_series` int(11) DEFAULT NULL,
  `Id_editeurs` int(11) NOT NULL,
  `Id_dessinateurs` int(11) NOT NULL,
  `Id_scenaristes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `comics_personnages`
--

CREATE TABLE `comics_personnages` (
  `Id_personnages` int(11) NOT NULL,
  `Id_comics` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `dessinateurs`
--

CREATE TABLE `dessinateurs` (
  `Id` int(11) NOT NULL,
  `Nom` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `editeurs`
--

CREATE TABLE `editeurs` (
  `Id` int(11) NOT NULL,
  `Nom` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `epoques`
--

CREATE TABLE `epoques` (
  `Id` int(11) NOT NULL,
  `Nom` varchar(255) NOT NULL,
  `Description` text NOT NULL,
  `Annees` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `personnages`
--

CREATE TABLE `personnages` (
  `Id` int(11) NOT NULL,
  `Nom` varchar(255) NOT NULL,
  `Alias` varchar(255) NOT NULL,
  `Status` varchar(255) NOT NULL,
  `Description` text NOT NULL,
  `PremiereApparition` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `recompenses`
--

CREATE TABLE `recompenses` (
  `Id` int(11) NOT NULL,
  `Titre` varchar(255) NOT NULL,
  `Description` text NOT NULL,
  `AnneeObtenue` year(4) NOT NULL,
  `Id_comics` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `scenaristes`
--

CREATE TABLE `scenaristes` (
  `Id` int(11) NOT NULL,
  `Nom` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `series`
--

CREATE TABLE `series` (
  `Id` int(11) NOT NULL,
  `Nom` varchar(255) NOT NULL,
  `Descriptif` text NOT NULL,
  `AnneeParution` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `univers`
--

CREATE TABLE `univers` (
  `Id` int(11) NOT NULL,
  `Nom` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `collections`
--
ALTER TABLE `collections`
  ADD PRIMARY KEY (`Id`);

--
-- Index pour la table `comics`
--
ALTER TABLE `comics`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `ISBN` (`ISBN`),
  ADD KEY `Id_epoques` (`Id_epoques`),
  ADD KEY `Id_collections` (`Id_collections`),
  ADD KEY `Id_univers` (`Id_univers`),
  ADD KEY `Id_series` (`Id_series`),
  ADD KEY `Id_editeurs` (`Id_editeurs`),
  ADD KEY `Id_dessinateurs` (`Id_dessinateurs`),
  ADD KEY `Id_scenaristes` (`Id_scenaristes`);

--
-- Index pour la table `comics_personnages`
--
ALTER TABLE `comics_personnages`
  ADD PRIMARY KEY (`Id_personnages`,`Id_comics`),
  ADD KEY `Id_comics` (`Id_comics`);

--
-- Index pour la table `dessinateurs`
--
ALTER TABLE `dessinateurs`
  ADD PRIMARY KEY (`Id`);

--
-- Index pour la table `editeurs`
--
ALTER TABLE `editeurs`
  ADD PRIMARY KEY (`Id`);

--
-- Index pour la table `epoques`
--
ALTER TABLE `epoques`
  ADD PRIMARY KEY (`Id`);

--
-- Index pour la table `personnages`
--
ALTER TABLE `personnages`
  ADD PRIMARY KEY (`Id`);

--
-- Index pour la table `recompenses`
--
ALTER TABLE `recompenses`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_comics` (`Id_comics`);

--
-- Index pour la table `scenaristes`
--
ALTER TABLE `scenaristes`
  ADD PRIMARY KEY (`Id`);

--
-- Index pour la table `series`
--
ALTER TABLE `series`
  ADD PRIMARY KEY (`Id`);

--
-- Index pour la table `univers`
--
ALTER TABLE `univers`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `collections`
--
ALTER TABLE `collections`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `comics`
--
ALTER TABLE `comics`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `dessinateurs`
--
ALTER TABLE `dessinateurs`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `editeurs`
--
ALTER TABLE `editeurs`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `epoques`
--
ALTER TABLE `epoques`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `personnages`
--
ALTER TABLE `personnages`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `recompenses`
--
ALTER TABLE `recompenses`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `scenaristes`
--
ALTER TABLE `scenaristes`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `series`
--
ALTER TABLE `series`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `univers`
--
ALTER TABLE `univers`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `comics`
--
ALTER TABLE `comics`
  ADD CONSTRAINT `comics_ibfk_1` FOREIGN KEY (`Id_epoques`) REFERENCES `epoques` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comics_ibfk_2` FOREIGN KEY (`Id_collections`) REFERENCES `collections` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comics_ibfk_3` FOREIGN KEY (`Id_univers`) REFERENCES `univers` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comics_ibfk_4` FOREIGN KEY (`Id_series`) REFERENCES `series` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comics_ibfk_5` FOREIGN KEY (`Id_editeurs`) REFERENCES `editeurs` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comics_ibfk_6` FOREIGN KEY (`Id_dessinateurs`) REFERENCES `dessinateurs` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comics_ibfk_7` FOREIGN KEY (`Id_scenaristes`) REFERENCES `scenaristes` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `comics_personnages`
--
ALTER TABLE `comics_personnages`
  ADD CONSTRAINT `comics_personnages_ibfk_1` FOREIGN KEY (`Id_personnages`) REFERENCES `personnages` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comics_personnages_ibfk_2` FOREIGN KEY (`Id_comics`) REFERENCES `comics` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `recompenses`
--
ALTER TABLE `recompenses`
  ADD CONSTRAINT `recompenses_ibfk_1` FOREIGN KEY (`Id_comics`) REFERENCES `comics` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
