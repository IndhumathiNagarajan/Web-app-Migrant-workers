-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 01, 2025 at 01:45 PM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `jsp_migrant`
--
CREATE DATABASE IF NOT EXISTS `jsp_migrant` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `jsp_migrant`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `userid` varchar(200) NOT NULL,
  `pwd` varchar(100) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`userid`, `pwd`) VALUES
('admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `jobapply`
--

CREATE TABLE IF NOT EXISTS `jobapply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jid` int(11) NOT NULL,
  `userid` varchar(200) NOT NULL,
  `astatus` varchar(50) NOT NULL DEFAULT 'pending',
  PRIMARY KEY (`jid`,`userid`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `jobapply`
--

INSERT INTO `jobapply` (`id`, `jid`, `userid`, `astatus`) VALUES
(5, 1, 'rajat', 'pending'),
(7, 3, 'rajat', 'accept');

-- --------------------------------------------------------

--
-- Table structure for table `newcompany`
--

CREATE TABLE IF NOT EXISTS `newcompany` (
  `name` varchar(200) NOT NULL,
  `cname` varchar(200) NOT NULL,
  `addr` varchar(200) NOT NULL,
  `city` varchar(200) NOT NULL,
  `gstin` varchar(50) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `userid` varchar(200) NOT NULL,
  `pwd` varchar(50) NOT NULL,
  `sphoto` varchar(1000) NOT NULL,
  `sidproof` varchar(1000) NOT NULL,
  `astatus` varchar(50) NOT NULL DEFAULT 'pending',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `newcompany`
--

INSERT INTO `newcompany` (`name`, `cname`, `addr`, `city`, `gstin`, `mobile`, `userid`, `pwd`, `sphoto`, `sidproof`, `astatus`) VALUES
('James', 'XYZ Pvt Ltd', '34,North Street,', 'Chennai', '33AACCA8888Q1Z5', '9834983439', 'james@gmail.com', 'j', '1743490633a.jpg', '1743490633aa.jpg', 'accept'),
('Ram Kumar R', 'Abc Pvt Ltd', '43,South Car Street,', 'Madurai', '33AACCA9189Q1Z5', '9384938398', 'ram@gmail.com', 'r', '1743244804a.jpg', '1743244804a.jpg', 'accept'),
('Samuel', 'Sam Constructions', '343,North Street', 'Chennai', '33AACCU1818Q1Z5', '9283492849', 'sam@gmail.com', 's', '1743514755a.jpg', '1743514755aa.jpg', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `newjob`
--

CREATE TABLE IF NOT EXISTS `newjob` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cmpid` varchar(200) NOT NULL,
  `jname` varchar(200) NOT NULL,
  `cname` varchar(200) NOT NULL,
  `descr` varchar(500) NOT NULL,
  `sal` varchar(100) NOT NULL,
  `astatus` varchar(20) NOT NULL DEFAULT 'pending',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `newjob`
--

INSERT INTO `newjob` (`id`, `cmpid`, `jname`, `cname`, `descr`, `sal`, `astatus`) VALUES
(1, 'ram@gmail.com', 'Mason', 'Construction Work', 'All kinds of construction like Road, Building, etc...', 'Rs.5 Lakh', 'accept'),
(2, 'ram@gmail.com', 'Road Construction Worker', 'Road Construction', 'All kinds of road laying work', 'Rs.6 Lakh', 'pending'),
(3, 'james@gmail.com', 'Construction Worker', 'Construction', 'Bridge Construction', 'Rs.5 Lakh', 'accept');

-- --------------------------------------------------------

--
-- Table structure for table `newuser`
--

CREATE TABLE IF NOT EXISTS `newuser` (
  `name` varchar(200) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `addr` varchar(200) NOT NULL,
  `state` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `userid` varchar(200) NOT NULL,
  `pwd` varchar(50) NOT NULL,
  `sphoto` varbinary(500) NOT NULL,
  `sidproof` varchar(500) NOT NULL,
  `ustatus` varchar(20) NOT NULL DEFAULT 'pending',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `newuser`
--

INSERT INTO `newuser` (`name`, `gender`, `addr`, `state`, `country`, `mobile`, `userid`, `pwd`, `sphoto`, `sidproof`, `ustatus`) VALUES
('Rajat Kumar', 'Male', '343,north street', 'Assam', 'India', '', 'rajat', 'r', '1743169070a1.jpg', '1743169070b.jpg', 'accept'),
('Ravi Kumar', 'Male', '33,North Street', 'Assam', 'India', '9839483983', 'ravikumar', 'r', '1743168762a.jpg', '1743168762b.jpg', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `schemes`
--

CREATE TABLE IF NOT EXISTS `schemes` (
  `sname` varchar(200) NOT NULL,
  `cname` varchar(200) NOT NULL,
  `descr` varchar(1000) NOT NULL,
  `amt` varchar(100) NOT NULL,
  PRIMARY KEY (`sname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schemes`
--

INSERT INTO `schemes` (`sname`, `cname`, `descr`, `amt`) VALUES
('Ayushman Bharat Pradhan Mantri Jan Arogya Yojana', 'Health Cover', 'Provides health cover of Rs.5 lakhs per family per year', 'Rs.5 Lakh per Year'),
('Pradhan Mantri Jeevan Jyoti Bima Yojana', 'Life Insurance', 'Provides Life Insurance Cover', 'Up to Rs.5 Lakh'),
('Pradhan Mantri Shram Yogi Maan-Dhan Yojana', 'Pension', 'Offers a monthly pension of Rs.3,000 after attaining the age of 60 for workers', 'Rs.3000 per month'),
('Pradhan Mantri Suraksha Bima Yojana', 'Death Insurance', 'Covers accidental Death Insurance', 'Rs.2 Lakh');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
