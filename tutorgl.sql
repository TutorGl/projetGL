-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 30, 2023 at 04:54 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tutorgl`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `email` varchar(50) NOT NULL,
  `password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `adresse`
--

CREATE TABLE `adresse` (
  `idAdresse` int(11) NOT NULL,
  `commune` varchar(50) DEFAULT NULL,
  `wilaya` varchar(50) DEFAULT NULL,
  `rue` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `annonceext`
--

CREATE TABLE `annonceext` (
  `idAnnonceExt` int(11) NOT NULL,
  `lien` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `annonces`
--

CREATE TABLE `annonces` (
  `idAnnonce` int(11) NOT NULL,
  `categorie` varchar(50) DEFAULT NULL,
  `theme` varchar(50) DEFAULT NULL,
  `modalite` varchar(50) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `tarif` float DEFAULT NULL,
  `adresse` int(11) NOT NULL,
  `photo` blob DEFAULT NULL,
  `annonceur` int(11) NOT NULL,
  `localisation` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `favoris`
--

CREATE TABLE `favoris` (
  `user` int(11) NOT NULL,
  `annonce` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `favorisext`
--

CREATE TABLE `favorisext` (
  `user` int(11) NOT NULL,
  `annonce` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `idMessage` int(11) NOT NULL,
  `recepteur` int(11) NOT NULL,
  `emetteur` int(11) NOT NULL,
  `contenu` varchar(50) DEFAULT NULL,
  `annonce` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `idUser` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `adresse`
--
ALTER TABLE `adresse`
  ADD PRIMARY KEY (`idAdresse`);

--
-- Indexes for table `annonceext`
--
ALTER TABLE `annonceext`
  ADD PRIMARY KEY (`idAnnonceExt`);

--
-- Indexes for table `annonces`
--
ALTER TABLE `annonces`
  ADD PRIMARY KEY (`idAnnonce`),
  ADD KEY `annonceur` (`annonceur`),
  ADD KEY `adresse` (`adresse`);

--
-- Indexes for table `favoris`
--
ALTER TABLE `favoris`
  ADD PRIMARY KEY (`user`,`annonce`),
  ADD KEY `annonce` (`annonce`);

--
-- Indexes for table `favorisext`
--
ALTER TABLE `favorisext`
  ADD PRIMARY KEY (`user`,`annonce`),
  ADD KEY `annonce` (`annonce`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`idMessage`),
  ADD KEY `annonce` (`annonce`),
  ADD KEY `recepteur` (`recepteur`),
  ADD KEY `emetteur` (`emetteur`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`idUser`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adresse`
--
ALTER TABLE `adresse`
  MODIFY `idAdresse` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `annonceext`
--
ALTER TABLE `annonceext`
  MODIFY `idAnnonceExt` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `annonces`
--
ALTER TABLE `annonces`
  MODIFY `idAnnonce` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `idMessage` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `annonces`
--
ALTER TABLE `annonces`
  ADD CONSTRAINT `annonces_ibfk_1` FOREIGN KEY (`annonceur`) REFERENCES `users` (`idUser`),
  ADD CONSTRAINT `annonces_ibfk_2` FOREIGN KEY (`adresse`) REFERENCES `adresse` (`idAdresse`);

--
-- Constraints for table `favoris`
--
ALTER TABLE `favoris`
  ADD CONSTRAINT `favoris_ibfk_1` FOREIGN KEY (`user`) REFERENCES `users` (`idUser`),
  ADD CONSTRAINT `favoris_ibfk_2` FOREIGN KEY (`annonce`) REFERENCES `annonces` (`idAnnonce`);

--
-- Constraints for table `favorisext`
--
ALTER TABLE `favorisext`
  ADD CONSTRAINT `favorisext_ibfk_1` FOREIGN KEY (`user`) REFERENCES `users` (`idUser`),
  ADD CONSTRAINT `favorisext_ibfk_2` FOREIGN KEY (`annonce`) REFERENCES `annonceext` (`idAnnonceExt`);

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`annonce`) REFERENCES `annonces` (`idAnnonce`),
  ADD CONSTRAINT `message_ibfk_2` FOREIGN KEY (`recepteur`) REFERENCES `users` (`idUser`),
  ADD CONSTRAINT `message_ibfk_3` FOREIGN KEY (`emetteur`) REFERENCES `users` (`idUser`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
