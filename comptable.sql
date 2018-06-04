-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 04, 2018 at 01:51 PM
-- Server version: 5.6.38
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `comptable`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
 `id` int(11) NOT NULL,
 `name` varchar(20) NOT NULL,
 `type` enum('debit','credit') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
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
-- Table structure for table `compte_bancaire`
--

CREATE TABLE `compte_bancaire` (
 `id` int(11) NOT NULL,
 `nom` varchar(25) NOT NULL,
 `type` enum('courant','épargne','compte_joint') NOT NULL,
 `solde` double(10,2) NOT NULL,
 `devise` enum('EUR','USD') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `compte_operation`
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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `compte_bancaire`
--
ALTER TABLE `compte_bancaire`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `compte_operation`
--
ALTER TABLE `compte_operation`
 ADD PRIMARY KEY (`id`),
 ADD KEY `id_compte` (`id_compte`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
 MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `compte_bancaire`
--
ALTER TABLE `compte_bancaire`
 MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `compte_operation`
--
ALTER TABLE `compte_operation`
 MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `compte_operation`
--
ALTER TABLE `compte_operation`
 ADD CONSTRAINT `compte_operation_ibfk_1` FOREIGN KEY (`id`) REFERENCES `compte_bancaire` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
 ADD CONSTRAINT `compte_operation_ibfk_2` FOREIGN KEY (`id_compte`) REFERENCES `category` (`id`);