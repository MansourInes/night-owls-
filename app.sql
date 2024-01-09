-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
<<<<<<<< HEAD:app.sql
-- Généré le : sam. 06 jan. 2024 à 14:54
========
-- Généré le : dim. 07 jan. 2024 à 18:42
>>>>>>>> feature/form-connexion-inscription:app (3).sql
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `app`
--

-- --------------------------------------------------------

--
-- Structure de la table `capteur`
--

CREATE TABLE `capteur` (
  `id_capteur` int(11) NOT NULL,
  `niveau_sonore` int(11) DEFAULT NULL,
  `frequence` int(11) DEFAULT NULL,
  `id_evenement` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `capteur`
--

INSERT INTO `capteur` (`id_capteur`, `niveau_sonore`, `frequence`, `id_evenement`) VALUES
(2, 50, 12, 1);

-- --------------------------------------------------------

--
-- Structure de la table `etablissement`
--

CREATE TABLE `etablissement` (
  `id_etablissement` int(11) NOT NULL,
  `capacite_max` int(11) DEFAULT NULL,
  `adresse` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `etablissement`
--

INSERT INTO `etablissement` (`id_etablissement`, `capacite_max`, `adresse`) VALUES
(1, 50, 'test');

-- --------------------------------------------------------

--
-- Structure de la table `evenement`
--

CREATE TABLE `evenement` (
  `id_evenement` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `capacite_max` varchar(50) DEFAULT NULL,
  `date_evenement` date DEFAULT NULL,
  `id_etablissement` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `evenement`
--

INSERT INTO `evenement` (`id_evenement`, `nom`, `capacite_max`, `date_evenement`, `id_etablissement`) VALUES
(1, 'test', '50', '2012-12-12', 1);

-- --------------------------------------------------------

--
-- Structure de la table `faq`
--

CREATE TABLE `faq` (
  `id_faq` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `forum`
--

CREATE TABLE `forum` (
  `id_forum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

CREATE TABLE `message` (
  `id_message` int(11) NOT NULL,
  `date_creation` date DEFAULT NULL,
  `contenu` varchar(50) DEFAULT NULL,
  `id_utilisateur` int(11) NOT NULL,
  `id_sujet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `participer`
--

CREATE TABLE `participer` (
  `id_participation` int(11) NOT NULL,
  `id_utilisateur` int(11) NOT NULL,
  `id_evenement` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `question`
--

CREATE TABLE `question` (
  `id_question` int(11) NOT NULL,
  `contenu` varchar(1000) DEFAULT NULL,
  `reponse` varchar(1000) DEFAULT NULL,
  `id_faq` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `sujet`
--

CREATE TABLE `sujet` (
  `id_sujet` int(11) NOT NULL,
  `titre` varchar(50) DEFAULT NULL,
  `date_creation` date DEFAULT NULL,
  `id_forum` int(11) NOT NULL,
  `id_utilisateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id_utilisateur` int(11) NOT NULL,
  `mail` varchar(50) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `age_` int(11) DEFAULT NULL,
  `sexe` varchar(50) DEFAULT NULL,
  `ville` varchar(50) DEFAULT NULL,
  `estAdmin` tinyint(1) DEFAULT NULL,
  `mot_de_passe` varchar(200) NOT NULL,
  `estSuperAdmin` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `utilisateur`
--

<<<<<<<< HEAD:app.sql
INSERT INTO `utilisateur` (`id_utilisateur`, `mail`, `nom`, `prenom`, `age_`, `sexe`, `ville`, `estDJ`, `mot_de_passe`) VALUES
(7, 'test@gmail.com', 'ESTEVES', 'Gabriel', 20, '', 'Bezons', 1, '$2y$10$gya6gibpme3GeDzEN1y1GuB2/kKqzQCufIQLFjJUsaIEhonbRGuje'),
(14, 'test@gmail', 'ESTEVES', 'Test1', 20, '', 'test', 0, '$2y$10$gWAucUlkS33x4t9QuA/u9uueBd/3zYtMxXhqxApUrM9RKflgHaDey');
========
INSERT INTO `utilisateur` (`id_utilisateur`, `mail`, `nom`, `prenom`, `age_`, `sexe`, `ville`, `estAdmin`, `mot_de_passe`, `estSuperAdmin`) VALUES
(7, 'test@gmail.com', 'ESTEVES', 'Gabriel', 20, '', 'Bezons', 1, '$2y$10$gya6gibpme3GeDzEN1y1GuB2/kKqzQCufIQLFjJUsaIEhonbRGuje', NULL),
(14, 'test@gmail', 'ESTEVES', 'Test1', 20, '', 'test', 0, '$2y$10$gWAucUlkS33x4t9QuA/u9uueBd/3zYtMxXhqxApUrM9RKflgHaDey', NULL),
(15, 'test@test.com', 'Esteves', 'Gabriel', 20, 'Homme', 'Bezons', 0, '$2y$10$mz3o3p7qVfB.HqcOxqkvuuqtSWvQPv7zJp3qlM/c/x28W4qfvCh8O', 1),
(16, 'test@test.commm', 'Esteves', 'Gabriel', 20, '', 'Bezons', 0, '$2y$10$WN06UCSaM1FQ8J8rmoZ5W./8sTRwBOnYXAPke6Pke2yAW5xbg71ai', 1),
(17, 'test@gmai', 'dsqddsdd5', 'ddssds555', 16, '', '', 0, '$2y$10$vBtGW1HHkkc9nXsBgaUc2edMGPlnPI5XjXUkoNKWR8083RYy2EWTq', 0),
(18, 'gabriel@gmail.com', 'Esteves', 'Gabriellll', 20, '', 'Bezons', 1, '$2y$10$zLKuA0RV2ctSwkk21tIZke.KABGO./MUdJg0Nlx.NoIrgCRmI3Gry', 0);
>>>>>>>> feature/form-connexion-inscription:app (3).sql

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `capteur`
--
ALTER TABLE `capteur`
  ADD PRIMARY KEY (`id_capteur`),
  ADD KEY `capteur_ibfk_1` (`id_evenement`);

--
-- Index pour la table `etablissement`
--
ALTER TABLE `etablissement`
  ADD PRIMARY KEY (`id_etablissement`);

--
-- Index pour la table `evenement`
--
ALTER TABLE `evenement`
  ADD PRIMARY KEY (`id_evenement`),
  ADD KEY `evenement_ibfk_1` (`id_etablissement`);

--
-- Index pour la table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id_faq`);

--
-- Index pour la table `forum`
--
ALTER TABLE `forum`
  ADD PRIMARY KEY (`id_forum`);

--
-- Index pour la table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id_message`),
  ADD KEY `message_ibfk_1` (`id_utilisateur`),
  ADD KEY `message_ibfk_2` (`id_sujet`);

--
-- Index pour la table `participer`
--
ALTER TABLE `participer`
  ADD PRIMARY KEY (`id_participation`),
  ADD KEY `participer_ibfk_1` (`id_utilisateur`),
  ADD KEY `participer_ibfk_2` (`id_evenement`);

--
-- Index pour la table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id_question`),
  ADD KEY `question_ibfk_1` (`id_faq`);

--
-- Index pour la table `sujet`
--
ALTER TABLE `sujet`
  ADD PRIMARY KEY (`id_sujet`),
  ADD KEY `sujet_ibfk_1` (`id_forum`),
  ADD KEY `sujet_ibfk_2` (`id_utilisateur`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id_utilisateur`),
  ADD UNIQUE KEY `mail` (`mail`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `capteur`
--
ALTER TABLE `capteur`
  MODIFY `id_capteur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `etablissement`
--
ALTER TABLE `etablissement`
  MODIFY `id_etablissement` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `evenement`
--
ALTER TABLE `evenement`
  MODIFY `id_evenement` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `faq`
--
ALTER TABLE `faq`
  MODIFY `id_faq` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `forum`
--
ALTER TABLE `forum`
  MODIFY `id_forum` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `message`
--
ALTER TABLE `message`
  MODIFY `id_message` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `participer`
--
ALTER TABLE `participer`
  MODIFY `id_participation` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `question`
--
ALTER TABLE `question`
  MODIFY `id_question` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `sujet`
--
ALTER TABLE `sujet`
  MODIFY `id_sujet` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
<<<<<<<< HEAD:app.sql
  MODIFY `id_utilisateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
========
  MODIFY `id_utilisateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
>>>>>>>> feature/form-connexion-inscription:app (3).sql

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `capteur`
--
ALTER TABLE `capteur`
  ADD CONSTRAINT `capteur_ibfk_1` FOREIGN KEY (`id_evenement`) REFERENCES `evenement` (`id_evenement`);

--
-- Contraintes pour la table `evenement`
--
ALTER TABLE `evenement`
  ADD CONSTRAINT `evenement_ibfk_1` FOREIGN KEY (`id_etablissement`) REFERENCES `etablissement` (`id_etablissement`);

--
-- Contraintes pour la table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`),
  ADD CONSTRAINT `message_ibfk_2` FOREIGN KEY (`id_sujet`) REFERENCES `sujet` (`id_sujet`);

--
-- Contraintes pour la table `participer`
--
ALTER TABLE `participer`
  ADD CONSTRAINT `participer_ibfk_1` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`),
  ADD CONSTRAINT `participer_ibfk_2` FOREIGN KEY (`id_evenement`) REFERENCES `evenement` (`id_evenement`);

--
-- Contraintes pour la table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `question_ibfk_1` FOREIGN KEY (`id_faq`) REFERENCES `faq` (`id_faq`);

--
-- Contraintes pour la table `sujet`
--
ALTER TABLE `sujet`
  ADD CONSTRAINT `sujet_ibfk_1` FOREIGN KEY (`id_forum`) REFERENCES `forum` (`id_forum`),
  ADD CONSTRAINT `sujet_ibfk_2` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
