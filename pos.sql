-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 23, 2022 at 07:26 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pos`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `ID` int(11) NOT NULL,
  `USERNAME` varchar(50) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `DATETIME` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`ID`, `USERNAME`, `PASSWORD`, `DATETIME`) VALUES
(1, 'akhlaq', 'admin', '2022-03-05 12:57:40'),
(2, 'rifat', 'admin', '2022-03-05 12:57:40'),
(3, 'itiaq', 'user', '2022-03-05 12:57:40');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `ID` int(11) NOT NULL,
  `PHONE` varchar(50) DEFAULT NULL,
  `SUBTOTAL` float DEFAULT NULL,
  `DATETIME` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`ID`, `PHONE`, `SUBTOTAL`, `DATETIME`) VALUES
(1, '0000', 490, '2022-03-23 10:53:48');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `ID` int(11) NOT NULL,
  `QUANTITY` int(11) DEFAULT NULL CHECK (`QUANTITY` >= 0),
  `DISCOUNT` float DEFAULT NULL CHECK (`DISCOUNT` >= 0),
  `P_ID` int(11) NOT NULL,
  `C_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `STOCK` int(11) DEFAULT NULL CHECK (`STOCK` >= 0),
  `UNIT` varchar(50) DEFAULT NULL,
  `SELL` int(11) DEFAULT NULL CHECK (`SELL` >= `BUY`),
  `BUY` int(11) DEFAULT NULL,
  `DATETIME` datetime DEFAULT current_timestamp(),
  `S_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`ID`, `NAME`, `STOCK`, `UNIT`, `SELL`, `BUY`, `DATETIME`, `S_ID`) VALUES
(1, 'Monitor', 20, 'Piece', 20000, 15000, '2022-03-20 12:31:31', 6),
(2, 'Keyboard', 50, 'Piece', 3000, 2000, '2022-03-20 12:36:07', 4),
(5, 'Mouse', 10, 'Piece', 500, 250, '2022-03-21 09:57:07', 7);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `PHONE` varchar(255) NOT NULL,
  `ADDRESS` varchar(255) DEFAULT NULL,
  `DATETIME` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`ID`, `NAME`, `PHONE`, `ADDRESS`, `DATETIME`) VALUES
(1, 'Akhlaq', '1010', 'Mirpur, Dhaka', '2022-03-09 00:45:58'),
(2, 'Istiaq', '1111', 'Uttara, Dhaka', '2022-03-09 00:47:16'),
(4, 'Rifat', '1100', 'Badda, Dhaka', '2022-03-11 01:45:01'),
(6, 'Tanbir', '10111', 'Shewrapara', '2022-03-12 02:06:14'),
(7, 'Rohan', '0012', 'Monipur,Dhaka', '2022-03-21 09:51:34'),
(8, 'Robin', '0099', 'Mipur-1', '2022-03-21 10:13:52');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `USERNAME` (`USERNAME`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `NAME` (`NAME`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `NAME` (`NAME`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
