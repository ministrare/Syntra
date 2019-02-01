-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Gegenereerd op: 01 feb 2019 om 14:31
-- Serverversie: 5.7.24
-- PHP-versie: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `voorbeeld-database`
--
CREATE DATABASE IF NOT EXISTS `voorbeeld-database` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `voorbeeld-database`;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `bestuur`
--

DROP TABLE IF EXISTS `bestuur`;
CREATE TABLE IF NOT EXISTS `bestuur` (
  `bestuur_id` int(4) NOT NULL AUTO_INCREMENT,
  `persoon_id` int(4) NOT NULL,
  `functie_id` int(4) NOT NULL,
  PRIMARY KEY (`bestuur_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `bestuur`
--

INSERT INTO `bestuur` (`bestuur_id`, `persoon_id`, `functie_id`) VALUES
(1, 3, 1),
(2, 12, 2),
(3, 23, 3);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `diensten`
--

DROP TABLE IF EXISTS `diensten`;
CREATE TABLE IF NOT EXISTS `diensten` (
  `dienst_id` int(11) NOT NULL AUTO_INCREMENT,
  `dienst` varchar(225) NOT NULL,
  PRIMARY KEY (`dienst_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `diensten`
--

INSERT INTO `diensten` (`dienst_id`, `dienst`) VALUES
(1, 'directie'),
(2, 'aankoop'),
(3, 'verkoop'),
(4, 'secretariaat');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `functie`
--

DROP TABLE IF EXISTS `functie`;
CREATE TABLE IF NOT EXISTS `functie` (
  `functie_id` int(11) NOT NULL AUTO_INCREMENT,
  `functie` varchar(225) NOT NULL,
  PRIMARY KEY (`functie_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `functie`
--

INSERT INTO `functie` (`functie_id`, `functie`) VALUES
(1, 'Algemeen directeur'),
(2, 'Directeur aankoop'),
(3, 'Directeur verkoop');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `personen`
--

DROP TABLE IF EXISTS `personen`;
CREATE TABLE IF NOT EXISTS `personen` (
  `persoon_id` int(10) NOT NULL AUTO_INCREMENT,
  `naam` varchar(255) NOT NULL,
  `voornaam` varchar(255) NOT NULL,
  `geslacht` int(1) NOT NULL,
  `taal_id` int(1) NOT NULL,
  `dienst_id` int(1) NOT NULL,
  `geboortedatum` date DEFAULT NULL,
  `jaarsalaris` decimal(10,0) NOT NULL,
  `vakantiegeld` decimal(10,0) NOT NULL,
  PRIMARY KEY (`persoon_id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `personen`
--

INSERT INTO `personen` (`persoon_id`, `naam`, `voornaam`, `geslacht`, `taal_id`, `dienst_id`, `geboortedatum`, `jaarsalaris`, `vakantiegeld`) VALUES
(1, 'Heyvaert', 'Peter', 1, 5, 3, NULL, '35000', '3300'),
(2, 'Vermeiren', 'Willy', 1, 3, 2, '1955-01-12', '18000', '1600'),
(3, 'Pasmans', 'Dirk', 1, 5, 1, '1960-03-15', '65000', '6300'),
(4, 'Pattoor', 'Wim', 1, 5, 3, '1980-11-24', '25000', '2300'),
(5, 'Kloentens', 'Marc', 1, 5, 4, NULL, '17000', '1500'),
(6, 'Nijsen', 'Corinne', 0, 5, 4, '1971-08-30', '27000', '2500'),
(7, 'Van Sanden', 'Staf', 0, 3, 3, '1940-10-26', '23000', '2100'),
(8, 'Van Puym', 'Petra', 0, 3, 3, '1981-03-17', '33000', '3100'),
(9, 'Piers', 'Tamara', 0, 5, 2, '1977-07-29', '29000', '2700'),
(10, 'Puyseleer', 'Raf', 1, 5, 3, NULL, '38000', '2600'),
(11, 'Van Brande', 'Ingrid', 0, 3, 3, '1960-12-05', '28000', '2600'),
(12, 'Rombaut', 'Jeroen', 1, 5, 1, '1963-01-09', '40000', '3800'),
(13, 'De Fleur', 'Thomas', 1, 1, 2, NULL, '37000', '3500'),
(14, 'Dierxcens', 'Jacques', 1, 3, 2, '1985-03-12', '26000', '2400'),
(15, 'Van Goethem', 'Eric', 1, 5, 3, '1966-01-02', '22000', '2000'),
(16, 'Huyghen', 'Raf', 1, 5, 3, '1973-04-28', '35000', '3200'),
(17, 'Stoffelen', 'Jozef', 1, 5, 2, '1968-04-11', '22000', '2000'),
(18, 'Moonen', 'Staf', 1, 3, 2, NULL, '19000', '1700'),
(19, 'Ysebaert', 'Sabine', 0, 5, 3, '1977-08-09', '36000', '3400'),
(20, 'Michielsen', 'Veerle', 0, 3, 3, '1948-12-25', '22000', '2000'),
(21, 'Verpooten', 'Marleen', 0, 5, 3, '1969-12-22', '23000', '2100'),
(22, 'Machtels', 'Marc', 1, 5, 3, NULL, '29000', '2700'),
(23, 'Michiels', 'Hilde', 0, 3, 1, '1985-12-01', '36000', '3400');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `personenbedrijf`
--

DROP TABLE IF EXISTS `personenbedrijf`;
CREATE TABLE IF NOT EXISTS `personenbedrijf` (
  `persoon_id` int(11) NOT NULL AUTO_INCREMENT,
  `naam` varchar(225) NOT NULL,
  `voornaam` varchar(255) NOT NULL,
  `geslacht` int(11) NOT NULL,
  `taal_id` int(11) NOT NULL,
  `dienst_id` int(11) NOT NULL,
  `geboortedatum` date DEFAULT NULL,
  `jaarsalaris` int(11) NOT NULL,
  `vakantiegeld` int(11) NOT NULL,
  PRIMARY KEY (`persoon_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `personenbedrijf`
--

INSERT INTO `personenbedrijf` (`persoon_id`, `naam`, `voornaam`, `geslacht`, `taal_id`, `dienst_id`, `geboortedatum`, `jaarsalaris`, `vakantiegeld`) VALUES
(1, 'Versmissen', 'Petra', 0, 5, 3, '2019-02-01', 40000, 3800),
(2, 'Ulenberg', 'Oscar', 1, 3, 2, '1960-01-12', 22000, 2000),
(3, 'Brees', 'Walter', 1, 5, 1, '1972-03-22', 65000, 6300),
(4, 'Kotrees', 'Inge', 0, 5, 3, '1985-12-05', 38000, 3600),
(5, 'Nijskens', 'Marc', 1, 5, 4, '2019-02-01', 18000, 1600),
(6, 'Cluwers', 'Sandra', 0, 5, 4, '1969-02-01', 30000, 2800),
(7, 'Kiekens', 'Staf', 1, 3, 3, '1941-12-30', 28000, 2600),
(8, 'Prukkis', 'Nico', 1, 3, 3, '1985-08-22', 31000, 2900);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `talen`
--

DROP TABLE IF EXISTS `talen`;
CREATE TABLE IF NOT EXISTS `talen` (
  `taal_id` int(11) NOT NULL AUTO_INCREMENT,
  `taal_code` varchar(2) NOT NULL,
  `taal` varchar(30) NOT NULL,
  PRIMARY KEY (`taal_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `talen`
--

INSERT INTO `talen` (`taal_id`, `taal_code`, `taal`) VALUES
(1, 'D', 'Duits'),
(2, 'E', 'Engels'),
(3, 'F', 'Frans'),
(4, 'I', 'Italiaans'),
(5, 'N', 'Nederlands'),
(6, 'S', 'Spaans'),
(7, 'Z', 'Zweeds');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
