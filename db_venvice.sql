-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 15, 2021 at 01:32 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_venvice`
--

-- --------------------------------------------------------

--
-- Table structure for table `bidang_jasa`
--

CREATE TABLE `bidang_jasa` (
  `id_bidang_jasa` int(10) NOT NULL,
  `nama_bidang_jasa` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `layanan`
--

CREATE TABLE `layanan` (
  `id_layanan` int(10) NOT NULL,
  `id_penyedia_jasa` int(10) NOT NULL,
  `nama_layanan` varchar(255) DEFAULT NULL,
  `harga_layanan` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `login_pencari_jasa`
--

CREATE TABLE `login_pencari_jasa` (
  `id_login_pencari_jasa` int(10) NOT NULL,
  `token_pencari_jasa` varchar(255) NOT NULL,
  `expired_date` datetime DEFAULT NULL,
  `id_pencari_jasa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `login_penyedia_jasa`
--

CREATE TABLE `login_penyedia_jasa` (
  `id_penyedia_jasa` int(10) NOT NULL,
  `token_penyedia_jasa` varchar(255) NOT NULL,
  `id_log_penyedia_jasa` int(10) NOT NULL,
  `expired_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `id_pegawai` int(10) NOT NULL,
  `nama_pegawai` varchar(255) NOT NULL,
  `nik_pegawai` varchar(255) NOT NULL,
  `id_penyedia` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pencari_jasa`
--

CREATE TABLE `pencari_jasa` (
  `id_pencari_jasa` int(10) NOT NULL,
  `nama_pencari_jasa` varchar(255) NOT NULL,
  `alamat_pencari_jasa` varchar(255) DEFAULT NULL,
  `no_hp_pencari_jasa` varchar(20) NOT NULL,
  `email_pencari_jasa` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `display_picture_pencari_jasa` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pencari_jasa`
--

INSERT INTO `pencari_jasa` (`id_pencari_jasa`, `nama_pencari_jasa`, `alamat_pencari_jasa`, `no_hp_pencari_jasa`, `email_pencari_jasa`, `password`, `display_picture_pencari_jasa`) VALUES
(1, 'jasa hunter', NULL, '08149894234', 'jasahunter@gmail.com', '$2b$10$zSVhlOl..bhQxcUsbLnYr.7joAs7ZnUSMq7zlJ0tnWSo1Wv2PSOPm', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `penyedia_jasa`
--

CREATE TABLE `penyedia_jasa` (
  `id_penyedia_jasa` int(10) NOT NULL,
  `nama_penyedia_jasa` varchar(200) NOT NULL,
  `alamat_kantor` text DEFAULT NULL,
  `npwp_pemilik` varchar(50) DEFAULT NULL,
  `email_penyedia` varchar(255) NOT NULL,
  `nomor_telpon_penyedia` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `penyedia_jasa`
--

INSERT INTO `penyedia_jasa` (`id_penyedia_jasa`, `nama_penyedia_jasa`, `alamat_kantor`, `npwp_pemilik`, `email_penyedia`, `nomor_telpon_penyedia`, `password`) VALUES
(1, 'WANDITRONIC', NULL, NULL, 'suwandek@gmail.com', '08123123123', '$2b$10$3b/EnEh5.TWq4gMVziQEDuRU09zjuXdHp2uwoeDuf6kJsCrlwp7Z.');

-- --------------------------------------------------------

--
-- Table structure for table `sub_jasa`
--

CREATE TABLE `sub_jasa` (
  `id_sub_jasa` int(10) NOT NULL,
  `id_bidang_jasa` int(10) NOT NULL,
  `nama_sub_jasa` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bidang_jasa`
--
ALTER TABLE `bidang_jasa`
  ADD PRIMARY KEY (`id_bidang_jasa`);

--
-- Indexes for table `layanan`
--
ALTER TABLE `layanan`
  ADD PRIMARY KEY (`id_layanan`),
  ADD KEY `id_penyedia_jasa` (`id_penyedia_jasa`);

--
-- Indexes for table `login_pencari_jasa`
--
ALTER TABLE `login_pencari_jasa`
  ADD PRIMARY KEY (`id_login_pencari_jasa`),
  ADD UNIQUE KEY `token_pencari_jasa` (`token_pencari_jasa`),
  ADD KEY `id_pencari_jasa` (`id_pencari_jasa`);

--
-- Indexes for table `login_penyedia_jasa`
--
ALTER TABLE `login_penyedia_jasa`
  ADD PRIMARY KEY (`id_penyedia_jasa`,`id_log_penyedia_jasa`),
  ADD UNIQUE KEY `token_pencari_jasa` (`token_penyedia_jasa`),
  ADD KEY `id_pencari_jasa` (`id_penyedia_jasa`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id_pegawai`),
  ADD UNIQUE KEY `nik_pegawai` (`nik_pegawai`),
  ADD KEY `id_penyedia` (`id_penyedia`);

--
-- Indexes for table `pencari_jasa`
--
ALTER TABLE `pencari_jasa`
  ADD PRIMARY KEY (`id_pencari_jasa`),
  ADD UNIQUE KEY `no_hp_pencari_jasa` (`no_hp_pencari_jasa`),
  ADD UNIQUE KEY `email_pencari_jasa` (`email_pencari_jasa`);

--
-- Indexes for table `penyedia_jasa`
--
ALTER TABLE `penyedia_jasa`
  ADD PRIMARY KEY (`id_penyedia_jasa`),
  ADD UNIQUE KEY `nomor_telpon_penyedia` (`nomor_telpon_penyedia`),
  ADD UNIQUE KEY `npwp_pemilik` (`npwp_pemilik`),
  ADD KEY `email_penyedia` (`email_penyedia`);

--
-- Indexes for table `sub_jasa`
--
ALTER TABLE `sub_jasa`
  ADD PRIMARY KEY (`id_sub_jasa`),
  ADD UNIQUE KEY `icon` (`icon`),
  ADD KEY `id_bidang_jasa` (`id_bidang_jasa`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bidang_jasa`
--
ALTER TABLE `bidang_jasa`
  MODIFY `id_bidang_jasa` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `layanan`
--
ALTER TABLE `layanan`
  MODIFY `id_layanan` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `login_pencari_jasa`
--
ALTER TABLE `login_pencari_jasa`
  MODIFY `id_login_pencari_jasa` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `id_pegawai` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pencari_jasa`
--
ALTER TABLE `pencari_jasa`
  MODIFY `id_pencari_jasa` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `penyedia_jasa`
--
ALTER TABLE `penyedia_jasa`
  MODIFY `id_penyedia_jasa` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sub_jasa`
--
ALTER TABLE `sub_jasa`
  MODIFY `id_sub_jasa` int(10) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `layanan`
--
ALTER TABLE `layanan`
  ADD CONSTRAINT `layanan_ibfk_1` FOREIGN KEY (`id_penyedia_jasa`) REFERENCES `penyedia_jasa` (`id_penyedia_jasa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `login_pencari_jasa`
--
ALTER TABLE `login_pencari_jasa`
  ADD CONSTRAINT `login_pencari_jasa_ibfk_1` FOREIGN KEY (`id_pencari_jasa`) REFERENCES `pencari_jasa` (`id_pencari_jasa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `login_penyedia_jasa`
--
ALTER TABLE `login_penyedia_jasa`
  ADD CONSTRAINT `login_penyedia_jasa_ibfk_1` FOREIGN KEY (`id_penyedia_jasa`) REFERENCES `penyedia_jasa` (`id_penyedia_jasa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD CONSTRAINT `pegawai_ibfk_1` FOREIGN KEY (`id_penyedia`) REFERENCES `penyedia_jasa` (`id_penyedia_jasa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sub_jasa`
--
ALTER TABLE `sub_jasa`
  ADD CONSTRAINT `sub_jasa_ibfk_1` FOREIGN KEY (`id_bidang_jasa`) REFERENCES `bidang_jasa` (`id_bidang_jasa`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
