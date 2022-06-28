-- phpMyAdmin SQL Dump
-- version 5.3.0-dev+20220605.3bb0712d47
-- https://www.phpmyadmin.net/
--
-- Host: localhost:4306:4306
-- Generation Time: Jun 28, 2022 at 10:46 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookstore`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(10) NOT NULL,
  `code` varchar(20) NOT NULL,
  `title` varchar(250) NOT NULL,
  `description` varchar(512) NOT NULL,
  `category` varchar(30) NOT NULL,
  `certificate` varchar(50) NOT NULL,
  `duration` int(30) NOT NULL,
  `cost` decimal(30,0) NOT NULL,
  `imagePath` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `code`, `title`, `description`, `category`, `certificate`, `duration`, `cost`, `imagePath`, `user_id`) VALUES
(46, 'BD5241', 'Backend Development', 'Backend development is one of the web development skills required by the Software Eng.', 'Web Development', 'Professional Certificate', 2, '200', 'None', 0),
(42, 'BW634', 'Web Design and Development', 'Backend development is one of the web development skills required by the Software Eng.', 'Internet Programming', 'Course completion', 2, '220', '/images/Course-BW634-2022-51-22.png', 13),
(47, 'BW634x', 'Basics of Web Design', 'Backend development is one of the web development skills required by the Software Eng.', 'Web Development', 'Course completion', 2, '220', 'None', 0),
(45, 'CN542', 'Computer Networking', 'Computer Networking is a process of connecting computing devices', 'Networking and Communication', 'Professional Certificate', 3, '561', 'None', 13),
(25, 'PM2456', 'Project Management', 'This site can’t be reached', 'Management', 'Participation Certificate', 3, '250', '/images/Course-PM412-2022-51-20.png', 0),
(49, 'PY5214x', 'Python for AI', 'Connect-flash module for Node. js is a web development framework', 'Web Development', 'Course completion', 3, '210', 'None', 0),
(43, 'UI568', 'Software UI/Ux Design', 'This site can’t be reached', 'Management', 'Participation Certificate', 1, '320', 'None', 13),
(48, 'UI568x', 'Software UI/Ux Design', 'This site can’t be reached', 'Management', 'Participation Certificate', 1, '320', 'None', 0),
(21, 'WB14', 'Nodjes', 'Connect-flash module for Node. js is a web development framework', 'Web Development', 'Course completion', 2, '120', '/images/Course-WB14-2022-51-20.png', 0);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `title` varchar(20) NOT NULL,
  `price` float NOT NULL,
  `description` text NOT NULL,
  `imageUrl` text NOT NULL,
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
('58mO3fGxcTK4OaDljCK5dhbTYqf6qsMe', 1654636421, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{\"user\":1}}');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(5) NOT NULL,
  `firstName` varchar(15) NOT NULL,
  `lastName` varchar(15) NOT NULL,
  `username` varchar(15) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `gender` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstName`, `lastName`, `username`, `mobile`, `email`, `password`, `gender`) VALUES
(1, 'meti', 'Adugna', 'meti14', '0987654323', 'metiadugna14@gmail.com', '$2a$10$1yUaNgQ5Gv8uk7MAUXs0aeKrTpS.ZKuFfPzSYmSPeI9DnujAUiTVq', 'F'),
(2, 'Kokebe ', 'Samuel', 'koki123', '0932245667', 'kokebe@gmail.com', 'koki1234', 'F');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`code`),
  ADD KEY `id` (`id`);
ALTER TABLE `courses` ADD FULLTEXT KEY `code` (`code`,`title`,`description`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;



