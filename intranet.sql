-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 02, 2013 at 11:13 AM
-- Server version: 5.5.8
-- PHP Version: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `intranet`
--

-- --------------------------------------------------------

--
-- Table structure for table `content_type`
--

CREATE TABLE IF NOT EXISTS `content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `safe_name` varchar(256) NOT NULL,
  `fields` varchar(1600) NOT NULL,
  `description` varchar(1600) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `safe_name` (`safe_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=38 ;

INSERT INTO `content_type` (`id`, `name`, `safe_name`, `fields`, `description`) VALUES
(18, 'Diner details', 'diner_details', 'a:5:{s:4:"type";a:5:{i:0;s:1:"1";i:1;s:1:"4";i:2;s:1:"6";i:3;s:1:"1";i:4;s:2:"10";}s:4:"name";a:5:{i:0;s:8:"Forename";i:1;s:13:"Date and time";i:2;s:16:"Number of covers";i:3;s:12:"Phone number";i:4;s:5:"Email";}s:9:"safe_name";a:5:{i:0;s:8:"forename";i:1;s:13:"date_and_time";i:2;s:16:"number_of_covers";i:3;s:12:"phone_number";i:4;s:5:"email";}s:11:"description";a:5:{i:0;s:18:"Diner''s first name";i:1;s:9:"Date/time";i:2;s:16:"How many diners?";i:3;s:13:"Telephone no.";i:4;s:21:"Diner''s email address";}s:8:"required";a:5:{i:0;s:1:"1";i:1;s:1:"1";i:2;s:1:"1";i:3;s:1:"0";i:4;s:1:"0";}}', 'Personal details of a diner making a booking - title is surname');


-- --------------------------------------------------------

--
-- Table structure for table `field_type`
--

CREATE TABLE IF NOT EXISTS `field_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `description` varchar(1600) NOT NULL,
  `length` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `field_type`
--

INSERT INTO `field_type` (`id`, `name`, `description`, `length`) VALUES
(1, 'Text', 'A simple text field', 256),
(2, 'Long text', 'A text area for longer textual content', 1600),
(3, 'Date', 'A date field formatted as DD/MM/YYYY', 20),
(4, 'Date/time', 'Date and time formatted as DD/MM/YYYY HH:MM:SS', 20),
(5, 'Drop down selection', 'A drop down form element with multiple values to choose from', 1600),
(6, 'Integer', 'A simple number with no decimal places', 11),
(7, 'Decimal Number', 'A number with decimal places as described by "length" (default 2)', 2),
(8, 'Node reference', 'A link to an existing node', 11),
(9, 'URL', 'A text field for a URL', 256),
(10, 'Email', 'An email', 256),
(11, 'File upload', 'uploaded file', 256);

-- --------------------------------------------------------

--
-- Table structure for table `node`
--

CREATE TABLE IF NOT EXISTS `node` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) NOT NULL,
  `safe_title` varchar(256) NOT NULL,
  `content_type` int(11) NOT NULL,
  `content` varchar(1600) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `safe_title` (`safe_title`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=35 ;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `permissions` varchar(1600) NOT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `permissions`) VALUES
(1, 'Admin', 'a:5:{i:0;a:7:{i:0;s:1:"1";i:1;s:1:"1";i:2;s:1:"1";i:3;s:1:"1";i:4;s:1:"1";i:5;s:1:"1";i:6;s:1:"1";}i:1;a:7:{i:0;s:1:"1";i:1;s:1:"1";i:2;s:1:"1";i:3;s:1:"1";i:4;s:1:"1";i:5;s:1:"1";i:6;s:1:"1";}i:2;a:7:{i:0;s:1:"1";i:1;s:1:"1";i:2;s:1:"1";i:3;s:1:"1";i:4;s:1:"1";i:5;s:1:"1";i:6;s:1:"1";}i:3;a:7:{i:0;s:1:"1";i:1;s:1:"1";i:2;s:1:"1";i:3;s:1:"1";i:4;s:1:"1";i:5;s:1:"1";i:6;s:1:"1";}i:4;a:7:{i:0;s:1:"1";i:1;s:1:"1";i:2;s:1:"1";i:3;s:1:"1";i:4;s:1:"1";i:5;s:1:"1";i:6;s:1:"1";}}');


-- --------------------------------------------------------


--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(256) NOT NULL,
  `password` varchar(256) NOT NULL,
  `forename` varchar(256) NOT NULL,
  `surname` varchar(256) NOT NULL,
  `job_title` varchar(256) DEFAULT NULL,
  `permissions` int(11) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;


-- --------------------------------------------------------

--
-- Table structure for table `views`
--

CREATE TABLE IF NOT EXISTS `views` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `safe_name` varchar(256) NOT NULL,
  `description` varchar(1600) NOT NULL,
  `view_type` int(11) NOT NULL,
  `content_type` int(11) NOT NULL,
  `fields` varchar(1600) NOT NULL,
  `settings` varchar(1600) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

INSERT INTO `views` (`id`, `name`, `safe_name`, `description`, `view_type`, `content_type`, `fields`, `settings`, `create_date`, `created_by`) VALUES
(15, 'All diners', 'all_diners', 'List of all diners in the system', 1, 43, 'a:5:{s:8:"forename";s:2:"on";s:13:"date_and_time";s:2:"on";s:16:"number_of_covers";s:2:"on";s:12:"phone_number";s:2:"on";s:5:"email";s:2:"on";}', NULL, '2013-05-21 08:46:06', 9),
(16, 'Diner status', 'diner_status', 'Tracking Diner activity through the restaurant', 2, 43, 'a:4:{i:0;s:11:"Not arrived";i:1;s:12:"Waiting area";i:2;s:6:"Seated";i:3;s:8:"Departed";}', NULL, '2013-05-21 11:43:48', 9);

-- --------------------------------------------------------

--
-- Table structure for table `view_type`
--

CREATE TABLE IF NOT EXISTS `view_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `description` varchar(1600) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `view_type`
--

INSERT INTO `view_type` (`id`, `name`, `description`) VALUES
(1, 'Table', 'A simple table'),
(2, 'Dragboard', 'A planning board where nodes can be dragged between different states or categories.'),
(3, 'Check list', 'A simple list with a checkbox to mark when a list item is complete');
