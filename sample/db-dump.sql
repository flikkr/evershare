-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 13, 2019 at 04:28 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `evershare`
--

-- --------------------------------------------------------

--
-- Table structure for table `confirm`
--

CREATE TABLE `confirm` (
  `id` int(11) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `issued` datetime DEFAULT NULL,
  `kind` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `id` int(11) NOT NULL COMMENT 'Course ID',
  `name` varchar(60) NOT NULL COMMENT 'Course Name'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Table containing the name of all the different courses';

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`id`, `name`) VALUES
(1, 'Computer Science'),
(2, 'Philosophy'),
(3, 'Agriculture'),
(4, 'Accounting and Finance'),
(5, 'Architecture'),
(6, 'Geography');

-- --------------------------------------------------------

--
-- Table structure for table `favourite`
--

CREATE TABLE `favourite` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `upload_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `fwconfig`
--

CREATE TABLE `fwconfig` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `local` int(11) UNSIGNED DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fixed` int(11) UNSIGNED DEFAULT NULL,
  `integrity` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `crossorigin` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `defer` int(11) UNSIGNED DEFAULT NULL,
  `async` int(11) UNSIGNED DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fwconfig`
--

INSERT INTO `fwconfig` (`id`, `name`, `local`, `value`, `fixed`, `integrity`, `crossorigin`, `defer`, `async`, `type`) VALUES
(1, 'sitename', 1, 'evershare', 1, '', '', 0, 0, 'string'),
(2, 'sitenoreply', 1, 'noreply@localhost.org', 1, '', '', 0, 0, 'string'),
(3, 'siteurl', 1, 'http://localhost.org/evershare/', 1, '', '', 0, 0, 'string'),
(4, 'sysadmin', 1, 'k.rabier@newcastle.ac.uk', 1, '', '', 0, 0, 'string'),
(5, 'usecsp', 1, '0', 1, '', '', 0, 0, 'string'),
(6, 'reportcsp', 1, '0', 1, '', '', 0, 0, 'string'),
(7, 'bootcss', 0, '//stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css', 1, '', '', 0, 0, 'css'),
(8, 'editablecss', 0, '/evershare/assets/css/bs4-editable.css', 1, '', '', 0, 0, 'css'),
(9, 'facss', 0, 'https://use.fontawesome.com/releases/v5.12.0/css/all.css', 1, '', '', 0, 0, 'css'),
(10, 'bootvuecss', 0, 'https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.min.css', 1, '', '', 0, 0, 'css'),
(11, 'jquery', 0, 'https://code.jquery.com/jquery-3.4.1.min.js', 1, '', '', 0, 0, 'js'),
(12, 'jqueryslim', 0, 'https://code.jquery.com/jquery-3.4.1.slim.min.js', 1, 'sha256-pasqAKBDmFT4eHoN2ndd6lN370kFiGUFyTiUHWhU7k8=', 'anonymous', 0, 0, 'js'),
(13, 'bootjs', 0, '//stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js', 1, '', '', 0, 0, 'js'),
(14, 'bootbox', 0, '//cdnjs.cloudflare.com/ajax/libs/bootbox.js/5.3.4/bootbox.min.js', 1, '', '', 0, 0, 'js'),
(15, 'editable', 0, '/evershare/assets/js/bs4-editable-min.js', 1, '', '', 0, 0, 'js'),
(16, 'parsley', 0, '//cdnjs.cloudflare.com/ajax/libs/parsley.js/2.9.1/parsley.min.js', 1, '', '', 0, 0, 'js'),
(17, 'popperjs', 0, '//cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/popper.min.js', 1, '', '', 0, 0, 'js'),
(18, 'utiljs', 0, '/evershare/assets/js/util-min.js', 0, '', '', 0, 0, 'js'),
(19, 'vuejs', 0, 'https://unpkg.com/vue/dist/vue.min.js', 1, '', '', 0, 0, 'js'),
(20, 'bootvuejs', 0, 'https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.min.js', 1, '', '', 0, 0, 'js'),
(21, 'gijgojs', 0, 'https://cdnjs.cloudflare.com/ajax/libs/gijgo/1.9.13/combined/js/gijgo.min.js', 1, '', '', 0, 0, 'js'),
(22, 'gijgocss', 0, 'https://cdnjs.cloudflare.com/ajax/libs/gijgo/1.9.13/combined/css/gijgo.min.css', 1, '', '', 0, 0, 'css');

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

CREATE TABLE `module` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `code` varchar(7) NOT NULL,
  `name` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `module`
--

INSERT INTO `module` (`id`, `course_id`, `code`, `name`) VALUES
(1, 1, 'CSC3095', 'Project and Dissertation in Computing Science'),
(3, 6, 'GEO2315', 'Europe\'s economical expansion'),
(15, 2, 'PHI3982', 'Ancient Greek Philosophy'),
(17, 1, 'CSC3123', 'Web Technologies'),
(18, 3, 'AGR1234', 'Agriculture module'),
(19, 6, 'GEO9828', 'Geo module');

-- --------------------------------------------------------

--
-- Table structure for table `note`
--

CREATE TABLE `note` (
  `id` int(11) UNSIGNED NOT NULL,
  `upload_id` int(11) UNSIGNED NOT NULL,
  `image_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `page`
--

CREATE TABLE `page` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kind` int(11) UNSIGNED DEFAULT NULL,
  `source` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `needlogin` int(11) UNSIGNED DEFAULT NULL,
  `mobileonly` int(11) UNSIGNED DEFAULT NULL,
  `active` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `page`
--

INSERT INTO `page` (`id`, `name`, `kind`, `source`, `needlogin`, `mobileonly`, `active`) VALUES
(1, 'about', 2, '@content/about.twig', 0, 0, 1),
(2, 'admin', 1, '\\Framework\\Pages\\Admin', 1, 0, 1),
(3, 'assets', 1, '\\Framework\\Pages\\Assets', 1, 0, 0),
(4, 'confirm', 1, '\\Framework\\Pages\\UserLogin', 0, 0, 1),
(5, 'contact', 1, '\\Pages\\Contact', 0, 0, 1),
(6, 'cspreport', 1, '\\Framework\\Pages\\CSPReport', 0, 0, 0),
(7, 'devel', 1, '\\Framework\\Pages\\Developer', 1, 0, 1),
(8, 'forgot', 1, '\\Framework\\Pages\\UserLogin', 0, 0, 1),
(9, 'home', 1, '\\Pages\\Home', 0, 0, 1),
(10, 'install.php', 2, '@util/oops.twig', 0, 0, 1),
(11, 'login', 1, '\\Framework\\Pages\\UserLogin', 0, 0, 1),
(12, 'logout', 1, '\\Framework\\Pages\\UserLogin', 1, 0, 1),
(13, 'private', 1, '\\Framework\\Pages\\GetFile', 1, 0, 1),
(14, 'register', 1, '\\Framework\\Pages\\UserLogin', 0, 0, 1),
(15, 'upload', 1, '\\Framework\\Pages\\Upload', 0, 0, 1),
(16, 'module', 1, '\\Pages\\Module', 0, 0, 1),
(17, 'profile', 1, '\\Pages\\Profile', 0, 0, 1),
(18, 'uploadnotes', 1, '\\Pages\\Uploadnotes', 1, 0, 1),
(19, 'note', 1, '\\Pages\\Note', 1, 0, 1),
(20, 'browse', 1, '\\Pages\\Browse', 1, 0, 1),
(22, 'getfile', 1, '\\Pages\\Getfile', 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pagerole`
--

CREATE TABLE `pagerole` (
  `id` int(11) UNSIGNED NOT NULL,
  `otherinfo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `page_id` int(11) UNSIGNED DEFAULT NULL,
  `rolecontext_id` int(11) UNSIGNED DEFAULT NULL,
  `rolename_id` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pagerole`
--

INSERT INTO `pagerole` (`id`, `otherinfo`, `start`, `end`, `page_id`, `rolecontext_id`, `rolename_id`) VALUES
(1, '-', '2019-12-05 21:29:29', NULL, 2, 1, 1),
(2, '-', '2019-12-05 21:29:29', NULL, 7, 1, 1),
(3, '-', '2019-12-05 21:29:29', NULL, 7, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) UNSIGNED NOT NULL,
  `otherinfo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `rolecontext_id` int(11) UNSIGNED DEFAULT NULL,
  `rolename_id` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `otherinfo`, `start`, `end`, `user_id`, `rolecontext_id`, `rolename_id`) VALUES
(1, '-', '2019-12-05 21:29:29', NULL, 1, 1, 1),
(2, '-', '2019-12-05 21:29:29', NULL, 1, 1, 2),
(3, '', '2019-12-05 20:49:27', NULL, 3, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `rolecontext`
--

CREATE TABLE `rolecontext` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fixed` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rolecontext`
--

INSERT INTO `rolecontext` (`id`, `name`, `fixed`) VALUES
(1, 'Site', 1),
(2, 'Test', 1);

-- --------------------------------------------------------

--
-- Table structure for table `rolename`
--

CREATE TABLE `rolename` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fixed` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rolename`
--

INSERT INTO `rolename` (`id`, `name`, `fixed`) VALUES
(1, 'Admin', 1),
(2, 'Developer', 1),
(3, 'Tester', 1);

-- --------------------------------------------------------

--
-- Table structure for table `upload`
--

CREATE TABLE `upload` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `rating_overall` int(11) DEFAULT NULL,
  `time` int(11) NOT NULL DEFAULT current_timestamp(),
  `added` datetime DEFAULT NULL,
  `fname` varchar(191) DEFAULT NULL,
  `filename` varchar(191) DEFAULT NULL,
  `public` int(11) UNSIGNED DEFAULT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `group_id` int(11) UNSIGNED DEFAULT NULL,
  `module_id` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `upload`
--

INSERT INTO `upload` (`id`, `title`, `description`, `rating_overall`, `time`, `added`, `fname`, `filename`, `public`, `user_id`, `group_id`, `module_id`) VALUES
(128, 'Test upload', 'This is a test upload of 2 files for CSC3123', NULL, 2147483647, '2019-12-12 15:16:58', '\\private\\3\\2019\\12\\5df259ea999070.47624238.png', 'notesA1_comparison.png', 0, 3, 0, 17),
(129, 'Test upload', 'This is a test upload of 2 files for CSC3123', NULL, 2147483647, '2019-12-12 15:16:58', '\\private\\3\\2019\\12\\5df259eac0fd79.58815494.png', 'noteshrink-comparison.png', 0, 3, 0, 17),
(130, 'Test upload', 'Test upload for GEO2315, 4 files', NULL, 2147483647, '2019-12-12 15:21:22', '\\private\\3\\2019\\12\\5df25af2ca68b2.33536804.png', 'notesA1_comparison - Copy (2).png', 0, 3, 201756, 3),
(131, 'Test upload', 'Test upload for GEO2315, 4 files', NULL, 2147483647, '2019-12-12 15:21:22', '\\private\\3\\2019\\12\\5df25af2e3e502.21430492.png', 'notesA1_comparison.png', 0, 3, 201756, 3),
(132, 'Test upload', 'Test upload for GEO2315, 4 files', NULL, 2147483647, '2019-12-12 15:21:23', '\\private\\3\\2019\\12\\5df25af2f11791.92416609.png', 'noteshrink-comparison - Copy.png', 0, 3, 201756, 3),
(133, 'Test upload', 'Test upload for GEO2315, 4 files', NULL, 2147483647, '2019-12-12 15:21:23', '\\private\\3\\2019\\12\\5df25af31a4745.23494546.jpg', 'sample1 - Copy (2).jpg', 0, 3, 201756, 3),
(138, 'Philosophy test', '', NULL, 2147483647, '2019-12-12 15:27:01', '\\private\\3\\2019\\12\\5df25c453c66b3.73215361.jpg', 'sample1 - Copy (2).jpg', 0, 3, 1545600, 15),
(139, 'Dissertation test upload', '3 uploaded files', NULL, 2147483647, '2019-12-12 15:33:57', '\\private\\3\\2019\\12\\5df25de5bfa3c9.39821761.png', 'notesA1_comparison - Copy.png', 0, 3, 20493, 1),
(140, 'Dissertation test upload', '3 uploaded files', NULL, 2147483647, '2019-12-12 15:33:57', '\\private\\3\\2019\\12\\5df25de5f0ed04.96528104.png', 'noteshrink-comparison - Copy (2).png', 0, 3, 20493, 1),
(141, 'Dissertation test upload', '3 uploaded files', NULL, 2147483647, '2019-12-12 15:33:58', '\\private\\3\\2019\\12\\5df25de6119b27.57535241.jpg', 'sample1 - Copy (2).jpg', 0, 3, 20493, 1),
(142, 'Other test', '', NULL, 2147483647, '2019-12-12 15:36:28', '\\private\\3\\2019\\12\\5df25e7c32b703.29568994.png', 'noteshrink-comparison - Copy.png', 0, 3, 301392, 17),
(143, 'Test upload 2', '', NULL, 2147483647, '2019-12-12 15:38:07', '\\private\\3\\2019\\12\\5df25edfd63c78.54215238.png', 'noteshrink-comparison - Copy.png', 0, 3, 264615, 1),
(144, 'Test', '', NULL, 2147483647, '2019-12-12 15:39:35', '\\private\\3\\2019\\12\\5df25f370c2433.81772687.jpg', 'sample1 - Copy (2).jpg', 0, 3, 1606320, 15),
(147, 'test', 'this is a description', NULL, 2147483647, '2019-12-13 10:09:25', '\\private\\2\\2019\\12\\5df36355e30261.10109132.png', 'noteshrink-comparison - Copy (2).png', 0, 2, 966966, 17);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` int(11) UNSIGNED DEFAULT NULL,
  `confirm` int(11) UNSIGNED DEFAULT NULL,
  `joined` datetime DEFAULT NULL,
  `bio` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upl_count` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `login`, `password`, `active`, `confirm`, `joined`, `bio`, `upl_count`) VALUES
(1, 'k.rabier@newcastle.ac.uk', 'evershareadmin', '$2y$10$8eqS0AeDb2cQaA/oXpd1rexXUwXEWI/30m3eAraDUlrAhOBd9wG76', 1, 1, '2019-12-05 21:29:29', 'This is my bio!', 0),
(2, 'k.rabier@newcastle.ac.uk', 'user', '$2y$10$GRu4zsgBcZfWmZ.CAP7ml.tFWiUcaVgwlaJ1sLuj01tILVDKRsMty', 1, 1, '2019-12-05 21:49:03', 'I love Evershare, I passed third year thanks to it', 1),
(3, 'k.rabier@newcastle.ac.uk', 'dev', '$2y$10$MoM0OQ5XTX3bGpJMmd2rhecsrNYJSikrdszHPDR6niz.ged05zyyC', 1, 1, '2019-12-05 21:49:27', 'Something about myself', 13);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `confirm`
--
ALTER TABLE `confirm`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_foreignkey_confirm_user` (`user_id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favourite`
--
ALTER TABLE `favourite`
  ADD PRIMARY KEY (`user_id`,`upload_id`),
  ADD KEY `upload_id` (`upload_id`);

--
-- Indexes for table `fwconfig`
--
ALTER TABLE `fwconfig`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module_ibfk_1` (`course_id`);

--
-- Indexes for table `note`
--
ALTER TABLE `note`
  ADD PRIMARY KEY (`id`),
  ADD KEY `upload_id` (`upload_id`);

--
-- Indexes for table `page`
--
ALTER TABLE `page`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pagerole`
--
ALTER TABLE `pagerole`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_foreignkey_pagerole_page` (`page_id`),
  ADD KEY `index_foreignkey_pagerole_rolecontext` (`rolecontext_id`),
  ADD KEY `index_foreignkey_pagerole_rolename` (`rolename_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_foreignkey_role_user` (`user_id`),
  ADD KEY `index_foreignkey_role_rolecontext` (`rolecontext_id`),
  ADD KEY `index_foreignkey_role_rolename` (`rolename_id`);

--
-- Indexes for table `rolecontext`
--
ALTER TABLE `rolecontext`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rolename`
--
ALTER TABLE `rolename`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `upload`
--
ALTER TABLE `upload`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_foreignkey_upload_user` (`user_id`),
  ADD KEY `index_foreignkey_upload_group` (`group_id`),
  ADD KEY `index_foreignkey_upload_module` (`module_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `confirm`
--
ALTER TABLE `confirm`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Course ID', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `fwconfig`
--
ALTER TABLE `fwconfig`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `module`
--
ALTER TABLE `module`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `note`
--
ALTER TABLE `note`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `page`
--
ALTER TABLE `page`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `pagerole`
--
ALTER TABLE `pagerole`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `rolecontext`
--
ALTER TABLE `rolecontext`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `rolename`
--
ALTER TABLE `rolename`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `upload`
--
ALTER TABLE `upload`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `confirm`
--
ALTER TABLE `confirm`
  ADD CONSTRAINT `c_fk_confirm_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `favourite`
--
ALTER TABLE `favourite`
  ADD CONSTRAINT `favourite_ibfk_1` FOREIGN KEY (`upload_id`) REFERENCES `upload` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `favourite_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `module`
--
ALTER TABLE `module`
  ADD CONSTRAINT `module_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `note`
--
ALTER TABLE `note`
  ADD CONSTRAINT `note_ibfk_1` FOREIGN KEY (`upload_id`) REFERENCES `upload` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pagerole`
--
ALTER TABLE `pagerole`
  ADD CONSTRAINT `c_fk_pagerole_page_id` FOREIGN KEY (`page_id`) REFERENCES `page` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `c_fk_pagerole_rolecontext_id` FOREIGN KEY (`rolecontext_id`) REFERENCES `rolecontext` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `c_fk_pagerole_rolename_id` FOREIGN KEY (`rolename_id`) REFERENCES `rolename` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role`
--
ALTER TABLE `role`
  ADD CONSTRAINT `c_fk_role_rolecontext_id` FOREIGN KEY (`rolecontext_id`) REFERENCES `rolecontext` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `c_fk_role_rolename_id` FOREIGN KEY (`rolename_id`) REFERENCES `rolename` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `c_fk_role_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `upload`
--
ALTER TABLE `upload`
  ADD CONSTRAINT `c_fk_upload_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
