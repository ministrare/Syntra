-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Gegenereerd op: 10 mei 2019 om 17:07
-- Serverversie: 5.7.21
-- PHP-versie: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `oefeningen`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `locatie`
--

DROP TABLE IF EXISTS `locatie`;
CREATE TABLE IF NOT EXISTS `locatie` (
  `locatie_id` int(11) NOT NULL AUTO_INCREMENT,
  `locatie_naam` varchar(255) NOT NULL,
  PRIMARY KEY (`locatie_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `locatie`
--

INSERT INTO `locatie` (`locatie_id`, `locatie_naam`) VALUES
(1, 'magazijn 1'),
(2, 'container 1'),
(3, 'magazijn 2'),
(4, 'container 2'),
(5, 'opslag hardware'),
(6, 'opslag software'),
(7, 'opslag netwerk'),
(8, 'container 3'),
(9, 'magazijn 3'),
(10, 'opslag allerlei'),
(11, 'opslag tijdelijk'),
(12, 'container 4'),
(13, 'magazijn 4'),
(14, 'kantoor'),
(15, 'magazijn 5');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `oorsprong`
--

DROP TABLE IF EXISTS `oorsprong`;
CREATE TABLE IF NOT EXISTS `oorsprong` (
  `oorsprong_id` int(11) NOT NULL AUTO_INCREMENT,
  `oorsprong_naam` varchar(255) NOT NULL,
  PRIMARY KEY (`oorsprong_id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `oorsprong`
--

INSERT INTO `oorsprong` (`oorsprong_id`, `oorsprong_naam`) VALUES
(1, 'onis'),
(2, 'abcpc'),
(3, 'systems'),
(4, 'coons'),
(5, 'compac'),
(6, 'imz'),
(7, 'telcompu'),
(8, 'unizi'),
(9, 'siempin'),
(10, 'tobi'),
(11, 'micropc'),
(12, 'hazert'),
(13, 'cajo'),
(14, 'millie'),
(15, 'filps'),
(16, 'somy'),
(17, 'viewmicro'),
(18, 'nerte'),
(19, 'netpc'),
(20, 'treza'),
(21, 'xiop'),
(22, 'oli');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `persoon`
--

DROP TABLE IF EXISTS `persoon`;
CREATE TABLE IF NOT EXISTS `persoon` (
  `persoon_id` int(11) NOT NULL AUTO_INCREMENT,
  `persoon_taal` varchar(1) NOT NULL,
  `persoon_geslacht` int(1) NOT NULL,
  `persoon_naam` varchar(255) NOT NULL,
  `persoon_voornaam` varchar(255) NOT NULL,
  PRIMARY KEY (`persoon_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `persoon`
--

INSERT INTO `persoon` (`persoon_id`, `persoon_taal`, `persoon_geslacht`, `persoon_naam`, `persoon_voornaam`) VALUES
(1, 'N', 1, 'janssens', 'piet'),
(2, 'N', 1, 'peeters', 'marc'),
(3, 'N', 2, 'verlinden', 'mieke'),
(4, 'F', 1, 'dujardin', 'patrick'),
(5, 'N', 2, 'jans', 'nico'),
(6, 'F', 2, 'delvaux', 'christina'),
(7, 'F', 2, 'lambeau', 'jose'),
(8, 'N', 1, 'winnen', 'dirk'),
(9, 'N', 1, 'persoons', 'felix'),
(10, 'N', 1, 'desmedt', 'jan'),
(11, 'N', 1, 'bellemans', 'hugo'),
(12, 'F', 2, 'lamberti', 'nicole'),
(13, 'N', 2, 'vanwalle', 'petra'),
(14, 'N', 1, 'moons', 'tony'),
(15, 'N', 1, 'ysbert', 'victor'),
(16, 'F', 1, 'morreaux', 'xavier'),
(17, 'F', 1, 'dubois', 'henry'),
(18, 'N', 1, 'mertens', 'andy'),
(19, 'N', 1, 'deridder', 'bart'),
(20, 'N', 1, 'moonen', 'peter');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_code` varchar(4) NOT NULL,
  `product_nr` int(11) NOT NULL,
  `locatie_nr` int(11) DEFAULT NULL,
  `oorsprong_nr` int(11) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `product`
--

INSERT INTO `product` (`product_id`, `product_code`, `product_nr`, `locatie_nr`, `oorsprong_nr`) VALUES
(1, 'HA', 33, NULL, 2),
(2, 'HA', 1, 1, 1),
(3, 'SO', 2, 15, NULL),
(4, 'HA', 1, 2, 2),
(5, 'HA', 3, 14, NULL),
(6, 'HA', 2, NULL, 5),
(7, 'SO', 3, NULL, 6),
(8, 'HA', 4, 2, 8),
(9, 'SO', 1, 13, 8),
(10, 'NE', 2, 7, 2),
(11, 'SO', 3, 10, 8),
(12, 'SO', 4, 4, 4),
(13, 'HA', 5, 10, 1),
(14, 'SO', 4, NULL, NULL),
(15, 'HA', 6, 6, 4),
(16, 'NE', 7, 7, 15),
(17, 'HA', 8, 4, 4),
(18, 'HA', 9, 4, 15),
(19, 'SO', 13, 5, 20),
(20, 'HA', 14, NULL, 8),
(21, 'HA', 5, 7, 15),
(22, 'SO', 6, 1, 5),
(23, 'NE', 7, 2, NULL),
(24, 'HA', 1, 2, 5),
(25, 'SO', 2, NULL, NULL),
(26, 'SO', 2, NULL, 6),
(27, 'NE', 33, 2, 8),
(28, 'HA', 33, 2, 15),
(29, 'HA', 33, 2, 20),
(30, 'HA', 33, 1, 20),
(31, 'NE', 33, NULL, NULL),
(32, 'SO', 14, 3, 15);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
