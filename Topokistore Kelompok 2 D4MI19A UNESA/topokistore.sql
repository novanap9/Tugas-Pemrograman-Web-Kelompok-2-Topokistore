-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 06, 2021 at 05:39 AM
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
-- Database: `topokistore`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `idcart` int(11) NOT NULL,
  `orderid` varchar(100) NOT NULL,
  `userid` int(11) NOT NULL,
  `tglorder` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(10) NOT NULL DEFAULT 'Cart'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`idcart`, `orderid`, `userid`, `tglorder`, `status`) VALUES
(10, '15wKVT0nej25Y', 2, '2020-03-16 12:10:42', 'Selesai'),
(11, '15Swf8Ye0Fm.M', 2, '2020-03-16 12:17:34', 'Cart'),
(12, '15PzF03ejd8W2', 1, '2020-05-13 02:40:48', 'Confirmed'),
(13, '16mowphgoUekc', 7, '2021-01-01 04:20:01', 'Confirmed'),
(14, '16/pe9LJUeNkI', 7, '2021-01-03 12:59:25', 'Confirmed'),
(15, '168a7BgOLkYRg', 1, '2021-01-03 13:27:58', 'Confirmed'),
(16, '16pzI.xa5ss1g', 8, '2021-01-04 16:30:01', 'Confirmed');

-- --------------------------------------------------------

--
-- Table structure for table `detailorder`
--

CREATE TABLE `detailorder` (
  `detailid` int(11) NOT NULL,
  `orderid` varchar(100) NOT NULL,
  `idproduk` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detailorder`
--

INSERT INTO `detailorder` (`detailid`, `orderid`, `idproduk`, `qty`) VALUES
(16, '16mowphgoUekc', 9, 1),
(17, '16mowphgoUekc', 8, 1),
(18, '16/pe9LJUeNkI', 6, 2),
(19, '168a7BgOLkYRg', 9, 1),
(20, '16pzI.xa5ss1g', 6, 2);

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `idkategori` int(11) NOT NULL,
  `namakategori` varchar(20) NOT NULL,
  `tgldibuat` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`idkategori`, `namakategori`, `tgldibuat`) VALUES
(4, 'Makanan', '2021-01-01 04:07:14'),
(5, 'Minuman', '2021-01-01 04:07:22');

-- --------------------------------------------------------

--
-- Table structure for table `konfirmasi`
--

CREATE TABLE `konfirmasi` (
  `idkonfirmasi` int(11) NOT NULL,
  `orderid` varchar(100) NOT NULL,
  `userid` int(11) NOT NULL,
  `payment` varchar(10) NOT NULL,
  `namarekening` varchar(25) NOT NULL,
  `tglbayar` date NOT NULL,
  `tglsubmit` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `konfirmasi`
--

INSERT INTO `konfirmasi` (`idkonfirmasi`, `orderid`, `userid`, `payment`, `namarekening`, `tglbayar`, `tglsubmit`) VALUES
(2, '16mowphgoUekc', 7, 'DANA', 'pembeli', '2021-01-01', '2021-01-01 07:22:34'),
(3, '16/pe9LJUeNkI', 7, 'DANA', 'pembeli', '2021-01-03', '2021-01-03 13:09:21'),
(4, '168a7BgOLkYRg', 1, 'Mandiri', 'admin', '2021-01-03', '2021-01-03 13:29:16'),
(5, '16pzI.xa5ss1g', 8, 'Mandiri', 'pembeli2', '2021-01-04', '2021-01-04 16:32:55');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `userid` int(11) NOT NULL,
  `namalengkap` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(150) NOT NULL,
  `notelp` varchar(15) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `tgljoin` timestamp NOT NULL DEFAULT current_timestamp(),
  `role` varchar(7) NOT NULL DEFAULT 'Member',
  `lastlogin` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`userid`, `namalengkap`, `email`, `password`, `notelp`, `alamat`, `tgljoin`, `role`, `lastlogin`) VALUES
(1, 'Admin', 'admin', '$2y$10$GJVGd4ji3QE8ikTBzNyA0uLQhiGd6MirZeSJV1O6nUpjSVp1eaKzS', '081332430056', 'surabaya', '2020-03-16 11:31:17', 'Admin', NULL),
(4, 'zulfa', 'zulfa@gmail.com', '$2y$10$7o4JtXRifQbOhIPW8JZSIul4XPXhsRKw8GGulQxQaB63A1fXMXfTW', '0812522728', 'Tuban', '2021-01-01 03:37:33', 'Admin', NULL),
(5, 'Novan', 'novan@gmail.com', '$2y$10$3pPLuOg41vcEofBjKBNzK.jQHotvmkGOIRjmO660hR21OX9XGfV2G', '081332430056', 'Surabaya', '2021-01-01 03:39:58', 'Admin', NULL),
(6, 'hakam', 'hakam@gmail.com', '$2y$10$2AXo0r5OOnlFzEo5THr8OO5fsXyfH12ufIcUGkTqhMFODQWhhnTau', '083815342534', 'Sidoarjo', '2021-01-01 03:59:14', 'Admin', NULL),
(7, 'pembeli', 'pembeli@gmail.com', '$2y$10$hO7BYLrUTMr3TMcezMi73e4MCGIBwQ1ThT/ftmCMTuX40Ks19WpaK', '081324132726', 'cepu', '2021-01-01 04:13:20', 'Member', NULL),
(8, 'pembeli2', 'pembeli2@gmail.com', '$2y$10$Wr2TZkrgTUCrt3m6sJIs4OP5zrWD0xg7Cap0Vif/Zcd5D5NmSOupW', '081526726152', 'Surabaya', '2021-01-04 16:25:44', 'Member', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `no` int(11) NOT NULL,
  `metode` varchar(25) NOT NULL,
  `norek` varchar(25) NOT NULL,
  `logo` text DEFAULT NULL,
  `an` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`no`, `metode`, `norek`, `logo`, `an`) VALUES
(4, 'DANA', '081332430056', 'images/dana.png', 'Topoki Store'),
(5, 'Mandiri', '1425280641826', 'images/mandiri.jpg', 'Topoki Store');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `idproduk` int(11) NOT NULL,
  `idkategori` int(11) NOT NULL,
  `namaproduk` varchar(30) NOT NULL,
  `gambar` varchar(100) NOT NULL,
  `deskripsi` varchar(200) NOT NULL,
  `rate` int(11) NOT NULL,
  `hargabefore` int(11) NOT NULL,
  `hargaafter` int(11) NOT NULL,
  `tgldibuat` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`idproduk`, `idkategori`, `namaproduk`, `gambar`, `deskripsi`, `rate`, `hargabefore`, `hargaafter`, `tgldibuat`) VALUES
(6, 5, 'Sinom 1,5 L', 'produk/16.vPXJXpBtAo.jpg', 'Sinom adalah minuman tradisional khas jawa yang sudah ada sejak jaman kerajaan dulu. Minuman lezat ini dibuat dari campuran air, asam Jawa, daun asam muda alias sinom, gula asli dan juga kunyit.', 5, 25000, 20000, '2021-01-01 07:07:17'),
(7, 5, 'Legen Tuban 1,5 L', 'produk/16Md6ZCRNXIOY.jpg', 'Legen adalah nama minuman tradisional yang banyak ditemukan di sekitar wilayah Jawa Tengah dan Jawa Timur, Indonesia. Minuman ini diambil dari bagian pohon siwalan. Jika kita menuju Kota Yogyakarta me', 5, 30000, 25000, '2021-01-01 07:08:46'),
(8, 4, 'Kripik Apel Malang', 'produk/16gbcVXbEMc8c.jpg', 'Keripik apel adalah keripik hasil olahan buah apel yang digoreng dengan cara khusus, biasanya menggunakan mesin penggoreng hampa. Jika menggunakan cara penggorengan biasa yakni dengan menggunakan kual', 5, 15000, 10000, '2021-01-01 07:12:35'),
(9, 4, 'Tahu Jombang', 'produk/16dsR8uvZciTk.jpg', 'Tahu yang khas dari Kabupaten Jombang ini selain memakai bahan baku kedelai, Tasu juga dicampuri susu sapi. Sehingga rasanya terasa lebih gurih dibandingkan dengan tahu biasa. Cara menikmatinya cukup ', 5, 13500, 11000, '2021-01-01 07:13:54');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`idcart`),
  ADD UNIQUE KEY `orderid` (`orderid`),
  ADD KEY `orderid_2` (`orderid`);

--
-- Indexes for table `detailorder`
--
ALTER TABLE `detailorder`
  ADD PRIMARY KEY (`detailid`),
  ADD KEY `orderid` (`orderid`),
  ADD KEY `idproduk` (`idproduk`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`idkategori`);

--
-- Indexes for table `konfirmasi`
--
ALTER TABLE `konfirmasi`
  ADD PRIMARY KEY (`idkonfirmasi`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`userid`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`no`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`idproduk`),
  ADD KEY `idkategori` (`idkategori`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `idcart` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `detailorder`
--
ALTER TABLE `detailorder`
  MODIFY `detailid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `idkategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `konfirmasi`
--
ALTER TABLE `konfirmasi`
  MODIFY `idkonfirmasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `idproduk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detailorder`
--
ALTER TABLE `detailorder`
  ADD CONSTRAINT `idproduk` FOREIGN KEY (`idproduk`) REFERENCES `produk` (`idproduk`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orderid` FOREIGN KEY (`orderid`) REFERENCES `cart` (`orderid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `konfirmasi`
--
ALTER TABLE `konfirmasi`
  ADD CONSTRAINT `userid` FOREIGN KEY (`userid`) REFERENCES `login` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `idkategori` FOREIGN KEY (`idkategori`) REFERENCES `kategori` (`idkategori`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
