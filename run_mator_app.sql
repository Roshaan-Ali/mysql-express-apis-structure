-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 24, 2021 at 03:49 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bata_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `type` enum('admin','manager','hr') DEFAULT NULL,
  `status` enum('active','inactive','block') DEFAULT 'inactive',
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT 'user.png',
  `phone` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password`, `type`, `status`, `created_date`, `created_by`, `image`, `phone`) VALUES
(1, 'Admin', 'admin@admin.com', '$2b$10$Kc2RT8txvMPPjf7n.DdW7eZ8UPfkHyvVDdYcFxt3Nbx4X2eOyeE/i', 'admin', 'active', '2021-09-01 18:59:40', 0, 'user.png', NULL),
(2, 'Subadmin', 'admin@test.com', '$2b$10$Kc2RT8txvMPPjf7n.DdW7eZ8UPfkHyvVDdYcFxt3Nbx4X2eOyeE/i', 'manager', 'active', '2021-09-03 19:16:40', NULL, 'user.png', NULL),
(3, 'Muhammad Ali', 'alii.engineerr@gmail.com', 'testtest', NULL, 'active', '2021-09-11 21:44:20', NULL, 'c3435b6f69d943adac319bfb8ff77185.PNG', NULL),
(4, 'Muhammad Ali', 'alii.engineerr@gmail.com', 'testtest', NULL, 'block', '2021-09-11 22:13:11', NULL, 'c11877bad6b36be3539721aff68ef9e7.jpg', ''),
(6, '[value-2]', '[value-3]', '[value-4]', '', '', '0000-00-00 00:00:00', 0, '[value-9]', '[value-10]'),
(7, 'Minahaj', 'minhaj@test.com', NULL, NULL, 'inactive', '2021-11-15 07:21:51', NULL, 'user.png', NULL),
(8, 'Minahaj', 'minhaj@test.com', NULL, NULL, 'inactive', '2021-11-15 07:22:20', NULL, 'user.png', NULL),
(9, 'Minahaj', 'minhaj@test.com', NULL, NULL, 'inactive', '2021-11-15 07:23:26', NULL, 'user.png', NULL),
(10, 'Minahaj', 'minhaj@test.com', NULL, NULL, 'inactive', '2021-11-15 07:23:53', NULL, 'user.png', NULL),
(11, 'Minahaj', 'minhaj@test.com', NULL, NULL, 'inactive', '2021-11-15 07:24:09', NULL, 'user.png', NULL),
(12, 'Minahaj', 'minhaj@test.com', NULL, NULL, 'inactive', '2021-11-15 07:24:17', NULL, 'user.png', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `booking_order`
--

CREATE TABLE `booking_order` (
  `id` int(11) NOT NULL,
  `provider_id` int(11) DEFAULT NULL,
  `total_amount` varchar(100) DEFAULT NULL,
  `discounted_amount` varchar(100) DEFAULT NULL,
  `order_items` text DEFAULT NULL,
  `status` enum('pending','accepted','rejected','expired','completed') DEFAULT 'pending',
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_date` datetime DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `hash` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booking_order`
--

INSERT INTO `booking_order` (`id`, `provider_id`, `total_amount`, `discounted_amount`, `order_items`, `status`, `created_date`, `updated_date`, `customer_id`, `hash`) VALUES
(1, NULL, '50', '10', '[{\"name\":\"Hair Cut\",\"quantity\":\"2\",\"price\":\"15\"},{\"name\":\"Head Massage\",\"quantity\":\"1\",\"price\":\"15\"}]', 'pending', '2021-10-09 08:14:12', NULL, 2, ''),
(2, NULL, '50', '10', '[{\"name\":\"Hair Cut\",\"quantity\":\"2\",\"price\":\"15\"},{\"name\":\"Head Massage\",\"quantity\":\"1\",\"price\":\"15\"}]', 'pending', '2021-10-09 08:15:30', NULL, 2, ''),
(3, NULL, '50', '10', '[{\"name\":\"Hair Cut\",\"quantity\":\"2\",\"price\":\"15\"},{\"name\":\"Head Massage\",\"quantity\":\"1\",\"price\":\"15\"}]', 'pending', '2021-10-09 08:29:01', NULL, 2, ''),
(4, NULL, '50', '10', '[{\"name\":\"Hair Cut\",\"quantity\":\"2\",\"price\":\"15\"},{\"name\":\"Head Massage\",\"quantity\":\"1\",\"price\":\"15\"}]', 'pending', '2021-10-09 08:31:36', NULL, 2, '$2b$10$9zEYBZaE39BDjcB6jS1r4OJ1BzIIW5O0mDl.zxJ0v1fbpViH.p9VC'),
(5, NULL, '50', '10', '[{\"name\":\"Hair Cut\",\"quantity\":\"2\",\"price\":\"15\"},{\"name\":\"Head Massage\",\"quantity\":\"1\",\"price\":\"15\"}]', 'pending', '2021-10-09 08:31:40', NULL, 2, '$2b$10$080Gckaf1gXmzCxt7TNsmu9IwPi/YByIJ8gmqNlHXuVKYtKrxsECa'),
(6, NULL, '50', '10', '[{\"name\":\"Hair Cut\",\"quantity\":\"2\",\"price\":\"15\"},{\"name\":\"Head Massage\",\"quantity\":\"1\",\"price\":\"15\"}]', 'pending', '2021-10-09 09:46:40', NULL, 2, '$2b$10$lkaLox9Be3oB25UlOqsyBOgwdw2Rn.jQU0ED4SLEc/nLiswugvIjK'),
(7, NULL, '50', '10', '[{\"name\":\"Hair Cut\",\"quantity\":\"2\",\"price\":\"15\"},{\"name\":\"Head Massage\",\"quantity\":\"1\",\"price\":\"15\"}]', 'pending', '2021-10-09 09:49:34', NULL, 2, '$2b$10$.JSw0bcRsjnmtuVJgEDD1eeXm.YtVoisHbpMVFuZRt3ZVKn8mXBDC'),
(8, NULL, '50', '10', '[{\"name\":\"Hair Cut\",\"quantity\":\"2\",\"price\":\"15\"},{\"name\":\"Head Massage\",\"quantity\":\"1\",\"price\":\"15\"}]', 'pending', '2021-10-09 10:54:39', NULL, 2, 'dc076666809bb97f0dbf2bc6016e3d17'),
(9, NULL, '50', '10', '[{\"name\":\"Hair Cut\",\"quantity\":\"2\",\"price\":\"15\"},{\"name\":\"Head Massage\",\"quantity\":\"1\",\"price\":\"15\"}]', 'pending', '2021-10-09 10:58:54', NULL, 2, '239cca0257a1e67dc0b85966e993070e'),
(10, NULL, '50', '10', '[{\"name\":\"Hair Cut\",\"quantity\":\"2\",\"price\":\"15\"},{\"name\":\"Head Massage\",\"quantity\":\"1\",\"price\":\"15\"}]', 'pending', '2021-10-09 11:01:19', NULL, 2, 'b7e5a9492a37d6bacd1f3a1d86f15d1b'),
(11, NULL, '50', '10', '[{\"name\":\"Hair Cut\",\"quantity\":\"2\",\"price\":\"15\"},{\"name\":\"Head Massage\",\"quantity\":\"1\",\"price\":\"15\"}]', 'pending', '2021-10-09 11:04:01', NULL, 2, 'e1570fbcfaaf77b9608d20f6a20b48df'),
(12, NULL, '50', '10', '[{\"name\":\"Hair Cut\",\"quantity\":\"2\",\"price\":\"15\"},{\"name\":\"Head Massage\",\"quantity\":\"1\",\"price\":\"15\"}]', 'pending', '2021-10-09 11:05:58', NULL, 2, 'e24aabfc3dc7125fe3f3f66d02a17006'),
(13, NULL, '50', '10', '[{\"name\":\"Hair Cut\",\"quantity\":\"2\",\"price\":\"15\"},{\"name\":\"Head Massage\",\"quantity\":\"1\",\"price\":\"15\"}]', 'pending', '2021-10-09 11:06:35', NULL, 2, 'd18e394393381058f3728b05a10a8a4f'),
(14, NULL, '50', '10', '[{\"name\":\"Hair Cut\",\"quantity\":\"2\",\"price\":\"15\"},{\"name\":\"Head Massage\",\"quantity\":\"1\",\"price\":\"15\"}]', 'pending', '2021-10-09 11:07:42', NULL, 2, 'ce95def91a0a4313900629836862e31b'),
(15, NULL, '50', '10', '[{\"name\":\"Hair Cut\",\"quantity\":\"2\",\"price\":\"15\"},{\"name\":\"Head Massage\",\"quantity\":\"1\",\"price\":\"15\"}]', 'pending', '2021-10-09 11:07:55', NULL, 2, '1889a0e5d99f5d81885e1598d068bbe7'),
(16, 2, '50', '10', '[{\"name\":\"Hair Cut\",\"quantity\":\"2\",\"price\":\"15\"},{\"name\":\"Head Massage\",\"quantity\":\"1\",\"price\":\"15\"}]', 'expired', '2021-10-09 11:08:20', NULL, 4, '7473d0453b61625528159681fc4318db');

-- --------------------------------------------------------

--
-- Table structure for table `client_packages`
--

CREATE TABLE `client_packages` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  `amount` float NOT NULL DEFAULT 0,
  `status` int(1) NOT NULL DEFAULT 1,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `client_packages`
--

INSERT INTO `client_packages` (`id`, `client_id`, `package_id`, `amount`, `status`, `created_date`) VALUES
(1, 16, 4, 100, 1, '2021-12-24 14:09:59');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `type` enum('provider','customer') DEFAULT NULL,
  `message` text NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `full_name`, `type`, `message`, `created_date`, `user_id`) VALUES
(1, 'Muhammd', 'provider', '0030303 sjsdsjd sjd sjd', '2021-10-10 17:29:18', 0),
(2, '', NULL, '', '2021-11-12 11:48:47', 0),
(3, '2', NULL, '', '2021-11-12 12:01:34', 0),
(4, '2', NULL, '', '2021-11-12 12:01:44', 0),
(5, '2', NULL, '', '2021-11-12 12:01:53', 0),
(6, '2', NULL, '', '2021-11-12 12:04:07', 0),
(7, '2', NULL, '', '2021-11-12 12:05:34', 0),
(8, '2', NULL, '', '2021-11-12 12:06:02', 0),
(9, '2', NULL, '', '2021-11-12 12:06:16', 0);

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

CREATE TABLE `job` (
  `id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `attachment` text NOT NULL,
  `status` enum('pending','viewed','shortlisted') NOT NULL DEFAULT 'pending',
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `admin_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `language_name` varchar(55) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `language_name`, `status`, `created_date`) VALUES
(1, 'english', 1, '2021-12-24 14:19:03'),
(2, 'german', 1, '2021-12-24 14:19:03'),
(3, 'french', 1, '2021-12-24 14:19:03');

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `provider_id` int(11) DEFAULT NULL,
  `booking_order_id` int(11) DEFAULT NULL,
  `status` enum('pending','accepted','expired','cancelled') DEFAULT 'pending',
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `action_time` datetime DEFAULT NULL,
  `send_type` enum('provider','admin','customer') DEFAULT NULL,
  `msg_type` enum('booking_send') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`id`, `customer_id`, `provider_id`, `booking_order_id`, `status`, `created_date`, `action_time`, `send_type`, `msg_type`) VALUES
(1, 4, 1, 17, 'pending', '2021-10-03 18:29:52', NULL, NULL, NULL),
(2, 4, 2, 17, 'pending', '2021-10-03 18:29:52', NULL, NULL, NULL),
(3, 4, 3, 17, 'pending', '2021-10-03 18:29:52', NULL, NULL, NULL),
(4, 4, 1, 18, 'pending', '2021-10-03 19:08:50', NULL, NULL, NULL),
(5, 4, 2, 18, 'pending', '2021-10-03 19:08:50', NULL, NULL, NULL),
(6, 4, 3, 18, 'pending', '2021-10-03 19:08:50', NULL, NULL, NULL),
(7, 4, 1, 19, 'pending', '2021-10-03 19:10:05', NULL, NULL, NULL),
(8, 4, 2, 19, 'pending', '2021-10-03 19:10:05', NULL, NULL, NULL),
(9, 4, 3, 19, 'pending', '2021-10-03 19:10:05', NULL, NULL, NULL),
(10, 4, 1, 20, 'pending', '2021-10-03 19:12:52', NULL, NULL, NULL),
(11, 4, 2, 20, 'pending', '2021-10-03 19:12:52', NULL, NULL, NULL),
(12, 4, 3, 20, 'pending', '2021-10-03 19:12:52', NULL, NULL, NULL),
(13, 4, 1, 21, 'pending', '2021-10-03 19:14:11', NULL, NULL, NULL),
(14, 4, 2, 21, 'pending', '2021-10-03 19:14:11', NULL, NULL, NULL),
(15, 4, 3, 21, 'pending', '2021-10-03 19:14:11', NULL, NULL, NULL),
(16, 4, 1, 22, 'pending', '2021-10-03 19:15:50', NULL, NULL, NULL),
(17, 4, 2, 22, 'pending', '2021-10-03 19:15:50', NULL, NULL, NULL),
(18, 4, 3, 22, 'pending', '2021-10-03 19:15:50', NULL, NULL, NULL),
(19, 4, 1, 23, 'pending', '2021-10-03 19:16:15', NULL, NULL, NULL),
(20, 4, 2, 23, 'pending', '2021-10-03 19:16:15', NULL, NULL, NULL),
(21, 4, 3, 23, 'pending', '2021-10-03 19:16:15', NULL, NULL, NULL),
(22, 4, 1, 24, 'pending', '2021-10-03 19:17:01', NULL, NULL, NULL),
(23, 4, 2, 24, 'pending', '2021-10-03 19:17:01', NULL, NULL, NULL),
(24, 4, 3, 24, 'pending', '2021-10-03 19:17:01', NULL, NULL, NULL),
(25, 2, 1, 25, 'pending', '2021-10-09 07:44:22', NULL, NULL, NULL),
(26, 2, 2, 25, 'pending', '2021-10-09 07:44:22', NULL, NULL, NULL),
(27, 2, 3, 25, 'pending', '2021-10-09 07:44:22', NULL, NULL, NULL),
(28, 2, 1, 26, 'pending', '2021-10-09 07:51:17', NULL, NULL, NULL),
(29, 2, 2, 26, 'pending', '2021-10-09 07:51:17', NULL, NULL, NULL),
(30, 2, 3, 26, 'pending', '2021-10-09 07:51:17', NULL, NULL, NULL),
(31, 2, 1, 27, 'pending', '2021-10-09 07:53:24', NULL, NULL, NULL),
(32, 2, 2, 27, 'pending', '2021-10-09 07:53:24', NULL, NULL, NULL),
(33, 2, 3, 27, 'pending', '2021-10-09 07:53:24', NULL, NULL, NULL),
(34, 2, 1, 28, 'pending', '2021-10-09 07:54:45', NULL, NULL, NULL),
(35, 2, 2, 28, 'pending', '2021-10-09 07:54:45', NULL, NULL, NULL),
(36, 2, 3, 28, 'pending', '2021-10-09 07:54:45', NULL, NULL, NULL),
(37, 2, 1, 29, 'pending', '2021-10-09 07:55:18', NULL, NULL, NULL),
(38, 2, 2, 29, 'pending', '2021-10-09 07:55:18', NULL, NULL, NULL),
(39, 2, 3, 29, 'pending', '2021-10-09 07:55:18', NULL, NULL, NULL),
(40, 2, 1, 30, 'pending', '2021-10-09 08:10:46', NULL, NULL, NULL),
(41, 2, 2, 30, 'pending', '2021-10-09 08:10:46', NULL, NULL, NULL),
(42, 2, 3, 30, 'pending', '2021-10-09 08:10:46', NULL, NULL, NULL),
(43, 2, 1, 31, 'pending', '2021-10-09 08:11:26', NULL, NULL, NULL),
(44, 2, 2, 31, 'pending', '2021-10-09 08:11:26', NULL, NULL, NULL),
(45, 2, 3, 31, 'pending', '2021-10-09 08:11:26', NULL, NULL, NULL),
(46, 2, 1, 1, 'pending', '2021-10-09 08:14:12', NULL, NULL, NULL),
(47, 2, 2, 1, 'pending', '2021-10-09 08:14:12', NULL, NULL, NULL),
(48, 2, 3, 1, 'pending', '2021-10-09 08:14:12', NULL, NULL, NULL),
(49, 2, 1, 2, 'pending', '2021-10-09 08:15:31', NULL, NULL, NULL),
(50, 2, 2, 2, 'pending', '2021-10-09 08:15:31', NULL, NULL, NULL),
(51, 2, 3, 2, 'pending', '2021-10-09 08:15:31', NULL, NULL, NULL),
(52, 2, 1, 3, 'pending', '2021-10-09 08:29:01', NULL, NULL, NULL),
(53, 2, 2, 3, 'pending', '2021-10-09 08:29:01', NULL, NULL, NULL),
(54, 2, 3, 3, 'pending', '2021-10-09 08:29:01', NULL, NULL, NULL),
(55, 2, 1, 4, 'pending', '2021-10-09 08:31:36', NULL, NULL, NULL),
(56, 2, 2, 4, 'pending', '2021-10-09 08:31:36', NULL, NULL, NULL),
(57, 2, 3, 4, 'pending', '2021-10-09 08:31:36', NULL, NULL, NULL),
(58, 2, 1, 5, 'pending', '2021-10-09 08:31:40', NULL, NULL, NULL),
(59, 2, 2, 5, 'pending', '2021-10-09 08:31:40', NULL, NULL, NULL),
(60, 2, 3, 5, 'pending', '2021-10-09 08:31:40', NULL, NULL, NULL),
(61, 2, 1, 6, 'pending', '2021-10-09 09:46:41', NULL, NULL, NULL),
(62, 2, 2, 6, 'pending', '2021-10-09 09:46:41', NULL, NULL, NULL),
(63, 2, 3, 6, 'pending', '2021-10-09 09:46:41', NULL, NULL, NULL),
(64, 2, 1, 7, 'pending', '2021-10-09 09:49:35', NULL, NULL, NULL),
(65, 2, 2, 7, 'pending', '2021-10-09 09:49:35', NULL, NULL, NULL),
(66, 2, 3, 7, 'pending', '2021-10-09 09:49:35', NULL, NULL, NULL),
(67, 2, 1, 8, 'pending', '2021-10-09 10:54:39', NULL, NULL, NULL),
(68, 2, 2, 8, 'pending', '2021-10-09 10:54:39', NULL, NULL, NULL),
(69, 2, 3, 8, 'pending', '2021-10-09 10:54:39', NULL, NULL, NULL),
(70, 2, 1, 9, 'pending', '2021-10-09 10:58:55', NULL, NULL, NULL),
(71, 2, 2, 9, 'pending', '2021-10-09 10:58:55', NULL, NULL, NULL),
(72, 2, 3, 9, 'pending', '2021-10-09 10:58:55', NULL, NULL, NULL),
(73, 2, 1, 10, 'pending', '2021-10-09 11:01:19', NULL, NULL, NULL),
(74, 2, 2, 10, 'pending', '2021-10-09 11:01:19', NULL, NULL, NULL),
(75, 2, 3, 10, 'pending', '2021-10-09 11:01:19', NULL, NULL, NULL),
(76, 2, 1, 11, 'pending', '2021-10-09 11:04:01', NULL, NULL, NULL),
(77, 2, 2, 11, 'pending', '2021-10-09 11:04:01', NULL, NULL, NULL),
(78, 2, 3, 11, 'pending', '2021-10-09 11:04:01', NULL, NULL, NULL),
(79, 2, 1, 12, 'pending', '2021-10-09 11:05:58', NULL, NULL, NULL),
(80, 2, 2, 12, 'pending', '2021-10-09 11:05:58', NULL, NULL, NULL),
(81, 2, 3, 12, 'pending', '2021-10-09 11:05:58', NULL, NULL, NULL),
(82, 2, 1, 13, 'pending', '2021-10-09 11:06:35', NULL, NULL, NULL),
(83, 2, 2, 13, 'pending', '2021-10-09 11:06:35', NULL, NULL, NULL),
(84, 2, 3, 13, 'pending', '2021-10-09 11:06:35', NULL, NULL, NULL),
(85, 2, 1, 14, 'pending', '2021-10-09 11:07:42', NULL, NULL, NULL),
(86, 2, 3, 14, 'pending', '2021-10-09 11:07:42', NULL, NULL, NULL),
(87, 2, 2, 14, 'pending', '2021-10-09 11:07:42', NULL, NULL, NULL),
(88, 2, 1, 15, 'pending', '2021-10-09 11:07:55', NULL, NULL, NULL),
(89, 2, 2, 15, 'pending', '2021-10-09 11:07:56', NULL, NULL, NULL),
(90, 2, 3, 15, 'pending', '2021-10-09 11:07:56', NULL, NULL, NULL),
(91, 2, 1, 16, 'pending', '2021-10-09 11:08:20', NULL, NULL, NULL),
(92, 2, 2, 16, 'pending', '2021-10-09 11:08:20', NULL, NULL, NULL),
(93, 2, 3, 16, 'pending', '2021-10-09 11:08:20', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `description` text NOT NULL,
  `package_limit` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `name`, `price`, `description`, `package_limit`, `created_date`, `status`) VALUES
(4, 'individual', 100, 'individual', 1, '2021-12-24 13:57:47', 1),
(5, 'enterprise', 500, 'enterprise', 4, '2021-12-24 13:57:47', 1),
(6, 'custom', 800, 'custom', 500, '2021-12-24 13:57:47', 1);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `client_package_id` int(11) NOT NULL,
  `payment_txn` varchar(255) NOT NULL,
  `amount` varchar(50) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `client_package_id`, `payment_txn`, `amount`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'txn_3JRtamEDAWFaP2cd1PIOgour', '100', 1, '2021-08-24 11:57:25', '2021-08-24 11:57:25');

-- --------------------------------------------------------

--
-- Table structure for table `provider`
--

CREATE TABLE `provider` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `branch_name` varchar(255) DEFAULT NULL,
  `lat_long` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `status` enum('active','inactive','block') DEFAULT 'inactive',
  `created_date` timestamp NULL DEFAULT current_timestamp(),
  `zip_code` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `provider`
--

INSERT INTO `provider` (`id`, `name`, `email`, `password`, `phone`, `branch_name`, `lat_long`, `address`, `city_id`, `state`, `status`, `created_date`, `zip_code`) VALUES
(1, 'Muhammd', 'muhammad.hassan@oip.com.pk', '$2b$10$GzH.wKnUY1p7ND2sWr.UCu2.a3IuUO6P3vnIM0uxgvXvFlCJ/.Y5S', '105055', '10', '10', '10', 10, '10', 'inactive', '2021-10-10 11:39:21', '256');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `rating` float NOT NULL,
  `reviews` varchar(1000) NOT NULL,
  `client_id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `role_name` varchar(55) NOT NULL,
  `role_status` int(1) NOT NULL DEFAULT 1,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role_name`, `role_status`, `created_date`) VALUES
(1, 'admin', 1, '2021-12-24 13:45:57'),
(2, 'client', 1, '2021-12-24 13:45:57'),
(3, 'translator', 1, '2021-12-24 13:45:57');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `service_category` int(11) DEFAULT NULL,
  `note` varchar(500) NOT NULL,
  `client_id` int(11) NOT NULL,
  `assigned_provider_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `service_category`, `note`, `client_id`, `assigned_provider_id`, `status`, `created_date`) VALUES
(1, 2, 'I need this service for a tourism', 16, 4, 1, '2021-09-03 19:18:24'),
(2, 0, 'Acne treatments are not just for teenagers anymore, many individuals in their 20’s, 30’s, and beyond are dealing with this potentially embarrassing condition. At our spa, treatments for acne usually employ deep-pore and deep-tissue cleansing to rid the skin of excess oils and stimulate circulation. Antibacterial ingredients are often utilized in a deep cleansing facial to prevent acne breakouts.', 0, 0, 1, '2021-09-03 20:31:25'),
(3, 0, 'This 45-minute treatment starts with a deep cleansing, exfoliation with steam, Gel being penetrated in your skin followed by facial and décolleté massage, a mask specific for your skin and finished with moisturizer.', 0, 0, 1, '2021-09-03 20:31:51'),
(4, 0, 'Hair straightening is a hair styling technique used since ages involving the flattening and straightening of hair in order to give it a smooth, streamlined, and ‘sleek’ appearance.', 0, 0, 1, '2021-09-03 20:32:30'),
(5, 0, 'Artificial hair integrations, more commonly known as hair extensions, add length and/or fullness to human hair.', 0, 0, 1, '2021-09-03 20:32:54'),
(6, 0, 'Swedish massage is the most common and best-known type of massage in the West. If it’s your first time at the spa or you don’t get massage very often, Swedish massage is the perfect massage for you. Swedish massage therapy is the modality that comes to mind when most individuals think about massage. As the best-known type of bodywork performed today, one of the primary goals of the Swedish massage technique is to relax the entire body. This is accomplished by rubbing the muscles with long glidin', 0, 0, 1, '2021-09-03 21:08:23'),
(7, 0, 'Aromatherapy uses plant materials and aromatic plant oils, including essential oils, and other aromatic compounds for the purpose of altering one’s mood, cognitive, psychological or physical wellbeing.', 0, 0, 1, '2021-09-03 21:09:36'),
(8, 0, 'Hot Stone Massage Therapy melts away strain, comforts muscle stiffness and enhances circulation and metabolism. Each 1 ½ -hour hot stone massage therapy session promotes deeper muscle relaxation through the placement of smooth, water-heated stones at key points on the body. Our professional massage therapists also incorporate a customized massage, with the use of hot stones which offers enriched benefits.', 0, 0, 1, '2021-09-03 21:10:00'),
(9, 0, 'test', 0, 0, 1, '2021-09-09 18:51:18'),
(10, 0, 'lorem', 0, 0, 1, '2021-09-09 18:56:54'),
(11, 0, 'test desc', 0, 0, 0, '2021-10-09 21:07:59'),
(12, 0, 'zzztest desc1111', 0, 0, 1, '2021-10-09 21:10:17'),
(13, 0, 'zzztest desc1111', 0, 0, 1, '2021-10-09 21:18:27');

-- --------------------------------------------------------

--
-- Table structure for table `service_category`
--

CREATE TABLE `service_category` (
  `id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `service_category`
--

INSERT INTO `service_category` (`id`, `category_name`, `status`, `created_date`) VALUES
(1, 'christmas', 1, '2021-12-24 14:29:50'),
(2, 'tourism', 1, '2021-12-24 14:29:50'),
(3, 'medical emergency', 1, '2021-12-24 14:29:50');

-- --------------------------------------------------------

--
-- Table structure for table `trip`
--

CREATE TABLE `trip` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `rider_id` int(11) NOT NULL,
  `pickup_datetime` datetime DEFAULT NULL,
  `dropoff_datetime` datetime DEFAULT NULL,
  `pickup_lat` double NOT NULL,
  `pickup_long` double NOT NULL,
  `dropoff_lat` double NOT NULL,
  `dropoff_long` double NOT NULL,
  `total_distance` double NOT NULL,
  `total_duration` double NOT NULL,
  `total_point` double NOT NULL,
  `total_amount` double NOT NULL,
  `status` longblob NOT NULL,
  `ratings` varchar(500) NOT NULL,
  `remarks` varchar(500) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `trip`
--

INSERT INTO `trip` (`id`, `customer_id`, `rider_id`, `pickup_datetime`, `dropoff_datetime`, `pickup_lat`, `pickup_long`, `dropoff_lat`, `dropoff_long`, `total_distance`, `total_duration`, `total_point`, `total_amount`, `status`, `ratings`, `remarks`, `created_date`, `updated_date`) VALUES
(2, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '2021-11-10 11:57:53', '2021-11-10 11:57:53');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `street_address` varchar(255) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `zip_code` varchar(100) DEFAULT NULL,
  `status` enum('active','inactive','block') DEFAULT 'inactive',
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `forget_password_hash` varchar(500) NOT NULL,
  `role_id` int(11) NOT NULL DEFAULT 1,
  `online_status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `previous_package` int(11) DEFAULT NULL,
  `current_package` int(11) DEFAULT NULL,
  `lat` varchar(255) NOT NULL,
  `lng` varchar(255) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `profile_image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `full_name`, `email`, `password`, `phone`, `street_address`, `city_id`, `state`, `zip_code`, `status`, `created_date`, `forget_password_hash`, `role_id`, `online_status`, `previous_package`, `current_package`, `lat`, `lng`, `address`, `profile_image`) VALUES
(1, 'Ali', 'test@test.com', '$2b$10$Kc2RT8txvMPPjf7n.DdW7eZ8UPfkHyvVDdYcFxt3Nbx4X2eOyeE/i', NULL, NULL, NULL, NULL, NULL, 'active', '2021-08-28 09:22:11', '', 1, 'inactive', NULL, NULL, '', '', '', ''),
(4, 'Muhammad Ahmed', 'hassan.dev73@gmail.com', '$2b$10$08MMfSdvCwjtoU8hIaOY/e2tgL8UiYgCkHt.O8tsX0icDeGxsULy2', '0300256972121', 'streetAddress', 1, 'LA', '545', 'active', '2021-09-07 13:46:28', 'null', 3, 'inactive', NULL, NULL, '', '', '', ''),
(7, 'fullName', 'ali@ali.co', '$2b$10$2IK60IR8t0ljo40zh5p3yuecjd.pgizlXWZjABWVd9eSMqZAHJp2e', '0300256972121', 'streetAddress', 1, 'LA', '545', 'active', '2021-10-03 17:40:06', '', 3, 'inactive', NULL, NULL, '', '', '', ''),
(9, 'fullName', 'ali@ali.cmo', '$2b$10$fPPnh2rVqTmPCxrGnB/phOnZt6HTFBpa.Sy91xTimZkWHs374ssmG', '0300256972121', 'streetAddress', 1, 'LA', '545', 'block', '2021-10-03 17:41:21', '', 1, 'inactive', NULL, NULL, '', '', '', ''),
(11, 'fullName', 'muhammad.hassan@oip.com.pk', '$2b$10$HtZRgH1Qm6SabaIlNlEMHeUINvLlQ.XDyk0zc9KCD8XskngTkfLjC', '0300256972121', 'streetAddress', 1, 'LA', '545', 'inactive', '2021-11-09 11:50:24', '479491de2535ef799de6c90dcda20633', 1, 'inactive', NULL, NULL, '', '', '', ''),
(13, 'fullName', 'muhammad.hassans@oip.com.pk', '$2b$10$1NrRS6ufGMhnu6o94jlhH.4b/uK24/OxjLSRyyIXUn9BpsBJTo92G', '0300256972121', 'streetAddress', 1, 'LA', '545', 'inactive', '2021-11-09 12:36:47', '', 1, 'inactive', NULL, NULL, '', '', '', ''),
(16, 'Muhammad Hassan', 'muhammad.hassa2ns@oip.com.pk', '$2b$10$NlbDMWqClbjNAe2DaNpdgOVTmCImSDNNDEjsaJyNgBWd/mf/624sK', '0300256972121', 'streetAddress', 1, 'LA', '545', 'inactive', '2021-11-09 13:16:48', '', 2, 'active', 0, 1, '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `us_cities`
--

CREATE TABLE `us_cities` (
  `ID` int(11) NOT NULL,
  `ID_STATE` int(11) NOT NULL,
  `CITY` varchar(50) NOT NULL,
  `COUNTY` varchar(50) NOT NULL,
  `LATITUDE` double NOT NULL,
  `LONGITUDE` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `us_states`
--

CREATE TABLE `us_states` (
  `ID` int(11) NOT NULL,
  `STATE_CODE` char(2) NOT NULL,
  `STATE_NAME` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `us_states`
--

INSERT INTO `us_states` (`ID`, `STATE_CODE`, `STATE_NAME`) VALUES
(1, 'AL', 'Alabama'),
(2, 'AK', 'Alaska'),
(3, 'AZ', 'Arizona'),
(4, 'AR', 'Arkansas'),
(5, 'CA', 'California'),
(6, 'CO', 'Colorado'),
(7, 'CT', 'Connecticut'),
(8, 'DE', 'Delaware'),
(9, 'DC', 'District of Columbia'),
(10, 'FL', 'Florida'),
(11, 'GA', 'Georgia'),
(12, 'HI', 'Hawaii'),
(13, 'ID', 'Idaho'),
(14, 'IL', 'Illinois'),
(15, 'IN', 'Indiana'),
(16, 'IA', 'Iowa'),
(17, 'KS', 'Kansas'),
(18, 'KY', 'Kentucky'),
(19, 'LA', 'Louisiana'),
(20, 'ME', 'Maine'),
(21, 'MD', 'Maryland'),
(22, 'MA', 'Massachusetts'),
(23, 'MI', 'Michigan'),
(24, 'MN', 'Minnesota'),
(25, 'MS', 'Mississippi'),
(26, 'MO', 'Missouri'),
(27, 'MT', 'Montana'),
(28, 'NE', 'Nebraska'),
(29, 'NV', 'Nevada'),
(30, 'NH', 'New Hampshire'),
(31, 'NJ', 'New Jersey'),
(32, 'NM', 'New Mexico'),
(33, 'NY', 'New York'),
(34, 'NC', 'North Carolina'),
(35, 'ND', 'North Dakota'),
(36, 'OH', 'Ohio'),
(37, 'OK', 'Oklahoma'),
(38, 'OR', 'Oregon'),
(39, 'PA', 'Pennsylvania'),
(40, 'PR', 'Puerto Rico'),
(41, 'RI', 'Rhode Island'),
(42, 'SC', 'South Carolina'),
(43, 'SD', 'South Dakota'),
(44, 'TN', 'Tennessee'),
(45, 'TX', 'Texas'),
(46, 'UT', 'Utah'),
(47, 'VT', 'Vermont'),
(48, 'VA', 'Virginia'),
(49, 'WA', 'Washington'),
(50, 'WV', 'West Virginia'),
(51, 'WI', 'Wisconsin'),
(52, 'WY', 'Wyoming');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking_order`
--
ALTER TABLE `booking_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_packages`
--
ALTER TABLE `client_packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `provider`
--
ALTER TABLE `provider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_category`
--
ALTER TABLE `service_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trip`
--
ALTER TABLE `trip`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `us_cities`
--
ALTER TABLE `us_cities`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_STATE` (`ID_STATE`);

--
-- Indexes for table `us_states`
--
ALTER TABLE `us_states`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `booking_order`
--
ALTER TABLE `booking_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `client_packages`
--
ALTER TABLE `client_packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `job`
--
ALTER TABLE `job`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `provider`
--
ALTER TABLE `provider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `service_category`
--
ALTER TABLE `service_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `trip`
--
ALTER TABLE `trip`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `us_cities`
--
ALTER TABLE `us_cities`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `us_states`
--
ALTER TABLE `us_states`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `us_cities`
--
ALTER TABLE `us_cities`
  ADD CONSTRAINT `us_cities_ibfk_1` FOREIGN KEY (`ID_STATE`) REFERENCES `us_states` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
