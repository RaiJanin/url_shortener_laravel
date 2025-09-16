-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 15, 2025 at 09:48 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test_url`
--

-- --------------------------------------------------------

--
-- Table structure for table `url_codes`
--

CREATE TABLE `url_codes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `link_name` varchar(255) DEFAULT NULL,
  `original_url` varchar(255) NOT NULL,
  `short_code` varchar(255) NOT NULL,
  `clicks` bigint(20) UNSIGNED NOT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `url_codes`
--

INSERT INTO `url_codes` (`id`, `link_name`, `original_url`, `short_code`, `clicks`, `expires_at`, `created_at`, `updated_at`) VALUES
(2, 'localhost', 'http://localhost/phpmyadmin/index.php?route=/sql&db=test_url&table=url_codes', 'Am3oGV', 1, '2025-09-15 08:52:07', '2025-09-14 08:52:07', '2025-09-14 08:52:22'),
(3, 'ww7.123moviesfree.net', 'https://ww7.123moviesfree.net/movie/f1-the-movie-1630859317/', '2bW5SL', 2, '2025-09-15 08:53:43', '2025-09-14 08:53:43', '2025-09-14 11:16:39'),
(5, 'Outside the Wire', 'https://ww7.123moviesfree.net/movie/outside-the-wire-101991/', '123otw', 0, '2025-09-15 09:30:14', '2025-09-14 09:30:14', '2025-09-14 09:30:14'),
(49, 'URL Codes Database', 'http://localhost/phpmyadmin/index.php?route=/sql&db=url_stn&table=url_codes', 'xct4p8', 7, NULL, '2025-08-13 08:44:28', NULL),
(50, 'GDrive Janino Websites', 'https://drive.google.com/drive/folders/10H5yyOLZQnsgFaLVY9cVMo7KV8e1FUpX', 'yulVJN', 6, NULL, '2025-08-13 08:45:05', NULL),
(51, 'Janino\'s Pinned Facebook Post', 'https://www.facebook.com/reel/611744281791593', 'cPqnzW', 1, NULL, '2025-08-13 08:45:43', NULL),
(52, 'OCS Time Keeping', 'http://100.102.205.120:8080/hris-2023/timekeeping', 'XXH5id', 5, NULL, '2025-08-13 08:46:10', '2025-09-14 22:59:14'),
(53, 'CompTech 2025 Food Ordering System', 'https://grp4foodwebpos.com/client/costumerpage.php', '41OpbE', 3, NULL, '2025-08-13 08:47:46', '2025-09-14 22:58:23'),
(54, 'Sample (Youtube)', 'https://www.youtube.com/watch?v=cALy3S728CQ', 'RKymP2', 1, NULL, '2025-08-13 11:15:40', NULL),
(55, 'Adobe', 'https://new.express.adobe.com/id/urn:aaid:sc:AP:c120458d-6997-4575-8726-c8927cce4a9d?taskID=flyer&category=templates&assetCollection=urn%3Aaaid%3Asc%3AVA6C2%3Af05ef460-1717-49f7-8731-89cfa5104360&tab=templates', 'VWe7o6', 2, NULL, '2025-08-13 15:08:02', NULL),
(56, 'Adobe Flow Chart Template', 'https://new.express.adobe.com/id/urn:aaid:sc:AP:c120458d-6997-4575-8726-c8927cce4a9d?taskID=flyer&category=templates&assetCollection=urn%3Aaaid%3Asc%3AVA6C2%3Af05ef460-1717-49f7-8731-89cfa5104360&tab=templates', 'rVMbHD', 2, NULL, '2025-08-15 10:35:26', NULL),
(58, 'Rob Daniel - Ikaw Sana x Nandito Ako | Wish 107.5 Live Cover', 'https://www.youtube.com/watch?v=FRTvF-OR4M4&list=RDFRTvF-OR4M4&start_radio=1', '2ctCD1', 0, NULL, '2025-08-17 16:02:06', NULL),
(59, 'Shamrock - Alipin (Khel Pangilinan) | Bandroom Sessions', 'https://www.youtube.com/watch?v=oguRGRv59W8&list=RDoguRGRv59W8&start_radio=1', 'Axx3Cd', 0, NULL, '2025-08-17 16:06:13', NULL),
(60, 'Ako\'y Sayo at Ika\'y Akin Lamang (Khel Pangilinan) | Bandroom Sessions', 'https://www.youtube.com/watch?v=ODzAuOyMI3I&list=RDODzAuOyMI3I&start_radio=1', 'IAXEbr', 0, NULL, '2025-08-17 16:11:11', NULL),
(61, 'Khel Pangilinan | BTBT Takeover Full Performance Ep 1', 'https://www.youtube.com/watch?v=nWGpdUhl4KU&list=RDnWGpdUhl4KU&start_radio=1', 'uq5OIG', 1, NULL, '2025-08-17 16:16:36', NULL),
(62, 'RAI Rookies Time Keeping', 'https://raihr.com/rairookies/timekeeping', 'nikfjS', 21, NULL, '2025-08-17 16:39:14', '2025-09-14 12:49:06'),
(71, 'Rai Janin GitHub', 'https://github.com/RaiJanin/url_shortener.git', '3xF4MH', 5, NULL, '2025-08-28 23:00:35', '2025-09-14 13:31:39'),
(73, 'Parokya ni Edgar - Gitara || Fingerstyle Guitar Cover Performed by Janiño Abrenica', 'https://www.facebook.com/share/r/19hsAqQMYK/', 'lsL2aB', 1, NULL, '2025-08-29 10:13:42', NULL),
(75, 'IG Short Riff', 'https://www.instagram.com/reel/DJ-p_j4SUyS/?igsh=MWJsMGJvaHl0NjUwNA==', 'MQSIvu', 1, NULL, '2025-08-31 21:14:28', NULL),
(76, 'IG to be continued riff', 'https://www.instagram.com/reel/DNue9Vq5nfh/?igsh=MXRzNGlqZnZqb3ZkdA==', 'Sohe7Y', 0, NULL, '2025-08-31 21:24:27', NULL),
(77, 'IG Share Fur Elise Tabs', 'https://www.instagram.com/reel/DHSzxY2SJng/?igsh=eXd3OTlrbXBtNnFx', 'Jq1C6e', 0, NULL, '2025-09-01 23:02:19', NULL),
(78, 'IG share Anime 1', 'https://www.instagram.com/reel/DI_5UKayTYh/?igsh=MnlidWFsaHJ6aGt2', 'jgD3yQ', 0, NULL, '2025-09-01 23:32:36', NULL),
(79, 'IG share CAGED system', 'https://www.instagram.com/reel/DNDpvoMg__e/?igsh=bnplcmV4czJqYWl2', 'KpRUWo', 1, NULL, '2025-09-01 23:37:39', NULL),
(80, 'Tiktok Share Folded Harmonize', 'https://vt.tiktok.com/ZSAG5gG5g/', 'E3oYgG', 2, NULL, '2025-09-02 13:06:11', '2025-09-14 11:42:44');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `url_codes`
--
ALTER TABLE `url_codes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `url_codes_short_code_unique` (`short_code`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `url_codes`
--
ALTER TABLE `url_codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
