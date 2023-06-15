-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 31, 2021 at 06:44 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `car`
--

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `car_id` int(20) NOT NULL,
  `car_name` varchar(50) NOT NULL,
  `car_nameplate` varchar(50) NOT NULL,
  `car_img` varchar(50) DEFAULT 'NA',
  `ac_price` float NOT NULL,
  `non_ac_price` float NOT NULL,
  `ac_price_per_day` float NOT NULL,
  `non_ac_price_per_day` float NOT NULL,
  `car_availability` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`car_id`, `car_name`, `car_nameplate`, `car_img`, `ac_price`, `non_ac_price`, `ac_price_per_day`, `non_ac_price_per_day`, `car_availability`) VALUES
(1, 'Wagon R', 'KA19MG9910', 'assets/img/cars/wagon-r.png', 10, 8, 2000, 1600, 'no'),
(2, 'Alto 800', 'MH20GH9452', 'assets/img/cars/alto-800.png', 9, 7, 1800, 1400, 'yes'),
(3, 'Innova', 'GA16NM9125', 'assets/img/cars/Innova.png', 13, 11, 2600, 2200, 'no'),
(4, 'Ford Figo', 'GJ17HZ4001', 'assets/img/cars/figo.png', 11, 9, 2200, 1800, 'yes'),
(6, 'Mahindra Bolero', 'KL18MJ8472', 'assets/img/cars/bolero.jpg', 15, 13, 3000, 2600, 'yes'),
(7, 'Honda Amaze', 'PJ16YX8820', 'assets/img/cars/amaze.png', 14, 12, 2800, 2400, 'no'),
(8, 'Tata Nexon', 'WB15EX5005', 'assets/img/cars/nexon.jpg', 12, 10, 2400, 2000, 'yes'),
(9, 'Swift Dzire', 'BR01HX8001', 'assets/img/cars/dzire.png', 10, 8, 2000, 1600, 'yes'),
(10, 'Suzuki Ciaz', 'TN17MS1997', 'assets/img/cars/Suzuki_Ciaz_2017.jpg', 12, 10, 2400, 2000, 'yes'),
(11, 'Mahindra XUV 500', 'KA12EX1883', 'assets/img/cars/Mahindra XUV.jpg', 15, 13, 3000, 2600, 'yes'),
(12, 'Toyota Fortuner', 'GA08MX1997', 'assets/img/cars/Fortuner.png', 16, 14, 3200, 2800, 'yes'),
(13, 'Suzuki Ertiga', 'MH02DC1997', 'assets/img/cars/maruti-suzuki-ertiga.jpg', 14, 12, 2800, 2400, 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `clientcars`
--

CREATE TABLE `clientcars` (
  `car_id` int(20) NOT NULL,
  `client_username` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `clientcars`
--

INSERT INTO `clientcars` (`car_id`, `client_username`) VALUES
(2, 'nikhil'),
(6, 'roshan');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `client_username` varchar(50) NOT NULL,
  `client_name` varchar(50) NOT NULL,
  `client_phone` varchar(15) NOT NULL,
  `client_email` varchar(25) NOT NULL,
  `client_address` varchar(50) CHARACTER SET utf8 COLLATE utf8_estonian_ci NOT NULL,
  `client_password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`client_username`, `client_name`, `client_phone`, `client_email`, `client_address`, `client_password`) VALUES
('nikhil', 'Nikhil Amin', '8547869542', 'nikhil@gmail.com', 'Mangalore', 'root'),
('rohan123', 'Rohan shinde', '1123512365', 'abcf@gmail.com', 'gsugk', '12345'),
('roshan', 'Roshan Raj', '8569874125', 'roshan@gmail.com', 'Surathkal', 'root');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_username` varchar(50) NOT NULL,
  `customer_name` varchar(50) NOT NULL,
  `customer_phone` varchar(15) NOT NULL,
  `customer_email` varchar(25) NOT NULL,
  `customer_address` varchar(50) NOT NULL,
  `customer_password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_username`, `customer_name`, `customer_phone`, `customer_email`, `customer_address`, `customer_password`) VALUES
('diwakar', 'Diwakar Vignesh', '9412578632', 'diwakar@gmail.com', 'Patna', 'root'),
('rakshith', 'Rakshith Kotian', '9541257862', 'rakshith@gmail.com', 'Surat', 'root'),
('rohan123', 'Rohan Shinde', '1234567892', 'gjkkgg@gmail.com', 'gshggug', '12345'),
('rohan@gmail.com', 'Rohan Shinde', '1111111111', 'rohan@gmail.com', 'dshsrhsh', '1234'),
('sbcodes', 'satish birhade', '9579511021', 'satishbirhade16@gmail.com', 'dfagadfb', '1561999'),
('shinde', 'Rohan', '1111111111', 'rohan@gmail.com', 'egwgjsdjnf', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `driver_id` int(20) NOT NULL,
  `driver_name` varchar(50) NOT NULL,
  `dl_number` varchar(50) NOT NULL,
  `driver_phone` varchar(15) NOT NULL,
  `driver_address` varchar(50) NOT NULL,
  `driver_gender` varchar(10) NOT NULL,
  `client_username` varchar(50) NOT NULL,
  `driver_availability` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `driver`
--

INSERT INTO `driver` (`driver_id`, `driver_name`, `dl_number`, `driver_phone`, `driver_address`, `driver_gender`, `client_username`, `driver_availability`) VALUES
(1, 'Ravi Moolya', 'DL_TEH5974', '9547863157', 'Goa', 'Male', 'nikhil', 'yes'),
(2, 'Nikitha Ghetia', 'DL_NDC7584', '9147523684', 'Gujarath', 'Female', 'nikhil', 'yes'),
(3, 'S M Adil', 'DL_LSC8451', '9147523682', 'Kerala', 'Male', 'nikhil', 'yes'),
(4, 'Sona Somshekar', 'DL_MND8415', '9187563240', 'Mandya', 'Female', 'roshan', 'no'),
(5, 'Aditi Naik', 'DL_GAX9452', '7584960123', 'Vasco', 'Female', 'roshan', 'yes'),
(6, 'Sudarshan Shetty', 'DL_YSH9542', '8421025476', 'Andra Pradesh', 'Male', 'roshan', 'yes'),
(7, 'Jugal Chauhan', 'DL_XEC9742', '7541023695', 'Rajashthan', 'Male', 'roshan', 'yes'),
(8, 'rahul', '123478', '136547892', 'sanjivnagar', 'male', 'rohan123', 'yes'),
(9, 'rahul', 'dl_123458', '1568697530', 'sanjivnagar', 'male', 'rohan123', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `name` varchar(20) NOT NULL,
  `e_mail` varchar(30) NOT NULL,
  `message` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`name`, `e_mail`, `message`) VALUES
('Nikhil', 'nikhil@gmail.com', 'Hope this works.');

-- --------------------------------------------------------

--
-- Table structure for table `rentedcars`
--

CREATE TABLE `rentedcars` (
  `id` int(100) NOT NULL,
  `customer_username` varchar(50) NOT NULL,
  `car_id` int(20) NOT NULL,
  `driver_id` int(20) NOT NULL,
  `booking_date` date NOT NULL,
  `rent_start_date` date NOT NULL,
  `rent_end_date` date NOT NULL,
  `car_return_date` date DEFAULT NULL,
  `fare` double NOT NULL,
  `charge_type` varchar(25) NOT NULL DEFAULT 'days',
  `distance` double DEFAULT NULL,
  `no_of_days` int(50) DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `return_status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rentedcars`
--

INSERT INTO `rentedcars` (`id`, `customer_username`, `car_id`, `driver_id`, `booking_date`, `rent_start_date`, `rent_end_date`, `car_return_date`, `fare`, `charge_type`, `distance`, `no_of_days`, `total_amount`, `return_status`) VALUES
(574681258, 'rohan@gmail.com', 2, 2, '2021-05-25', '2021-05-25', '2021-05-26', '2021-05-25', 9, 'km', 45, 1, 405, 'R'),
(574681261, 'rohan@gmail.com', 6, 6, '2021-05-25', '2021-05-25', '2021-05-26', '2021-05-25', 15, 'km', 12, 1, 180, 'R'),
(574681262, 'rohan@gmail.com', 6, 6, '2021-05-25', '2021-05-25', '2021-05-26', '2021-05-25', 15, 'km', 12, 1, 180, 'R'),
(574681263, 'rohan123', 2, 1, '2021-05-30', '2021-05-30', '2021-05-31', '2021-05-30', 9, 'km', 12, 1, 108, 'R'),
(574681264, 'rohan123', 2, 2, '2021-05-30', '2021-05-30', '2021-05-30', '2021-05-30', 0, '', 0, 0, 0, 'R'),
(574681265, 'rohan123', 6, 6, '2021-05-30', '2021-05-31', '2021-05-31', '2021-05-30', 15, 'km', 4, 0, 60, 'R'),
(574681266, 'rohan123', 2, 1, '2021-05-31', '2021-05-31', '2021-05-31', '2021-05-31', 9, 'km', 4, 0, 36, 'R'),
(574681267, 'rohan123', 2, 2, '2021-05-31', '2021-05-31', '2021-05-31', '2021-05-31', 9, 'km', 4, 0, 36, 'R'),
(574681268, 'rohan123', 2, 2, '2021-05-31', '2021-05-31', '2021-06-01', '2021-05-31', 1800, 'days', NULL, 1, 1800, 'R');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`car_id`),
  ADD UNIQUE KEY `car_nameplate` (`car_nameplate`);

--
-- Indexes for table `clientcars`
--
ALTER TABLE `clientcars`
  ADD PRIMARY KEY (`car_id`),
  ADD KEY `client_username` (`client_username`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`client_username`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_username`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`driver_id`),
  ADD UNIQUE KEY `dl_number` (`dl_number`),
  ADD KEY `client_username` (`client_username`);

--
-- Indexes for table `rentedcars`
--
ALTER TABLE `rentedcars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_username` (`customer_username`),
  ADD KEY `car_id` (`car_id`),
  ADD KEY `driver_id` (`driver_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `car_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `driver`
--
ALTER TABLE `driver`
  MODIFY `driver_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `rentedcars`
--
ALTER TABLE `rentedcars`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=574681269;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `clientcars`
--
ALTER TABLE `clientcars`
  ADD CONSTRAINT `clientcars_ibfk_1` FOREIGN KEY (`client_username`) REFERENCES `clients` (`client_username`),
  ADD CONSTRAINT `clientcars_ibfk_2` FOREIGN KEY (`car_id`) REFERENCES `cars` (`car_id`);

--
-- Constraints for table `driver`
--
ALTER TABLE `driver`
  ADD CONSTRAINT `driver_ibfk_1` FOREIGN KEY (`client_username`) REFERENCES `clients` (`client_username`);

--
-- Constraints for table `rentedcars`
--
ALTER TABLE `rentedcars`
  ADD CONSTRAINT `rentedcars_ibfk_1` FOREIGN KEY (`customer_username`) REFERENCES `customers` (`customer_username`),
  ADD CONSTRAINT `rentedcars_ibfk_2` FOREIGN KEY (`car_id`) REFERENCES `cars` (`car_id`),
  ADD CONSTRAINT `rentedcars_ibfk_3` FOREIGN KEY (`driver_id`) REFERENCES `driver` (`driver_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
