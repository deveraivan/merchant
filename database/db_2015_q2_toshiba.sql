-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 24, 2015 at 12:14 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_2015_q2_toshiba`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_clients_info`
--

CREATE TABLE IF NOT EXISTS `tbl_clients_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `contract_id` bigint(20) unsigned NOT NULL,
  `sales_id` bigint(20) unsigned NOT NULL,
  `country` varchar(45) NOT NULL,
  `town_city` varchar(45) NOT NULL,
  `postalcode` smallint(4) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contract_id_idx` (`contract_id`),
  KEY `company_id_idx` (`company_id`),
  KEY `user_id_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_companies`
--

CREATE TABLE IF NOT EXISTS `tbl_companies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contact_no` varchar(19) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_contracts`
--

CREATE TABLE IF NOT EXISTS `tbl_contracts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `contract_path` varchar(100) NOT NULL,
  `client_info_id` bigint(20) unsigned NOT NULL,
  `date_start` datetime NOT NULL,
  `date_end` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `clients_info_id_idx` (`client_info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_groups`
--

CREATE TABLE IF NOT EXISTS `tbl_groups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(45) NOT NULL,
  `description` text NOT NULL,
  `permission` text NOT NULL,
  `level` tinyint(3) unsigned NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userid_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_promotions`
--

CREATE TABLE IF NOT EXISTS `tbl_promotions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `description` text NOT NULL,
  `status` enum('enabled','disabled') NOT NULL,
  `discount` smallint(5) unsigned NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_requests`
--

CREATE TABLE IF NOT EXISTS `tbl_requests` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `quantity` smallint(5) unsigned NOT NULL,
  `request_item` varchar(100) NOT NULL,
  `date_requested` datetime NOT NULL,
  `date_needed` datetime NOT NULL,
  `delivery_address` varchar(45) NOT NULL,
  `request_type` enum('order','purchase') NOT NULL,
  `request_status` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sales`
--

CREATE TABLE IF NOT EXISTS `tbl_sales` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `request_id` bigint(20) unsigned NOT NULL,
  `supply_id` bigint(20) unsigned NOT NULL,
  `client_info_id` bigint(20) unsigned NOT NULL,
  `invoice` varchar(100) NOT NULL,
  `reciept_no` varchar(100) NOT NULL,
  `price` int(10) unsigned NOT NULL,
  `status` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `request_id_idx` (`request_id`),
  KEY `supply_id_idx` (`supply_id`),
  KEY `client_info_id_idx` (`client_info_id`),
  KEY `user_id_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_supplies`
--

CREATE TABLE IF NOT EXISTS `tbl_supplies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `request_id` bigint(20) unsigned DEFAULT NULL,
  `promotion_id` bigint(20) unsigned DEFAULT NULL,
  `item` varchar(50) DEFAULT NULL,
  `description` text,
  `hardware_type` varchar(100) NOT NULL,
  `number_of_supply` smallint(5) unsigned NOT NULL,
  `price` int(10) unsigned DEFAULT NULL,
  `manufacturer` varchar(100) DEFAULT NULL,
  `date_acquired` datetime DEFAULT NULL,
  `status` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `promotion_id_idx` (`promotion_id`),
  KEY `request_id_idx` (`request_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=259 ;

--
-- Dumping data for table `tbl_supplies`
--

INSERT INTO `tbl_supplies` (`id`, `request_id`, `promotion_id`, `item`, `description`, `hardware_type`, `number_of_supply`, `price`, `manufacturer`, `date_acquired`, `status`) VALUES
(1, NULL, NULL, NULL, NULL, 'Computer Cases', 1000, NULL, 'Alienware', NULL, NULL),
(2, NULL, NULL, NULL, NULL, 'Computer Cases', 0, NULL, 'AMAX Information Technology', NULL, NULL),
(3, NULL, NULL, NULL, NULL, 'Computer Cases', 0, NULL, 'Antec', NULL, NULL),
(4, NULL, NULL, NULL, NULL, 'Computer Cases', 0, NULL, 'AOpen', NULL, NULL),
(5, NULL, NULL, NULL, NULL, 'Computer Cases', 0, NULL, 'APEVIA', NULL, NULL),
(6, NULL, NULL, NULL, NULL, 'Computer Cases', 0, NULL, 'Arctic Cooling', NULL, NULL),
(7, NULL, NULL, NULL, NULL, 'Computer Cases', 0, NULL, 'ASRock', NULL, NULL),
(8, NULL, NULL, NULL, NULL, 'Computer Cases', 0, NULL, 'Asus', NULL, NULL),
(9, NULL, NULL, NULL, NULL, 'Computer Cases', 0, NULL, 'Auzentech', NULL, NULL),
(10, NULL, NULL, NULL, NULL, 'Computer Cases', 0, NULL, 'Be quiet!', NULL, NULL),
(11, NULL, NULL, NULL, NULL, 'Computer Cases', 0, NULL, 'Chassis Plans', NULL, NULL),
(12, NULL, NULL, NULL, NULL, 'Computer Cases', 0, NULL, 'Compaq', NULL, NULL),
(13, NULL, NULL, NULL, NULL, 'Computer Cases', 0, NULL, 'Cooler Master', NULL, NULL),
(14, NULL, NULL, NULL, NULL, 'Computer Cases', 0, NULL, 'Corsair Memory', NULL, NULL),
(15, NULL, NULL, NULL, NULL, 'Computer Cases', 0, NULL, 'Dell', NULL, NULL),
(16, NULL, NULL, NULL, NULL, 'Computer Cases', 0, NULL, 'Deepcool', NULL, NULL),
(17, NULL, NULL, NULL, NULL, 'Computer Cases', 0, NULL, 'DFI', NULL, NULL),
(18, NULL, NULL, NULL, NULL, 'Computer Cases', 0, NULL, 'ECS', NULL, NULL),
(19, NULL, NULL, NULL, NULL, 'Computer Cases', 0, NULL, 'Enermax', NULL, NULL),
(20, NULL, NULL, NULL, NULL, 'Computer Cases', 0, NULL, 'EVGA Corporation', NULL, NULL),
(21, NULL, NULL, NULL, NULL, 'Computer Cases', 0, NULL, 'Foxconn', NULL, NULL),
(22, NULL, NULL, NULL, NULL, 'Computer Cases', 0, NULL, 'Fractal Design', NULL, NULL),
(23, NULL, NULL, NULL, NULL, 'Computer Cases', 0, NULL, 'Gigabyte Technology', NULL, NULL),
(24, NULL, NULL, NULL, NULL, 'Computer Cases', 0, NULL, 'iMicro', NULL, NULL),
(25, NULL, NULL, NULL, NULL, 'Computer Cases', 0, NULL, 'Intel', NULL, NULL),
(26, NULL, NULL, NULL, NULL, 'Computer Cases', 0, NULL, 'In Win Development', NULL, NULL),
(27, NULL, NULL, NULL, NULL, 'Computer Cases', 0, NULL, 'IXIUM', NULL, NULL),
(28, NULL, NULL, NULL, NULL, 'Computer Cases', 0, NULL, 'Jeantech', NULL, NULL),
(29, NULL, NULL, NULL, NULL, 'Computer Cases', 0, NULL, 'Lenovo', NULL, NULL),
(30, NULL, NULL, NULL, NULL, 'Computer Cases', 0, NULL, 'Lian Li', NULL, NULL),
(31, NULL, NULL, NULL, NULL, 'Computer Cases', 0, NULL, 'MSI', NULL, NULL),
(32, NULL, NULL, NULL, NULL, 'Computer Cases', 0, NULL, 'MiTAC', NULL, NULL),
(33, NULL, NULL, NULL, NULL, 'Computer Cases', 0, NULL, 'NZXT Corporation', NULL, NULL),
(34, NULL, NULL, NULL, NULL, 'Computer Cases', 0, NULL, 'RAIDMax', NULL, NULL),
(35, NULL, NULL, NULL, NULL, 'Computer Cases', 0, NULL, 'Shuffle', NULL, NULL),
(36, NULL, NULL, NULL, NULL, 'Computer Cases', 0, NULL, 'SilverStone', NULL, NULL),
(37, NULL, NULL, NULL, NULL, 'Computer Cases', 0, NULL, 'Thermaltake', NULL, NULL),
(38, NULL, NULL, NULL, NULL, 'Computer Cases', 0, NULL, 'Trenton Technology', NULL, NULL),
(39, NULL, NULL, NULL, NULL, 'Computer Cases', 0, NULL, 'Ultra Products', NULL, NULL),
(40, NULL, NULL, NULL, NULL, 'Computer Cases', 0, NULL, 'XFX', NULL, NULL),
(41, NULL, NULL, NULL, NULL, 'Computer Cases', 0, NULL, 'Zalman', NULL, NULL),
(42, NULL, NULL, NULL, NULL, 'Power Supply Units', 0, NULL, 'ADATA', NULL, NULL),
(43, NULL, NULL, NULL, NULL, 'Power Supply Units', 0, NULL, 'Antec', NULL, NULL),
(44, NULL, NULL, NULL, NULL, 'Power Supply Units', 0, NULL, 'Corsair', NULL, NULL),
(45, NULL, NULL, NULL, NULL, 'Power Supply Units', 0, NULL, 'Delta Electronics', NULL, NULL),
(46, NULL, NULL, NULL, NULL, 'Power Supply Units', 0, NULL, 'Foxconn', NULL, NULL),
(47, NULL, NULL, NULL, NULL, 'Power Supply Units', 0, NULL, 'Fractal Design', NULL, NULL),
(48, NULL, NULL, NULL, NULL, 'Power Supply Units', 0, NULL, 'In Win Development', NULL, NULL),
(49, NULL, NULL, NULL, NULL, 'Power Supply Units', 0, NULL, 'SilverStone', NULL, NULL),
(50, NULL, NULL, NULL, NULL, 'Power Supply Units', 0, NULL, 'XFX', NULL, NULL),
(51, NULL, NULL, NULL, NULL, 'Power Supply Units', 0, NULL, 'Zalman', NULL, NULL),
(52, NULL, NULL, NULL, NULL, 'Rack-mount computer cases', 0, NULL, 'AMAX Information Technology', NULL, NULL),
(53, NULL, NULL, NULL, NULL, 'Rack-mount computer cases', 0, NULL, 'Antec', NULL, NULL),
(54, NULL, NULL, NULL, NULL, 'Rack-mount computer cases', 0, NULL, 'AOpen', NULL, NULL),
(55, NULL, NULL, NULL, NULL, 'Rack-mount computer cases', 0, NULL, 'Supermicro', NULL, NULL),
(56, NULL, NULL, NULL, NULL, 'Rack-mount computer cases', 0, NULL, 'In Win Development', NULL, NULL),
(57, NULL, NULL, NULL, NULL, 'Laptop Cases', 0, NULL, 'Clevo', NULL, NULL),
(58, NULL, NULL, NULL, NULL, 'Laptop Cases', 0, NULL, 'MSI', NULL, NULL),
(59, NULL, NULL, NULL, NULL, 'Laptop Cases', 0, NULL, 'Sager', NULL, NULL),
(60, NULL, NULL, NULL, NULL, 'Motherboard', 0, NULL, 'Acer', NULL, NULL),
(61, NULL, NULL, NULL, NULL, 'Motherboard', 0, NULL, 'Acube Systems', NULL, NULL),
(62, NULL, NULL, NULL, NULL, 'Motherboard', 0, NULL, 'AMAX Information Technology', NULL, NULL),
(63, NULL, NULL, NULL, NULL, 'Motherboard', 0, NULL, 'AOpen', NULL, NULL),
(64, NULL, NULL, NULL, NULL, 'Motherboard', 0, NULL, 'ASRock', NULL, NULL),
(65, NULL, NULL, NULL, NULL, 'Motherboard', 0, NULL, 'Asus', NULL, NULL),
(66, NULL, NULL, NULL, NULL, 'Motherboard', 0, NULL, 'Biostar', NULL, NULL),
(67, NULL, NULL, NULL, NULL, 'Motherboard', 0, NULL, 'Chassis Plans', NULL, NULL),
(68, NULL, NULL, NULL, NULL, 'Motherboard', 0, NULL, 'DFI', NULL, NULL),
(69, NULL, NULL, NULL, NULL, 'Motherboard', 0, NULL, 'ECS', NULL, NULL),
(70, NULL, NULL, NULL, NULL, 'Motherboard', 0, NULL, 'EPoX', NULL, NULL),
(71, NULL, NULL, NULL, NULL, 'Motherboard', 0, NULL, 'Foxconn', NULL, NULL),
(72, NULL, NULL, NULL, NULL, 'Motherboard', 0, NULL, 'Gigabyte', NULL, NULL),
(73, NULL, NULL, NULL, NULL, 'Motherboard', 0, NULL, 'Gumstix', NULL, NULL),
(74, NULL, NULL, NULL, NULL, 'Motherboard', 0, NULL, 'IBM', NULL, NULL),
(75, NULL, NULL, NULL, NULL, 'Motherboard', 0, NULL, 'Intel', NULL, NULL),
(76, NULL, NULL, NULL, NULL, 'Motherboard', 0, NULL, 'Lanner Inc.', NULL, NULL),
(77, NULL, NULL, NULL, NULL, 'Motherboard', 0, NULL, 'LeadTek', NULL, NULL),
(78, NULL, NULL, NULL, NULL, 'Motherboard', 0, NULL, 'Lite-On', NULL, NULL),
(79, NULL, NULL, NULL, NULL, 'Motherboard', 0, NULL, 'Magic-Pro', NULL, NULL),
(80, NULL, NULL, NULL, NULL, 'Motherboard', 0, NULL, 'MSI', NULL, NULL),
(81, NULL, NULL, NULL, NULL, 'Motherboard', 0, NULL, 'PNY Technologies', NULL, NULL),
(82, NULL, NULL, NULL, NULL, 'Motherboard', 0, NULL, 'Powercolor', NULL, NULL),
(83, NULL, NULL, NULL, NULL, 'Motherboard', 0, NULL, 'Sapphire Technology', NULL, NULL),
(84, NULL, NULL, NULL, NULL, 'Motherboard', 0, NULL, 'Shuttle Inc.', NULL, NULL),
(85, NULL, NULL, NULL, NULL, 'Motherboard', 0, NULL, 'Simmtronics', NULL, NULL),
(86, NULL, NULL, NULL, NULL, 'Motherboard', 0, NULL, 'Supermicro', NULL, NULL),
(87, NULL, NULL, NULL, NULL, 'Motherboard', 0, NULL, 'Trenton Technology', NULL, NULL),
(88, NULL, NULL, NULL, NULL, 'Motherboard', 0, NULL, 'Tyan', NULL, NULL),
(89, NULL, NULL, NULL, NULL, 'Motherboard', 0, NULL, 'VIA Technlogy', NULL, NULL),
(90, NULL, NULL, NULL, NULL, 'Motherboard', 0, NULL, 'Vigor Gaming', NULL, NULL),
(91, NULL, NULL, NULL, NULL, 'Motherboard', 0, NULL, 'XFX', NULL, NULL),
(92, NULL, NULL, NULL, NULL, 'Motherboard', 0, NULL, 'Zotac', NULL, NULL),
(93, NULL, NULL, NULL, NULL, 'Chipsets for motherboard', 0, NULL, 'AMD', NULL, NULL),
(94, NULL, NULL, NULL, NULL, 'Chipsets for motherboard', 0, NULL, 'Intel', NULL, NULL),
(95, NULL, NULL, NULL, NULL, 'Chipsets for motherboard', 0, NULL, 'Nvidia', NULL, NULL),
(96, NULL, NULL, NULL, NULL, 'Chipsets for motherboard', 0, NULL, 'ServerWorks', NULL, NULL),
(97, NULL, NULL, NULL, NULL, 'Chipsets for motherboard', 0, NULL, 'Silicon Integrated Systems', NULL, NULL),
(98, NULL, NULL, NULL, NULL, 'Chipsets for motherboard', 0, NULL, 'VIA Technologies', NULL, NULL),
(99, NULL, NULL, NULL, NULL, 'Central Processing Unit', 0, NULL, 'AMD', NULL, NULL),
(100, NULL, NULL, NULL, NULL, 'Central Processing Unit', 0, NULL, 'ARM Holdings', NULL, NULL),
(101, NULL, NULL, NULL, NULL, 'Central Processing Unit', 0, NULL, 'Cyrix', NULL, NULL),
(102, NULL, NULL, NULL, NULL, 'Central Processing Unit', 0, NULL, 'Freescale', NULL, NULL),
(103, NULL, NULL, NULL, NULL, 'Central Processing Unit', 0, NULL, 'Intel', NULL, NULL),
(104, NULL, NULL, NULL, NULL, 'Central Processing Unit', 0, NULL, 'IBM', NULL, NULL),
(105, NULL, NULL, NULL, NULL, 'Central Processing Unit', 0, NULL, 'Marvell', NULL, NULL),
(106, NULL, NULL, NULL, NULL, 'Central Processing Unit', 0, NULL, 'MediaTek', NULL, NULL),
(107, NULL, NULL, NULL, NULL, 'Central Processing Unit', 0, NULL, 'NexGen', NULL, NULL),
(108, NULL, NULL, NULL, NULL, 'Central Processing Unit', 0, NULL, 'Nvidia Tegra', NULL, NULL),
(109, NULL, NULL, NULL, NULL, 'Central Processing Unit', 0, NULL, 'Oracle(Sun)', NULL, NULL),
(110, NULL, NULL, NULL, NULL, 'Central Processing Unit', 0, NULL, 'Qualcomm', NULL, NULL),
(111, NULL, NULL, NULL, NULL, 'Central Processing Unit', 0, NULL, 'Rise Technology', NULL, NULL),
(112, NULL, NULL, NULL, NULL, 'Central Processing Unit', 0, NULL, 'Samsung', NULL, NULL),
(113, NULL, NULL, NULL, NULL, 'Central Processing Unit', 0, NULL, 'SigmaTel', NULL, NULL),
(114, NULL, NULL, NULL, NULL, 'Central Processing Unit', 0, NULL, 'Texas Instruments', NULL, NULL),
(115, NULL, NULL, NULL, NULL, 'Central Processing Unit', 0, NULL, 'Transmeta', NULL, NULL),
(116, NULL, NULL, NULL, NULL, 'Central Processing Unit', 0, NULL, 'Tilera', NULL, NULL),
(117, NULL, NULL, NULL, NULL, 'Central Processing Unit', 0, NULL, 'Via(Centaur Technology)', NULL, NULL),
(118, NULL, NULL, NULL, NULL, 'Central Processing Unit', 0, NULL, 'WinChip', NULL, NULL),
(119, NULL, NULL, NULL, NULL, 'Internal HDD', 0, NULL, 'Seagate Technology', NULL, NULL),
(120, NULL, NULL, NULL, NULL, 'Internal HDD', 0, NULL, 'Toshiba', NULL, NULL),
(121, NULL, NULL, NULL, NULL, 'Internal HDD', 0, NULL, 'Western Digital', NULL, NULL),
(122, NULL, NULL, NULL, NULL, 'External HDD', 0, NULL, 'ADATA', NULL, NULL),
(123, NULL, NULL, NULL, NULL, 'External HDD', 0, NULL, 'Buffalo Technology', NULL, NULL),
(124, NULL, NULL, NULL, NULL, 'External HDD', 0, NULL, 'Freecom', NULL, NULL),
(125, NULL, NULL, NULL, NULL, 'External HDD', 0, NULL, 'G-Technology', NULL, NULL),
(126, NULL, NULL, NULL, NULL, 'External HDD', 0, NULL, 'HGST', NULL, NULL),
(127, NULL, NULL, NULL, NULL, 'External HDD', 0, NULL, 'Hyundai', NULL, NULL),
(128, NULL, NULL, NULL, NULL, 'External HDD', 0, NULL, 'IoSafe', NULL, NULL),
(129, NULL, NULL, NULL, NULL, 'External HDD', 0, NULL, 'LaCie', NULL, NULL),
(130, NULL, NULL, NULL, NULL, 'External HDD', 0, NULL, 'LG', NULL, NULL),
(131, NULL, NULL, NULL, NULL, 'External HDD', 0, NULL, 'Promise Technology', NULL, NULL),
(132, NULL, NULL, NULL, NULL, 'External HDD', 0, NULL, 'Samsung', NULL, NULL),
(133, NULL, NULL, NULL, NULL, 'External HDD', 0, NULL, 'Silicon Power', NULL, NULL),
(134, NULL, NULL, NULL, NULL, 'External HDD', 0, NULL, 'Seagate Technology', NULL, NULL),
(135, NULL, NULL, NULL, NULL, 'External HDD', 0, NULL, 'Toshiba', NULL, NULL),
(136, NULL, NULL, NULL, NULL, 'External HDD', 0, NULL, 'TrekStor', NULL, NULL),
(137, NULL, NULL, NULL, NULL, 'External HDD', 0, NULL, 'Transcend Information', NULL, NULL),
(138, NULL, NULL, NULL, NULL, 'External HDD', 0, NULL, 'Verbatim Corporation', NULL, NULL),
(139, NULL, NULL, NULL, NULL, 'External HDD', 0, NULL, 'Western Digital', NULL, NULL),
(140, NULL, NULL, NULL, NULL, 'External HDD', 0, NULL, 'Lacie', NULL, NULL),
(141, NULL, NULL, NULL, NULL, 'Drive Controller Cards/RAID', 0, NULL, '3ware', NULL, NULL),
(142, NULL, NULL, NULL, NULL, 'Drive Controller Cards/RAID', 0, NULL, 'Adaptec', NULL, NULL),
(143, NULL, NULL, NULL, NULL, 'Drive Controller Cards/RAID', 0, NULL, 'Asus', NULL, NULL),
(144, NULL, NULL, NULL, NULL, 'Drive Controller Cards/RAID', 0, NULL, 'ATTO Technology', NULL, NULL),
(145, NULL, NULL, NULL, NULL, 'Drive Controller Cards/RAID', 0, NULL, 'Dell', NULL, NULL),
(146, NULL, NULL, NULL, NULL, 'Drive Controller Cards/RAID', 0, NULL, 'HP', NULL, NULL),
(147, NULL, NULL, NULL, NULL, 'Drive Controller Cards/RAID', 0, NULL, 'Intel', NULL, NULL),
(148, NULL, NULL, NULL, NULL, 'Drive Controller Cards/RAID', 0, NULL, 'LG', NULL, NULL),
(149, NULL, NULL, NULL, NULL, 'Drive Controller Cards/RAID', 0, NULL, 'LSI', NULL, NULL),
(150, NULL, NULL, NULL, NULL, 'Drive Controller Cards/RAID', 0, NULL, 'PNY', NULL, NULL),
(151, NULL, NULL, NULL, NULL, 'Drive Controller Cards/RAID', 0, NULL, 'Promise Technology', NULL, NULL),
(152, NULL, NULL, NULL, NULL, 'Drive Controller Cards/RAID', 0, NULL, 'StarTech.com', NULL, NULL),
(153, NULL, NULL, NULL, NULL, 'Drive Controller Cards/RAID', 0, NULL, 'Supermicro', NULL, NULL),
(154, NULL, NULL, NULL, NULL, 'Solid-state drives', 0, NULL, 'ADATA', NULL, NULL),
(155, NULL, NULL, NULL, NULL, 'Solid-state drives	', 0, NULL, 'Angelbird Technologies', NULL, NULL),
(156, NULL, NULL, NULL, NULL, 'Solid-state drives	', 0, NULL, 'Corsiar Memory', NULL, NULL),
(157, NULL, NULL, NULL, NULL, 'Solid-state drives', 0, NULL, 'Crucial', NULL, NULL),
(158, NULL, NULL, NULL, NULL, 'Solid-state drives	', 0, NULL, 'Curtiss-Wright', NULL, NULL),
(159, NULL, NULL, NULL, NULL, 'Solid-state drives	', 0, NULL, 'Fusion-io(SanDisk NOW)', NULL, NULL),
(160, NULL, NULL, NULL, NULL, 'Solid-state drives	', 0, NULL, 'Fujitsu', NULL, NULL),
(161, NULL, NULL, NULL, NULL, 'Solid-state drives	', 0, NULL, 'Greenliant Systems', NULL, NULL),
(162, NULL, NULL, NULL, NULL, 'Solid-state drives	', 0, NULL, 'G. Skill', NULL, NULL),
(163, NULL, NULL, NULL, NULL, 'Solid-state drives	', 0, NULL, 'Hitachi Global Storage Technology', NULL, NULL),
(164, NULL, NULL, NULL, NULL, 'Solid-state drives	', 0, NULL, 'IBM', NULL, NULL),
(165, NULL, NULL, NULL, NULL, 'Solid-state drives	', 0, NULL, 'Indilinx(Toshiba NOW)', NULL, NULL),
(166, NULL, NULL, NULL, NULL, 'Solid-state drives	', 0, NULL, 'Intel', NULL, NULL),
(167, NULL, NULL, NULL, NULL, 'Solid-state drives	', 0, NULL, 'Kingston Technology', NULL, NULL),
(168, NULL, NULL, NULL, NULL, 'Solid-state drives	', 0, NULL, 'Lexar', NULL, NULL),
(169, NULL, NULL, NULL, NULL, 'Solid-state drives	', 0, NULL, 'LSI Corporation', NULL, NULL),
(170, NULL, NULL, NULL, NULL, 'Solid-state drives	', 0, NULL, 'Memoright', NULL, NULL),
(171, NULL, NULL, NULL, NULL, 'Solid-state drives	', 0, NULL, 'Micron Technology', NULL, NULL),
(172, NULL, NULL, NULL, NULL, 'Solid-state drives	', 0, NULL, 'Mushkin', NULL, NULL),
(173, NULL, NULL, NULL, NULL, 'Solid-state drives	', 0, NULL, 'OCZ Technology', NULL, NULL),
(174, NULL, NULL, NULL, NULL, 'Solid-state drives	', 0, NULL, 'Ritek/RiDATA', NULL, NULL),
(175, NULL, NULL, NULL, NULL, 'Solid-state drives	', 0, NULL, 'RunCore', NULL, NULL),
(176, NULL, NULL, NULL, NULL, 'Solid-state drives	', 0, NULL, 'Samsung Electrnics', NULL, NULL),
(177, NULL, NULL, NULL, NULL, 'Solid-state drives	', 0, NULL, 'SandForce', NULL, NULL),
(178, NULL, NULL, NULL, NULL, 'Solid-state drives	', 0, NULL, 'SanDisk', NULL, NULL),
(179, NULL, NULL, NULL, NULL, 'Solid-state drives	', 0, NULL, 'Seagate Technologies', NULL, NULL),
(180, NULL, NULL, NULL, NULL, 'Solid-state drives	', 0, NULL, 'SK Hynix', NULL, NULL),
(181, NULL, NULL, NULL, NULL, 'Solid-state drives	', 0, NULL, 'STEC, Inc.', NULL, NULL),
(182, NULL, NULL, NULL, NULL, 'Solid-state drives	', 0, NULL, 'Strontium Technology', NULL, NULL),
(183, NULL, NULL, NULL, NULL, 'Solid-state drives	', 0, NULL, 'SuperTalent', NULL, NULL),
(184, NULL, NULL, NULL, NULL, 'Solid-state drives	', 0, NULL, 'Texas Memory Systems', NULL, NULL),
(185, NULL, NULL, NULL, NULL, 'Solid-state drives	', 0, NULL, 'Toshiba', NULL, NULL),
(186, NULL, NULL, NULL, NULL, 'Solid-state drives	', 0, NULL, 'Transcend', NULL, NULL),
(187, NULL, NULL, NULL, NULL, 'Solid-state drives	', 0, NULL, 'Verbatim Corporation', NULL, NULL),
(188, NULL, NULL, NULL, NULL, 'Solid-state drives	', 0, NULL, 'Viking Modular Solutions', NULL, NULL),
(189, NULL, NULL, NULL, NULL, 'Solid-state drives	', 0, NULL, 'Violin Memory', NULL, NULL),
(190, NULL, NULL, NULL, NULL, 'Solid-state drives	', 0, NULL, 'Zalman', NULL, NULL),
(191, NULL, NULL, NULL, NULL, 'Solid-state drives	', 0, NULL, 'Goodram', NULL, NULL),
(192, NULL, NULL, NULL, NULL, 'Optical disk drives', 0, NULL, 'AOpen', NULL, NULL),
(193, NULL, NULL, NULL, NULL, 'Optical disk drives', 0, NULL, 'Artec', NULL, NULL),
(194, NULL, NULL, NULL, NULL, 'Optical disk drives', 0, NULL, 'Asus', NULL, NULL),
(195, NULL, NULL, NULL, NULL, 'Optical disk drives', 0, NULL, 'BenQ', NULL, NULL),
(196, NULL, NULL, NULL, NULL, 'Optical disk drives', 0, NULL, 'HP', NULL, NULL),
(197, NULL, NULL, NULL, NULL, 'Optical disk drives', 0, NULL, 'Hitachi-LG Electronics', NULL, NULL),
(198, NULL, NULL, NULL, NULL, 'Optical disk drives', 0, NULL, 'Imation', NULL, NULL),
(199, NULL, NULL, NULL, NULL, 'Optical disk drives', 0, NULL, 'Iomega', NULL, NULL),
(200, NULL, NULL, NULL, NULL, 'Optical disk drives', 0, NULL, 'JVC', NULL, NULL),
(201, NULL, NULL, NULL, NULL, 'Optical disk drives', 0, NULL, 'Lite-On', NULL, NULL),
(202, NULL, NULL, NULL, NULL, 'Optical disk drives', 0, NULL, 'Memorex', NULL, NULL),
(203, NULL, NULL, NULL, NULL, 'Optical disk drives', 0, NULL, 'Panasonic', NULL, NULL),
(204, NULL, NULL, NULL, NULL, 'Optical disk drives', 0, NULL, 'Philips-BenQ Digital Solutions', NULL, NULL),
(205, NULL, NULL, NULL, NULL, 'Optical disk drives', 0, NULL, 'Philips-Lite-On Digital Solutions', NULL, NULL),
(206, NULL, NULL, NULL, NULL, 'Optical disk drives', 0, NULL, 'Pioneer', NULL, NULL),
(207, NULL, NULL, NULL, NULL, 'Optical disk drives', 0, NULL, 'Piextor', NULL, NULL),
(208, NULL, NULL, NULL, NULL, 'Optical disk drives', 0, NULL, 'Polaroid', NULL, NULL),
(209, NULL, NULL, NULL, NULL, 'Optical disk drives', 0, NULL, 'Ricoh', NULL, NULL),
(210, NULL, NULL, NULL, NULL, 'Optical disk drives', 0, NULL, 'SilverStone', NULL, NULL),
(211, NULL, NULL, NULL, NULL, 'Optical disk drives', 0, NULL, 'Sony-ENC', NULL, NULL),
(212, NULL, NULL, NULL, NULL, 'Optical disk drives', 0, NULL, 'TEAC', NULL, NULL),
(213, NULL, NULL, NULL, NULL, 'Optical disk drives', 0, NULL, 'Toshiba-Samsung Storage Technology', NULL, NULL),
(214, NULL, NULL, NULL, NULL, 'Optical disk drives', 0, NULL, 'Traxada', NULL, NULL),
(215, NULL, NULL, NULL, NULL, 'Optical disk drives', 0, NULL, 'Yamaha', NULL, NULL),
(216, NULL, NULL, NULL, NULL, 'Fan Controllers', 0, NULL, 'Zalman', NULL, NULL),
(217, NULL, NULL, NULL, NULL, 'Fan Controllers', 0, NULL, 'NZXT Corporation', NULL, NULL),
(218, NULL, NULL, NULL, NULL, 'Fan Controllers', 0, NULL, 'Asus', NULL, NULL),
(219, NULL, NULL, NULL, NULL, 'Fan Controllers', 0, NULL, 'Scythe', NULL, NULL),
(220, NULL, NULL, NULL, NULL, 'Fan Controllers', 0, NULL, 'Thermaltake', NULL, NULL),
(221, NULL, NULL, NULL, NULL, 'Cooling Solutions', 0, NULL, 'Akasa', NULL, NULL),
(222, NULL, NULL, NULL, NULL, 'Cooling Solutions', 0, NULL, 'AMD', NULL, NULL),
(223, NULL, NULL, NULL, NULL, 'Cooling Solutions', 0, NULL, 'Asus', NULL, NULL),
(224, NULL, NULL, NULL, NULL, 'Cooling Solutions', 0, NULL, 'Be quiet!', NULL, NULL),
(225, NULL, NULL, NULL, NULL, 'Cooling Solutions', 0, NULL, 'Cooler Master', NULL, NULL),
(226, NULL, NULL, NULL, NULL, 'Cooling Solutions', 0, NULL, 'Corsair Memory', NULL, NULL),
(227, NULL, NULL, NULL, NULL, 'Cooling Solutions', 0, NULL, 'Deepcool', NULL, NULL),
(228, NULL, NULL, NULL, NULL, 'Cooling Solutions', 0, NULL, 'Delta Electronics', NULL, NULL),
(229, NULL, NULL, NULL, NULL, 'Cooling Solutions', 0, NULL, 'EBM-PAPST', NULL, NULL),
(230, NULL, NULL, NULL, NULL, 'Cooling Solutions', 0, NULL, 'Fractal Design', NULL, NULL),
(231, NULL, NULL, NULL, NULL, 'Cooling Solutions', 0, NULL, 'Foxconn', NULL, NULL),
(232, NULL, NULL, NULL, NULL, 'Cooling Solutions', 0, NULL, 'Enermax', NULL, NULL),
(233, NULL, NULL, NULL, NULL, 'Cooling Solutions', 0, NULL, 'Gigabyte Technology', NULL, NULL),
(234, NULL, NULL, NULL, NULL, 'Cooling Solutions', 0, NULL, 'Hama Technology', NULL, NULL),
(235, NULL, NULL, NULL, NULL, 'Cooling Solutions', 0, NULL, 'Intel', NULL, NULL),
(236, NULL, NULL, NULL, NULL, 'Cooling Solutions', 0, NULL, 'Nidec', NULL, NULL),
(237, NULL, NULL, NULL, NULL, 'Cooling Solutions', 0, NULL, 'Noctua', NULL, NULL),
(238, NULL, NULL, NULL, NULL, 'Cooling Solutions', 0, NULL, 'NZXT Corporation', NULL, NULL),
(239, NULL, NULL, NULL, NULL, 'Cooling Solutions', 0, NULL, 'Saint-Golbain', NULL, NULL),
(240, NULL, NULL, NULL, NULL, 'Cooling Solutions', 0, NULL, 'Spire', NULL, NULL),
(241, NULL, NULL, NULL, NULL, 'Cooling Solutions', 0, NULL, 'Thermalight', NULL, NULL),
(242, NULL, NULL, NULL, NULL, 'Cooling Solutions', 0, NULL, 'Thermaltake', NULL, NULL),
(243, NULL, NULL, NULL, NULL, 'Cooling Solutions', 0, NULL, 'Ultra Products', NULL, NULL),
(244, NULL, NULL, NULL, NULL, 'Cooling Solutions', 0, NULL, 'Vantec', NULL, NULL),
(245, NULL, NULL, NULL, NULL, 'Cooling Solutions', 0, NULL, 'Vigor Gaming', NULL, NULL),
(246, NULL, NULL, NULL, NULL, 'Cooling Solutions', 0, NULL, 'Zalman', NULL, NULL),
(247, NULL, NULL, NULL, 'Seidon Series', 'Non-refillable liquid cooling', 0, NULL, 'Cooler Master', NULL, NULL),
(248, NULL, NULL, NULL, 'H-Series', 'Non-refillable liquid cooling', 0, NULL, 'Corsair Memory', NULL, NULL),
(249, NULL, NULL, NULL, 'Capitain Series,Maelstrom Series', 'Non-refillable liquid cooling', 0, NULL, 'Deepcool', NULL, NULL),
(250, NULL, NULL, NULL, '', 'Non-refillable liquid cooling', 0, NULL, 'EVGA Corporation', NULL, NULL),
(251, NULL, NULL, NULL, 'Kelvin Series', 'Non-refillable liquid cooling', 0, NULL, 'Fractal design', NULL, NULL),
(252, NULL, NULL, NULL, 'Kraken Series', 'Non-refillable liquid cooling', 0, NULL, 'NZXT', NULL, NULL),
(253, NULL, NULL, NULL, 'Tundra Series', 'Non-refillable liquid cooling', 0, NULL, 'SilverStone Technology', NULL, NULL),
(254, NULL, NULL, NULL, 'Water 2.0 Series', 'Non-refillable liquid cooling', 0, NULL, 'Thermaltake', NULL, NULL),
(255, NULL, NULL, NULL, 'SKADI series, Reserator 3 Max, LQ Series,Reserator 3 Max Dual ', 'Non-refillable liquid cooling', 0, NULL, 'Zalman', NULL, NULL),
(256, NULL, NULL, NULL, NULL, 'Non-refillable liquid cooling', 0, NULL, 'Zotac', NULL, NULL),
(257, NULL, NULL, NULL, NULL, 'Refillable liquid cooling kits', 0, NULL, 'Gigabyte Technology', NULL, NULL),
(258, NULL, NULL, NULL, NULL, 'Refillable liquid cooling kits', 0, NULL, 'Thermaltake', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE IF NOT EXISTS `tbl_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` bigint(20) unsigned DEFAULT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `address` varchar(70) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `group_id_idx` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_clients_info`
--
ALTER TABLE `tbl_clients_info`
  ADD CONSTRAINT `company_id` FOREIGN KEY (`company_id`) REFERENCES `tbl_companies` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `contract_id` FOREIGN KEY (`contract_id`) REFERENCES `tbl_contracts` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `tbl_contracts`
--
ALTER TABLE `tbl_contracts`
  ADD CONSTRAINT `clients_info_id` FOREIGN KEY (`client_info_id`) REFERENCES `tbl_clients_info` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `tbl_groups`
--
ALTER TABLE `tbl_groups`
  ADD CONSTRAINT `userid` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `tbl_promotions`
--
ALTER TABLE `tbl_promotions`
  ADD CONSTRAINT `useridid` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tbl_requests`
--
ALTER TABLE `tbl_requests`
  ADD CONSTRAINT `useruser` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `tbl_sales`
--
ALTER TABLE `tbl_sales`
  ADD CONSTRAINT `client_infoid` FOREIGN KEY (`client_info_id`) REFERENCES `tbl_clients_info` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `requestid` FOREIGN KEY (`request_id`) REFERENCES `tbl_requests` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `supplyid` FOREIGN KEY (`supply_id`) REFERENCES `tbl_supplies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `user_ids` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tbl_supplies`
--
ALTER TABLE `tbl_supplies`
  ADD CONSTRAINT `promotion_id` FOREIGN KEY (`promotion_id`) REFERENCES `tbl_promotions` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `request_ids` FOREIGN KEY (`request_id`) REFERENCES `tbl_requests` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD CONSTRAINT `group_id` FOREIGN KEY (`group_id`) REFERENCES `tbl_groups` (`id`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
