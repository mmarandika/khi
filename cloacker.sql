-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 15, 2023 at 06:31 PM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cloacker`
--

-- --------------------------------------------------------

--
-- Table structure for table `captions`
--

CREATE TABLE `captions` (
  `id` int(11) NOT NULL,
  `caption` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `domain_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(10) NOT NULL,
  `modified_at` int(11) NOT NULL,
  `account` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `comment` text CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cryptokeys`
--

CREATE TABLE `cryptokeys` (
  `id` int(11) NOT NULL,
  `domain_id` int(11) NOT NULL,
  `flags` int(11) NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `content` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dailystats`
--

CREATE TABLE `dailystats` (
  `id` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `date_utc` date NOT NULL,
  `owner` varchar(32) NOT NULL,
  `total_hit` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `domainmetadata`
--

CREATE TABLE `domainmetadata` (
  `id` int(11) NOT NULL,
  `domain_id` int(11) NOT NULL,
  `kind` varchar(32) DEFAULT NULL,
  `content` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `domains`
--

CREATE TABLE `domains` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `master` varchar(128) DEFAULT NULL,
  `last_check` int(11) DEFAULT NULL,
  `type` varchar(6) NOT NULL,
  `notified_serial` int(10) UNSIGNED DEFAULT NULL,
  `account` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `special` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `domains`
--

INSERT INTO `domains` (`id`, `name`, `master`, `last_check`, `type`, `notified_serial`, `account`, `special`) VALUES
(7, 'asdaf.co', NULL, NULL, 'NATIVE', NULL, 'admin', '0'),
(8, 'ghakdsa.co', NULL, NULL, 'NATIVE', NULL, 'demotes', '0'),
(12, 'domain.com', NULL, NULL, 'NATIVE', NULL, 'admin', '0'),
(13, 'domain.co', NULL, NULL, 'NATIVE', NULL, 'admin', '0'),
(14, 'domain.ca', NULL, NULL, 'NATIVE', NULL, 'admin', '0'),
(15, 'ajhdska.com', NULL, NULL, 'NATIVE', NULL, 'admin', '1'),
(16, 'jadskajda.com', NULL, NULL, 'NATIVE', NULL, 'admin', '1'),
(17, 'jahdsjada.com', NULL, NULL, 'NATIVE', NULL, 'admin', '1');

-- --------------------------------------------------------

--
-- Table structure for table `gen_link`
--

CREATE TABLE `gen_link` (
  `id` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `type` varchar(12) NOT NULL,
  `sub` varchar(12) NOT NULL,
  `domain` varchar(32) NOT NULL,
  `hash` varchar(64) NOT NULL,
  `full_domain` varchar(255) NOT NULL,
  `forward_url` text NOT NULL,
  `fake_url` text NOT NULL,
  `custom_title` text NOT NULL,
  `custom_description` text NOT NULL,
  `custom_keywords` text NOT NULL,
  `custom_image` text NOT NULL,
  `country` varchar(128) NOT NULL,
  `app_id` varchar(64) NOT NULL,
  `username` varchar(32) NOT NULL,
  `country_block` varchar(128) DEFAULT NULL,
  `use_landing` enum('off','on') NOT NULL,
  `forward_web` varchar(128) NOT NULL,
  `forward_wap` varchar(128) NOT NULL,
  `team` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gen_link`
--

INSERT INTO `gen_link` (`id`, `date`, `type`, `sub`, `domain`, `hash`, `full_domain`, `forward_url`, `fake_url`, `custom_title`, `custom_description`, `custom_keywords`, `custom_image`, `country`, `app_id`, `username`, `country_block`, `use_landing`, `forward_web`, `forward_wap`, `team`) VALUES
(1, '0000-00-00', 'basic', '3653', 'asdaf.co', '18', '3653.asdaf.co', '{&quot;ALL&quot;:&quot;http://localhost/cloacker2/index.php&quot;}', '', '', '', '', '', '', '', 'admin', '', 'off', '', '', ''),
(2, '0000-00-00', 'basic', 'd8ca48', 'asdaf.co', '61d8', 'd8ca48.asdaf.co', '{&quot;ALL&quot;:&quot;http://localhost/cloacker2/index.php&quot;,&quot;BD&quot;:&quot;http://localhost/cloacker2/index.php&quot;}', '', '', '', '', '', '', '', 'admin', '', 'off', '', '', ''),
(3, '0000-00-00', 'basic', '0da6cc3', 'asdaf.co', '6690', '0da6cc3.asdaf.co', '{&quot;ALL&quot;:&quot;http://localhost/cloacker2/index.php&quot;}', '', '', '', '', '', '', '', 'admin', '', 'off', '', '', ''),
(4, '0000-00-00', 'basic', 'b6c41d', 'asdaf.co', '3b', 'b6c41d.asdaf.co', '{&quot;ALL&quot;:&quot;http://localhost/cloacker2/index.php&quot;}', '', '', '', '', '', '', '', 'admin', '', 'off', '{}', '{}', ''),
(5, '0000-00-00', 'basic', '837cbd5', 'asdaf.co', '27b', '837cbd5.asdaf.co', '{&quot;ALL&quot;:&quot;http://localhost/cloacker2/index.php&quot;}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:&quot;http://localhost/cloacker2/index.php&quot;}', '{&quot;ALL&quot;:&quot;http://localhost/cloacker2/index.php&quot;}', ''),
(6, '0000-00-00', 'basic', 'ddce18c', 'asdaf.co', '11', 'ddce18c.asdaf.co', '{&quot;ALL&quot;:&quot;https://www.facebook.com/&quot;}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:&quot;&quot;}', '{&quot;ALL&quot;:&quot;&quot;}', ''),
(7, '0000-00-00', 'basic', 'a8130f', 'asdaf.co', 'e3a8', 'a8130f.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;,&quot;https://www.detik.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', 'TeamOne'),
(8, '0000-00-00', 'basic', '625ea6', 'asdaf.co', '11', '625ea6.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;,&quot;https://www.detik.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', 'TeamOne'),
(9, '0000-00-00', 'basic', '54185', 'asdaf.co', '4541', '54185.asdaf.co', '{&quot;ALL&quot;:&quot;{\\\\&quot;ALL\\\\&quot;:[\\\\&quot;https:\\\\\\\\/\\\\\\\\/www.facebook.com\\\\\\\\/\\\\&quot;,\\\\&quot;https:\\\\\\\\/\\\\\\\\/www.detik.com\\\\\\\\/\\\\&quot;]}&quot;}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:&quot;&quot;}', '{&quot;ALL&quot;:&quot;&quot;}', ''),
(10, '0000-00-00', 'basic', 'da422', 'asdaf.co', '7da4', 'da422.asdaf.co', '{&quot;ALL&quot;:[&quot;{\\\\&quot;ALL\\\\&quot;:[\\\\&quot;https:\\\\\\\\/\\\\\\\\/www.facebook.com\\\\\\\\/\\\\&quot;,\\\\&quot;https:\\\\\\\\/\\\\\\\\/www.detik.com\\\\\\\\/\\\\&quot;]}&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(11, '0000-00-00', 'basic', 'e6c505', 'asdaf.co', '6c50598', 'e6c505.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(12, '0000-00-00', 'basic', '1ecade1', 'asdaf.co', '1471', '1ecade1.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(13, '0000-00-00', 'basic', 'dd1eed9', 'asdaf.co', 'bdd1ee', 'dd1eed9.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(14, '0000-00-00', 'basic', 'da16aeb', 'asdaf.co', 'da16aeb', 'da16aeb.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(15, '0000-00-00', 'basic', 'ac35', 'asdaf.co', '5be1eeb', 'ac35.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(16, '0000-00-00', 'basic', '144149', 'asdaf.co', '21441', '144149.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(17, '0000-00-00', 'basic', '4bb', 'asdaf.co', 'abf830a', '4bb.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(18, '0000-00-00', 'basic', '4fbf', 'asdaf.co', 'bf2ba3', '4fbf.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(19, '0000-00-00', 'basic', '505', 'asdaf.co', '973c499', '505.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(20, '0000-00-00', 'basic', '17a0063', 'asdaf.co', '17a0063', '17a0063.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(21, '0000-00-00', 'basic', 'b21', 'asdaf.co', '2114', 'b21.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(22, '0000-00-00', 'basic', 'b674', 'asdaf.co', '6741b', 'b674.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(23, '0000-00-00', 'basic', 'b5e28b9', 'asdaf.co', '8fb5e', 'b5e28b9.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(24, '0000-00-00', 'basic', 'bc62', 'asdaf.co', '62cded', 'bc62.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(25, '0000-00-00', 'basic', '053d', 'asdaf.co', 'd279d57', '053d.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(26, '0000-00-00', 'basic', '097efe4', 'asdaf.co', '3a20', '097efe4.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(27, '0000-00-00', 'basic', '85c22', 'asdaf.co', 'b85c', '85c22.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(28, '0000-00-00', 'basic', '5602d', 'asdaf.co', '02d5a43', '5602d.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(29, '0000-00-00', 'basic', 'e7374e4', 'asdaf.co', 'b5ee', 'e7374e4.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(30, '0000-00-00', 'basic', '9c6', 'asdaf.co', 'c614', '9c6.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(31, '0000-00-00', 'basic', '4d5ec9', 'asdaf.co', 'd5ec9c5', '4d5ec9.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(32, '0000-00-00', 'basic', '9d77044', 'asdaf.co', '9d77044', '9d77044.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(33, '0000-00-00', 'basic', '8d5', 'asdaf.co', '5d789', '8d5.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(34, '0000-00-00', 'basic', '9f2f9', 'asdaf.co', '89f2', '9f2f9.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(35, '0000-00-00', 'basic', '4d017', 'asdaf.co', 'd01785', '4d017.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(36, '0000-00-00', 'basic', '0b39', 'asdaf.co', 'b3910', '0b39.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(37, '0000-00-00', 'basic', '04c2d1d', 'asdaf.co', '3104c', '04c2d1d.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(38, '0000-00-00', 'basic', '8237ab3', 'asdaf.co', 'b108', '8237ab3.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(39, '0000-00-00', 'basic', '62f28', 'asdaf.co', '62f28', '62f28.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(40, '0000-00-00', 'basic', '84a5', 'asdaf.co', 'a5dacb', '84a5.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(41, '0000-00-00', 'basic', '5a0989', 'asdaf.co', '5a0989', '5a0989.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(42, '0000-00-00', 'basic', 'fdd972b', 'asdaf.co', 'fdd972b', 'fdd972b.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(43, '0000-00-00', 'basic', 'eba', 'asdaf.co', '22d1e60', 'eba.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(44, '0000-00-00', 'basic', '26b3', 'asdaf.co', '32b6ea1', '26b3.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(45, '0000-00-00', 'basic', '6be4', 'asdaf.co', '6be4', '6be4.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(46, '0000-00-00', 'basic', '84e', 'asdaf.co', 'e090b', '84e.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(47, '0000-00-00', 'basic', '621d', 'asdaf.co', '21d3b', '621d.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(48, '0000-00-00', 'basic', 'd2b', 'asdaf.co', 'bf140', 'd2b.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(49, '0000-00-00', 'basic', 'b3c07d', 'asdaf.co', 'c6b3', 'b3c07d.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(50, '0000-00-00', 'basic', '785', 'asdaf.co', '9b907a', '785.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(51, '0000-00-00', 'basic', '4242', 'asdaf.co', '24237', '4242.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(52, '0000-00-00', 'basic', '30bc467', 'asdaf.co', '530bc4', '30bc467.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(53, '0000-00-00', 'basic', '105b702', 'asdaf.co', 'c3c1', '105b702.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(54, '0000-00-00', 'basic', '55489', 'asdaf.co', '548934', '55489.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(55, '0000-00-00', 'basic', '4604a9', 'asdaf.co', '4604a9', '4604a9.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(56, '0000-00-00', 'basic', '2da0d8', 'asdaf.co', '4e2d', '2da0d8.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(57, '0000-00-00', 'basic', 'be79f4', 'asdaf.co', 'e79f426', 'be79f4.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(58, '0000-00-00', 'basic', 'e7ddd96', 'asdaf.co', 'e7ddd96', 'e7ddd96.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(59, '0000-00-00', 'basic', '9f2', 'asdaf.co', '3a0eb0a', '9f2.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(60, '0000-00-00', 'basic', 'd9cdfb', 'asdaf.co', '8d9cd', 'd9cdfb.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(61, '0000-00-00', 'basic', '9866c', 'asdaf.co', '5986', '9866c.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(62, '0000-00-00', 'basic', 'a10d516', 'asdaf.co', 'efca', 'a10d516.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', 'ONEX'),
(63, '0000-00-00', 'basic', '35d9e7c', 'asdaf.co', '6835d', '35d9e7c.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', 'ONEX'),
(64, '0000-00-00', 'basic', '8906', 'asdaf.co', '8906', '8906.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', 'ONEX'),
(65, '0000-00-00', 'basic', '2b5c', 'asdaf.co', '2b5c', '2b5c.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', 'ONEX'),
(66, '0000-00-00', 'basic', '6843f', 'asdaf.co', 'e684', '6843f.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', 'ONEX'),
(67, '0000-00-00', 'basic', '914f', 'asdaf.co', '4f959f', '914f.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', 'ONEX'),
(68, '0000-00-00', 'basic', '82f', 'asdaf.co', 'fdb7b', '82f.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(69, '0000-00-00', 'basic', 'c32a2b9', 'asdaf.co', 'c32a2b9', 'c32a2b9.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(70, '0000-00-00', 'basic', '168d97', 'asdaf.co', '168d97', '168d97.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(71, '0000-00-00', 'basic', 'eef', 'asdaf.co', 'efa4', 'eef.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(72, '0000-00-00', 'basic', '6a182', 'asdaf.co', '46a1', '6a182.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(73, '0000-00-00', 'basic', '2a3a33c', 'asdaf.co', '62a3a3', '2a3a33c.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(74, '0000-00-00', 'basic', '33b31', 'asdaf.co', 'b310ef3', '33b31.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(75, '0000-00-00', 'basic', '7b2', 'asdaf.co', '8e84002', '7b2.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(76, '0000-00-00', 'basic', '3b8a01b', 'asdaf.co', '79d3', '3b8a01b.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(77, '0000-00-00', 'basic', 'f50f', 'asdaf.co', '50ffd', 'f50f.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(78, '0000-00-00', 'basic', '61f', 'asdaf.co', '1f76', '61f.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(79, '0000-00-00', 'basic', '50f', 'asdaf.co', '0f26', '50f.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(80, '0000-00-00', 'fakeurl', '9c62a', 'asdaf.co', '62afc2f', '9c62a.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', 'https://porkbun.com/', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(81, '0000-00-00', 'basic', '899c', 'asdaf.co', '9ced4e', '899c.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(82, '0000-00-00', 'fakeurl', 'a1fb', 'asdaf.co', 'fbea07', 'a1fb.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', 'https://porkbun.com/', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(83, '0000-00-00', 'fakeurl', 'c3a19', 'asdaf.co', '0c3a', 'c3a19.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', 'https://porkbun.com/', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(84, '0000-00-00', 'fakeurl', '5308acf', 'asdaf.co', '75308a', '5308acf.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', 'https://porkbun.com/', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(85, '0000-00-00', 'fakeurl', 'f5aa219', 'asdaf.co', 'f5aa219', 'f5aa219.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', 'https://porkbun.com/', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(86, '0000-00-00', 'basic', 'dac008', 'asdaf.co', '4dac0', 'dac008.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(87, '0000-00-00', 'fakeurl', 'c9a', 'asdaf.co', '9ad3', 'c9a.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', 'https://porkbun.com/', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(88, '0000-00-00', 'fakeurl', '4392838', 'asdaf.co', '4fb4', '4392838.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', 'https://www.pexels.com/photo/back-view-beach-bikini-blonde-hair-323244/', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(89, '0000-00-00', 'basic', '7aa30', 'asdaf.co', '7aa30', '7aa30.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(90, '0000-00-00', 'basic', '0bd3c', 'asdaf.co', '0bd3c', '0bd3c.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(91, '0000-00-00', 'basic', 'cc3', 'asdaf.co', '3be72', 'cc3.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(92, '0000-00-00', 'basic', 'c0b4bf', 'asdaf.co', 'cc0b4', 'c0b4bf.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(93, '0000-00-00', 'basic', '7a047e', 'asdaf.co', '287a', '7a047e.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(94, '0000-00-00', 'basic', 'fdf', 'asdaf.co', 'f8aa2', 'fdf.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(95, '0000-00-00', 'basic', '296c6a6', 'asdaf.co', 'f9f2', '296c6a6.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(96, '0000-00-00', 'basic', '53cc7', 'asdaf.co', '853c', '53cc7.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(97, '2021-05-19', 'basic', 'a3b', 'asdaf.co', '7461d5', 'a3b.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(98, '2021-05-19', 'basic', '11d', 'asdaf.co', 'd7d6f', '11d.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(99, '2021-05-19', 'basic', 'f92', 'asdaf.co', '2b5c0', 'f92.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(100, '2021-05-19', 'basic', 'f85d7e', 'asdaf.co', '73f8', 'f85d7e.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(101, '2021-05-19', 'basic', '7139', 'asdaf.co', '39e6f6', '7139.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(102, '2021-05-19', 'basic', 'cc4', 'asdaf.co', 'e1582b', 'cc4.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(103, '2021-05-19', 'basic', '95a6', 'asdaf.co', '95a6', '95a6.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(104, '2021-05-19', 'basic', '54e', 'asdaf.co', '84c707', '54e.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(105, '2021-05-19', 'basic', '86c62', 'asdaf.co', '286c', '86c62.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(106, '2021-05-19', 'basic', '76455', 'asdaf.co', '7764', '76455.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(107, '2021-05-19', 'basic', '4bd1f', 'asdaf.co', '4bd1f', '4bd1f.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(108, '2021-05-19', 'basic', '93f713', 'asdaf.co', '3893', '93f713.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(109, '2021-05-19', 'basic', '8189', 'asdaf.co', '8189', '8189.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(110, '2021-05-19', 'basic', '761', 'asdaf.co', '310086', '761.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(111, '2021-05-19', 'basic', '3ca8', 'asdaf.co', '3ca8', '3ca8.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(112, '2021-05-19', 'basic', '541ad72', 'asdaf.co', '541ad72', '541ad72.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(113, '2021-05-19', 'basic', 'b12566', 'asdaf.co', 'f4b1', 'b12566.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(114, '2021-05-19', 'basic', '28d2473', 'asdaf.co', 'a628d', '28d2473.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(115, '2021-05-19', 'basic', '949252', 'asdaf.co', '89492', '949252.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(116, '2021-05-19', 'basic', '575a5', 'asdaf.co', '9575', '575a5.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(117, '2021-05-19', 'basic', '808125', 'asdaf.co', '081254f', '808125.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(118, '2021-06-20', 'basic', '0121cb', 'asdaf.co', '121cb05', '0121cb.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(119, '2021-06-20', 'basic', '956', 'asdaf.co', 'b83237', '956.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(120, '2021-06-20', 'basic', '4fc77', 'asdaf.co', '4fc77', '4fc77.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(121, '2021-06-20', 'basic', '39b366', 'asdaf.co', 'c39b3', '39b366.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(122, '2021-06-20', 'basic', '9bef', 'asdaf.co', 'f97d63e', '9bef.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(123, '2021-06-20', 'basic', 'c60cb', 'asdaf.co', '60cbad', 'c60cb.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(124, '2021-06-20', 'basic', 'e7835', 'asdaf.co', '8355790', 'e7835.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(125, '2021-06-20', 'basic', '59e', 'asdaf.co', '37b3028', '59e.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(126, '2021-06-20', 'basic', '094503', 'asdaf.co', '945037d', '094503.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(127, '2021-06-20', 'basic', 'd34b2', 'asdaf.co', '4d34', 'd34b2.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(128, '2021-06-20', 'basic', 'b085', 'asdaf.co', '85aa63', 'b085.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(129, '2021-06-20', 'basic', 'bb5', 'asdaf.co', '906c859', 'bb5.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(130, '2021-06-21', 'basic', '5c7e', 'asdaf.co', '5c7e', '5c7e.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(131, '2021-06-21', 'basic', '3cf16bd', 'asdaf.co', 'b363', '3cf16bd.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(132, '2021-06-21', 'basic', '585b2', 'asdaf.co', 'e585', '585b2.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(133, '2021-06-21', 'basic', '9c4ce', 'asdaf.co', '4ceede5', '9c4ce.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(134, '2021-06-21', 'basic', 'd48', 'asdaf.co', '8aaec', 'd48.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(135, '2021-06-21', 'basic', '2d2d', 'asdaf.co', '2dfb86', '2d2d.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(136, '2021-06-21', 'basic', '4118b', 'asdaf.co', '4118b', '4118b.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(137, '2021-06-21', 'basic', '0975f5', 'asdaf.co', '2b09', '0975f5.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(138, '2021-06-21', 'basic', '4db0', 'asdaf.co', '092f89c', '4db0.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(139, '2021-06-21', 'basic', 'c49f0', 'asdaf.co', '1c49', 'c49f0.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(140, '2021-06-21', 'basic', '8eb36a7', 'asdaf.co', '158eb', '8eb36a7.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(141, '2021-06-21', 'basic', '867c16', 'asdaf.co', '9686', '867c16.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(142, '2021-06-21', 'basic', '5967', 'asdaf.co', '96799', '5967.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(143, '2021-06-21', 'basic', '0db', 'asdaf.co', 'dbd1', '0db.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(144, '2021-06-21', 'basic', '283', 'asdaf.co', '7817a78', '283.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(145, '2021-06-21', 'basic', 'b5c', 'asdaf.co', '2a5e969', 'b5c.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(146, '2021-06-21', 'basic', '35c', 'asdaf.co', '5c77', '35c.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(147, '2021-06-21', 'basic', 'dc0', 'asdaf.co', 'c053', 'dc0.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(148, '2021-06-21', 'fakeurl', '5e9', 'asdaf.co', 'e95c', '5e9.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', 'https://porkbun.com/', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(149, '2021-06-21', 'content', 'f8f4bd1', 'asdaf.co', '3f8f4b', 'f8f4bd1.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', 'Privacy Policy', 'zaada', 'wonk.pw', 'https://video.branch.io/13968030/15428182/fd8842df9dba1af4df948af64bada0ca/large/whatsgoodly-sms-content-sharing-and-deferred-deep-0-thumbnail.jpg', '', '87741124305', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(150, '2021-06-21', 'basic', 'b2faf', 'asdaf.co', 'fafb4fa', 'b2faf.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(151, '2021-06-21', 'basic', '161fc79', 'asdaf.co', 'f8d1', '161fc79.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(152, '2021-06-21', 'basic', 'db5', 'asdaf.co', 'b587', 'db5.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(153, '2021-06-21', 'basic', 'aa1', 'asdaf.co', 'adb38a3', 'aa1.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(154, '2021-06-21', 'basic', '79efda', 'asdaf.co', 'b79ef', '79efda.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(155, '2021-06-21', 'basic', '0f3bf8', 'asdaf.co', 'f3bf8e9', '0f3bf8.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(156, '2021-06-21', 'basic', '8059', 'asdaf.co', '8059', '8059.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(157, '2021-06-21', 'basic', 'd5f5c', 'asdaf.co', '5f5ce9', 'd5f5c.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(158, '2021-06-21', 'basic', 'e67d9', 'asdaf.co', 'e67d9', 'e67d9.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(159, '2021-06-21', 'basic', 'e0c1', 'asdaf.co', 'e0c1', 'e0c1.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(160, '2021-06-21', 'basic', 'fcf', 'asdaf.co', '5fc873', 'fcf.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(161, '2021-06-21', 'basic', 'e32', 'asdaf.co', '3241', 'e32.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(162, '2021-06-21', 'basic', 'a8d03a', 'asdaf.co', 'a8d03a', 'a8d03a.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(163, '2021-06-21', 'basic', 'e5f89', 'asdaf.co', '5f8903', 'e5f89.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(164, '2021-06-21', 'basic', 'a4eef8', 'asdaf.co', 'a4eef8', 'a4eef8.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(165, '2021-06-21', 'basic', 'e154', 'asdaf.co', '4ddb4c6', 'e154.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(166, '2021-06-21', 'basic', '13307f', 'asdaf.co', 'b1330', '13307f.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(167, '2021-06-21', 'basic', '4ee2', 'asdaf.co', 'e2c629', '4ee2.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(168, '2021-06-21', 'basic', 'f0f3361', 'asdaf.co', '3f0f33', 'f0f3361.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(169, '2021-06-21', 'basic', 'c553d71', 'asdaf.co', '8c553d', 'c553d71.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(170, '2021-06-21', 'basic', 'aee', 'asdaf.co', '3d5d23', 'aee.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(171, '2021-06-21', 'basic', '08c6', 'asdaf.co', '08c6', '08c6.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(172, '2021-06-21', 'basic', '6605525', 'asdaf.co', '966055', '6605525.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(173, '2021-06-21', 'basic', 'bd2', 'asdaf.co', 'd2c7', 'bd2.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(174, '2021-06-21', 'basic', '0d77', 'asdaf.co', 'd777f', '0d77.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(175, '2021-06-21', 'basic', 'ed9', 'asdaf.co', 'ebb2074', 'ed9.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(176, '2021-06-21', 'basic', '0e697f', 'asdaf.co', 'e697f2f', '0e697f.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(177, '2021-06-21', 'basic', '77ba', 'asdaf.co', '7ba01', '77ba.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(178, '2021-06-21', 'basic', '258', 'asdaf.co', 'a9a8b2f', '258.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(179, '2021-06-21', 'basic', '5a60', 'asdaf.co', '5a60', '5a60.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(180, '2021-06-21', 'basic', 'bcdd1', 'asdaf.co', 'bcdd1', 'bcdd1.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(181, '2021-06-21', 'basic', 'd3a72', 'asdaf.co', '9d3a', 'd3a72.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(182, '2021-06-21', 'basic', '5b11278', 'asdaf.co', '3a5b1', '5b11278.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(183, '2021-06-21', 'basic', '0705d', 'asdaf.co', '0705d', '0705d.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(184, '2021-06-21', 'basic', 'ee25', 'asdaf.co', '258ecd', 'ee25.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(185, '2021-06-21', 'basic', '28c', 'asdaf.co', '8c3a', '28c.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(186, '2021-06-21', 'basic', '5264e', 'asdaf.co', 'b526', '5264e.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(187, '2021-06-21', 'basic', 'ac9ce40', 'asdaf.co', '624a', 'ac9ce40.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(188, '2021-06-21', 'basic', '65e0', 'asdaf.co', '5e09a', '65e0.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', '');
INSERT INTO `gen_link` (`id`, `date`, `type`, `sub`, `domain`, `hash`, `full_domain`, `forward_url`, `fake_url`, `custom_title`, `custom_description`, `custom_keywords`, `custom_image`, `country`, `app_id`, `username`, `country_block`, `use_landing`, `forward_web`, `forward_wap`, `team`) VALUES
(189, '2021-06-21', 'basic', '989d', 'asdaf.co', '89d0f', '989d.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(190, '2021-06-21', 'basic', '44659', 'asdaf.co', '44659', '44659.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(191, '2021-06-21', 'basic', 'eeaed0', 'asdaf.co', 'eeaed0', 'eeaed0.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(192, '2021-06-21', 'basic', '465d4', 'asdaf.co', '65d44c', '465d4.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(193, '2021-06-21', 'basic', 'f30a0', 'asdaf.co', '30a0ff', 'f30a0.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(194, '2021-06-21', 'basic', '00cfd0e', 'asdaf.co', '6600c', '00cfd0e.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(195, '2021-06-21', 'basic', '6bf', 'asdaf.co', 'b9133c', '6bf.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(196, '2021-06-21', 'basic', '1794e71', 'asdaf.co', '71794e', '1794e71.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(197, '2021-06-21', 'basic', 'd1678', 'asdaf.co', '167860', 'd1678.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(198, '2021-06-21', 'basic', 'b4e', 'asdaf.co', '4e4b', 'b4e.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(199, '2021-06-21', 'basic', 'e1a', 'asdaf.co', '6fe06d', 'e1a.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(200, '2021-06-21', 'basic', '10476a5', 'asdaf.co', '99104', '10476a5.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(201, '2021-06-21', 'basic', '167', 'asdaf.co', '707f1', '167.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(202, '2021-06-21', 'basic', '910476', 'asdaf.co', '10476a5', '910476.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(203, '2021-06-21', 'basic', '67b', 'asdaf.co', '1ec73a1', '67b.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(204, '2021-06-21', 'basic', '1408e03', 'asdaf.co', 'c9140', '1408e03.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(205, '2021-06-21', 'basic', '8c62b3e', 'asdaf.co', '58c62b', '8c62b3e.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(206, '2021-06-21', 'basic', '07c', 'asdaf.co', '23bcfb6', '07c.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(207, '2021-06-21', 'basic', '7394', 'asdaf.co', '468ccf1', '7394.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(208, '2021-06-21', 'basic', '0d52f', 'asdaf.co', '40d5', '0d52f.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(209, '2021-06-21', 'basic', 'f8599e', 'asdaf.co', 'd6f8', 'f8599e.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(210, '2021-06-21', 'basic', '2e3c0', 'asdaf.co', 'e3c01d', '2e3c0.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(211, '2021-06-21', 'basic', '54ab5f', 'asdaf.co', '4ab5f76', '54ab5f.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(212, '2021-06-21', 'basic', '85f', 'asdaf.co', '5f7de65', '85f.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(213, '2021-06-21', 'basic', 'e65e', 'asdaf.co', 'e65e', 'e65e.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(214, '2021-06-21', 'basic', '7a727d', 'asdaf.co', '917a', '7a727d.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(215, '2021-06-21', 'basic', '8b8b', 'asdaf.co', '8b8b', '8b8b.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(216, '2021-06-21', 'basic', '2610d8', 'asdaf.co', '2610d8', '2610d8.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(217, '2021-06-21', 'basic', '6eb9a', 'asdaf.co', 'eb9a68', '6eb9a.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(218, '2021-06-21', 'basic', '0548d2', 'asdaf.co', '548d2b4', '0548d2.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(219, '2021-06-21', 'basic', '80c', 'asdaf.co', '0c1b', '80c.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(220, '2021-06-21', 'basic', 'a400', 'asdaf.co', 'a400', 'a400.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(221, '2021-06-21', 'basic', '77a627', 'asdaf.co', '7a62708', '77a627.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(222, '2021-06-21', 'basic', '34a0cd', 'asdaf.co', '34a0cd', '34a0cd.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(223, '2021-06-21', 'basic', 'a00145', 'asdaf.co', '0014562', 'a00145.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(224, '2021-06-21', 'basic', '8b8a4', 'asdaf.co', '8b8a4', '8b8a4.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(225, '2021-06-21', 'basic', 'ef7561', 'asdaf.co', 'f756190', 'ef7561.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(226, '2021-06-21', 'basic', 'b0b9e', 'asdaf.co', 'b0b9e', 'b0b9e.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(227, '2021-06-21', 'basic', '5bd7', 'asdaf.co', 'bd7f6', '5bd7.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(228, '2021-06-21', 'basic', '784f', 'asdaf.co', '784f', '784f.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(229, '2021-06-21', 'basic', 'a377a', 'asdaf.co', '377aa4', 'a377a.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(230, '2021-06-21', 'basic', '208e104', 'asdaf.co', 'b208e1', '208e104.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(231, '2021-06-21', 'basic', '4bdd', 'asdaf.co', 'd969981', '4bdd.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(232, '2021-06-21', 'basic', '7c95280', 'asdaf.co', '7c95280', '7c95280.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(233, '2021-06-21', 'basic', '0cb06c', 'asdaf.co', 'cb06cad', '0cb06c.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(234, '2021-06-21', 'basic', 'de975fa', 'asdaf.co', '42bd', 'de975fa.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(235, '2021-06-21', 'basic', 'd1ef5', 'asdaf.co', 'ef5e292', 'd1ef5.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(236, '2021-06-21', 'basic', 'c67409', 'asdaf.co', 'c67409', 'c67409.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(237, '2021-06-21', 'basic', 'e06', 'asdaf.co', '511c05e', 'e06.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(238, '2021-06-21', 'basic', '2dc68c', 'asdaf.co', '02dc6', '2dc68c.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(239, '2021-06-21', 'basic', 'e73999', 'asdaf.co', '739999d', 'e73999.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(240, '2021-06-21', 'basic', '1fb5e10', 'asdaf.co', 'e3e1', '1fb5e10.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(241, '2021-06-21', 'basic', 'b56', 'asdaf.co', '4477576', 'b56.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(242, '2021-06-21', 'basic', '9772', 'asdaf.co', '772ae', '9772.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(243, '2021-06-21', 'basic', 'e528', 'asdaf.co', '286140', 'e528.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(244, '2021-06-21', 'basic', '5219', 'asdaf.co', '99411e8', '5219.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(245, '2021-06-21', 'basic', '3bc12', 'asdaf.co', '3bc12', '3bc12.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(246, '2021-06-21', 'basic', '9966e', 'asdaf.co', '966e18', '9966e.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(247, '2021-06-21', 'basic', 'f518', 'asdaf.co', '18f144', 'f518.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(248, '2021-06-21', 'basic', 'b5c03', 'asdaf.co', '5c030c', 'b5c03.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(249, '2021-06-21', 'basic', '7911', 'asdaf.co', '1717108', '7911.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(250, '2021-06-21', 'basic', '2198', 'asdaf.co', '1989b', '2198.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(251, '2021-06-21', 'basic', '3b71', 'asdaf.co', '11a59b7', '3b71.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(252, '2021-06-21', 'basic', 'f87', 'asdaf.co', '71e9e', 'f87.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(253, '2021-06-21', 'basic', '0a35', 'asdaf.co', '5b5b578', '0a35.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(254, '2021-06-21', 'basic', 'ae178', 'asdaf.co', 'ae178', 'ae178.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(255, '2021-06-21', 'basic', '54b1f0', 'asdaf.co', '3854', '54b1f0.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(256, '2021-06-21', 'basic', 'b1db7', 'asdaf.co', 'db7c952', 'b1db7.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(257, '2021-06-21', 'basic', '30d67', 'asdaf.co', '30d67', '30d67.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(258, '2021-06-21', 'basic', '6f5', 'asdaf.co', '08d171', '6f5.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(259, '2021-06-21', 'basic', 'fa8a5', 'asdaf.co', '8a5a1d0', 'fa8a5.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(260, '2021-06-21', 'basic', '982', 'asdaf.co', 'cdaa2d', '982.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(261, '2021-06-21', 'basic', '5cde5', 'asdaf.co', '05cd', '5cde5.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(262, '2021-06-21', 'basic', 'dc0c', 'asdaf.co', 'dc0c', 'dc0c.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(263, '2021-06-21', 'basic', '85f2', 'asdaf.co', '5f2c8', '85f2.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(264, '2021-06-22', 'basic', 'c65ecfe3d', 'asdaf.co', '65ecfe3d08', 'c65ecfe3d.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(265, '2021-06-22', 'basic', '1de42268', 'asdaf.co', '81de422', '1de42268.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(266, '2021-06-22', 'basic', 'e21939451', 'asdaf.co', '741852cc17cea5ee95', 'e21939451.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(267, '2021-06-22', 'basic', 'e0b4542', 'asdaf.co', '1e0b45', 'e0b4542.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(268, '2021-06-22', 'basic', '6d0cfd1317', 'asdaf.co', 'd0cfd13178d', '6d0cfd1317.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(269, '2021-06-22', 'basic', 'defe3d', 'asdaf.co', '1d0314b4a41d3d1889b', 'defe3d.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(270, '2021-06-23', 'basic', 'd892ce803', 'asdaf.co', 'ce8032bda55f2', 'd892ce803.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(271, '2021-06-23', 'basic', 'cd0fd05', 'asdaf.co', '53f8e6d6842a3b4', 'cd0fd05.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(272, '2021-06-23', 'basic', '2b829b4ca', 'asdaf.co', '1a0197203eb2349a68', '2b829b4ca.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(273, '2021-06-23', 'basic', 'f56061', 'asdaf.co', '3fa8e99d07d5e', 'f56061.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(274, '2021-06-23', 'basic', 'be9d86', 'asdaf.co', '7113a621c339972b983', 'be9d86.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(275, '2021-06-23', 'basic', '640a055d8e', 'asdaf.co', '55d8e347c407988', '640a055d8e.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(276, '2021-06-23', 'basic', '5eeb0cb33', 'asdaf.co', '330d7e26793417cd', '5eeb0cb33.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(277, '2021-08-18', 'basic', '8848fd51a7', 'asdaf.co', 'a785d4ccabfa26fbcb', '8848fd51a7.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(278, '2021-08-28', 'basic', '16bede6628', 'asdaf.co', '2de816', '16bede6628.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(279, '2021-08-28', 'basic', '7e230e3', 'asdaf.co', '7e230e3', '7e230e3.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(280, '2021-08-28', 'basic', 'bd63968', 'asdaf.co', '9d4c689392f5010c', 'bd63968.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(281, '2021-08-28', 'basic', 'a6a991b8', 'asdaf.co', '51f5e6c846df5d179', 'a6a991b8.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(282, '2021-08-28', 'basic', 'a8399ac9', 'asdaf.co', 'c9c8db91a56ccd', 'a8399ac9.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(283, '2021-08-28', 'basic', '1aa439c57', 'asdaf.co', 'b91aa43', '1aa439c57.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(284, '2021-08-28', 'basic', 'f3598c2c8d', 'asdaf.co', 'ef3598c2c', 'f3598c2c8d.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(285, '2021-08-28', 'basic', '5a984191', 'asdaf.co', '8419199f4f9', '5a984191.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(286, '2021-08-28', 'basic', '8878612', 'asdaf.co', '87861293', '8878612.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(287, '2021-08-28', 'basic', '04f9bb89e', 'asdaf.co', '2404f9b', '04f9bb89e.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(288, '2021-08-28', 'basic', '88e650d3', 'asdaf.co', '650d3f86273', '88e650d3.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(289, '2021-08-28', 'basic', 'cf1cb7', 'asdaf.co', 'b738302de0', 'cf1cb7.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(290, '2021-08-28', 'basic', '1adf99a', 'asdaf.co', '144935f9db366247f4d5', '1adf99a.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(291, '2021-08-28', 'basic', 'e5700c6', 'asdaf.co', 'e5700c6', 'e5700c6.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(292, '2021-08-28', 'basic', '16b0938d80', 'asdaf.co', '678d16', '16b0938d80.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(293, '2021-08-28', 'basic', '70019235e', 'asdaf.co', '0070019', '70019235e.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(294, '2021-08-28', 'basic', '672239d4', 'asdaf.co', '7b6722', '672239d4.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(295, '2021-08-28', 'basic', '21ae895b', 'asdaf.co', '4d21ae', '21ae895b.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(296, '2021-08-28', 'basic', '445ab85', 'asdaf.co', '89ff5d34a8248aa409fd', '445ab85.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(297, '2021-08-28', 'basic', 'a232e3f64', 'asdaf.co', '6472475e28459901', 'a232e3f64.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(298, '2021-08-28', 'basic', 'fd602009e7', 'asdaf.co', '602009e7ec7e', 'fd602009e7.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(299, '2021-08-28', 'basic', 'ea63b9f46', 'asdaf.co', 'ea63b9f46', 'ea63b9f46.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(300, '2021-08-28', 'basic', '5b7c8d', 'asdaf.co', 'b18bb2816d20a95377bd', '5b7c8d.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(301, '2021-08-28', 'basic', '95ad87c65', 'asdaf.co', '3395ad8', '95ad87c65.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(302, '2021-08-28', 'basic', 'f52f73691', 'asdaf.co', '915b622116183889', 'f52f73691.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(303, '2021-08-28', 'basic', '0acd78d3', 'asdaf.co', '8d3f7e3463330', '0acd78d3.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(304, '2021-08-28', 'basic', '2a3b2112', 'asdaf.co', '2a3b2112', '2a3b2112.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(305, '2021-08-28', 'basic', 'cd0f14', 'asdaf.co', '0828cfc8b757ceb', 'cd0f14.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(306, '2021-08-28', 'basic', '04719f9', 'asdaf.co', '104719', '04719f9.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(307, '2021-08-28', 'basic', '77660c0', 'asdaf.co', '77660c0', '77660c0.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(308, '2021-08-31', 'basic', '427b7d65', 'asdaf.co', '1ca6cdb94ab835979ea', '427b7d65.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(309, '2021-08-31', 'basic', '37d912', 'asdaf.co', '7d91247', '37d912.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(310, '2021-08-31', 'basic', '981d760', 'asdaf.co', '037979a14bae16', '981d760.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(311, '2021-08-31', 'fakeurl', '9145dd53', 'asdaf.co', '391aefcddcac8f3', '9145dd53.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', 'https://www.pexels.com/photo/back-view-beach-bikini-blonde-hair-323244/', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(312, '2021-08-31', 'fakeurl', 'cf03c8c0', 'asdaf.co', 'f03c8c097', 'cf03c8c0.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', 'https://www.pexels.com/photo/back-view-beach-bikini-blonde-hair-323244/', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(313, '2021-08-31', 'fakeurl', 'd5638098', 'asdaf.co', '81d32b7dab11c93', 'd5638098.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', 'https://www.pexels.com/photo/back-view-beach-bikini-blonde-hair-323244/', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(314, '2021-08-31', 'fakeurl', 'f5320330cf', 'asdaf.co', 'fe4fe920250d292b5e4', 'f5320330cf.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', 'https://www.pexels.com/photo/back-view-beach-bikini-blonde-hair-323244/', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(315, '2021-08-31', 'fakeurl', '06395abb99', 'asdaf.co', '06395abb99', '06395abb99.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', 'https://www.pexels.com/photo/back-view-beach-bikini-blonde-hair-323244/', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(316, '2021-08-31', 'fakeurl', 'e28d074', 'asdaf.co', '28d07455', 'e28d074.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', 'https://www.pexels.com/photo/back-view-beach-bikini-blonde-hair-323244/', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(317, '2021-08-31', 'fakeurl', 'd9a96c3d6f', 'asdaf.co', 'fa4fdea3c3ee1c68f80', 'd9a96c3d6f.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', 'https://www.pexels.com/photo/back-view-beach-bikini-blonde-hair-323244/', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(318, '2021-08-31', 'fakeurl', '7ef09d3574', 'asdaf.co', 'f09d3574a50f', '7ef09d3574.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', 'https://www.pexels.com/photo/back-view-beach-bikini-blonde-hair-323244/', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(319, '2021-08-31', 'fakeurl', '313a406', 'asdaf.co', 'ea294875189916165b6', '313a406.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', 'https://www.pexels.com/photo/back-view-beach-bikini-blonde-hair-323244/', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(320, '2021-08-31', 'fakeurl', '40bb4b92', 'asdaf.co', '9296260918355e', '40bb4b92.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', 'https://www.pexels.com/photo/back-view-beach-bikini-blonde-hair-323244/', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(321, '2021-08-31', 'fakeurl', '87a0d30', 'asdaf.co', '30091e3a27c1', '87a0d30.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', 'https://www.pexels.com/photo/back-view-beach-bikini-blonde-hair-323244/', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(322, '2021-08-31', 'fakeurl', '107ea3242', 'asdaf.co', 'a3242e6f61b28', '107ea3242.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', 'https://www.pexels.com/photo/back-view-beach-bikini-blonde-hair-323244/', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(323, '2021-08-31', 'fakeurl', 'a263c94', 'asdaf.co', '89bd36c8691e2618', 'a263c94.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', 'https://www.pexels.com/photo/back-view-beach-bikini-blonde-hair-323244/', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(324, '2021-08-31', 'fakeurl', '8b5a688', 'asdaf.co', 'f41480a26a29382d26', '8b5a688.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', 'https://www.pexels.com/photo/back-view-beach-bikini-blonde-hair-323244/', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(325, '2021-09-30', 'basic', 'df271d98c', 'domain.co', 'd98c472191cf45', 'df271d98c.domain.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(326, '2021-09-30', 'basic', '2347b8051', 'asdaf.co', 'c2347b80', '2347b8051.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(327, '2021-09-30', 'basic', 'da71627af5', 'domain.co', '5ce751c8eec5b35a8cf1', 'da71627af5.domain.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(328, '2021-09-30', 'basic', '00eb3356ee', 'domain.ca', 'ef00eb33', '00eb3356ee.domain.ca', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(329, '2021-09-30', 'basic', 'f4748344c5', 'asdaf.co', 'acf47483', 'f4748344c5.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(330, '2021-09-30', 'basic', 'a9b480b6e1', 'domain.ca', '480b6e19aa5e8', 'a9b480b6e1.domain.ca', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(331, '2021-09-30', 'basic', '0991f2', 'domain.co', '01ad2028b6f34893401', '0991f2.domain.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(332, '2021-09-30', 'basic', '79fb293', 'domain.ca', 'fb293ac4f', '79fb293.domain.ca', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(333, '2021-09-30', 'basic', 'a3c9634', 'domain.co', '7e77b68fd877d08', 'a3c9634.domain.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(334, '2021-09-30', 'basic', '969565', 'domain.com', '969565', '969565.domain.com', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(335, '2021-09-30', 'basic', 'aae7a8f', 'domain.com', 'baae7a', 'aae7a8f.domain.com', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(336, '2022-02-26', 'basic', '24e11b', 'domain.ca', '472db76f5abe7e303', '24e11b.domain.ca', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(337, '2022-02-26', 'basic', '6d0a29', 'domain.com', '811ffc357e0e704851', '6d0a29.domain.com', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(338, '2022-02-26', 'basic', '17a58b28', 'asdaf.co', '5d2909db37a3f23e89', '17a58b28.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(339, '2022-02-26', 'basic', 'c7ab66a', 'domain.ca', 'a811a695210d3', 'c7ab66a.domain.ca', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(340, '2022-02-26', 'basic', 'f2c4293a98', 'asdaf.co', '3a9896bc276ffe1b', 'f2c4293a98.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(341, '2022-02-27', 'basic', 'f0c8182c', 'asdaf.co', 'c8182c963f', 'f0c8182c.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(342, '2022-02-27', 'basic', 'fee64b0a46', 'asdaf.co', '64b0a4633d7ea', 'fee64b0a46.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(343, '2022-02-27', 'basic', '6f2cccf5b', 'domain.ca', 'af78349cdce1a4d4d19', '6f2cccf5b.domain.ca', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(344, '2022-02-27', 'basic', '3b6f0c1755', 'domain.ca', 'c1755f4398d7550', '3b6f0c1755.domain.ca', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(345, '2022-02-27', 'basic', '67122e3d', 'domain.co', '2e3d0fbe9ebe', '67122e3d.domain.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(346, '2022-02-27', 'basic', 'db614d', 'domain.co', 'd0b33b253420d5f38158', 'db614d.domain.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(347, '2022-02-27', 'basic', '4ad118a0', 'domain.co', '0f0bb34ecb63578', '4ad118a0.domain.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(348, '2022-04-10', 'basic', 'bcabce5880', '', 'f0b2bc', 'bcabce5880.', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(349, '2022-04-10', 'basic', 'fb3528', 'domain.co', '2811c1dd78', 'fb3528.domain.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(350, '2022-04-10', 'basic', '66eedf6be', '', 'edf6bea466c5', '66eedf6be.', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(351, '2022-04-10', 'basic', 'cfe950', '', 'be0c3322ce674fc82549', 'cfe950.', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(352, '2022-04-10', 'basic', '7763d18', '', '7763d18', '7763d18.', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(353, '2022-04-10', 'basic', '7dc217', '', 'e21cea6cd68a', '7dc217.', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(354, '2022-04-10', 'basic', 'cc985464e', '', '464ee88b66d9f4', 'cc985464e.', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(355, '2022-04-10', 'basic', 'c4c802b', 'domain.com', '538f972d6c9d8794e2b9', 'c4c802b.domain.com', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(356, '2022-04-10', 'basic', '8954ab7c', 'domain.co', 'c8954ab', '8954ab7c.domain.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(357, '2022-04-10', 'basic', '2db3beb2', 'asdaf.co', 'eb0f72e2c54b7ed8c7', '2db3beb2.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(358, '2022-04-10', 'basic', '1c92af5a2', 'domain.ca', 'b1c92af5', '1c92af5a2.domain.ca', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(359, '2022-04-10', 'basic', 'a6577489c6', 'asdaf.co', 'd7a1a6', 'a6577489c6.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(360, '2022-04-10', 'basic', 'd7685a0f', '', '559a60452622ac6dc1b', 'd7685a0f.', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(361, '2022-04-10', 'basic', '226f650fb', 'domain.ca', '650fbac142802', '226f650fb.domain.ca', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(362, '2022-04-10', 'basic', '700ff399', '', '3ce64fdbe39c06c79', '700ff399.', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(363, '2022-04-10', 'basic', 'b4fd4ea3', '', '5c87bf0f249bf6188', 'b4fd4ea3.', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(364, '2022-04-10', 'basic', 'cca1ae70', '', '0e942cb2f0187d0', 'cca1ae70.', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(365, '2022-04-10', 'basic', '93b4739b', '', 'b93b473', '93b4739b.', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(366, '2022-04-10', 'basic', '1398508', '', 'fe31cea37e1afdb1cdf', '1398508.', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(367, '2022-04-10', 'basic', 'bcb2b362', 'domain.ca', '622e78bff70043', 'bcb2b362.domain.ca', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(368, '2022-04-10', 'basic', 'cfe7e29', 'domain.ca', '54a88f19b77f410a', 'cfe7e29.domain.ca', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(369, '2022-04-10', 'basic', '8f2d08bb30', 'domain.com', 'f2d08bb306e', '8f2d08bb30.domain.com', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', '');
INSERT INTO `gen_link` (`id`, `date`, `type`, `sub`, `domain`, `hash`, `full_domain`, `forward_url`, `fake_url`, `custom_title`, `custom_description`, `custom_keywords`, `custom_image`, `country`, `app_id`, `username`, `country_block`, `use_landing`, `forward_web`, `forward_wap`, `team`) VALUES
(370, '2022-04-10', 'basic', 'b41611955', '', '557e7d7801829fd8', 'b41611955.', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(371, '2022-04-10', 'basic', '87d72ae1', '', '2ae1fde30740', '87d72ae1.', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(372, '2022-04-10', 'basic', 'c0bfcee84', 'domain.co', 'bcc0bfc', 'c0bfcee84.domain.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(373, '2022-04-10', 'basic', '06762975', '', '7629756218', '06762975.', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(374, '2022-04-10', 'basic', '58d1178a', 'domain.com', '21d4ada9b0c1a8b7bf', '58d1178a.domain.com', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(375, '2022-04-10', 'basic', '0f1eb1d', '', 'b0551ca84ef74e', '0f1eb1d.', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(376, '2022-04-10', 'basic', '74abb19f0', '', 'bb19f01a7b09', '74abb19f0.', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(377, '2022-04-10', 'basic', '7eb0e6f', '', '0e6fa186cf', '7eb0e6f.', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(378, '2022-04-10', 'basic', 'a3c32ab', '', 'dbf1f4e17efa7f1', 'a3c32ab.', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(379, '2022-04-10', 'basic', '14cefa4e6', '', '02936353ed27646ea1b', '14cefa4e6.', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(380, '2022-04-10', 'basic', '2c4503c8', '', '4503c8e1c8', '2c4503c8.', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(381, '2022-04-10', 'basic', 'eeaa5d', 'asdaf.co', 'c0e8ab0524bc3', 'eeaa5d.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(382, '2022-04-10', 'basic', '0947a05', 'domain.co', '947a0525', '0947a05.domain.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(383, '2022-04-10', 'basic', 'c5f33bea', '', 'f33bea5e41', 'c5f33bea.', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(384, '2022-04-10', 'basic', '2b14ea46c', '', '46c94cd79e4a4d1', '2b14ea46c.', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(385, '2022-04-10', 'basic', 'c3629e', '', '3629e60', 'c3629e.', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(386, '2022-04-10', 'basic', 'e8bc67', 'jahdsjada.com', '21cd54cd113b359', 'e8bc67.jahdsjada.com', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(387, '2022-04-10', 'basic', '65fe700794', 'jadskajda.com', '007943f60c21c9b', '65fe700794.jadskajda.com', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(388, '2022-04-10', 'basic', '09945a6e0', 'jadskajda.com', 'a6e00285c613f1', '09945a6e0.jadskajda.com', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(389, '2022-04-10', 'basic', 'b951a1', 'jahdsjada.com', '92fc1f93c3c764db', 'b951a1.jahdsjada.com', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(390, '2022-04-10', 'basic', 'aa0287', 'ajhdska.com', '287279ba5', 'aa0287.ajhdska.com', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(391, '2022-05-06', 'basic', '50a009a10', 'domain.com', '10416cc5c3294dee', '50a009a10.domain.com', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(392, '2022-05-06', 'basic', 'aab5edab8', 'domain.ca', '6c59f98ae02949ade3bb', 'aab5edab8.domain.ca', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(393, '2022-05-06', 'basic', '599286ad83', 'domain.ca', '63d5992', '599286ad83.domain.ca', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(394, '2022-05-06', 'basic', '0811954', 'asdaf.co', '5482c331f151', '0811954.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(395, '2022-05-06', 'basic', '1fa6ee81cf', 'domain.ca', 'cbe1fa6', '1fa6ee81cf.domain.ca', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(396, '2022-05-06', 'basic', '9812461', 'domain.co', '08a02a114c2f22bc', '9812461.domain.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(397, '2022-05-06', 'basic', '00010ddc', 'domain.co', 'a00010d', '00010ddc.domain.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(398, '2022-05-06', 'basic', '7d6ff85', 'asdaf.co', 'd56cc7d6b27ece', '7d6ff85.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(399, '2022-05-06', 'basic', '40a0541416', 'domain.com', '61cb69378d4ea11d071', '40a0541416.domain.com', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(400, '2022-05-06', 'basic', 'db2b91d8f8', 'domain.com', '1d8f86ff685d4e4', 'db2b91d8f8.domain.com', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(401, '2022-05-06', 'basic', 'e0ba6e8', 'asdaf.co', 'e0ba6e8', 'e0ba6e8.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(402, '2022-05-06', 'basic', '54d7d195', 'asdaf.co', 'a1f64eeaec50ceeb', '54d7d195.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(403, '2022-05-06', 'basic', 'ce715e20b', 'domain.co', 'a16e172715605d3925', 'ce715e20b.domain.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(404, '2022-05-06', 'basic', 'cb86e5', 'asdaf.co', 'cb86e5', 'cb86e5.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(405, '2022-05-06', 'basic', 'af20ae', 'domain.ca', 'd87fdaf8dd85d', 'af20ae.domain.ca', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(406, '2022-05-06', 'basic', '8baa84c933', 'asdaf.co', '33799750b914fbe696', '8baa84c933.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(407, '2022-05-06', 'basic', '611e7be4', 'asdaf.co', '5be875d66087dda6b', '611e7be4.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(408, '2022-05-06', 'basic', '191272', 'domain.ca', '191272', '191272.domain.ca', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(409, '2022-05-06', 'basic', '399849fdf', 'domain.com', '9849fdfe158', '399849fdf.domain.com', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(410, '2022-05-06', 'basic', '3e53c78eae', 'asdaf.co', 'eae4a8907ee915abe', '3e53c78eae.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(411, '2022-05-06', 'basic', '35ff159', 'asdaf.co', '535ff1', '35ff159.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(412, '2022-05-06', 'basic', '9dc302fce4', 'asdaf.co', '599dc302', '9dc302fce4.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(413, '2022-05-06', 'basic', '205804', 'domain.co', '205804', '205804.domain.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(414, '2022-05-06', 'basic', '2fee8e6', 'domain.com', 'e678a395c910', '2fee8e6.domain.com', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(415, '2022-05-06', 'basic', 'a87f552', 'domain.ca', '4046203642db310', 'a87f552.domain.ca', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(416, '2022-05-06', 'basic', '6b12bd1805', 'domain.com', '2bd18055a9449', '6b12bd1805.domain.com', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(417, '2022-05-06', 'basic', '29fededef0', 'domain.com', '15a29fe', '29fededef0.domain.com', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(418, '2022-05-06', 'basic', '8dd70dce8e', 'domain.ca', 'dce8e7cadebc74a', '8dd70dce8e.domain.ca', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(419, '2022-05-06', 'basic', 'd9828be4a9', 'domain.com', '0a0372cb9107765b5a72', 'd9828be4a9.domain.com', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(420, '2022-05-06', 'basic', '1876c5', 'domain.com', 'c52caa7099', '1876c5.domain.com', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(421, '2022-05-06', 'basic', 'f773174', 'domain.co', '174bf1e6706', 'f773174.domain.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(422, '2022-05-06', 'basic', '89355d36', 'domain.com', '8c9c003c63489c74109', '89355d36.domain.com', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(423, '2022-05-06', 'basic', '97eac117a', 'domain.com', '8bdcb9c72220bc4b8b', '97eac117a.domain.com', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(424, '2022-05-06', 'basic', 'c20b8760', 'domain.co', '5cfd7451a29e24d9d6cf', 'c20b8760.domain.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(425, '2022-05-06', 'basic', 'fa4721ae36', 'domain.com', '7fa4721ae', 'fa4721ae36.domain.com', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(426, '2022-05-06', 'basic', 'a75aee2184', 'domain.ca', '67a75aee', 'a75aee2184.domain.ca', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(427, '2022-05-06', 'basic', '266872741', 'domain.co', '72741cbe8c02f', '266872741.domain.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(428, '2022-05-06', 'basic', 'd32b3474', 'domain.co', '160be070093876f152', 'd32b3474.domain.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(429, '2022-05-06', 'basic', 'ce6d46c7a9', 'domain.ca', '95341947c3776cb6ae1', 'ce6d46c7a9.domain.ca', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(430, '2022-05-06', 'basic', 'f40c736', 'domain.ca', '2273bab0ddb9030', 'f40c736.domain.ca', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(431, '2022-05-06', 'basic', '233516e', 'domain.com', '033d7281b8e98b4b', '233516e.domain.com', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(432, '2022-05-06', 'basic', '9d0d4d00e', 'domain.co', '0ebf6fd751e711a0', '9d0d4d00e.domain.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(433, '2022-05-06', 'basic', '3080c5', 'asdaf.co', 'e152839bae1e887', '3080c5.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(434, '2022-05-06', 'basic', '159cc7549', 'domain.com', '140159', '159cc7549.domain.com', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(435, '2022-05-24', 'basic', '8a5add', 'asdaf.co', 'a5addb5', '8a5add.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(436, '2022-05-24', 'basic', 'c792ee', 'domain.com', 'b96d07545def3', 'c792ee.domain.com', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(437, '2022-05-24', 'basic', '5b04d7e5b', 'domain.com', 'b04d7e5bf2', '5b04d7e5b.domain.com', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(438, '2022-08-15', 'basic', '0aed6fa9d8', 'asdaf.co', 'aed6fa9d895', '0aed6fa9d8.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(439, '2022-08-15', 'basic', '85019e', 'domain.co', '9e0ef64f53', '85019e.domain.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(440, '2022-08-15', 'basic', '94224a18', 'domain.ca', 'd0a024f6c3ee3291', '94224a18.domain.ca', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(441, '2022-08-15', 'basic', 'd5215a0', 'asdaf.co', 'd5215a0', 'd5215a0.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(442, '2022-08-15', 'basic', '223845706', 'domain.co', '991e053ee0182e65817', '223845706.domain.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(443, '2022-08-17', 'basic', '917a2fb', 'asdaf.co', 'fbdcfec8c47d', '917a2fb.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(444, '2022-08-17', 'basic', 'd9ad1246', 'domain.com', 'bd9ad12', 'd9ad1246.domain.com', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(445, '2022-08-17', 'basic', '43aebed', 'asdaf.co', '543aeb', '43aebed.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(446, '2022-08-17', 'basic', '451fb1e5a', 'domain.co', '46451fb', '451fb1e5a.domain.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(447, '2022-08-17', 'basic', '238848', 'domain.com', 'd981bbbd5d82534', '238848.domain.com', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(448, '2022-08-17', 'basic', '6d70e3267', 'domain.ca', 'd70e32671f', '6d70e3267.domain.ca', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(449, '2022-08-17', 'basic', '459fca0', 'asdaf.co', '459fca0', '459fca0.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(450, '2022-08-17', 'basic', '2786cbca', 'asdaf.co', '2f71f3dd1a7db8b542d', '2786cbca.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(451, '2022-08-17', 'basic', 'a59e0546f0', 'domain.com', '9e0546f006f8', 'a59e0546f0.domain.com', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(452, '2022-08-17', 'basic', '0be974', 'domain.ca', '742862c4cc54', '0be974.domain.ca', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(453, '2022-08-17', 'basic', 'ffd05e', 'domain.co', '212377a475389c2b51a', 'ffd05e.domain.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(454, '2022-08-17', 'basic', 'a92a0fac4', 'domain.co', '40d8c141a40860dd1', 'a92a0fac4.domain.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(455, '2022-08-17', 'basic', 'e104f9de', 'domain.ca', '9de3da5266f7a', 'e104f9de.domain.ca', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(456, '2022-08-17', 'basic', 'b3f62652', 'asdaf.co', '19a992197cbb84555c', 'b3f62652.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(457, '2022-08-17', 'basic', '434ae737', 'domain.ca', 'ae737b6c65c', '434ae737.domain.ca', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(458, '2022-08-17', 'basic', 'c2bbc5085c', 'domain.com', 'c5085cc460a945', 'c2bbc5085c.domain.com', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(459, '2022-08-17', 'basic', '7096d3b96d', 'domain.co', '7096d3b96d', '7096d3b96d.domain.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(460, '2022-08-17', 'basic', '66b3e26a5', 'domain.ca', '6a517f57b08c143', '66b3e26a5.domain.ca', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(461, '2022-08-17', 'basic', '9c48c11f3', 'domain.ca', 'e717729223e1494522d6', '9c48c11f3.domain.ca', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(462, '2022-08-17', 'basic', 'da42b14f5', 'domain.co', 'f11ea12f7ea34d68d5', 'da42b14f5.domain.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(463, '2022-08-17', 'basic', '600f63', 'domain.co', '34caeb7f3d8', '600f63.domain.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(464, '2022-08-17', 'basic', '4f143ed94', 'domain.ca', 'd94fd7f9b74eab7', '4f143ed94.domain.ca', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(465, '2022-08-17', 'basic', '3dac33e', 'asdaf.co', 'de26b3527bc815d', '3dac33e.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(466, '2022-08-17', 'basic', '67ac86287', 'domain.ca', '6a67ac8', '67ac86287.domain.ca', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(467, '2022-08-17', 'basic', 'b51ec166f', 'domain.co', 'ec166f6f0d07', 'b51ec166f.domain.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(468, '2022-08-17', 'basic', '98c7e3', 'asdaf.co', '2357ad33e5613e', '98c7e3.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(469, '2022-08-17', 'basic', 'f3fba5fc', 'domain.co', 'fc9b620e2260ad', 'f3fba5fc.domain.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(470, '2022-08-17', 'basic', 'fe01eb2d7', 'domain.ca', 'efdfe0', 'fe01eb2d7.domain.ca', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(471, '2022-08-17', 'basic', '2cdf33', 'domain.co', '1292b09a98abc002a', '2cdf33.domain.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(472, '2022-08-17', 'basic', '7487654a4', 'asdaf.co', '2afaeb5b890ab222488', '7487654a4.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(473, '2022-08-17', 'basic', '5f4b9024', 'domain.ca', 'b9024527cc2', '5f4b9024.domain.ca', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(474, '2022-08-17', 'basic', '498d81cf35', 'domain.co', '35830a7941b4aecbab', '498d81cf35.domain.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(475, '2022-08-17', 'basic', 'cd141e', 'domain.co', '3de5658478253', 'cd141e.domain.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(476, '2022-08-17', 'basic', '93b90d', 'domain.co', '3b90d94', '93b90d.domain.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(477, '2022-08-17', 'basic', 'c15caee', 'domain.co', 'ed9cbe6f9aa31', 'c15caee.domain.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(478, '2022-08-17', 'basic', '7623398265', 'domain.ca', '98265664c2de25a', '7623398265.domain.ca', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(479, '2022-08-24', 'basic', '5bd407c', 'asdaf.co', 'bd407cc0', '5bd407c.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(480, '2022-08-24', 'basic', '29b79ec', 'domain.co', 'df85befbf585b11', '29b79ec.domain.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(481, '2022-08-24', 'basic', '406189', 'domain.com', '97b2d4ed898', '406189.domain.com', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(482, '2022-08-24', 'basic', '3202ebe', 'domain.com', '2ebe6a1490', '3202ebe.domain.com', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(483, '2022-08-24', 'basic', '0fae82df', 'domain.com', '0fae82df', '0fae82df.domain.com', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(484, '2022-08-24', 'basic', '574e1748cd', 'domain.ca', 'ba574e17', '574e1748cd.domain.ca', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(485, '2022-08-24', 'basic', '9f7b203c', 'domain.com', 'fcc89fb6ec0c2d38ffc1', '9f7b203c.domain.com', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(486, '2022-08-24', 'basic', '9b13bdc3', 'domain.co', '268d16c646e02fa87', '9b13bdc3.domain.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(487, '2022-08-24', 'basic', '9b25dc1', 'domain.com', '25dc174c8', '9b25dc1.domain.com', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(488, '2022-08-24', 'basic', 'b270dd2', 'domain.ca', 'd25e33f46ed0', 'b270dd2.domain.ca', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(489, '2022-08-24', 'basic', 'a155f9', 'asdaf.co', '5f9580999', 'a155f9.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(490, '2022-08-24', 'basic', '9831a9d489', 'domain.ca', '1d29831', '9831a9d489.domain.ca', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(491, '2022-08-24', 'basic', '27da90', 'asdaf.co', '27da90', '27da90.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(492, '2022-08-24', 'basic', '8b3e024b73', 'asdaf.co', 'f88b3e02', '8b3e024b73.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(493, '2022-08-24', 'basic', '69930d', 'domain.co', 'b2cb9edbaf78', '69930d.domain.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(494, '2022-08-24', 'basic', '79ad22', 'asdaf.co', 'be885bdcc60c955', '79ad22.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(495, '2022-08-24', 'basic', 'b9cf0f82', 'domain.com', 'ab9cf0f', 'b9cf0f82.domain.com', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(496, '2022-08-24', 'basic', 'ee5bc243d', 'domain.ca', '9ee5bc24', 'ee5bc243d.domain.ca', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(497, '2022-08-24', 'basic', '3b97790125', 'domain.co', '463b9779', '3b97790125.domain.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(498, '2022-08-24', 'basic', 'c061e5c85d', 'domain.com', '5c85db6b015e4f7', 'c061e5c85d.domain.com', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(499, '2022-08-24', 'basic', 'ceaa4423', 'asdaf.co', '2dceaa', 'ceaa4423.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(500, '2022-08-24', 'basic', 'aba8463', 'domain.com', '84637ca20c', 'aba8463.domain.com', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(501, '2022-08-24', 'basic', 'b3583fed', 'domain.com', 'bb61b74222f52447fe8', 'b3583fed.domain.com', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(502, '2022-08-24', 'basic', 'cd1a46', 'domain.ca', '1a46d8e1', 'cd1a46.domain.ca', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(503, '2022-08-24', 'basic', '7881e1d1bc', 'domain.com', '1d1bc9e313eb14b', '7881e1d1bc.domain.com', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(504, '2022-08-24', 'basic', 'aaa72902a', 'domain.com', '2a1f92a7ead23f1b', 'aaa72902a.domain.com', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(505, '2022-08-24', 'basic', 'bf4c3d12', 'asdaf.co', 'f4c3d1264', 'bf4c3d12.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(506, '2022-08-24', 'basic', '6f6a4a1b', 'domain.ca', 'f6a4a1bb8', '6f6a4a1b.domain.ca', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(507, '2022-08-24', 'basic', '1368515', 'domain.co', '6851542a1', '1368515.domain.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(508, '2022-08-24', 'basic', '50b2739', 'domain.ca', '759a5ffc3e9de9', '50b2739.domain.ca', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(509, '2022-08-24', 'basic', '38b0d7144e', 'domain.ca', 'abc38b0', '38b0d7144e.domain.ca', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(510, '2022-08-24', 'basic', 'a10b7a146c', 'domain.co', '9a10b7a14', 'a10b7a146c.domain.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(511, '2022-08-24', 'basic', '76633d6', 'domain.com', '6633d670', '76633d6.domain.com', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(512, '2022-08-24', 'basic', '0387035f', 'domain.co', 'a30387', '0387035f.domain.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(513, '2022-08-24', 'basic', 'e33b788d8', 'domain.ca', 'ac8c76f694ddd08ae6', 'e33b788d8.domain.ca', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(514, '2022-08-24', 'basic', '8d1532fdd9', 'asdaf.co', 'be238d', '8d1532fdd9.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(515, '2022-08-24', 'basic', '34bf4c72e1', 'asdaf.co', '2e13b46bd00198904', '34bf4c72e1.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(516, '2022-08-24', 'basic', '6b474b', 'asdaf.co', '99e14e93e7532a40dc', '6b474b.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(517, '2022-08-24', 'basic', '2daaa2c4', 'domain.com', 'c4e871ecaa98a0', '2daaa2c4.domain.com', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(518, '2022-08-24', 'basic', '1cdedea', 'asdaf.co', 'dea652e0463', '1cdedea.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(519, '2022-08-24', 'basic', '1920abfd3e', 'domain.com', 'a1e619', '1920abfd3e.domain.com', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(520, '2022-08-24', 'basic', '31ecf6e0d', 'domain.ca', 'ecf6e0d2ae7', '31ecf6e0d.domain.ca', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(521, '2022-08-24', 'basic', '029f3c', 'domain.co', 'f1b37bc4d4e5497', '029f3c.domain.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(522, '2022-08-24', 'basic', '323032f8', 'domain.ca', '20440d4a88659db67', '323032f8.domain.ca', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(523, '2022-08-24', 'basic', 'e2790e9768', 'domain.ca', '8f79fc46f7bb4e3d1cfa', 'e2790e9768.domain.ca', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(524, '2022-08-24', 'basic', 'dc542b01', 'asdaf.co', 'cb316c0809211cf9', 'dc542b01.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(525, '2022-08-24', 'basic', 'fd129a', 'domain.com', 'f1aa0450339deedc3', 'fd129a.domain.com', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(526, '2022-08-24', 'basic', 'e4d2c533', 'domain.co', '53330398ea74f', 'e4d2c533.domain.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(527, '2022-08-24', 'basic', 'efeb17', 'asdaf.co', '1d997548a9e384e5b3', 'efeb17.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(528, '2022-08-24', 'basic', '5c89e119', 'asdaf.co', 'e119d9b3c0c8', '5c89e119.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(529, '2022-08-24', 'basic', '832649', 'domain.ca', '5fe3f1e172881652', '832649.domain.ca', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(530, '2022-08-26', 'basic', '6f81b9', 'domain.co', '447e726ad4b6106925', '6f81b9.domain.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(531, '2022-08-26', 'basic', '0a0440c', 'domain.com', '60ad466cfec283247', '0a0440c.domain.com', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(532, '2022-08-26', 'basic', '05f637ac', 'domain.com', '9b69491ce3172bbd', '05f637ac.domain.com', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(533, '2022-08-26', 'basic', '8f14032f', 'domain.ca', 'f1f6b8bf26a9243', '8f14032f.domain.ca', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(534, '2022-08-26', 'basic', 'e59a3943f9', 'domain.ca', '3e59a3943', 'e59a3943f9.domain.ca', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(535, '2022-08-26', 'basic', 'c78ceca63', 'domain.com', '635be74986702e4a', 'c78ceca63.domain.com', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(536, '2022-08-26', 'basic', 'c58ba3b', 'domain.com', 'c58ba3b', 'c58ba3b.domain.com', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(537, '2022-08-26', 'basic', '592b7777b', 'domain.co', 'bfb8ee452ca9bcdbf', '592b7777b.domain.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(538, '2022-08-26', 'basic', '3b2f1ff', 'asdaf.co', '1ff433bc29b', '3b2f1ff.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(539, '2022-08-26', 'basic', '544638', 'domain.ca', 'c09a20e2b351b', '544638.domain.ca', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(540, '2022-08-26', 'basic', '20c96f', 'domain.ca', '0c96f29', '20c96f.domain.ca', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(541, '2022-08-26', 'basic', '32a380f', 'domain.com', 'c3865889b6e104', '32a380f.domain.com', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(542, '2022-08-26', 'basic', 'e948703e', 'domain.ca', '3e567f9deb3114', 'e948703e.domain.ca', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(543, '2022-08-26', 'basic', '8a37fe1143', 'domain.co', '78a37fe11', '8a37fe1143.domain.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(544, '2022-08-26', 'basic', '449dd5f82', 'domain.com', '449dd5f82', '449dd5f82.domain.com', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(545, '2022-08-26', 'basic', '406814d1a1', 'domain.co', '814d1a19a1a4f', '406814d1a1.domain.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(546, '2022-08-26', 'basic', 'd80df9dd6', 'domain.ca', '3ba94506573c09010d3', 'd80df9dd6.domain.ca', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(547, '2022-08-26', 'basic', 'd1b72e54', 'domain.com', '2e54b5f819f3', 'd1b72e54.domain.com', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(548, '2022-08-26', 'basic', 'b7bd76fe6', 'asdaf.co', '6f3b7b', 'b7bd76fe6.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(549, '2022-08-26', 'basic', '280c79756', 'domain.ca', '0280c797', '280c79756.domain.ca', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', '');
INSERT INTO `gen_link` (`id`, `date`, `type`, `sub`, `domain`, `hash`, `full_domain`, `forward_url`, `fake_url`, `custom_title`, `custom_description`, `custom_keywords`, `custom_image`, `country`, `app_id`, `username`, `country_block`, `use_landing`, `forward_web`, `forward_wap`, `team`) VALUES
(550, '2022-08-26', 'basic', 'd1d828', 'domain.ca', '18d57bed41c9c7ea6', 'd1d828.domain.ca', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(551, '2022-08-26', 'basic', '831e15920', 'domain.ca', '1e159200440', '831e15920.domain.ca', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(552, '2022-08-26', 'basic', '0699612', 'domain.ca', '23ad93a080d44', '0699612.domain.ca', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(553, '2022-08-26', 'basic', '294f57', 'domain.co', 'eaa38e51b0d49fb', '294f57.domain.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(554, '2022-08-26', 'basic', '9308ee9', 'domain.com', 'd0cfa1a66f25f1453', '9308ee9.domain.com', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(555, '2022-08-26', 'basic', '7af60e67d', 'asdaf.co', 'd7af60e6', '7af60e67d.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(556, '2022-08-26', 'basic', 'ca670ca', 'domain.ca', '7d4ebcd7406d551eb8e1', 'ca670ca.domain.ca', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(557, '2022-09-18', 'basic', '1c716a3b76', 'domain.ca', '6aa322c0657c208bffa', '1c716a3b76.domain.ca', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(558, '2022-09-18', 'basic', '6e63f241', 'domain.ca', '3f241037dc5', '6e63f241.domain.ca', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(559, '2022-09-18', 'basic', '781229d', 'domain.ca', 'db39282ea5fce', '781229d.domain.ca', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(560, '2022-09-18', 'basic', 'cbb135098', 'domain.com', 'acbb1350', 'cbb135098.domain.com', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(561, '2022-09-18', 'basic', '3adedf9d', 'domain.com', 'df9d7a713576', '3adedf9d.domain.com', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(562, '2022-09-18', 'basic', '305015', 'domain.co', '15513e72e2', '305015.domain.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(563, '2022-09-18', 'basic', '8d07ee40', 'domain.com', 'd3309f667b93077b3fc', '8d07ee40.domain.com', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(564, '2022-09-18', 'basic', '9912110', 'asdaf.co', '116ccd7b787a225d2fa7', '9912110.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(565, '2022-09-18', 'basic', '24a35d', 'asdaf.co', '17b65b12afaaa', '24a35d.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(566, '2022-09-18', 'basic', '009f8adbe', 'domain.com', '009f8adbe', '009f8adbe.domain.com', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(567, '2022-09-18', 'basic', 'a9b0f8e9', 'domain.com', 'a9b0f8e9', 'a9b0f8e9.domain.com', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(568, '2022-09-18', 'basic', 'bd47577741', 'domain.com', '577741101906c8', 'bd47577741.domain.com', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(569, '2022-09-18', 'basic', 'f6c1c00496', 'domain.co', 'e9f6c1c0', 'f6c1c00496.domain.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(570, '2022-09-18', 'basic', '4a2e8b5b0', 'asdaf.co', 'e8b5b010ca8c', '4a2e8b5b0.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(571, '2022-09-18', 'basic', '9d8aad9', 'domain.co', 'd8aad98a', '9d8aad9.domain.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(572, '2022-09-18', 'basic', '5c3cdd', 'asdaf.co', 'c3cdded', '5c3cdd.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(573, '2022-09-18', 'basic', 'bb09af', 'domain.com', 'ce29b1b8a137ae8d5', 'bb09af.domain.com', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(574, '2022-09-18', 'basic', '88813a7f', 'domain.ca', '3a7fc47b0a99', '88813a7f.domain.ca', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(575, '2022-09-18', 'basic', 'e024b2', 'asdaf.co', 'd4bc6800086b5709', 'e024b2.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(576, '2022-09-18', 'basic', 'bba14b', 'domain.ca', '939d31ff7c21249acf2', 'bba14b.domain.ca', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(577, '2022-09-18', 'basic', 'e5408068a', 'domain.co', '6b5644daa53159726306', 'e5408068a.domain.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(578, '2022-09-18', 'basic', '75e8be6', 'asdaf.co', '6e3ca9e17e51b', '75e8be6.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', ''),
(579, '2022-09-18', 'basic', '551b87b48', 'asdaf.co', '7b485ec417891b', '551b87b48.asdaf.co', '{&quot;ALL&quot;:[&quot;https://www.facebook.com/&quot;]}', '', '', '', '', '', '', '', 'admin', '', 'off', '{&quot;ALL&quot;:[&quot;&quot;]}', '{&quot;ALL&quot;:[&quot;&quot;]}', '');

-- --------------------------------------------------------

--
-- Table structure for table `hitstat`
--

CREATE TABLE `hitstat` (
  `id` bigint(20) NOT NULL,
  `date` datetime NOT NULL,
  `full_url` text NOT NULL,
  `target_url` text NOT NULL,
  `owner` varchar(12) NOT NULL,
  `referer` text NOT NULL,
  `requested_with` varchar(128) NOT NULL,
  `useragent` text NOT NULL,
  `host` varchar(64) NOT NULL,
  `ip` varchar(128) NOT NULL,
  `country` varchar(64) NOT NULL,
  `isp` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `id` bigint(20) NOT NULL,
  `date` datetime NOT NULL,
  `invnum` varchar(48) NOT NULL,
  `inv_total` double NOT NULL,
  `status` varchar(12) NOT NULL,
  `method` varchar(32) NOT NULL,
  `paid_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`id`, `date`, `invnum`, `inv_total`, `status`, `method`, `paid_date`) VALUES
(1, '2021-09-14 00:00:00', 'LINKGEN-52145214', 150000, 'paid', 'midtrans', '2021-09-14 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL,
  `date` datetime NOT NULL,
  `userid` varchar(12) NOT NULL,
  `invnum` varchar(48) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_price` double NOT NULL,
  `item_qty` varchar(4) NOT NULL,
  `item_term` enum('monthly','yearly','lifetime') NOT NULL,
  `status` enum('paid','unpaid','canceled') NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `expired` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `date`, `userid`, `invnum`, `item_name`, `item_price`, `item_qty`, `item_term`, `status`, `start`, `end`, `expired`) VALUES
(1, '2020-09-10 03:43:13', 'admin', '740245763', 'Link Generator 1 bulan - {$username}', 150000, '1', 'monthly', 'paid', '2020-09-10 10:38:09', '2020-10-10 03:43:13', 0),
(2, '2020-09-10 03:43:39', 'admin', '740245763', 'Link Generator 1 bulan - admin', 150000, '1', 'monthly', 'paid', '2020-09-10 10:38:09', '2020-10-10 03:43:39', 0),
(3, '2020-09-10 06:14:57', 'woo', 'LINKGEN-1998094723', 'Link Generator 1 bulan - woo', 150000, '1', 'monthly', 'paid', '2020-09-10 12:29:01', '2020-10-10 06:14:57', 0),
(4, '2020-09-11 03:39:12', 'demotes', 'LINKGEN-1329511463', 'Link Generator 1 bulan - demotes', 100000, '1', 'monthly', 'paid', '2020-06-09 18:11:11', '2020-10-11 03:39:12', 0),
(6, '2021-09-08 06:09:45', 'coba', 'LINKGEN-1203787416', 'Link Generator 6 bulan - coba', 800000, '6', 'monthly', 'paid', '2021-09-08 13:09:36', '2022-03-07 06:09:45', 0),
(7, '2022-11-10 08:08:26', 'coba', 'LINKGEN-1700893814', 'Link Generator 1 bulan - coba', 150000, '1', 'monthly', 'paid', '2022-11-10 15:08:07', '2022-12-10 08:08:26', 0);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` bigint(20) NOT NULL,
  `date` datetime NOT NULL,
  `name` varchar(64) NOT NULL,
  `price` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `records`
--

CREATE TABLE `records` (
  `id` bigint(20) NOT NULL,
  `domain_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `content` varchar(64) DEFAULT NULL,
  `ttl` varchar(11) DEFAULT NULL,
  `prio` int(11) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT '0',
  `ordername` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `auth` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `records`
--

INSERT INTO `records` (`id`, `domain_id`, `name`, `type`, `content`, `ttl`, `prio`, `disabled`, `ordername`, `auth`) VALUES
(6, 7, 'asdaf.co', 'A', '178.128.125.158', '3600', NULL, 0, NULL, 1),
(7, 7, '*.asdaf.co', 'A', '178.128.125.158', '3600', NULL, 0, NULL, 1),
(8, 7, 'asdaf.co', 'SOA', 'gnx.red root@gnx.red 1580862025 10800 3600 604800 3600', '3600', NULL, 0, NULL, 1),
(9, 7, 'asdaf.co', 'NS', 'ns1.gnx.red', '3600', NULL, 0, NULL, 1),
(10, 7, 'asdaf.co', 'NS', 'ns2.gnx.red', '3600', NULL, 0, NULL, 1),
(11, 8, 'ghakdsa.co', 'A', '178.128.125.158', '3600', NULL, 0, NULL, 1),
(12, 8, '*.ghakdsa.co', 'A', '178.128.125.158', '3600', NULL, 0, NULL, 1),
(13, 8, 'ghakdsa.co', 'SOA', 'gnx.red root@gnx.red 1583463249 10800 3600 604800 3600', '3600', NULL, 0, NULL, 1),
(14, 8, 'ghakdsa.co', 'NS', 'ns1.gnx.red', '3600', NULL, 0, NULL, 1),
(15, 8, 'ghakdsa.co', 'NS', 'ns2.gnx.red', '3600', NULL, 0, NULL, 1),
(31, 12, 'domain.com', 'A', '178.128.125.158', '3600', NULL, 0, NULL, 1),
(32, 12, '*.domain.com', 'A', '178.128.125.158', '3600', NULL, 0, NULL, 1),
(33, 12, 'domain.com', 'SOA', 'gnx.red root@gnx.red 1631972873 10800 3600 604800 3600', '3600', NULL, 0, NULL, 1),
(34, 12, 'domain.com', 'NS', 'ns1.gnx.red', '3600', NULL, 0, NULL, 1),
(35, 12, 'domain.com', 'NS', 'ns2.gnx.red', '3600', NULL, 0, NULL, 1),
(36, 13, 'domain.co', 'A', '178.128.125.158', '3600', NULL, 0, NULL, 1),
(37, 13, '*.domain.co', 'A', '178.128.125.158', '3600', NULL, 0, NULL, 1),
(38, 13, 'domain.co', 'SOA', 'gnx.red root@gnx.red 1631972873 10800 3600 604800 3600', '3600', NULL, 0, NULL, 1),
(39, 13, 'domain.co', 'NS', 'ns1.gnx.red', '3600', NULL, 0, NULL, 1),
(40, 13, 'domain.co', 'NS', 'ns2.gnx.red', '3600', NULL, 0, NULL, 1),
(41, 14, 'domain.ca', 'A', '178.128.125.158', '3600', NULL, 0, NULL, 1),
(42, 14, '*.domain.ca', 'A', '178.128.125.158', '3600', NULL, 0, NULL, 1),
(43, 14, 'domain.ca', 'SOA', 'gnx.red root@gnx.red 1631972873 10800 3600 604800 3600', '3600', NULL, 0, NULL, 1),
(44, 14, 'domain.ca', 'NS', 'ns1.gnx.red', '3600', NULL, 0, NULL, 1),
(45, 14, 'domain.ca', 'NS', 'ns2.gnx.red', '3600', NULL, 0, NULL, 1),
(46, 15, 'ajhdska.com', 'A', '178.128.125.158', '3600', NULL, 0, NULL, 1),
(47, 15, '*.ajhdska.com', 'A', '178.128.125.158', '3600', NULL, 0, NULL, 1),
(48, 15, 'ajhdska.com', 'SOA', 'gnx.red root@gnx.red 1649624113 10800 3600 604800 3600', '3600', NULL, 0, NULL, 1),
(49, 15, 'ajhdska.com', 'NS', 'ns1.gnx.red', '3600', NULL, 0, NULL, 1),
(50, 15, 'ajhdska.com', 'NS', 'ns2.gnx.red', '3600', NULL, 0, NULL, 1),
(51, 16, 'jadskajda.com', 'A', '178.128.125.158', '3600', NULL, 0, NULL, 1),
(52, 16, '*.jadskajda.com', 'A', '178.128.125.158', '3600', NULL, 0, NULL, 1),
(53, 16, 'jadskajda.com', 'SOA', 'gnx.red root@gnx.red 1649624113 10800 3600 604800 3600', '3600', NULL, 0, NULL, 1),
(54, 16, 'jadskajda.com', 'NS', 'ns1.gnx.red', '3600', NULL, 0, NULL, 1),
(55, 16, 'jadskajda.com', 'NS', 'ns2.gnx.red', '3600', NULL, 0, NULL, 1),
(56, 17, 'jahdsjada.com', 'A', '178.128.125.158', '3600', NULL, 0, NULL, 1),
(57, 17, '*.jahdsjada.com', 'A', '178.128.125.158', '3600', NULL, 0, NULL, 1),
(58, 17, 'jahdsjada.com', 'SOA', 'gnx.red root@gnx.red 1649624113 10800 3600 604800 3600', '3600', NULL, 0, NULL, 1),
(59, 17, 'jahdsjada.com', 'NS', 'ns1.gnx.red', '3600', NULL, 0, NULL, 1),
(60, 17, 'jahdsjada.com', 'NS', 'ns2.gnx.red', '3600', NULL, 0, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(32) NOT NULL,
  `access` int(10) UNSIGNED DEFAULT NULL,
  `data` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `access`, `data`) VALUES
('03c3fffkai9bn4alsvnardu879', 1661329934, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('0eln4lp9vjt8hpd1uhagfc5d31', 1651799986, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('0kin698k2jj4pp9tpvos5p0q26', 1661329919, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('0kl65gfs45dhft5d2nvfkkbq1r', 1661329026, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('0mc7qto9116n1aidgao8ighoj7', 1651799081, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('0mr13ije98tbaedh7k5mf1o1ri', 1651798848, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('0mu1jbhp04o2l9906asbiujisb', 1676460431, 'gxsess|a:3:{s:3:\"key\";s:32:\"52d8179e1b75690079cb363a9dcf9f30\";s:4:\"time\";s:19:\"2023-02-15 10:21:33\";s:3:\"val\";a:3:{s:8:\"username\";s:4:\"coba\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"6\";}}'),
('0nj7a2ha2nvmr9gg6m4ofs5k54', 1660527251, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('0runms3fjkq798jr5aa24tr7mn', 1651798284, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('0tsk2v2hqa6s43ho2n69iv7alu', 1663489697, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('0uv57al0tvipbj29hruvcbk06g', 1649624575, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('14cj9127ovbr9m18caljoqiuu0', 1651798255, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('15d4cl6t2hq7hu37bmket0sipu', 1651798389, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('15qgmcvf8v8vl37lpu3bsfqmh1', 1668066930, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('16gmbmdgjf76s64s0ip1avp33i', 1660721669, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('1876r9a4iifrbv9fimr5bnces0', 1661486250, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('1au6qpc518bloqrmf5vaa2fmbj', 1676456491, 'gxsess|a:3:{s:3:\"key\";s:32:\"52d8179e1b75690079cb363a9dcf9f30\";s:4:\"time\";s:19:\"2023-02-15 10:21:15\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('1d150p12054jpetqqdgijpr3r0', 1661477341, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('1da8psb9f31gfdh33emaibct38', 1649628759, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('1e54f9t0dl4qlo69tclgm8cpn0', 1645658686, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('1i4dd7ei98d729ecvgoeaur1mu', 1645658456, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('1na998pdsii1134ji737n1ep4a', 1663489699, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('1q08junkgc6m6fcg3e8j6v99kc', 1651800223, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('1qtknr3reeaakt6o4d5nosab7i', 1661474873, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('1s2pln0tpoo53j05vlg5f4ekm9', 1661474879, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('1t4f8q405ej6va8odjft950ce0', 1661330236, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('1ucid2jaus87djpkv5umnjfka5', 1668154066, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('1uopptgl780lsmjie9bi3sr15v', 1645658308, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:18:28\";s:3:\"val\";a:0:{}}'),
('27hl3mqaa7f393d9872jpifm81', 1661474854, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('2865nkgtecmu4o59r9ho231abn', 1649624113, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('28i6ku7si27e89h0gnv6vbm7hp', 1676457881, 'gxsess|a:3:{s:3:\"key\";s:32:\"52d8179e1b75690079cb363a9dcf9f30\";s:4:\"time\";s:19:\"2023-02-15 10:21:33\";s:3:\"val\";a:3:{s:8:\"username\";s:4:\"coba\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"6\";}}'),
('29vvaq2cehmsgv9f17kt2l69bc', 1645658310, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:18:30\";s:3:\"val\";a:0:{}}'),
('2cg5pala5vlcr109dgeh6i22kc', 1661328952, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('2dbuk852ke1nn8t1irgjtsf86p', 1651800208, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('2gte684sh5d4r7p6c6b9pisd3c', 1651800108, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('2j7ep548al4fh55p5h1foi5t5p', 1661328934, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('2je46f0u89dvq1qgnltd3ql1lp', 1663489648, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('2jnqfugibl32p833l33q63lrra', 1651705801, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('2jv4cgfj4pfq8ibj4mm6fou649', 1661330361, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('2k2tbrrg8o56i4qun4ncssccuj', 1667980642, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('2kksl21amvrutuqgub3ut6kjjm', 1649630660, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('2ltkp9ks9sm6aqk0jubf13dr8p', 1660757311, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('2mprn1itrd6g4e1fs250trjpj0', 1645658334, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:18:54\";s:3:\"val\";a:0:{}}'),
('2n2ukn7hsk6v2afna5f94enfu4', 1661474864, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('2npp92j3dri05shmffivdijo5v', 1649630645, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('2o4urfj1355s3qab6ndsc4ok1n', 1645918886, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('2poq10u653eq6m1mai5btaeqek', 1661328962, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('2rdn3q3sj2cnhvsu559jrejngc', 1649623946, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('2rhudcv1ca6j3slci6251p7n4q', 1649628751, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('2skdad5sgqlsnjcdh68515e16j', 1651800298, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('2uen62rrr8de4ge6j0orvdjfei', 1663489661, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('31lfomu4mm605907lc892fqsgr', 1651800214, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('31pof0fn20ntjnrc2h6aslu112', 1676456478, 'gxsess|a:3:{s:3:\"key\";s:32:\"52d8179e1b75690079cb363a9dcf9f30\";s:4:\"time\";s:19:\"2023-02-15 10:21:15\";s:3:\"val\";a:0:{}}'),
('32s8uhlnpdrdm35hhm9sincfb1', 1660749385, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('335i9a8vgjokbp1jkokqmi637k', 1651800000, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('33p145qcp43pp51tkt81257qvr', 1676458450, 'gxsess|a:3:{s:3:\"key\";s:32:\"52d8179e1b75690079cb363a9dcf9f30\";s:4:\"time\";s:19:\"2023-02-15 10:21:33\";s:3:\"val\";a:3:{s:8:\"username\";s:4:\"coba\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"6\";}}'),
('3b45fch2g1le031dcokue5vjv6', 1676456493, 'gxsess|a:3:{s:3:\"key\";s:32:\"52d8179e1b75690079cb363a9dcf9f30\";s:4:\"time\";s:19:\"2023-02-15 10:21:33\";s:3:\"val\";a:0:{}}'),
('3d4tfsdg468aomd4cevplnji3b', 1651799990, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('3i651oo12rsm1nh5bl87ph1cva', 1660750123, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('3l3ci4sjlcgkk7nmadtbddb0pe', 1668067719, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('3oc3dnc68idjq8kce6r545dr94', 1651798923, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('3ohfb8s5nqs8m52hpjbn7tgoie', 1663489670, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('3r8sf1na5dj06or2mekbuo1cmi', 1660727529, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('3uudfllgik3996mbsrev8jluko', 1661476643, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('3vcba5j6j7av9hji5rr2kdo7h0', 1645658456, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:0:{}}'),
('4017c2j6liv13p7j6i882f2d3r', 1676456532, 'gxsess|a:3:{s:3:\"key\";s:32:\"52d8179e1b75690079cb363a9dcf9f30\";s:4:\"time\";s:19:\"2023-02-15 10:21:33\";s:3:\"val\";a:3:{s:8:\"username\";s:4:\"coba\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"6\";}}'),
('40mriea73407720sjl3uq9ngjg', 1668067581, 'gxsess|a:3:{s:3:\"key\";s:32:\"5e2eaf7e1eec1fb1570fabbec51a304b\";s:4:\"time\";s:19:\"2022-11-10 07:55:50\";s:3:\"val\";a:3:{s:8:\"username\";s:4:\"coba\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"6\";}}'),
('41oiu8l6h58nbnn53vsmupnba0', 1651800240, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('41oqin5t601utj9i14tkdighgq', 1660717163, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('420difmbh0o487t27pcoup4dfm', 1645658683, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('42d4l51hmp6hlj6mqfpopdjjmc', 1649628737, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('449h5h9grfkqa2ite28psh2cdl', 1653353922, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('45e5d8jru0kfmd3l4eit0pi31c', 1651800343, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('47jbhmcmlc86sbm79qqeeomnrd', 1661329317, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('493p0rfvqatitgvjqftv42dlev', 1661474885, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('49l5e0vbqcreg4258283rmp59l', 1649624584, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('4b24h23ri32jveajdlfje44gpa', 1668067484, 'gxsess|a:3:{s:3:\"key\";s:32:\"5e2eaf7e1eec1fb1570fabbec51a304b\";s:4:\"time\";s:19:\"2022-11-10 07:55:50\";s:3:\"val\";a:3:{s:8:\"username\";s:4:\"coba\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"6\";}}'),
('4bhrrvrstj1c8t6o8l5a8v84es', 1645918877, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('4dek9ol60bpre1jmlek67oob16', 1668067705, 'gxsess|a:3:{s:3:\"key\";s:32:\"5e2eaf7e1eec1fb1570fabbec51a304b\";s:4:\"time\";s:19:\"2022-11-10 07:55:50\";s:3:\"val\";a:3:{s:8:\"username\";s:4:\"coba\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"6\";}}'),
('4e72vlltbsr042maq5eb8acl85', 1649626805, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('4gquc7u28u4h3si700uvp3jcvk', 1661474872, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('4hjcm2lha29k0thkdha0et491i', 1668067536, 'gxsess|a:3:{s:3:\"key\";s:32:\"5e2eaf7e1eec1fb1570fabbec51a304b\";s:4:\"time\";s:19:\"2022-11-10 07:55:50\";s:3:\"val\";a:3:{s:8:\"username\";s:4:\"coba\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"6\";}}'),
('4ls6mjho8s7paul04ltno8s79q', 1651703918, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('4lvqoum70910jugpj3524s4f8t', 1651800376, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('4p7fvqvegbpvi4ld88dqv4kk02', 1645658680, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('4tdn42rjsaih2e2ilsub56o1ft', 1660721354, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('52iiedc1s2gg4enpp20j2l8sc1', 1645658336, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:18:56\";s:3:\"val\";a:0:{}}'),
('52sv64mv2vhnf61kjm3g10i4uh', 1660727507, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('571h8gn14jdcl49n5klenu0n6m', 1660717198, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('582qnnjcq23hfurv1gcjb07i8j', 1649630219, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('58343jcobvvmhct0lcksd0cqnk', 1645658517, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('5go998fv1kqqf9slr2n944a9l5', 1661474881, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('5hqdg8khf5i9v7qqf3egdbgacq', 1649629865, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('5m5bvh786ofvfmk4igfi6ec0mh', 1661477352, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('5qcmnu2nobopenms55jdtmd00u', 1660750219, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('5qlrttbfv558k0sp75dc6rtu4l', 1668067504, 'gxsess|a:3:{s:3:\"key\";s:32:\"5e2eaf7e1eec1fb1570fabbec51a304b\";s:4:\"time\";s:19:\"2022-11-10 07:55:50\";s:3:\"val\";a:3:{s:8:\"username\";s:4:\"coba\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"6\";}}'),
('5s5bdagvnc8uc73d0pepgq6u7a', 1676458444, 'gxsess|a:3:{s:3:\"key\";s:32:\"52d8179e1b75690079cb363a9dcf9f30\";s:4:\"time\";s:19:\"2023-02-15 10:21:33\";s:3:\"val\";a:3:{s:8:\"username\";s:4:\"coba\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"6\";}}'),
('5s7c6kmtshhc9cu0t07j200vta', 1651800176, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('5vinbg3v8c29he4sc55flqd1c9', 1645920974, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('61uarstddfcn3vibq9jfs4ekfo', 1661328829, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('625nr45glruh0u4ngcabs86lqi', 1660747734, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('64bs4kscea240c1i4vhr7ocp1r', 1660721661, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('64oht5djcofp6uka5ofn28osbq', 1661474898, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('66ebil5048dsqg35qof3l9o089', 1649628844, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('6a9301d7e4ieq3l013h4rp2hbk', 1649629929, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('6ch28g5d6vpqg6mi160hqqh0rp', 1660752307, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('6g68lesq00vs0ghi6ope914eam', 1645920830, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('6kbjp4vfnpfu0ud73kbbk1nnb2', 1661474873, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('6ti2f2qmql6ivo34bd1brnkil2', 1660721408, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('6uee76ltosggg5lsv59v6ihs4c', 1651800003, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('6uim8cl7di57fv82ogvod42j5j', 1645658336, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:18:56\";s:3:\"val\";a:0:{}}'),
('75b9b0urldn61f88gi5ualtliu', 1645658310, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:18:30\";s:3:\"val\";a:0:{}}'),
('75q8jruc50ius15nta2h6iu6tc', 1669690218, 'gxsess|a:3:{s:3:\"key\";s:32:\"9b11c494e875265da59b871e11186816\";s:4:\"time\";s:19:\"2022-11-29 02:34:52\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('78qvh3tk2pdj0nc5o2earognkj', 1661329914, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('7cp75au66mvffom0ach1eetee6', 1660525459, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:0:{}}'),
('7fkbo6s1qohij33nuetkfhdlk4', 1645920848, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('7fmrj5a7r0b45stq2ufgbdq0bc', 1649623924, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('7fqs0dj7or2qqvombpsgijbapr', 1676457924, 'gxsess|a:3:{s:3:\"key\";s:32:\"52d8179e1b75690079cb363a9dcf9f30\";s:4:\"time\";s:19:\"2023-02-15 10:21:33\";s:3:\"val\";a:3:{s:8:\"username\";s:4:\"coba\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"6\";}}'),
('7juttp0b038503iorlkh1n65r9', 1676482179, 'gxsess|a:3:{s:3:\"key\";s:32:\"31ec521c7e8ac8d8a47731e3666f03cc\";s:4:\"time\";s:19:\"2023-02-15 17:10:43\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('7ks097jd55qooktpog008qcsfa', 1676482179, 'gxsess|a:3:{s:3:\"key\";s:32:\"31ec521c7e8ac8d8a47731e3666f03cc\";s:4:\"time\";s:19:\"2023-02-15 17:10:43\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('7p0napofq38lsgekknt89bno5q', 1661474885, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('7p1d78dtq1ad4lofvv7crsc8q3', 1668067458, 'gxsess|a:3:{s:3:\"key\";s:32:\"5e2eaf7e1eec1fb1570fabbec51a304b\";s:4:\"time\";s:19:\"2022-11-10 07:55:50\";s:3:\"val\";a:3:{s:8:\"username\";s:4:\"coba\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"6\";}}'),
('7qi2i3dpd0qgc21l40vcquub7s', 1649628878, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('7rmo7auep83u8ssp4gcu7ste69', 1660717192, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('7tjs57uubu00ifd44i7o61nvbm', 1663489620, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('7ugq9kq79iij02kusjo74s062r', 1660721539, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('83iu6v0rjhbr1s32a6hr084b3q', 1661329917, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('85215qf42kb9b03odv32135a1c', 1649629920, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('86die80s0v13hfgkjme8irm5hv', 1676457911, 'gxsess|a:3:{s:3:\"key\";s:32:\"52d8179e1b75690079cb363a9dcf9f30\";s:4:\"time\";s:19:\"2023-02-15 10:21:33\";s:3:\"val\";a:3:{s:8:\"username\";s:4:\"coba\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"6\";}}'),
('86ekdkei9sgk5oqiteboqdckbh', 1645658517, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('8bdt5dqpc1gmatjc1c1r7nsgpj', 1676457879, 'gxsess|a:3:{s:3:\"key\";s:32:\"52d8179e1b75690079cb363a9dcf9f30\";s:4:\"time\";s:19:\"2023-02-15 10:21:33\";s:3:\"val\";a:3:{s:8:\"username\";s:4:\"coba\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"6\";}}'),
('8cekcgdd23f50e29qddtvc7o1l', 1645658677, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('8f9i37eecmcn54ft6eiqlk2kl1', 1668052972, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('8g00ie4dss0o676gd7kll9i3rn', 1661330159, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('8gn1m85j2mfbvi12epj49gdt22', 1661330373, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('8h010iaea62r1hl05k8711nrlm', 1676460438, 'gxsess|a:3:{s:3:\"key\";s:32:\"52d8179e1b75690079cb363a9dcf9f30\";s:4:\"time\";s:19:\"2023-02-15 10:21:33\";s:3:\"val\";a:3:{s:8:\"username\";s:4:\"coba\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"6\";}}'),
('8m7nb1nk7q57l574gdhu8rr54g', 1649628837, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('8ph26foivri4ltvl3d9qisvb74', 1645658681, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('8t30ck8d4aelqkppd8qhs3dbqu', 1663489647, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('901619ktd7qhuf132t2ebk5c4q', 1663489679, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('97sdnqshp49d3iplg1pjvi2m1h', 1653354218, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('99v8bainngj43bbo3ho8a6ft4t', 1651800330, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('9c0f3q8edvuirmfejoe30jmjd6', 1657178782, 'gxsess|a:3:{s:3:\"key\";s:32:\"b39cde8d5f4b97ea2f33dc67cadbad01\";s:4:\"time\";s:19:\"2022-07-07 07:26:15\";s:3:\"val\";a:0:{}}'),
('9gqhohi94noricvtne5d7tmgc0', 1661474876, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('9iognlll442tm4ql2une0aroje', 1661328712, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('9kpkccn0r0gpik2ohgrtd5h39o', 1660750349, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('9pvt1bhauoa2t0hmtoe8ho6f76', 1653353927, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('9sh17jgdmfrodg5kjm8tqafe9d', 1660525453, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:0:{}}'),
('9ta4oq2imhvjnt5hu22l86r476', 1663489576, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('a099rmjus2spd8g1qufool7flh', 1651799595, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('a16drk5jtcj7cqvhl874hf2ehi', 1649628819, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('a4rh797473qhp1hit3urtdeku0', 1660750346, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('a55an3kkdet0quhj8b1l8n63q3', 1651800244, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('a6auv09dvabfcjbfpcuf0lh4hf', 1645658396, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:0:{}}'),
('a6ttl5e6ghv9mj04ssder0vrmi', 1645658682, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('a7op7p6kj8o8io07solmpjd7pd', 1661329912, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('a7qnik4l95oscaquml1kpu4gop', 1649628872, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('a9u0aioeuabp527g1qj8t3q05g', 1676457920, 'gxsess|a:3:{s:3:\"key\";s:32:\"52d8179e1b75690079cb363a9dcf9f30\";s:4:\"time\";s:19:\"2023-02-15 10:21:33\";s:3:\"val\";a:3:{s:8:\"username\";s:4:\"coba\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"6\";}}'),
('abqo3j70qloidbnltip4a2fq2t', 1649630254, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('ac6oaispir89pg0o9c02hq8267', 1645658337, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:18:57\";s:3:\"val\";a:0:{}}'),
('ai49defui18l4e6497on9cnthp', 1668067706, 'gxsess|a:3:{s:3:\"key\";s:32:\"5e2eaf7e1eec1fb1570fabbec51a304b\";s:4:\"time\";s:19:\"2022-11-10 07:55:50\";s:3:\"val\";a:3:{s:8:\"username\";s:4:\"coba\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"6\";}}'),
('aqvh4kla38p577c0ibmba8l9ct', 1676457883, 'gxsess|a:3:{s:3:\"key\";s:32:\"52d8179e1b75690079cb363a9dcf9f30\";s:4:\"time\";s:19:\"2023-02-15 10:21:33\";s:3:\"val\";a:3:{s:8:\"username\";s:4:\"coba\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"6\";}}'),
('asaum18r6ju77ddfjrukmqj4er', 1676456478, 'gxsess|a:3:{s:3:\"key\";s:32:\"52d8179e1b75690079cb363a9dcf9f30\";s:4:\"time\";s:19:\"2023-02-15 10:21:15\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('b0vkeukt0fv377b34ftsrhal42', 1657178782, 'gxsess|a:3:{s:3:\"key\";s:32:\"b39cde8d5f4b97ea2f33dc67cadbad01\";s:4:\"time\";s:19:\"2022-07-07 07:26:15\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('b2vb95quit1pb84qjc9f16edv6', 1676482129, 'gxsess|a:3:{s:3:\"key\";s:32:\"52d8179e1b75690079cb363a9dcf9f30\";s:4:\"time\";s:19:\"2023-02-15 10:21:33\";s:3:\"val\";a:3:{s:8:\"username\";s:4:\"coba\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"6\";}}'),
('b37kjjrv9u0nj0fgl8leq7qg3b', 1649623954, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('b4eks8ipak8g9iln707ft0osea', 1661330213, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('b6er8n6jccjjmu7kjvbhobekm7', 1651703926, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('b8ucvq7jdbprnkhvrfl8lfg2kp', 1668067540, 'gxsess|a:3:{s:3:\"key\";s:32:\"5e2eaf7e1eec1fb1570fabbec51a304b\";s:4:\"time\";s:19:\"2022-11-10 07:55:50\";s:3:\"val\";a:3:{s:8:\"username\";s:4:\"coba\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"6\";}}'),
('b9ho2os6i0ai9bjls0686b5p92', 1660750109, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('ba8jlo7emcuu2b0jt6lf257dg6', 1645658337, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:18:57\";s:3:\"val\";a:0:{}}'),
('bapk0g7nokfcvjc9uu3cj12lb5', 1676457896, 'gxsess|a:3:{s:3:\"key\";s:32:\"52d8179e1b75690079cb363a9dcf9f30\";s:4:\"time\";s:19:\"2023-02-15 10:21:33\";s:3:\"val\";a:3:{s:8:\"username\";s:4:\"coba\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"6\";}}'),
('bdm5018hik0ppm7ahubtc6uoss', 1676482141, 'gxsess|a:3:{s:3:\"key\";s:32:\"31ec521c7e8ac8d8a47731e3666f03cc\";s:4:\"time\";s:19:\"2023-02-15 17:10:43\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('bfvmnbvmip27qs09qk6fprdv1l', 1676456503, 'gxsess|a:3:{s:3:\"key\";s:32:\"52d8179e1b75690079cb363a9dcf9f30\";s:4:\"time\";s:19:\"2023-02-15 10:21:33\";s:3:\"val\";a:0:{}}'),
('bhd2dhcls5kredom40mjf428ju', 1660750289, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('bk60v6lscksbkonl6pn2dvs8dh', 1649629873, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('bkcl81ihalq2g9lkrsnjaoovet', 1661406353, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('bknj2brfv3uv8230h5cckmmsi5', 1657178782, 'gxsess|a:3:{s:3:\"key\";s:32:\"b39cde8d5f4b97ea2f33dc67cadbad01\";s:4:\"time\";s:19:\"2022-07-07 07:26:15\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('bl1bccspgc10i02s1cb57o9t64', 1669689411, 'gxsess|a:3:{s:3:\"key\";s:32:\"9b11c494e875265da59b871e11186816\";s:4:\"time\";s:19:\"2022-11-29 02:34:52\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('bnpj4bjbu9hr5579c2k65fa0ov', 1660717109, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('bvukailt5l0pbs1nlee92de4k1', 1649628654, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('c0il4siq3l3cse1abhffdged7j', 1645658334, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:18:54\";s:3:\"val\";a:0:{}}'),
('c54viromqc364vaj37kst50215', 1651799559, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('cikovon9pa9brntkpioaqc30ev', 1661329915, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('cj3hie0r62asmpgoup5u6umabl', 1669689292, 'gxsess|a:3:{s:3:\"key\";s:32:\"9b11c494e875265da59b871e11186816\";s:4:\"time\";s:19:\"2022-11-29 02:34:52\";s:3:\"val\";a:0:{}}'),
('cj96vppbf7aof1rb8a6vit9th2', 1645658310, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:18:30\";s:3:\"val\";a:0:{}}'),
('cjc87o2pncm54pkn4k6l2bkoc5', 1651800277, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('co5dpppbdssf5u7nu0t6p13lfb', 1660750106, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('cplapphamaj2rdvm768d5ql7mu', 1649630565, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('cs9esh8f5bk4567p0mcari0mqd', 1649623889, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('ctqtbv8gagn2jacf8g9d5ge44a', 1651800151, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('cvifuf72vehdpg494p2809e9tn', 1676460433, 'gxsess|a:3:{s:3:\"key\";s:32:\"52d8179e1b75690079cb363a9dcf9f30\";s:4:\"time\";s:19:\"2023-02-15 10:21:33\";s:3:\"val\";a:3:{s:8:\"username\";s:4:\"coba\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"6\";}}'),
('d6r7hlosu7ucnge14rcb64urs8', 1669690218, 'gxsess|a:3:{s:3:\"key\";s:32:\"9b11c494e875265da59b871e11186816\";s:4:\"time\";s:19:\"2022-11-29 02:34:52\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('d92lmf9q6h0lidrocbor5ej525', 1660721665, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('d9gjqs9acj4a558n87vpqmqb0j', 1661329088, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('dal6e6rje2ugkqephu6f660vej', 1661329881, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('dan8t3aud6ip4k6spnb9k0jkcp', 1676482138, 'gxsess|a:3:{s:3:\"key\";s:32:\"31ec521c7e8ac8d8a47731e3666f03cc\";s:4:\"time\";s:19:\"2023-02-15 17:10:43\";s:3:\"val\";a:0:{}}'),
('dctvb22g3sea81k3fkq0kipojm', 1676482108, 'gxsess|a:3:{s:3:\"key\";s:32:\"52d8179e1b75690079cb363a9dcf9f30\";s:4:\"time\";s:19:\"2023-02-15 10:21:33\";s:3:\"val\";a:3:{s:8:\"username\";s:4:\"coba\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"6\";}}'),
('dfka05o06kfn1kgsbvsm01n8l8', 1651800191, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('dga10m8m4d8a3e7gd82ohh6l9s', 1645658394, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:54\";s:3:\"val\";a:0:{}}'),
('dh49v4a2le0ns0fj99r51pt8t2', 1668067358, 'gxsess|a:3:{s:3:\"key\";s:32:\"5e2eaf7e1eec1fb1570fabbec51a304b\";s:4:\"time\";s:19:\"2022-11-10 07:55:50\";s:3:\"val\";a:3:{s:8:\"username\";s:4:\"coba\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"6\";}}'),
('diqdil59nvk1fdmnristrc1vh6', 1663489676, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('djq3pe89ipem8na0u3sp2hthn7', 1661330210, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('dv2krqk3b918gf5khhgla6uh41', 1649629389, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('e1ulpt5g9ugbneebmrarp4jdmq', 1649629601, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('e21q38ce7g71e0het5uunml1ck', 1661474876, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('e2agshi76234nah9j92tn1d68o', 1645920208, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}');
INSERT INTO `sessions` (`id`, `access`, `data`) VALUES
('e2kh16elvor285n8pcdlfvkpsi', 1651800265, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('e52si0u5h68fhhq7iqoph1l08b', 1661490194, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('e57tbhelpvncnc4ceqjg5fkkhc', 1660727526, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('e5h6t3v2m43ug1vlcnh93av2if', 1645919152, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('e8cego34f4bgrs8mit46ta99vs', 1661329123, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('ebkmifa73ouhtnsats17hpfqtc', 1645658385, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:45\";s:3:\"val\";a:0:{}}'),
('edsdkje1a8c5kepv2cskkeuv76', 1669689383, 'gxsess|a:3:{s:3:\"key\";s:32:\"9b11c494e875265da59b871e11186816\";s:4:\"time\";s:19:\"2022-11-29 02:34:52\";s:3:\"val\";a:0:{}}'),
('efdgb067hvb8q36r0pvs7t397m', 1649628832, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('efpon16ck8oek37cagof14qn3u', 1660721534, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('ein3q4bbgmuomipoaapigmkgqm', 1669689383, 'gxsess|a:3:{s:3:\"key\";s:32:\"9b11c494e875265da59b871e11186816\";s:4:\"time\";s:19:\"2022-11-29 02:34:52\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('eiq2ot8um615jt25anrtao9ufj', 1657178775, 'gxsess|a:3:{s:3:\"key\";s:32:\"b39cde8d5f4b97ea2f33dc67cadbad01\";s:4:\"time\";s:19:\"2022-07-07 07:26:15\";s:3:\"val\";a:0:{}}'),
('ejkn6c2nmpp46871f09lhbj4en', 1668067409, 'gxsess|a:3:{s:3:\"key\";s:32:\"5e2eaf7e1eec1fb1570fabbec51a304b\";s:4:\"time\";s:19:\"2022-11-10 07:55:50\";s:3:\"val\";a:3:{s:8:\"username\";s:4:\"coba\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"6\";}}'),
('eko2154ef88tv1r9kl1hlrimmj', 1661329056, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('evmtk6fsb35m2n301b91il4pjv', 1660527081, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('f38giu5n1pmtimcupnh9dc8fu0', 1660749390, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('f3vuqhg8150p79qv794d42p4cs', 1649629917, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('f56pbdt8q5um1k125j2imupaet', 1645658395, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:55\";s:3:\"val\";a:0:{}}'),
('f5l5kajnv9iqb6bc9ajonu8mfp', 1660525459, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('f66rp0hhp8plf9divae1fcsusu', 1649628574, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('f6qe6vuhpcafp31ctemksc1ej1', 1649628799, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('f8d92e575jqt12fs2jfaivj8au', 1660750394, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('feh9k575d260h6uutlp5ja53bq', 1660748901, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('fevd34clemj3bf78k0r27jkb0k', 1660748698, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('fgkai8ebvnm0f0s4m7nan8c03p', 1651798250, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('flj98k368reag63ldcdh23vgh1', 1661476869, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('fm7n2gig2ru9s4qdos3solp00j', 1649629394, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('fv8v066nhhmno9io2hsdcssso0', 1663489560, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('fvjp7elo4qn9uml83skjqohrkj', 1661330087, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('g04pniejg0ijk8vsejerqalkrd', 1645658465, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('g07r4omahpfdsgitran0k020n0', 1651800119, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('g0isa89q01si71dphtjedkl6o9', 1663489568, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('g18ddr05nv7vg10c51f56vvirr', 1661330350, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('g19qc64dcng5msa11sfnlv0484', 1651800358, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('g61na5bkftq6r47q85aq9h2012', 1668154062, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('g84a8h7u2n0gi4gj1gqfcrqj8g', 1676457743, 'gxsess|a:3:{s:3:\"key\";s:32:\"52d8179e1b75690079cb363a9dcf9f30\";s:4:\"time\";s:19:\"2023-02-15 10:21:33\";s:3:\"val\";a:3:{s:8:\"username\";s:4:\"coba\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"6\";}}'),
('gb4jo5f74duu549b3o2mcb9g7k', 1657178775, 'gxsess|a:3:{s:3:\"key\";s:32:\"b39cde8d5f4b97ea2f33dc67cadbad01\";s:4:\"time\";s:19:\"2022-07-07 07:26:15\";s:3:\"val\";a:0:{}}'),
('gccrr7muslftvgdkk5ams5487r', 1661329917, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('gcovrp13buovirakpur5pte7b5', 1663489681, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('gdg5s4v1d8mva3qjf24bgjuv5g', 1668067465, 'gxsess|a:3:{s:3:\"key\";s:32:\"5e2eaf7e1eec1fb1570fabbec51a304b\";s:4:\"time\";s:19:\"2022-11-10 07:55:50\";s:3:\"val\";a:3:{s:8:\"username\";s:4:\"coba\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"6\";}}'),
('ge63ddnga0ibvii7b2i1fhja54', 1668067500, 'gxsess|a:3:{s:3:\"key\";s:32:\"5e2eaf7e1eec1fb1570fabbec51a304b\";s:4:\"time\";s:19:\"2022-11-10 07:55:50\";s:3:\"val\";a:3:{s:8:\"username\";s:4:\"coba\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"6\";}}'),
('gfa81ipvekj3og1u3n665ffdtg', 1661330162, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('gg8m7p2a7q8evimpg8sdmeb54v', 1660717148, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('gi2sjdabr47evipmgviq365gsu', 1660721395, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('gii66auom5fhchi3iuc96kvefb', 1649623964, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('gjmupk8sgukodv8gnivlaj24lc', 1649629372, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('gjo6ul8gc7efd4qe8t743t424r', 1645918915, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('gkc6hjqmsngor4u3e5l4sdm69n', 1651799641, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('gl37m92r5ev420cfi9daabncan', 1649630396, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('glodkbpri30j14umsfj4b5fir0', 1649624606, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('gm7o1m7oghgoto01k61cbqst75', 1649626108, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('gnkqinhaps2e1ngf7g99nc71ir', 1661329874, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('gp0aj3t32clh7hmasji0l581sa', 1661474869, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('gu3jedcg84tiahg06j6cr4nuc7', 1676460436, 'gxsess|a:3:{s:3:\"key\";s:32:\"52d8179e1b75690079cb363a9dcf9f30\";s:4:\"time\";s:19:\"2023-02-15 10:21:33\";s:3:\"val\";a:3:{s:8:\"username\";s:4:\"coba\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"6\";}}'),
('gudacstuc7psvh70aahpr438j4', 1661329102, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('h1ih0e1idudac4ct0uqm1thhtb', 1668067514, 'gxsess|a:3:{s:3:\"key\";s:32:\"5e2eaf7e1eec1fb1570fabbec51a304b\";s:4:\"time\";s:19:\"2022-11-10 07:55:50\";s:3:\"val\";a:3:{s:8:\"username\";s:4:\"coba\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"6\";}}'),
('h1kmbn533a9alcbb2a5hmd6pf0', 1669689336, 'gxsess|a:3:{s:3:\"key\";s:32:\"9b11c494e875265da59b871e11186816\";s:4:\"time\";s:19:\"2022-11-29 02:34:52\";s:3:\"val\";a:0:{}}'),
('h4i08prm9c55smnbtfn805aso6', 1661474886, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('hbmqsglg9s5ehm2lcm9upgt4md', 1669689292, 'gxsess|a:3:{s:3:\"key\";s:32:\"9b11c494e875265da59b871e11186816\";s:4:\"time\";s:19:\"2022-11-29 02:34:52\";s:3:\"val\";a:0:{}}'),
('hhd0jktc0alohe8slmu748ta64', 1661330204, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('hj88ufkga0k51dksb7id0a27ia', 1669689533, 'gxsess|a:3:{s:3:\"key\";s:32:\"9b11c494e875265da59b871e11186816\";s:4:\"time\";s:19:\"2022-11-29 02:34:52\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('hk97mdd00uvaf22slibfan0ivg', 1676482138, 'gxsess|a:3:{s:3:\"key\";s:32:\"31ec521c7e8ac8d8a47731e3666f03cc\";s:4:\"time\";s:19:\"2023-02-15 17:10:43\";s:3:\"val\";a:0:{}}'),
('hn7mnmk7hi14lqei7lu3fip73b', 1661328912, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('hq1lskj2h9898ua92b2p3fcdkp', 1668154066, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('hqf6rop0il555idip3gg2eartl', 1663489646, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('i6sb89gs5m9dkj2g40ip7034qg', 1645920107, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('i7r4m1458gggnp5c84h6pc192e', 1676456485, 'gxsess|a:3:{s:3:\"key\";s:32:\"52d8179e1b75690079cb363a9dcf9f30\";s:4:\"time\";s:19:\"2023-02-15 10:21:15\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('i8beimfl1679q3al7jga56g9sc', 1649624531, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('iaopklj8hnf9tlhdhmuhsrg9et', 1660750133, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('ickt35hrpcs5u8kqmcfhan1v3v', 1645658465, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('id83sa0mitubgds5stnn52bdm7', 1649630653, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('ijfqot8h2jqcvjhb1q9oh11jai', 1649624544, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('inond3tucss7c0ma74386rufdu', 1676482141, 'gxsess|a:3:{s:3:\"key\";s:32:\"31ec521c7e8ac8d8a47731e3666f03cc\";s:4:\"time\";s:19:\"2023-02-15 17:10:43\";s:3:\"val\";a:0:{}}'),
('ioqf4fbqi9r3lat2pi2kiq8s8o', 1661330166, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('ip5tvp9r39163vatop1i2bukcj', 1676457891, 'gxsess|a:3:{s:3:\"key\";s:32:\"52d8179e1b75690079cb363a9dcf9f30\";s:4:\"time\";s:19:\"2023-02-15 10:21:33\";s:3:\"val\";a:3:{s:8:\"username\";s:4:\"coba\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"6\";}}'),
('itj78ncc651vv4kcr0las4n4jp', 1645919115, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('ivb01hptas4v86nfrtua8jegea', 1661330075, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('j00c599g9vsbp0qmoje4pak3q8', 1660717171, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('j03dc7ae3thtkt7r9kqlr7brpl', 1660748745, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('j0pqrr2i54k44e59k0e0hc8qde', 1653354220, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('jdm4pbau70sk8m5un4ldkhfeg7', 1676458445, 'gxsess|a:3:{s:3:\"key\";s:32:\"52d8179e1b75690079cb363a9dcf9f30\";s:4:\"time\";s:19:\"2023-02-15 10:21:33\";s:3:\"val\";a:3:{s:8:\"username\";s:4:\"coba\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"6\";}}'),
('jfeu3hl7qpjp83jghjd400pqt0', 1660731991, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('jgjnaf3q5nhlm4lpdtp2ki521e', 1668066950, 'gxsess|a:3:{s:3:\"key\";s:32:\"5e2eaf7e1eec1fb1570fabbec51a304b\";s:4:\"time\";s:19:\"2022-11-10 07:55:50\";s:3:\"val\";a:0:{}}'),
('jhcn8jhaq2gu7hchdfue4gquhm', 1661329939, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('jknl6cs1nt4r4ttft3vmg4p3et', 1663489677, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('jkt5i44od6jlc2f5js521olamn', 1661474858, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('jm80qkoq5v929ovhs0k3jg8hbe', 1649629023, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('jpkbsn4m3kp2vmtp6352foarbi', 1661328929, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('k1gn01pq4kk4iqj039ibnhpikg', 1676457917, 'gxsess|a:3:{s:3:\"key\";s:32:\"52d8179e1b75690079cb363a9dcf9f30\";s:4:\"time\";s:19:\"2023-02-15 10:21:33\";s:3:\"val\";a:3:{s:8:\"username\";s:4:\"coba\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"6\";}}'),
('k1oa3bcu36jnlmr7v8jjqm5aoc', 1663489745, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('k27q6fjlfoplavmus43ubbcnav', 1661329917, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('k4o7b258oo0j9b461og8fo8o1h', 1660748905, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('k5cnlvp15ldoh999uvbvhqorpb', 1676456475, 'gxsess|a:3:{s:3:\"key\";s:32:\"52d8179e1b75690079cb363a9dcf9f30\";s:4:\"time\";s:19:\"2023-02-15 10:21:15\";s:3:\"val\";a:0:{}}'),
('k5h57stovpt2gls50gllar2icv', 1668066985, 'gxsess|a:3:{s:3:\"key\";s:32:\"5e2eaf7e1eec1fb1570fabbec51a304b\";s:4:\"time\";s:19:\"2022-11-10 07:55:50\";s:3:\"val\";a:0:{}}'),
('k5lflbhtitolelqesa9tl9d3sc', 1661474882, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('k7u3hr7viufppajf3t24qrhqc6', 1661329147, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('kakk9rhskvs649ht4rmkckgp65', 1676457926, 'gxsess|a:3:{s:3:\"key\";s:32:\"52d8179e1b75690079cb363a9dcf9f30\";s:4:\"time\";s:19:\"2023-02-15 10:21:33\";s:3:\"val\";a:3:{s:8:\"username\";s:4:\"coba\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"6\";}}'),
('katduert33h7pt9o4bfb8mqvn8', 1651799293, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('kf67dve6q5h6qmvurunaa7dhqk', 1676456493, 'gxsess|a:3:{s:3:\"key\";s:32:\"52d8179e1b75690079cb363a9dcf9f30\";s:4:\"time\";s:19:\"2023-02-15 10:21:33\";s:3:\"val\";a:0:{}}'),
('kglfb1lslm187isbu2gekqu3pl', 1649628561, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('kimpvad71r2i9vultd4lbnj4vq', 1660731988, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('kj1tjskmehgbihormh7u4e2t2m', 1668067354, 'gxsess|a:3:{s:3:\"key\";s:32:\"5e2eaf7e1eec1fb1570fabbec51a304b\";s:4:\"time\";s:19:\"2022-11-10 07:55:50\";s:3:\"val\";a:3:{s:8:\"username\";s:4:\"coba\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"6\";}}'),
('knklko3mh0hb2v3cojmkb4aj8f', 1660750223, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('kob2l4t5acdpun72m86gqsndmh', 1660757738, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('kpnpingnbvkch8l1p85thqr1fm', 1661329886, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('kprbpeq3cr3flcdsa5bp4o7cb1', 1649629492, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('kq2kumlh7bpk9oqak4256mcbu9', 1661476660, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('kqt56cq1qa6at6em33aeuf7jaf', 1660717090, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('kuh9ubs263prlnt0j8h1upl1mt', 1649629426, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('l19qvcv1rd23g3ric0abq2r82t', 1649626025, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('l1nfdrhlallvr67etjn4q8k62b', 1645658475, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('leg8dkf2b39hmuk17rs894dtc2', 1661329912, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('lgpo886tjg1btfq5134mh09sff', 1663489679, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('lil5th11la9mcd13u5qimpp0p5', 1661330343, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('lk7rqivfu8s9eg40cceivm69n4', 1663489654, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('lkftdo2ksb5va7p24rc1e9r3q9', 1645658321, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:18:41\";s:3:\"val\";a:0:{}}'),
('lm905afb7h87fqqdhte524dg9g', 1660717187, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('lsc4p3ondllpve38qbs97bh4u5', 1661330092, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('ltepcofeiun5j2uspoqv2q3iqs', 1651799131, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('m0nhhugbbkd29at8bmtjesl997', 1649623744, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('m6ju8jed81l3cab66fbcs2620a', 1649630657, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('m8guesg1rr0vatvt6268qthjcf', 1660750243, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('m9658ra35q2vfo9emt5vjo5ogd', 1660757292, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('m98fi94sft30tefbelpv5513eh', 1651800269, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('mcevkqkndi246u0ceqq1on6p1v', 1661330356, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('me1nthas4e56cumnf3qse6nq25', 1649630417, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('mek5speomvktb4gbsk4r45l9bs', 1676481043, 'gxsess|a:3:{s:3:\"key\";s:32:\"31ec521c7e8ac8d8a47731e3666f03cc\";s:4:\"time\";s:19:\"2023-02-15 17:10:43\";s:3:\"val\";a:0:{}}'),
('mhj34q44hvfqq7e48rdl9nheie', 1651800382, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('mkbgt2h51bibbgtkf5fo9ram35', 1660750295, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('mkukhngb0o1sst3c4ppamfkmvc', 1651799425, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('mlettog9k451gctj06s8hplfsb', 1661474877, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('mls3se3kgflnbs1ut9kj63rrtj', 1660721403, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('mlue8dnq6hr9fss7fh5tnf53oa', 1661474872, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('mn7ptat2a7nbrgv4baqt9nogqa', 1663489669, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('mnvrl90nduol4ro6nbmaqrkme8', 1661329914, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('mr7e8do1gq4rpbne7nsvj6bij6', 1661328948, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('n1s3ct6gaaeak4647u8vvcckhr', 1649630517, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('n5mvboqe9e8so81fc6f4tmf8s7', 1649628741, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('n8bpv56c4a18tvepsh6rlue1bp', 1661329919, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('n9v3fl16oli6rt4t43ules95us', 1661474872, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('na22bedngl2jbeltugls2prnhb', 1676457886, 'gxsess|a:3:{s:3:\"key\";s:32:\"52d8179e1b75690079cb363a9dcf9f30\";s:4:\"time\";s:19:\"2023-02-15 10:21:33\";s:3:\"val\";a:3:{s:8:\"username\";s:4:\"coba\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"6\";}}'),
('nargv5r0rphrliudvgr3rcdoiv', 1649628748, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('ndpsme0rt7i8d5sgua6ub18gbh', 1649630031, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('ndtg5smh0etlkosg5kbk608pgr', 1660721613, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('nfk52u732bk4r2op64t9mklcu9', 1661329917, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('nftt6bmtco5it65igj0055k4cj', 1661400185, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('nga5l2k4355a18hbb6rvotv8gd', 1645658321, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:18:41\";s:3:\"val\";a:0:{}}'),
('o9u3jgkosdlsbmobanbuvbanu0', 1660721542, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('oa2i0q6srs2eumc3202otoe4vd', 1676457922, 'gxsess|a:3:{s:3:\"key\";s:32:\"52d8179e1b75690079cb363a9dcf9f30\";s:4:\"time\";s:19:\"2023-02-15 10:21:33\";s:3:\"val\";a:3:{s:8:\"username\";s:4:\"coba\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"6\";}}'),
('obkvkb21s7f625nqg8sm8k6l36', 1660757307, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('odgqkfu7vm37j09l92hdj88g1k', 1660525453, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:0:{}}'),
('oej7jltr69b4d66paclt3o4ncq', 1645658320, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:18:40\";s:3:\"val\";a:0:{}}'),
('oek4sh8uk8gid5ilidtf3vk0pk', 1645658350, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:10\";s:3:\"val\";a:0:{}}'),
('og49fpspe03d5ab4kfneoup941', 1660527086, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('oo5ul7dlm1alshpj3bbddiku8q', 1661329917, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('oqq5i5kbpeb3339ci30h9agcfa', 1661518021, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('p3n1gi3c4eo3u1uthithioad41', 1651799164, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('p4jcjmqloo8626obmmlkvsboiu', 1649624563, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('p54dj7alhfe3dsajrtcglnr3mi', 1651800316, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('p56a30l0jpqiskpq8fl7tmafks', 1661329183, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('p7l67d04i3lg6gnesoj01ume0g', 1651799696, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('p9tou7530r9l65o7pt2hh1863o', 1660525469, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('palfrbepmti524rhasmot38uf4', 1651799331, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('pat44c3avkkln335qn1n7sjvuu', 1651799340, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('pdt0bkf0uvbh8lvebkh2ijdcov', 1668066950, 'gxsess|a:3:{s:3:\"key\";s:32:\"5e2eaf7e1eec1fb1570fabbec51a304b\";s:4:\"time\";s:19:\"2022-11-10 07:55:50\";s:3:\"val\";a:0:{}}'),
('peb7s8pfi3akvmh56992usjnao', 1660757735, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('peenm5ua8rp8thmdnssv78sdad', 1649629480, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('peeoejkgql1vl5pp40p0gsu722', 1649538097, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('pgq8sqr1d89jca6q88f0e71m79', 1676456527, 'gxsess|a:3:{s:3:\"key\";s:32:\"52d8179e1b75690079cb363a9dcf9f30\";s:4:\"time\";s:19:\"2023-02-15 10:21:33\";s:3:\"val\";a:3:{s:8:\"username\";s:4:\"coba\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"6\";}}'),
('pio4c3hubupnnsu0bnukage2d3', 1660721616, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('pmvu221gi6ak18abcma40j181o', 1661329165, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('po4bvstueno7jd1kfolm5ot1ip', 1661474876, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('pp8p8s06jvgd68u6nlotri3o10', 1651799721, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('pqte2q3608cvld9kmasojnulq6', 1661329913, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('pqtv8eua8rh12m0pph77tndi4i', 1645920118, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('pr79dnqq5tims3krodvuoma3ja', 1649629423, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('psdpe7afq2cp9ctpbcfuepb5tb', 1661474873, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('psvu360h9olebkvjkf3iu453p1', 1649630138, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('ptbuhd2girqm95era136n2pnpu', 1651800012, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('ptv2cnt3d45d8v66m1kkejnj5k', 1661330113, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('pu7agbq2n2dgqmadug2i166vtl', 1661329915, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('puijii3tm0nf67t69s8j5fthhq', 1660747730, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('q4j8519vq034t94nn8mb8djckr', 1651799458, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('qd350o9coihd8iqdam6pijbgn3', 1653353969, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('qhd5qfmcdiq57ejmceff3pjkpk', 1668067468, 'gxsess|a:3:{s:3:\"key\";s:32:\"5e2eaf7e1eec1fb1570fabbec51a304b\";s:4:\"time\";s:19:\"2022-11-10 07:55:50\";s:3:\"val\";a:3:{s:8:\"username\";s:4:\"coba\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"6\";}}'),
('qk0c3uq61gjqj5cnbse0pelv37', 1661329912, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('ql5c7bjqor8embrdnoggoobv96', 1649630277, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('qogdpc8u5276ipbujktcb83j7q', 1649629007, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('qoice9q9er9mic3oi9614ovk1h', 1660748702, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('qp5chca04cag0jshsccl6snr1p', 1660717115, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('qtacsb889f63ige44ols2lpnqq', 1663489704, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('qvg5j0ooevhhi5fgmom74njq6j', 1676457741, 'gxsess|a:3:{s:3:\"key\";s:32:\"52d8179e1b75690079cb363a9dcf9f30\";s:4:\"time\";s:19:\"2023-02-15 10:21:33\";s:3:\"val\";a:3:{s:8:\"username\";s:4:\"coba\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"6\";}}'),
('r232pstt32u8g7kvllm9jke70r', 1660527416, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('r3imnvc6oiju9mcgooth50frd5', 1649625927, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('r8hvc0rnkl2469v14n0idag6tf', 1649630351, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('rd48lbkrcm8lub4iuj8104liaq', 1651799171, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('rfsjtun9qgge9rn4mepdbfa6rf', 1676456503, 'gxsess|a:3:{s:3:\"key\";s:32:\"52d8179e1b75690079cb363a9dcf9f30\";s:4:\"time\";s:19:\"2023-02-15 10:21:33\";s:3:\"val\";a:3:{s:8:\"username\";s:4:\"coba\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"6\";}}'),
('rgscfkd8cc1bu0e2lb9cjcsecr', 1668067443, 'gxsess|a:3:{s:3:\"key\";s:32:\"5e2eaf7e1eec1fb1570fabbec51a304b\";s:4:\"time\";s:19:\"2022-11-10 07:55:50\";s:3:\"val\";a:3:{s:8:\"username\";s:4:\"coba\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"6\";}}'),
('rmjv9mmadi1vor2r64hb8ks1nq', 1661328917, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('rtgmf4nk63vsahtj4kg97e998d', 1660750391, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('s6p6si9kh6aqf7acbu96u6hf1m', 1645919090, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('sai9jb3358dn6f8bced7ik01f1', 1661328723, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('sb2fq8ajl9a6t1jt4pnhai2bmd', 1651799148, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('scfan69n331pk0p75is5db8do9', 1663489658, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('scku9sv4l2jtad0tdhnccuv14l', 1668067007, 'gxsess|a:3:{s:3:\"key\";s:32:\"5e2eaf7e1eec1fb1570fabbec51a304b\";s:4:\"time\";s:19:\"2022-11-10 07:55:50\";s:3:\"val\";a:3:{s:8:\"username\";s:4:\"coba\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"6\";}}'),
('sdj81dkhm79kr3itvr875j8s3q', 1663489646, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('sk5hcf3oqa4oah20im60h8t4ba', 1645658337, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:18:57\";s:3:\"val\";a:0:{}}'),
('skvdg9ppe36kt1lvqmccpkggt3', 1676456508, 'gxsess|a:3:{s:3:\"key\";s:32:\"52d8179e1b75690079cb363a9dcf9f30\";s:4:\"time\";s:19:\"2023-02-15 10:21:33\";s:3:\"val\";a:3:{s:8:\"username\";s:4:\"coba\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"6\";}}');
INSERT INTO `sessions` (`id`, `access`, `data`) VALUES
('sn1vsufo4qfovo6mug4htbrrr3', 1651799394, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('sq7m9l0itu8v6ppr4h34mfo24f', 1649625915, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('sqqhoua399vm1aq0d6v22bv6em', 1661477346, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('srkfr62p0g6jtgd1oriv292io1', 1645658336, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:18:56\";s:3:\"val\";a:0:{}}'),
('sso2aj249cqv1vsnsafparkip3', 1649630500, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('st3iguft3de00nd5ni61f2lqpo', 1649626029, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('t91kvetr31ppv9un38jlqksvra', 1663489661, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('tg2nevc61cesccmq6jjj371fui', 1649623936, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('tin21rgnunt5dkcc5etitfe9rt', 1645920131, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('tjqr178ualtced8r3aql08213u', 1660717203, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('tm9lanlaa4u8lu730a2p8v2jn9', 1661329915, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('ts662rq2svq3ge3urejsm28q16', 1660717083, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('u17blqq7j0rs080rp4rhn858cv', 1661474900, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('u1emi1frp4d77el9vkfdsaj8ic', 1676482147, 'gxsess|a:3:{s:3:\"key\";s:32:\"31ec521c7e8ac8d8a47731e3666f03cc\";s:4:\"time\";s:19:\"2023-02-15 17:10:43\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('u4sjavn0l5c6v9a76ea27dcg86', 1676457745, 'gxsess|a:3:{s:3:\"key\";s:32:\"52d8179e1b75690079cb363a9dcf9f30\";s:4:\"time\";s:19:\"2023-02-15 10:21:33\";s:3:\"val\";a:3:{s:8:\"username\";s:4:\"coba\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"6\";}}'),
('u7muljsgf0nk0ng7isic8ibc65', 1645658516, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('ubovnpgdkltciqr9bdh43ecsom', 1649628732, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('udt78rnlrnmuj328dp4j5tc13v', 1663489647, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('ufuk4ln4atdq6is9jf9qo4broa', 1660724627, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('ui49t5h46qogeoep726icjjr8i', 1676456475, 'gxsess|a:3:{s:3:\"key\";s:32:\"52d8179e1b75690079cb363a9dcf9f30\";s:4:\"time\";s:19:\"2023-02-15 10:21:15\";s:3:\"val\";a:0:{}}'),
('un2lj8gjdac0bbpddnt4ik06bk', 1661474881, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('uni7pkgut4lruj8q54b1m2teui', 1649629867, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('upangpj6fvmfndctt123bggfpf', 1660717120, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('ur02qsgtb9hgvqi4g58760ogb9', 1669689474, 'gxsess|a:3:{s:3:\"key\";s:32:\"9b11c494e875265da59b871e11186816\";s:4:\"time\";s:19:\"2022-11-29 02:34:52\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('urhl6kuh8hsmcfkag3ig1n1ikb', 1649628441, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('ut4uji4vku3msfs814s49sm502', 1668066978, 'gxsess|a:3:{s:3:\"key\";s:32:\"5e2eaf7e1eec1fb1570fabbec51a304b\";s:4:\"time\";s:19:\"2022-11-10 07:55:50\";s:3:\"val\";a:0:{}}'),
('v16n55f173jmg0n7fddatf8f5f', 1645658334, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:18:54\";s:3:\"val\";a:0:{}}'),
('v2l1n3dii0sqprcsuh3b8h2kf3', 1676457890, 'gxsess|a:3:{s:3:\"key\";s:32:\"52d8179e1b75690079cb363a9dcf9f30\";s:4:\"time\";s:19:\"2023-02-15 10:21:33\";s:3:\"val\";a:3:{s:8:\"username\";s:4:\"coba\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"6\";}}'),
('va3e68f5m4pjun7dige8uq6lbh', 1649628745, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('vad72nde16d9ulegto1r1815gc', 1649623903, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('vd48eeo1jpnrcpugh1kn5ngbp1', 1645920778, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('vevrdu73h8b99fvb0p05li8ou4', 1645658452, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:0:{}}'),
('viivk9gcrndhr4dtthlv4v9kns', 1649629405, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('vil36gfht8nj9gejjr6214fgsq', 1651799384, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('vj7dark3c4uherf8g25foqja52', 1660750240, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('vjlvb9rsa1sba2n3iltf81550s', 1668066985, 'gxsess|a:3:{s:3:\"key\";s:32:\"5e2eaf7e1eec1fb1570fabbec51a304b\";s:4:\"time\";s:19:\"2022-11-10 07:55:50\";s:3:\"val\";a:3:{s:8:\"username\";s:4:\"coba\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"6\";}}'),
('vnlj0or2ff3q0h06829puucee5', 1661329934, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('voicv6n205ll42a3lsh2r1q035', 1645658450, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:0:{}}'),
('voroav8fn2pai2hagv83c5hegt', 1661474882, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('vq645s3eumnl66p883bf30kq4m', 1645658685, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('vqbir974rr8irc03j397fj936b', 1661329915, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('vsuqa5t1ngc067kpfllo2inh1l', 1661400436, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('vtdhd24hjt9vu5tfvimhfp01te', 1651800005, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('vv45q8v121t955tc03166hv1ih', 1661477337, 'gxsess|a:3:{s:3:\"key\";s:32:\"f46c94837acadaff13949e7ddfe24229\";s:4:\"time\";s:19:\"2022-08-15 01:04:13\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}'),
('vvnrrreq0dvtng664k53mt6f91', 1651799121, 'gxsess|a:3:{s:3:\"key\";s:32:\"42b5f9a4f07b3ca7fba62129ca5617a7\";s:4:\"time\";s:19:\"2022-02-23 23:19:56\";s:3:\"val\";a:3:{s:8:\"username\";s:5:\"admin\";s:8:\"loggedin\";b:1;s:5:\"group\";s:1:\"0\";}}');

-- --------------------------------------------------------

--
-- Table structure for table `supermasters`
--

CREATE TABLE `supermasters` (
  `ip` varchar(64) NOT NULL,
  `nameserver` varchar(255) NOT NULL,
  `account` varchar(40) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` bigint(20) NOT NULL,
  `date` datetime NOT NULL,
  `owner` varchar(32) NOT NULL,
  `team` varchar(32) NOT NULL,
  `click_id` varchar(32) DEFAULT NULL,
  `s1` varchar(32) DEFAULT NULL,
  `s2` varchar(32) DEFAULT NULL,
  `s3` varchar(32) DEFAULT NULL,
  `s4` varchar(32) DEFAULT NULL,
  `s5` varchar(32) DEFAULT NULL,
  `link_offer` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `date`, `owner`, `team`, `click_id`, `s1`, `s2`, `s3`, `s4`, `s5`, `link_offer`) VALUES
(1, '2020-10-11 02:53:51', 'admin', 'TeamOne', 'TeamOne', 'TeamOne', 'TeamOne', 'TeamOne', 'TeamOne', 'TeamOne', ''),
(3, '2020-10-14 11:43:12', 'admin', 'ONEX', 'ONEX', 'ONEX', 'ONEX', 'ONEX', 'ONEX', 'ONEX', 'https://www.google.com');

-- --------------------------------------------------------

--
-- Table structure for table `trx`
--

CREATE TABLE `trx` (
  `id` bigint(20) NOT NULL,
  `date` datetime NOT NULL,
  `invnum` varchar(48) NOT NULL,
  `transaction_id` varchar(128) NOT NULL,
  `amount` double NOT NULL,
  `type` varchar(32) NOT NULL,
  `process_time` datetime NOT NULL,
  `status` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tsigkeys`
--

CREATE TABLE `tsigkeys` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `algorithm` varchar(50) DEFAULT NULL,
  `secret` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` bigint(32) NOT NULL,
  `userid` varchar(32) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `confirm` varchar(255) DEFAULT NULL,
  `group` enum('0','1','2','3','4','5','6') NOT NULL,
  `email` varchar(255) NOT NULL,
  `join_date` datetime NOT NULL,
  `status` enum('0','1') NOT NULL,
  `activation` text,
  `ipaddress` text,
  `forward_url` varchar(255) DEFAULT NULL,
  `referrer` varchar(32) NOT NULL,
  `hitstat` varchar(128) DEFAULT NULL,
  `forward_web` varchar(128) DEFAULT NULL,
  `forward_wap` varchar(128) DEFAULT NULL,
  `avatar` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `userid`, `pass`, `confirm`, `group`, `email`, `join_date`, `status`, `activation`, `ipaddress`, `forward_url`, `referrer`, `hitstat`, `forward_web`, `forward_wap`, `avatar`) VALUES
(1, 'admin', '70124eacb88225d188d49eb410d5e532', NULL, '0', 'metalgenix@gmail.com', '2020-02-03 06:08:25', '1', NULL, NULL, '{\"ALL\":[\"https:\\/\\/www.facebook.com\\/\"]}', '', 'http://localhost/reportmulti/hitstats.php?ip={ip}&amp;country={country}&amp;device={device}', '{\"ALL\":[\"\"]}', '{\"ALL\":[\"\"]}', 'images/avatars/cover-stream-grab-uid.png'),
(3, 'demotes', 'eedda7550fb8a93815b1af9fbee948a8', NULL, '6', 'dedy@gmail.com', '2020-02-04 04:33:15', '1', NULL, NULL, 'https://detik.com', '', '', '', '', ''),
(4, 'testing', 'd61eed36d0451c2d35b39d54459ab0d7', NULL, '6', '', '2020-03-08 14:56:01', '1', NULL, NULL, '', '', '', '', '', ''),
(5, 'coba', '21b0f53d9858d84fa15c4e663c9460c2', NULL, '6', 'coba@gnx.red', '2020-09-09 13:38:21', '1', 'm0qKlAIptmddE2XXkgywLwIpr6E15e3rIWVslB6PHuBImm2oQhSu6iVRqxsl', NULL, '{\"ALL\":[\"\"]}', '', '', '{\"ALL\":[\"\"]}', '{\"ALL\":[\"\"]}', ''),
(6, 'woo', '6cd9a40bb1e20a623164488d4191f81e', NULL, '6', 'woo@gnx.red', '2020-09-09 13:41:17', '1', 'GqqqlOF6PdDj7TePclIYJJjxMPL7IQYFgtIV9s535QNzD6qc1evfWgsHyKRS', NULL, '{\"ALL\":[\"http:\\/\\/localhost\\/cloacker2\\/index.php\"]}', '', '', '{\"ALL\":[\"\"]}', '{\"ALL\":[\"\"]}', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `captions`
--
ALTER TABLE `captions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_name_type_idx` (`name`,`type`),
  ADD KEY `comments_order_idx` (`domain_id`,`modified_at`);

--
-- Indexes for table `cryptokeys`
--
ALTER TABLE `cryptokeys`
  ADD PRIMARY KEY (`id`),
  ADD KEY `domainidindex` (`domain_id`);

--
-- Indexes for table `dailystats`
--
ALTER TABLE `dailystats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `domainmetadata`
--
ALTER TABLE `domainmetadata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `domainmetadata_idx` (`domain_id`,`kind`);

--
-- Indexes for table `domains`
--
ALTER TABLE `domains`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_index` (`name`);

--
-- Indexes for table `gen_link`
--
ALTER TABLE `gen_link`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hitstat`
--
ALTER TABLE `hitstat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `records`
--
ALTER TABLE `records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nametype_index` (`name`,`type`),
  ADD KEY `domain_id` (`domain_id`),
  ADD KEY `ordername` (`ordername`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supermasters`
--
ALTER TABLE `supermasters`
  ADD PRIMARY KEY (`ip`,`nameserver`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trx`
--
ALTER TABLE `trx`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tsigkeys`
--
ALTER TABLE `tsigkeys`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `namealgoindex` (`name`,`algorithm`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `captions`
--
ALTER TABLE `captions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cryptokeys`
--
ALTER TABLE `cryptokeys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dailystats`
--
ALTER TABLE `dailystats`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `domainmetadata`
--
ALTER TABLE `domainmetadata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `domains`
--
ALTER TABLE `domains`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `gen_link`
--
ALTER TABLE `gen_link`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=580;
--
-- AUTO_INCREMENT for table `hitstat`
--
ALTER TABLE `hitstat`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `records`
--
ALTER TABLE `records`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;
--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `trx`
--
ALTER TABLE `trx`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tsigkeys`
--
ALTER TABLE `tsigkeys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
