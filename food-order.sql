-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 14, 2023 at 08:42 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `food-order`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`id`, `full_name`, `username`, `password`) VALUES
(1, 'Nayma Jahan Chowdhury', 'nayma', '304d83f21a97e047065c06e791fe3e6b'),
(2, 'Rushu', 'rushu', '81dc9bdb52d04dc20036dbd8313ed055');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `featured` varchar(10) NOT NULL,
  `active` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`id`, `title`, `image_name`, `featured`, `active`) VALUES
(1, 'Pizza', 'Food_Category_461.jpg', 'Yes', 'Yes'),
(6, 'Burger', 'Food_Category_897.png', 'Yes', 'Yes'),
(9, 'Drinks', 'Food_Category_993.jpg', 'Yes', 'Yes'),
(11, 'Dessert', 'Food_Category_142.jpg', 'Yes', 'Yes'),
(13, 'Thai Foods', 'Food_Category_474.jpg', 'Yes', 'Yes'),
(15, 'Biriani', 'Food_Category_217.jpg', 'Yes', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_food`
--

CREATE TABLE `tbl_food` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `featured` varchar(10) NOT NULL,
  `active` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_food`
--

INSERT INTO `tbl_food` (`id`, `title`, `description`, `price`, `image_name`, `category_id`, `featured`, `active`) VALUES
(7, 'Cake', '', 100.00, 'Food-Name-2868.jpg', 11, 'Yes', 'Yes'),
(11, 'Coffee', '', 150.00, 'Food-Name-3785.jpg', 9, 'Yes', 'Yes'),
(12, 'Zoodles', '', 120.00, 'Food-Name-9846.jpg', 13, 'Yes', 'Yes'),
(14, 'Orange-juice', '', 120.00, 'Food-Name-2031.jpg', 9, 'Yes', 'Yes'),
(15, 'Cheese Pizza', '', 350.00, 'Food-Name-9795.jpg', 1, 'Yes', 'Yes'),
(16, 'Italian Pizza', '', 400.00, 'Food-Name-4966.jpg', 1, 'Yes', 'Yes'),
(17, 'Ham Pizza', '', 400.00, 'Food-Name-5988.jpg', 1, 'Yes', 'Yes'),
(18, 'Korean Pizza', '', 350.00, 'Food-Name-7599.jpg', 1, 'Yes', 'Yes'),
(19, 'Beef Burger', '', 250.00, 'Food-Name-9972.jpg', 6, 'Yes', 'Yes'),
(20, 'Cheese Burger', '', 300.00, 'Food-Name-1753.jpg', 6, 'Yes', 'Yes'),
(21, 'Ham Burger', '', 250.00, 'Food-Name-2674.jpg', 6, 'Yes', 'Yes'),
(22, 'Burger with French fry', '', 250.00, 'Food-Name-2750.jpg', 6, 'Yes', 'Yes'),
(23, 'Chocolate-Smoothie', '', 250.00, 'Food-Name-9405.jpg', 9, 'Yes', 'Yes'),
(24, 'Capachino', '', 150.00, 'Food-Name-2290.jpg', 9, 'Yes', 'Yes'),
(25, 'Fruit Smoothie', '', 300.00, 'Food-Name-5990.jpg', 9, 'Yes', 'Yes'),
(26, 'Pancakes', '', 200.00, 'Food-Name-9949.jpg', 11, 'Yes', 'Yes'),
(27, 'Fruits Yogurt', '', 200.00, 'Food-Name-7928.jpg', 11, 'Yes', 'Yes'),
(28, 'Chocolate Cake', '', 150.00, 'Food-Name-8664.jpg', 11, 'Yes', 'Yes'),
(29, 'Pudding', '', 200.00, 'Food-Name-1847.jpg', 11, 'Yes', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE `tbl_order` (
  `id` int(10) UNSIGNED NOT NULL,
  `food` varchar(150) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `qty` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `order_date` datetime NOT NULL,
  `status` varchar(50) NOT NULL,
  `customer_name` varchar(150) NOT NULL,
  `customer_contact` varchar(20) NOT NULL,
  `customer_email` varchar(150) NOT NULL,
  `customer_address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_order`
--

INSERT INTO `tbl_order` (`id`, `food`, `price`, `qty`, `total`, `order_date`, `status`, `customer_name`, `customer_contact`, `customer_email`, `customer_address`) VALUES
(2, 'Cake', 100.00, 1, 100.00, '2023-10-23 07:13:24', 'Cancelled', 'Nayma ', '1234567890', 'nayma@gmail.com', 'Mymensingh.'),
(3, 'Thai bowl', 250.00, 1, 250.00, '2023-10-23 07:18:38', 'Delivered', 'Nayma ', '1234567890', 'nayma@gmail.com', 'Mymensingh'),
(4, 'Zoodles', 120.00, 2, 240.00, '2023-10-23 08:11:10', 'Delivered', 'Nayma Jahan', '1234567890', 'nayma@gmail.com', 'Jamalpur'),
(5, 'Fruits Yogurt', 200.00, 1, 200.00, '2023-10-27 09:17:18', 'Delivered', 'Nayma Jahan', '1234567890', 'nayma@gmail.com', 'Jamalpur'),
(6, 'Cheese Pizza', 350.00, 1, 350.00, '2023-11-13 11:00:03', 'Delivered', 'Nayma Jahan', '0173023456', 'nayma@gmail.com', 'Jamalpur'),
(7, 'Cheese Pizza', 350.00, 1, 350.00, '2023-11-14 04:56:49', 'Delivered', 'Tanha', '1234567890', 'tanha@gmail.com', 'Jamalpur'),
(8, 'Cheese Pizza', 350.00, 2, 700.00, '2023-11-14 06:09:57', 'Delivered', 'Disha', '1234567890', 'disha@gmail.com', 'Jamalpur'),
(9, 'Cake', 100.00, 1, 100.00, '2023-11-14 07:39:08', 'Delivered', 'Rushu', '1234567890', 'rushu@gmail.com', 'Jamalpur');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_food`
--
ALTER TABLE `tbl_food`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tbl_food`
--
ALTER TABLE `tbl_food`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
