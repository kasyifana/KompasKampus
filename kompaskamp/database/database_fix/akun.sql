-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 02, 2025 at 08:47 PM
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
-- Table structure for table `account_deletions`
--

CREATE TABLE `account_deletions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `deletion_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `reason` text NOT NULL,
  `deleted_by` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `account_deletions`
--

INSERT INTO `account_deletions` (`id`, `user_id`, `username`, `email`, `deletion_date`, `reason`, `deleted_by`) VALUES
(1, 1, 'john_doe', 'john@example.com', '2025-01-01 03:00:00', 'Requested account deletion', 'admin@example.com'),
(2, 2, 'jane_doe', 'jane@example.com', '2025-01-02 07:30:00', 'Violation of terms', 'moderator@example.com'),
(3, 0, '', '', '2025-01-02 05:29:45', 'not_useful', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `akun`
--

CREATE TABLE `akun` (
  `id` int(11) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `poin` int(11) DEFAULT NULL,
  `rek1` varchar(50) DEFAULT NULL,
  `telp` varchar(15) DEFAULT NULL,
  `jur1` varchar(100) DEFAULT NULL,
  `jur2` varchar(100) DEFAULT NULL,
  `jur3` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `akun`
--

INSERT INTO `akun` (`id`, `nama_lengkap`, `email`, `password`, `poin`, `rek1`, `telp`, `jur1`, `jur2`, `jur3`) VALUES
(4, 'tes', 'tes@gmail.com', '$2y$10$C4fgRGUMM6eSIWkAVcvs6u7sP4N35BPPXjBt7Se2y/iUwX.81T98m', 4, 'ASI', '085434768988', NULL, NULL, NULL),
(5, 'avitt', 'avit@gmail.com', '$2y$10$KQR93qglBSOgaVIFXV4rquYx5UW.m/YI/owXW8xZrqMpoHebT0Smi', 5, 'SEA', '0', NULL, NULL, NULL),
(6, 'salsa', 'salsa@gmail.com', '$2y$10$R.zB0Zleqp.3SLbUX.czOuFfP9xTeVUlv6Dk4vuVHNUz.LvMhZVjW', NULL, NULL, '0', NULL, NULL, NULL),
(7, 'ali', 'ali@gmail.com', '$2y$10$OQPhVI87YM0Pch8xFy37B.jKfnGbD5mpst/Cdgh1jMSUWo93Clz5m', 16, 'RIC', '081111111113', NULL, NULL, NULL),
(8, 'lidzi penyuka bika ambon', 'lidzi@gmail.com', '$2y$10$t0nfZ6sc/JzumoBKcaG4wu23uTf8yr9DUxTApXgdPIQ2fe0VvYzqi', 21, 'ARE', '0', NULL, NULL, NULL),
(9, 'athuyy', 'atha@jago.com', '$2y$10$k29dqwDS8Z7nZ0EgSt30lueQMGcIRIveH74FEwhUojhfd6IemO6Gu', NULL, NULL, '0', NULL, NULL, NULL),
(10, 'athuyyyy', 'atha@tidakjago.com', '$2y$10$j47FR58r5y6jkw9HgqYbD.KAEck2Hn0aNqwKQVl9Yk7s0BOMBUOW6', NULL, NULL, '0', NULL, NULL, NULL),
(11, 'Argya Irsyad', 'irsyad@gacor.com', '$2y$10$fdg2IlwvxMuJD0G6CWUMpO9.LAPqDD7c2Bw/PV2csm9isrL5D2deW', 21, 'ICS', '0', NULL, NULL, NULL),
(12, 'alika', 'alika@gmail.com', '$2y$10$UsOQHSEARmgeVpGzwy7hUuV4Xi9Kv9XKOPZtWG6c1c87CG6yVzwxe', 23, 'IEC', '0', NULL, NULL, NULL),
(15, 'Muhammad Ilkis', 'ilkis@gmail.com', '$2y$10$zjhFThQ9QNKnylmZ1/qPreMpd6JYYso.4.S0/.PS3VhjGiEiqshYe', 22, 'ECS', '0', NULL, NULL, NULL),
(16, 'projek sudah don', 'projek@capek.com', '$2y$10$a.c1woXO/Fyg1ryXzrOLLuZqoA/duwmxSXVMEkpDkzSaKX4WRbsuu', NULL, NULL, NULL, NULL, NULL, NULL),
(17, 'om ripa', 'ripa@gmail.com', '$2y$10$yBlGdVvKrra6HcW1E7qmnOttihZa0YzWUX8WHu2D4.ZtmnU526wI6', 13, 'SEA', NULL, NULL, NULL, NULL),
(18, 'mas bintol', 'bintol@gmail.com', '$2y$10$eU8uTJol1ISBEmUCkDs8jOrPKLBvhN1en7lK70w8bDwL15HoJ2ycS', 12, 'CAS', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `id` int(11) DEFAULT NULL,
  `student_name` varchar(255) NOT NULL,
  `pai` decimal(5,2) DEFAULT NULL CHECK (`pai` between 0 and 100),
  `mtk` decimal(5,2) DEFAULT NULL CHECK (`mtk` between 0 and 100),
  `logika` decimal(5,2) DEFAULT NULL CHECK (`logika` between 0 and 100),
  `inggris` decimal(5,2) DEFAULT NULL CHECK (`inggris` between 0 and 100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nilai`
--

INSERT INTO `nilai` (`id`, `student_name`, `pai`, `mtk`, `logika`, `inggris`) VALUES
(NULL, 'Ahmad Fauzi', 85.00, 90.00, 88.00, 92.00),
(NULL, 'Siti Aminah', 78.00, 84.00, 80.00, 86.00),
(NULL, 'Budi Santoso', 88.00, 91.00, 85.00, 87.00),
(7, 'ali', 20.00, 16.00, 12.00, 16.00),
(8, 'lidzi penyuka bika ambon', 36.00, 20.00, 12.00, 16.00),
(17, 'om ripa', 16.00, 8.00, 16.00, 12.00),
(18, 'mas bintol', 12.00, 12.00, 12.00, 12.00),
(4, 'tes', 4.00, 4.00, 4.00, 4.00);

-- --------------------------------------------------------

--
-- Table structure for table `rekpro`
--

CREATE TABLE `rekpro` (
  `id` int(11) NOT NULL,
  `student_name` varchar(255) DEFAULT NULL,
  `rekpro1` varchar(255) DEFAULT NULL,
  `rekpro2` varchar(255) DEFAULT NULL,
  `rekpro3` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rekpro`
--

INSERT INTO `rekpro` (`id`, `student_name`, `rekpro1`, `rekpro2`, `rekpro3`) VALUES
(1, 'Ahmad Fauzi', 'Teknik Informatika', 'Sistem Informasi', 'Teknik Elektro'),
(2, 'Siti Aminah', 'Manajemen', 'Akuntansi', 'Ilmu Komunikasi'),
(3, 'Budi Santoso', 'Pendidikan Matematika', 'Pendidikan Fisika', 'Pendidikan Kimia'),
(4, 'tes', 'Psikologi', 'Hukum Keluarga', 'Kedokteran'),
(7, 'ali', 'Teknik Industri S2', 'Analisis Kimia D3', 'Akuntansi Perpajakan'),
(8, 'lidzi penyuka bika ambon', 'Psikologi', 'Hukum Keluarga', 'Kedokteran'),
(17, 'om ripa', 'Analisis Kimia D3', 'Teknik Industri', 'Akuntansi Perpajakan'),
(18, 'mas bintol', 'Psikologi', 'Ekonomi Pembangunan', 'Akuntansi Perpajakan');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_deletions`
--
ALTER TABLE `account_deletions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `akun`
--
ALTER TABLE `akun`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rekpro`
--
ALTER TABLE `rekpro`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_deletions`
--
ALTER TABLE `account_deletions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `akun`
--
ALTER TABLE `akun`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `rekpro`
--
ALTER TABLE `rekpro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
