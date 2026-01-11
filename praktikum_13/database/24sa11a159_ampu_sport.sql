-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 11, 2026 at 02:58 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `24sa11a159_ampu_sport`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbdetailbeli`
--

CREATE TABLE `tbdetailbeli` (
  `notabeli` varchar(50) NOT NULL,
  `kode` varchar(15) DEFAULT NULL,
  `jml` int(11) DEFAULT NULL,
  `hargabeli` int(11) DEFAULT NULL,
  `subtotal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbdetailbeli`
--

INSERT INTO `tbdetailbeli` (`notabeli`, `kode`, `jml`, `hargabeli`, `subtotal`) VALUES
('NBP01', 'KPD02', 2, 800000, 1600000),
('NBP02', 'KPD04', 1, 300000, 300000),
('NBP03', 'KPD05', 6, 500000, 3000000),
('NBP04', 'KPD01', 2, 200000, 400000),
('NBP05', 'KPD06', 1, 1200000, 1200000);

-- --------------------------------------------------------

--
-- Table structure for table `tbdetailjual`
--

CREATE TABLE `tbdetailjual` (
  `nota` int(11) NOT NULL,
  `kode` varchar(15) DEFAULT NULL,
  `jml` int(11) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `subtotal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbdetailjual`
--

INSERT INTO `tbdetailjual` (`nota`, `kode`, `jml`, `harga`, `subtotal`) VALUES
(1101, 'KPD02', 2, 800000, 1600000),
(1102, 'KPD04', 1, 300000, 300000),
(1103, 'KPD05', 3, 500000, 1500000),
(1104, 'KPD01', 2, 200000, 400000),
(1105, 'KPD06', 1, 1200000, 1200000);

-- --------------------------------------------------------

--
-- Table structure for table `tbkategori`
--

CREATE TABLE `tbkategori` (
  `idkategori` varchar(6) NOT NULL,
  `nama_kategori` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbkategori`
--

INSERT INTO `tbkategori` (`idkategori`, `nama_kategori`) VALUES
('K10', 'Aksesori Olahraga'),
('K01', 'Alat Fitnes'),
('K09', 'Pakaian Olahraga'),
('K04', 'Peralatan Basket'),
('K03', 'Peralatan Bulu Tangkis'),
('K08', 'Peralatan Outdoor'),
('K05', 'Peralatan Renang'),
('K02', 'Peralatan Sepak Bola'),
('K06', 'Peralatan Tenis'),
('K07', 'Peralatan Voli');

-- --------------------------------------------------------

--
-- Table structure for table `tbmember`
--

CREATE TABLE `tbmember` (
  `idmember` varchar(15) NOT NULL,
  `namamember` varchar(70) NOT NULL,
  `alamat` varchar(65) DEFAULT NULL,
  `telp` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbmember`
--

INSERT INTO `tbmember` (`idmember`, `namamember`, `alamat`, `telp`) VALUES
('M01', 'Andi Saputra', 'Banyumas', '089511021281'),
('M02', 'Budi Santoso', 'Purwokerto', '0859210193837'),
('M03', 'Citra Lestari', 'Sokaraja', '089232982132'),
('M04', 'Dewi Anggraini', 'Banjarnegara', '0859210193837'),
('M05', 'Eko Prasetyo', 'Purbalingga', '089232982132');

-- --------------------------------------------------------

--
-- Table structure for table `tbpemasok`
--

CREATE TABLE `tbpemasok` (
  `idpemasok` varchar(15) NOT NULL,
  `namapemasok` varchar(70) NOT NULL,
  `kontak` varchar(60) DEFAULT NULL,
  `alamat` varchar(65) DEFAULT NULL,
  `email` varchar(70) NOT NULL,
  `telp` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbpemasok`
--

INSERT INTO `tbpemasok` (`idpemasok`, `namapemasok`, `kontak`, `alamat`, `email`, `telp`) VALUES
('ISP01', 'PT Atletik Jaya Perkasa', 'Kevin Sanjaya', 'Jl. Arena No. 5, Jakarta Pusat', 'athletic.jaya@sports.com', '(021)9001122'),
('ISP02', 'PT Futsalindo Sukses', 'Yoga Pratama', 'Jl. Pelangi No. 12, Bekasi', 'futsalindo@sports.com', '081234567890'),
('ISP03', 'PT Sepatu Lari Ultra', 'Rina Marlina', 'Jl. Merdeka Raya No. 101, Bandung', 'sepatu.lari@sports.com', '(022)7654321'),
('ISP04', 'PT Jete Perlengkapan Gym', 'Arya Seloka', 'Jl. Pantura Blok C, Bogor', 'jete.gym@sports.com', '087437434029'),
('ISP05', 'PT Bola Dunia Sarana Prima', 'Wiryaman', 'Jl. Merder No. 88, Surabaya', 'bola.dunia@sports.com', '(031)85874123'),
('ISP06', 'PT Raket Utama Indo', 'Wijaya Kusuma', 'Jl. Mekar No. 3, Yogyakarta', 'raket.utama@sports.com', '083434879181');

-- --------------------------------------------------------

--
-- Table structure for table `tbpembelian`
--

CREATE TABLE `tbpembelian` (
  `notabeli` varchar(50) NOT NULL,
  `tgl` date DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  `idpemasok` varchar(15) DEFAULT NULL,
  `totalbeli` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbpembelian`
--

INSERT INTO `tbpembelian` (`notabeli`, `tgl`, `id`, `idpemasok`, `totalbeli`) VALUES
('NBP01', '2025-09-01', 1, 'ISP02', 1600000),
('NBP02', '2025-09-05', 2, 'ISP04', 300000),
('NBP03', '2025-09-10', 2, 'ISP05', 3000000),
('NBP04', '2025-09-12', 2, 'ISP01', 400000),
('NBP05', '2025-09-19', 1, 'ISP06', 1200000);

-- --------------------------------------------------------

--
-- Table structure for table `tbpengguna`
--

CREATE TABLE `tbpengguna` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `sandi` varchar(20) NOT NULL,
  `jabatan` enum('admin','kasir') NOT NULL,
  `nama` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbpengguna`
--

INSERT INTO `tbpengguna` (`id`, `username`, `sandi`, `jabatan`, `nama`) VALUES
(1, 'admin1', 'admin123', 'admin', 'Aisha Putri'),
(2, 'kasir1', 'kasir123', 'kasir', 'Kamila Ayu Ningsih'),
(3, 'admin2', 'admin321', 'admin', 'Indah Mekar'),
(4, 'kasir2', 'kasir321', 'kasir', 'Kusuma Pamungkas');

-- --------------------------------------------------------

--
-- Table structure for table `tbpenjualan`
--

CREATE TABLE `tbpenjualan` (
  `nota` int(11) NOT NULL,
  `tgltransaksi` date DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  `idmember` varchar(15) DEFAULT NULL,
  `total` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbpenjualan`
--

INSERT INTO `tbpenjualan` (`nota`, `tgltransaksi`, `id`, `idmember`, `total`) VALUES
(1101, '2025-10-01', 1, 'M01', 1600000),
(1102, '2025-10-04', 2, 'M02', 300000),
(1103, '2025-10-08', 2, 'M03', 1500000),
(1104, '2025-10-10', 2, 'M04', 400000),
(1105, '2025-10-15', 1, 'M05', 1200000);

-- --------------------------------------------------------

--
-- Table structure for table `tbproduk`
--

CREATE TABLE `tbproduk` (
  `kode` varchar(15) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `idkategori` varchar(6) NOT NULL,
  `harga` int(11) DEFAULT 0,
  `stok` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbproduk`
--

INSERT INTO `tbproduk` (`kode`, `nama`, `idkategori`, `harga`, `stok`) VALUES
('KPD01', 'Mistar Lompat Tinggi', 'K08', 200000, 100),
('KPD02', 'Sepatu Futsal - Lightning Striker', 'K02', 800000, 80),
('KPD03', 'Sepatu Marathon - Red Mils', 'K08', 1500000, 80),
('KPD04', 'Barbel Hexagonal', 'K01', 300000, 120),
('KPD05', 'Bola (Piala Series)', 'K02', 500000, 300),
('KPD06', 'Raket Carbon Pro', 'K03', 1200000, 50);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbdetailbeli`
--
ALTER TABLE `tbdetailbeli`
  ADD KEY `notabeli` (`notabeli`),
  ADD KEY `kode` (`kode`);

--
-- Indexes for table `tbdetailjual`
--
ALTER TABLE `tbdetailjual`
  ADD KEY `nota` (`nota`),
  ADD KEY `kode` (`kode`);

--
-- Indexes for table `tbkategori`
--
ALTER TABLE `tbkategori`
  ADD PRIMARY KEY (`idkategori`),
  ADD UNIQUE KEY `nama_kategori` (`nama_kategori`);

--
-- Indexes for table `tbmember`
--
ALTER TABLE `tbmember`
  ADD PRIMARY KEY (`idmember`);

--
-- Indexes for table `tbpemasok`
--
ALTER TABLE `tbpemasok`
  ADD PRIMARY KEY (`idpemasok`);

--
-- Indexes for table `tbpembelian`
--
ALTER TABLE `tbpembelian`
  ADD PRIMARY KEY (`notabeli`),
  ADD KEY `id` (`id`),
  ADD KEY `idpemasok` (`idpemasok`);

--
-- Indexes for table `tbpengguna`
--
ALTER TABLE `tbpengguna`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `tbpenjualan`
--
ALTER TABLE `tbpenjualan`
  ADD PRIMARY KEY (`nota`),
  ADD KEY `id` (`id`),
  ADD KEY `idmember` (`idmember`);

--
-- Indexes for table `tbproduk`
--
ALTER TABLE `tbproduk`
  ADD PRIMARY KEY (`kode`),
  ADD KEY `idkategori` (`idkategori`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbpengguna`
--
ALTER TABLE `tbpengguna`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbdetailbeli`
--
ALTER TABLE `tbdetailbeli`
  ADD CONSTRAINT `tbdetailbeli_ibfk_1` FOREIGN KEY (`notabeli`) REFERENCES `tbpembelian` (`notabeli`),
  ADD CONSTRAINT `tbdetailbeli_ibfk_2` FOREIGN KEY (`kode`) REFERENCES `tbproduk` (`kode`);

--
-- Constraints for table `tbdetailjual`
--
ALTER TABLE `tbdetailjual`
  ADD CONSTRAINT `tbdetailjual_ibfk_1` FOREIGN KEY (`nota`) REFERENCES `tbpenjualan` (`nota`),
  ADD CONSTRAINT `tbdetailjual_ibfk_2` FOREIGN KEY (`kode`) REFERENCES `tbproduk` (`kode`);

--
-- Constraints for table `tbpembelian`
--
ALTER TABLE `tbpembelian`
  ADD CONSTRAINT `tbpembelian_ibfk_1` FOREIGN KEY (`id`) REFERENCES `tbpengguna` (`id`),
  ADD CONSTRAINT `tbpembelian_ibfk_2` FOREIGN KEY (`idpemasok`) REFERENCES `tbpemasok` (`idpemasok`);

--
-- Constraints for table `tbpenjualan`
--
ALTER TABLE `tbpenjualan`
  ADD CONSTRAINT `tbpenjualan_ibfk_1` FOREIGN KEY (`id`) REFERENCES `tbpengguna` (`id`),
  ADD CONSTRAINT `tbpenjualan_ibfk_2` FOREIGN KEY (`idmember`) REFERENCES `tbmember` (`idmember`);

--
-- Constraints for table `tbproduk`
--
ALTER TABLE `tbproduk`
  ADD CONSTRAINT `tbproduk_ibfk_1` FOREIGN KEY (`idkategori`) REFERENCES `tbkategori` (`idkategori`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
