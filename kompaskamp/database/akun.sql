-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 23, 2024 at 09:37 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `akun`
--

-- --------------------------------------------------------

--
-- Table structure for table `akun`
--

CREATE TABLE `akun` (
  `id` int(11) NOT NULL,
  `akun` varchar(50) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `poin` int(11) DEFAULT NULL,
  `rek1` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `akun`
--

INSERT INTO `akun` (`id`, `akun`, `nama_lengkap`, `email`, `password`, `poin`, `rek1`) VALUES
(4, '', 'tes', 'tes@gmail.com', '$2y$10$C4fgRGUMM6eSIWkAVcvs6u7sP4N35BPPXjBt7Se2y/iUwX.81T98m', NULL, NULL),
(5, '', 'avitt', 'avit@gmail.com', '$2y$10$KQR93qglBSOgaVIFXV4rquYx5UW.m/YI/owXW8xZrqMpoHebT0Smi', 5, 'SEA'),
(6, '', 'salsa', 'salsa@gmail.com', '$2y$10$R.zB0Zleqp.3SLbUX.czOuFfP9xTeVUlv6Dk4vuVHNUz.LvMhZVjW', NULL, NULL),
(7, '', 'ali', 'ali@gmail.com', '$2y$10$OQPhVI87YM0Pch8xFy37B.jKfnGbD5mpst/Cdgh1jMSUWo93Clz5m', NULL, NULL),
(8, '', 'lidzi penyuka bika ambon', 'lidzi@gmail.com', '$2y$10$t0nfZ6sc/JzumoBKcaG4wu23uTf8yr9DUxTApXgdPIQ2fe0VvYzqi', NULL, NULL),
(9, '', 'athuyy', 'atha@jago.com', '$2y$10$k29dqwDS8Z7nZ0EgSt30lueQMGcIRIveH74FEwhUojhfd6IemO6Gu', NULL, NULL),
(10, '', 'athuyyyy', 'atha@tidakjago.com', '$2y$10$j47FR58r5y6jkw9HgqYbD.KAEck2Hn0aNqwKQVl9Yk7s0BOMBUOW6', NULL, NULL),
(11, '', 'Argya Irsyad', 'irsyad@gacor.com', '$2y$10$fdg2IlwvxMuJD0G6CWUMpO9.LAPqDD7c2Bw/PV2csm9isrL5D2deW', 21, 'ICS');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `akun`
--
ALTER TABLE `akun`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `akun`
--
ALTER TABLE `akun`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
