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
-- Database: `cloackstats`
--

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
  `isp` varchar(64) NOT NULL,
  `position` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dailystats`
--
ALTER TABLE `dailystats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hitstat`
--
ALTER TABLE `hitstat`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dailystats`
--
ALTER TABLE `dailystats`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hitstat`
--
ALTER TABLE `hitstat`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
