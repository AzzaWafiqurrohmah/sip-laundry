-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 19, 2023 at 07:22 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sip_laundry`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `address` mediumtext NOT NULL,
  `name` varchar(150) NOT NULL,
  `phone` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `address`, `name`, `phone`) VALUES
(247, 'jember', 'sasa', '087675675654'),
(248, 'jember', 'tina', '087876765654'),
(249, 'jember', 'titin', '087875432123'),
(254, 'jember', 'joki', '081238560'),
(255, 'jember', 'Aldea', '33232323'),
(258, 'jember', 'titi', '086234213213'),
(259, 'jember', 'rio', '089786765654'),
(260, 'jember', 'julia', '087123213456'),
(261, 'jember', 'jono', '086545123456'),
(263, 'jember', 'joki', '081238560'),
(264, 'jember', 'Aldea', '33232323'),
(268, 'jember', 'joki', '081238560'),
(269, 'jember', 'Aldea', '33232323'),
(272, 'banyuwangi', 'iyu', '081345432123'),
(274, 'jember', 'joki', '081238560'),
(275, 'jember', 'Aldea', '33232323'),
(289, 'jember', 'joki', '081238560'),
(290, 'jember', 'Aldea', '33232323'),
(294, 'jember', 'joki', '081238560'),
(295, 'jember', 'Aldea', '33232323'),
(298, 'bondowoso', 'rofiqi', '087876123214'),
(300, 'jember', 'joki', '081238560'),
(301, 'jember', 'Aldea', '33232323'),
(305, 'jember', 'joki', '081238560'),
(306, 'jember', 'Aldea', '33232323'),
(310, 'jember', 'joki', '081238560'),
(311, 'jember', 'Aldea', '33232323');

-- --------------------------------------------------------

--
-- Table structure for table `expense`
--

CREATE TABLE `expense` (
  `expense_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `expense_date` date NOT NULL,
  `subtotal` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `optional` mediumtext NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `expense`
--

INSERT INTO `expense` (`expense_id`, `name`, `expense_date`, `subtotal`, `qty`, `amount`, `optional`, `user_id`) VALUES
(50, 'beli parfum', '2023-06-03', 3000, 3, 9000, 'beli di warung depan', 317),
(51, 'beli rinso', '2023-06-03', 1000, 10, 10000, 'beli di toko', 317),
(54, 'beli jajan', '2023-05-09', 3000, 5, 15000, 'beli beli', 324),
(57, 'beli plastik', '2023-04-01', 2000, 5, 10000, 'keperluan sampah', 326),
(58, 'beli deterjen', '2023-02-02', 2000, 10, 20000, 'beli beli', 327),
(60, 'beli sabun', '2023-01-08', 6000, 2, 12000, 'beli beli', 325),
(61, 'beli obat', '2023-01-03', 10000, 3, 30000, 'buat orang sakit', 324),
(62, 'beli jajan', '2023-03-02', 6000, 2, 12000, 'beli', 326),
(63, 'beli beli', '2023-03-04', 1000, 3, 3000, 'beli ', 325),
(74, 'jajan', '2023-06-17', 2000, 2, 4000, 'beli di toko', 312),
(75, 'sabun', '2023-06-17', 5000, 1, 5000, 'beli di warung', 317);

--
-- Triggers `expense`
--
DELIMITER $$
CREATE TRIGGER `add_amountExp` BEFORE INSERT ON `expense` FOR EACH ROW SET NEW.`amount` = NEW.`qty` * NEW.`subtotal`
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `laundries`
--

CREATE TABLE `laundries` (
  `laundry_id` int(11) NOT NULL,
  `unit` enum('kilogram','meter','pcs') NOT NULL,
  `cost` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `IsExpress` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `laundries`
--

INSERT INTO `laundries` (`laundry_id`, `unit`, `cost`, `name`, `IsExpress`) VALUES
(187, 'kilogram', 5000, 'cuci baju', 0),
(188, 'kilogram', 6000, 'cuci baju', 1),
(189, 'meter', 3000, 'korden', 0),
(190, 'meter', 4000, 'korden', 1),
(191, 'pcs', 10000, 'boneka', 0),
(192, 'pcs', 12000, 'boneka', 1),
(194, 'kilogram', 3323, 'aldea', 0),
(198, 'kilogram', 3323, 'aldea', 0),
(202, 'kilogram', 3323, 'aldea', 0),
(205, 'pcs', 7000, 'karpet', 1),
(207, 'kilogram', 3323, 'aldea', 0),
(211, 'kilogram', 3323, 'aldea', 0),
(215, 'kilogram', 3323, 'aldea', 0);

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `option_id` int(11) NOT NULL,
  `key` varchar(100) NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`option_id`, `key`, `value`) VALUES
(99, 'name', 'SIP Laundry'),
(100, 'costExpress', '2000'),
(101, 'address', 'Jember'),
(102, 'phone', '081358301632');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `transaction_id` int(11) NOT NULL,
  `transaction_date` datetime NOT NULL,
  `retard` int(11) NOT NULL DEFAULT 0,
  `pickup_date` datetime NOT NULL,
  `status` enum('process','finish','taken','canceled') DEFAULT 'process',
  `payment_status` enum('paid','unpaid','instalment') NOT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `IsExpress` tinyint(4) NOT NULL DEFAULT 0,
  `paid_off` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`transaction_id`, `transaction_date`, `retard`, `pickup_date`, `status`, `payment_status`, `amount`, `IsExpress`, `paid_off`, `user_id`, `customer_id`) VALUES
(165, '2023-06-07 09:30:10', 0, '2023-06-10 04:30:10', 'process', 'paid', 15000, 0, 0, 324, 255),
(166, '2023-05-08 09:37:27', 0, '2023-05-10 09:37:28', 'process', 'paid', 17000, 0, 0, 324, 248),
(167, '2023-05-05 09:37:28', 0, '2023-05-08 09:37:28', 'finish', 'instalment', 8000, 0, 0, 326, 254),
(168, '2023-04-07 09:40:13', 0, '2023-04-09 09:40:13', 'finish', 'paid', 20000, 0, 0, 328, 260),
(169, '2023-04-04 09:40:13', 0, '2023-04-08 09:40:13', 'process', 'instalment', 10000, 0, 0, 312, 261),
(170, '2023-03-06 09:41:57', 0, '2023-03-08 09:41:57', 'process', 'paid', 24000, 0, 0, 317, 260),
(173, '2023-02-07 14:59:17', 0, '2023-06-09 14:59:17', 'process', 'instalment', 5000, 0, 0, 317, 248),
(174, '2023-01-01 15:00:36', 0, '2023-01-04 15:00:36', 'process', 'paid', 35000, 0, 0, 328, 254),
(182, '2023-06-09 00:17:09', 0, '2023-06-09 00:17:09', 'finish', 'paid', 10000, 0, 0, 324, 254),
(183, '2023-06-09 00:17:09', 0, '2023-06-09 00:17:09', 'finish', 'paid', 20000, 0, 0, 325, 248),
(184, '2023-06-08 00:18:49', 0, '2023-06-08 00:18:49', 'taken', 'paid', 5000, 0, 0, 327, 249),
(186, '2023-06-12 03:29:30', 0, '2023-06-12 03:29:30', 'finish', 'paid', 4000, 0, 0, 317, 248),
(187, '2023-06-12 03:29:30', 0, '2023-06-12 03:29:30', 'finish', 'instalment', 5000, 0, 0, 317, 249),
(188, '2023-06-11 08:30:55', 0, '2023-06-11 08:30:55', 'finish', 'paid', 7000, 0, 0, 317, 263),
(189, '2023-06-11 08:30:55', 0, '2023-06-11 08:30:55', 'finish', 'instalment', 2000, 0, 0, 317, 248),
(190, '2023-06-11 08:32:13', 0, '2023-06-11 08:32:13', 'finish', 'paid', 5000, 0, 0, 317, 268),
(191, '2023-06-10 08:32:13', 0, '2023-06-10 08:32:13', 'finish', 'paid', 3000, 0, 0, 317, 248),
(192, '2023-06-10 08:33:43', 0, '2023-06-12 03:33:42', 'process', 'paid', 2000, 0, 0, 317, 254),
(193, '2023-06-10 08:33:43', 0, '2023-06-12 03:33:42', 'finish', 'paid', 1000, 0, 0, 317, 248),
(194, '2023-06-10 08:35:04', 0, '2023-06-12 03:35:03', 'process', 'paid', 4000, 0, 0, 317, 248),
(195, '2023-06-09 08:35:04', 0, '2023-06-12 03:35:03', 'taken', 'paid', 30000, 0, 0, 317, 248),
(196, '2023-06-09 08:36:08', 0, '2023-06-12 03:36:07', 'finish', 'instalment', 6000, 0, 0, 324, 247),
(197, '2023-06-14 00:00:00', 0, '2023-06-12 03:36:08', 'finish', 'paid', 22000, 0, 0, 317, 249),
(198, '2023-06-08 08:37:05', 0, '2023-06-12 03:37:05', 'process', 'paid', 5000, 0, 0, 317, 247),
(199, '2023-06-08 08:37:05', 0, '2023-06-12 03:37:05', 'finish', 'instalment', 4000, 0, 0, 317, 269),
(200, '2023-06-07 08:38:06', 0, '2023-06-12 03:38:06', 'taken', 'paid', 4000, 0, 0, 317, 260),
(201, '2023-06-07 08:38:06', 0, '2023-06-12 03:38:06', 'process', 'instalment', 1000, 0, 0, 317, 248),
(202, '2023-06-07 08:39:12', 0, '2023-06-12 03:39:11', 'finish', 'paid', 2000, 0, 0, 317, 269),
(203, '2023-06-07 08:39:12', 0, '2023-06-12 03:39:11', 'taken', 'paid', 4000, 0, 0, 317, 261),
(204, '2023-06-07 08:40:09', 0, '2023-06-12 03:40:09', 'taken', 'paid', 3000, 0, 0, 317, 261),
(205, '2023-06-06 08:40:09', 0, '2023-06-12 03:40:09', 'finish', 'paid', 5000, 0, 0, 317, 269),
(206, '2023-06-06 08:41:09', 0, '2023-06-12 03:41:09', 'finish', 'paid', 2000, 0, 0, 317, 263),
(207, '2023-06-14 08:01:46', 0, '2023-06-14 08:01:46', 'process', 'paid', 2000, 0, 0, 324, 249),
(227, '2023-06-18 00:00:00', 0, '2023-06-21 00:00:00', 'process', 'paid', 5000, 0, 5000, 317, 248),
(228, '2023-06-18 00:00:00', 0, '2023-06-21 00:00:00', 'process', 'paid', 3000, 0, 3000, 317, 247);

-- --------------------------------------------------------

--
-- Table structure for table `transaction_details`
--

CREATE TABLE `transaction_details` (
  `qty` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL DEFAULT 0,
  `transaction_id` int(11) NOT NULL,
  `laundry_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaction_details`
--

INSERT INTO `transaction_details` (`qty`, `subtotal`, `transaction_id`, `laundry_id`) VALUES
(1, 6000, 195, 188),
(1, 4000, 195, 190),
(2, 20000, 195, 191),
(5, 6000, 196, 189),
(2, 12000, 197, 187),
(1, 10000, 197, 191),
(1, 5000, 227, 187),
(1, 3000, 228, 189);

--
-- Triggers `transaction_details`
--
DELIMITER $$
CREATE TRIGGER `add_amount` AFTER INSERT ON `transaction_details` FOR EACH ROW UPDATE `transactions` SET `transactions`.`amount` = `transactions`.`amount` + NEW.`subtotal` WHERE `transactions`.`transaction_id` = NEW.`transaction_id`
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `del_amount` AFTER DELETE ON `transaction_details` FOR EACH ROW UPDATE `transactions` SET `transactions`.`amount` = `transactions`.`amount` - OLD.`subtotal` WHERE `transactions`.`transaction_id` = OLD.`transaction_id`
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_amount` AFTER UPDATE ON `transaction_details` FOR EACH ROW UPDATE `transactions` SET `transactions`.`amount` = `transactions`.`amount` - OLD.`subtotal` + NEW.`subtotal` WHERE `transactions`.`transaction_id` = OLD.`transaction_id`
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `rfid` char(15) NOT NULL DEFAULT '0',
  `username` varchar(20) NOT NULL,
  `fullname` varchar(150) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `password` varchar(100) NOT NULL,
  `address` mediumtext NOT NULL,
  `role` enum('admin','cashier') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `rfid`, `username`, `fullname`, `phone`, `password`, `address`, `role`) VALUES
(312, '0', 'sinta', 'sinta manila2', '6281358301632', 'admin233', 'jember', 'admin'),
(317, '0', 'sinta', 'sinta', '6281358301632', 'kasir230', 'jember', 'cashier'),
(324, '0', 'Sinta', 'sinta manila', '6289787675654', 'kamu', 'jember', 'admin'),
(325, '0', 'sisi', 'sisiiii', '081323213453', 'sisisisi', 'jember', 'cashier'),
(326, '0', 'tiara', 'tiaraaaa', '087123213214', 'rererere', 'jember', 'cashier'),
(327, '0', 'siska', 'siskaaaa', '087123432675', 'siskasis', 'jember', 'cashier'),
(328, '0', 'joko', 'jokoooo', '087213213456', 'joko1234', 'jember', 'cashier'),
(334, '0', 'Sinta', 'sinta manila', '6289787675654', 'kamu', 'jember', 'admin'),
(340, '0', 'Sinta', 'sinta manila', '6289787675654', 'kamu', 'jember', 'admin'),
(346, '0', 'Sinta', 'sinta manila', '6289787675654', 'kamu', 'jember', 'admin'),
(362, '0', 'Sinta', 'sinta manila', '6289787675654', 'kamu', 'jember', 'admin'),
(369, '0', 'al21', 'aldea', '3232333333', 'haikamu', 'jember', 'cashier'),
(375, '0', 'Sinta', 'sinta manila', '6289787675654', 'kamu', 'jember', 'admin'),
(380, '0', 'al21', 'aldea', '3232333333', 'haikamu', 'jember', 'cashier'),
(388, '0', 'Sinta', 'sinta manila', '6289787675654', 'kamu', 'jember', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `verifications`
--

CREATE TABLE `verifications` (
  `user_id` int(11) NOT NULL,
  `code` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `verifications`
--

INSERT INTO `verifications` (`user_id`, `code`) VALUES
(312, '353113');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `expense`
--
ALTER TABLE `expense`
  ADD PRIMARY KEY (`expense_id`),
  ADD KEY `expense_ibfk_1` (`user_id`);

--
-- Indexes for table `laundries`
--
ALTER TABLE `laundries`
  ADD PRIMARY KEY (`laundry_id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`option_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `transaction_details`
--
ALTER TABLE `transaction_details`
  ADD PRIMARY KEY (`transaction_id`,`laundry_id`),
  ADD KEY `transaction_details_ibfk_2` (`laundry_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `verifications`
--
ALTER TABLE `verifications`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=314;

--
-- AUTO_INCREMENT for table `expense`
--
ALTER TABLE `expense`
  MODIFY `expense_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `laundries`
--
ALTER TABLE `laundries`
  MODIFY `laundry_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=218;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `option_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=229;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=389;

--
-- AUTO_INCREMENT for table `verifications`
--
ALTER TABLE `verifications`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=388;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `expense`
--
ALTER TABLE `expense`
  ADD CONSTRAINT `expense_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaction_details`
--
ALTER TABLE `transaction_details`
  ADD CONSTRAINT `transaction_details_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`transaction_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaction_details_ibfk_2` FOREIGN KEY (`laundry_id`) REFERENCES `laundries` (`laundry_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `verifications`
--
ALTER TABLE `verifications`
  ADD CONSTRAINT `verifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
