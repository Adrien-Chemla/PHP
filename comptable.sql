-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le :  mer. 06 juin 2018 à 07:43
-- Version du serveur :  5.6.38
-- Version de PHP :  7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données :  `comptable`
--

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `type` enum('debit','credit') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`, `type`) VALUES
(1, 'Alimentaire', 'debit'),
(2, 'Vestimentaire', 'debit'),
(3, 'Loisir', 'debit'),
(4, 'Transport', 'debit'),
(5, 'Logement', 'debit'),
(6, 'Autres', 'debit'),
(7, 'Virement', 'credit'),
(8, 'Dépôt', 'credit'),
(9, 'Salaire', 'credit'),
(10, 'Autres', 'credit');

-- --------------------------------------------------------

--
-- Structure de la table `compte_bancaire`
--

CREATE TABLE `compte_bancaire` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `nom` varchar(25) NOT NULL,
  `type` enum('courant','epargne','joint') NOT NULL,
  `solde` double(10,2) NOT NULL,
  `devise` enum('EUR','USD') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `compte_operation`
--

CREATE TABLE `compte_operation` (
  `id` int(11) NOT NULL,
  `id_compte` int(11) NOT NULL,
  `choix` int(11) NOT NULL,
  `operation` int(11) NOT NULL,
  `montant` double(10,2) NOT NULL,
  `categorie` int(11) NOT NULL,
  `mode_paiement` enum('CB','virement','chèques','prélèvement','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `tel` int(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `first_name`, `last_name`, `tel`, `email`, `password`) VALUES
(8, 'Alek', 'Grbovic', 1020345345, 'skefgb@gmail.com', '1234');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `compte_bancaire`
--
ALTER TABLE `compte_bancaire`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Index pour la table `compte_operation`
--
ALTER TABLE `compte_operation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_compte` (`id_compte`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `compte_bancaire`
--
ALTER TABLE `compte_bancaire`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `compte_operation`
--
ALTER TABLE `compte_operation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `compte_bancaire`
--
ALTER TABLE `compte_bancaire`
  ADD CONSTRAINT `compte_bancaire_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `compte_operation`
--
ALTER TABLE `compte_operation`
  ADD CONSTRAINT `compte_operation_ibfk_1` FOREIGN KEY (`id`) REFERENCES `compte_bancaire` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `compte_operation_ibfk_2` FOREIGN KEY (`id_compte`) REFERENCES `category` (`id`);
