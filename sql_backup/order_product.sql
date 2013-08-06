-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 06, 2013 at 07:51 PM
-- Server version: 5.1.44
-- PHP Version: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `oc_gotobus`
--

-- --------------------------------------------------------

--
-- Table structure for table `order_product`
--

CREATE TABLE IF NOT EXISTS `order_product` (
  `order_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `tax` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `reward` int(8) NOT NULL,
  `departure_date` date NOT NULL,
  PRIMARY KEY (`order_product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=105 ;

--
-- Dumping data for table `order_product`
--

INSERT INTO `order_product` (`order_product_id`, `order_id`, `product_id`, `name`, `model`, `quantity`, `price`, `total`, `tax`, `reward`, `departure_date`) VALUES
(104, 49, 58, 'Buffalo --&gt; New York 6:30 PM', 'LN000003-6:30', 1, 20.0000, 20.0000, 0.0000, 0, '0000-00-00'),
(94, 47, 52, 'New York --&gt; Syracuse', 'LN000004-4:30', 1, 21.0000, 21.0000, 0.0000, 0, '2013-07-18'),
(93, 47, 55, 'Syracuse --&gt; New York', 'LN000006-5:30', 1, 21.0000, 21.0000, 0.0000, 0, '2013-07-17'),
(92, 46, 58, 'Buffalo --&gt; New York', 'LN000003-6:30', 1, 20.0000, 20.0000, 0.0000, 0, '2013-07-18'),
(91, 46, 50, 'New York --&gt; Buffalo', 'LN000001-5:30', 1, 21.0000, 21.0000, 0.0000, 0, '2013-07-17'),
(103, 49, 50, 'New York --&gt; Buffalo 5:30 PM', 'LN000001-5:30', 1, 21.0000, 21.0000, 0.0000, 0, '0000-00-00'),
(102, 48, 55, 'Syracuse --&gt; New York 5:30 PM', 'LN000006-5:30', 2, 21.0000, 42.0000, 0.0000, 0, '0000-00-00'),
(89, 45, 53, 'Buffalo --&gt; New York', 'LN000003-5:30', 1, 20.0000, 20.0000, 0.0000, 0, '1988-09-18'),
(90, 45, 59, 'New York --&gt; Buffalo', 'LN000001-8:30', 1, 21.0000, 21.0000, 0.0000, 0, '1988-09-18');
