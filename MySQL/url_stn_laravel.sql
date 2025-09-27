-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 27, 2025 at 09:31 AM
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
-- Database: `url_stn_laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_09_15_082026_create_url_codes_table', 1),
(5, '2025_09_20_061052_create_url_clicks_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('TOlPn3clyAB1fQBnrZdb6NVFppfSIT4eyhiM7sf1', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQlBiT1dza2FSZTl0eEhya3hzem8zcnBvQnJIMHR5YUlvNXNaTkJ6USI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC94Y3Q0cDgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1758247451);

-- --------------------------------------------------------

--
-- Table structure for table `url_clicks`
--

CREATE TABLE `url_clicks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `url_id` bigint(20) UNSIGNED NOT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `referrer` varchar(255) DEFAULT NULL,
  `clicked_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `url_clicks`
--

INSERT INTO `url_clicks` (`id`, `url_id`, `ip_address`, `user_agent`, `referrer`, `clicked_at`) VALUES
(3, 50, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'Direct', '2025-08-14 02:48:23'),
(4, 50, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', 'Direct', '2025-08-14 02:49:30'),
(5, 50, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'Direct', '2025-08-14 02:52:20'),
(6, 49, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'Direct', '2025-08-14 02:52:44'),
(7, 54, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'Direct', '2025-08-14 03:15:48'),
(8, 55, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'Direct', '2025-08-14 07:08:09'),
(9, 55, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'Direct', '2025-08-16 00:48:36'),
(10, 56, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'Direct', '2025-08-16 02:38:47'),
(11, 50, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'Direct', '2025-08-16 02:43:25'),
(12, 56, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'Direct', '2025-08-16 03:20:59'),
(13, 52, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'Direct', '2025-08-17 23:59:05'),
(14, 49, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'Direct', '2025-08-18 08:02:30'),
(15, 49, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'Direct', '2025-08-19 06:49:37'),
(16, 51, '103.161.61.18', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'Direct', '2025-08-27 08:49:59'),
(19, 49, '216.247.21.16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'Direct', '2025-08-28 15:58:56'),
(20, 53, '216.247.21.16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'Direct', '2025-08-28 15:59:13'),
(21, 53, '216.247.21.16', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'Direct', '2025-08-28 16:05:51'),
(24, 49, '216.247.21.16', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'Direct', '2025-08-28 16:08:34'),
(25, 49, '216.247.21.16', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'Direct', '2025-08-28 16:08:36'),
(48, 62, '2405:8d40:48d8:bef0:185e:7096:ce04:d6f6', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'Direct', '2025-08-29 01:31:01'),
(50, 71, '103.161.61.22', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'Direct', '2025-08-29 07:01:15'),
(54, 61, '216.247.15.96', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'Direct', '2025-08-29 18:04:20'),
(56, 62, '2405:8d40:48d8:bef0:185e:7096:ce04:d6f6', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'Direct', '2025-08-29 19:38:29'),
(58, 73, '2405:8d40:48d8:bef0:185e:7096:ce04:d6f6', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'Direct', '2025-08-30 01:18:31'),
(60, 62, '216.247.22.249', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'Direct', '2025-09-01 01:00:07'),
(67, 62, '216.247.17.10', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'Direct', '2025-09-01 15:58:25'),
(68, 62, '216.247.17.10', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'Direct', '2025-09-02 00:44:20'),
(71, 50, '180.190.194.240', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'Direct', '2025-09-03 00:15:26'),
(72, 62, '180.190.194.240', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'Direct', '2025-09-03 01:25:39'),
(73, 75, '103.161.60.64', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'Direct', '2025-09-03 05:44:45'),
(77, 62, '216.247.15.73', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'Direct', '2025-09-04 01:05:08'),
(78, 62, '216.247.20.8', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'Direct', '2025-09-05 01:20:57'),
(79, 62, '103.161.61.37', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'Direct', '2025-09-07 02:21:36'),
(80, 62, '103.161.61.32', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'Direct', '2025-09-07 02:23:21'),
(87, 62, '216.247.15.237', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'Direct', '2025-09-07 16:35:43'),
(88, 79, '216.247.15.237', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'Direct', '2025-09-07 16:37:38'),
(89, 80, '216.247.15.237', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'Direct', '2025-09-07 16:39:38'),
(90, 71, '216.247.15.237', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'Direct', '2025-09-07 16:40:57'),
(91, 52, '216.247.15.237', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'Direct', '2025-09-07 16:41:37'),
(92, 62, '216.247.15.237', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'Direct', '2025-09-07 18:51:01'),
(95, 85, '216.247.22.241', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'Direct', '2025-09-09 22:27:10'),
(96, 62, '216.247.22.241', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'Direct', '2025-09-10 00:48:10'),
(97, 62, '216.247.22.241', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'Direct', '2025-09-10 00:53:18'),
(98, 62, '216.247.12.15', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'Direct', '2025-09-11 01:36:44'),
(106, 62, '49.145.39.253', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'Direct', '2025-09-13 04:12:59'),
(114, 50, '2001:4454:18e:1800:ddec:9df1:3f8d:4966', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'Direct', '2025-09-13 20:28:39'),
(115, 62, '49.145.47.255', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'Direct', '2025-09-13 20:29:50'),
(116, 62, '49.145.47.255', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'Direct', '2025-09-13 20:29:53'),
(117, 62, '216.247.15.161', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'Direct', '2025-09-16 01:15:06'),
(118, 62, '216.247.15.161', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'Direct', '2025-09-16 01:15:07'),
(122, 62, '216.247.20.206', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'Direct', '2025-09-16 20:41:45'),
(123, 53, '216.247.20.206', 'WhatsApp/3.0.0.0 A', 'Direct', '2025-09-17 01:05:37'),
(124, 53, '175.176.69.12', 'Mozilla/5.0 (Linux; Android 14; V2344 Build/UP1A.231005.007; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/140.0.7339.51 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/524.0.0.44.109;]', 'http://m.facebook.com/', '2025-09-17 01:05:46'),
(125, 53, '175.176.69.12', 'Mozilla/5.0 (Linux; Android 14; V2344 Build/UP1A.231005.007; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/140.0.7339.51 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/524.0.0.44.109;]', 'http://m.facebook.com/', '2025-09-17 01:07:57'),
(126, 53, '175.176.69.12', 'Mozilla/5.0 (Linux; Android 14; V2344 Build/UP1A.231005.007; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/140.0.7339.51 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/524.0.0.44.109;]', 'http://m.facebook.com/', '2025-09-17 01:12:20'),
(128, 90, '103.161.60.70', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'Direct', '2025-09-18 14:10:32'),
(129, 62, '216.247.21.220', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'Direct', '2025-09-18 23:16:22'),
(130, 62, '216.247.12.67', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'Direct', '2025-09-19 23:47:00'),
(131, 90, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'Direct', '2025-09-25 00:11:59'),
(132, 62, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'Direct', '2025-09-25 16:34:53'),
(133, 62, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'Direct', '2025-09-25 16:34:59'),
(134, 62, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'Direct', '2025-09-25 16:35:04'),
(136, 91, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'Direct', '2025-09-25 20:57:33'),
(137, 62, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'Direct', '2025-09-25 20:58:27'),
(149, 97, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'Direct', '2025-09-25 23:57:46'),
(150, 96, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'Direct', '2025-09-25 23:57:56'),
(151, 97, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'Direct', '2025-09-26 08:23:40'),
(152, 97, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'Direct', '2025-09-26 00:24:34'),
(153, 97, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'Direct', '2025-09-26 00:33:40'),
(154, 98, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'Direct', '2025-09-26 00:35:21'),
(155, 62, '216.247.20.206', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'Direct', '2025-09-26 00:38:48'),
(156, 49, '216.247.20.206', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'Direct', '2025-09-16 17:29:27'),
(157, 49, '216.247.20.206', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'http://m.facebook.com/', '2025-09-16 17:29:33'),
(158, 49, '216.247.20.206', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'http://m.facebook.com/', '2025-09-16 17:30:37'),
(159, 49, '216.247.20.206', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'http://m.facebook.com/', '2025-09-16 17:30:37'),
(160, 49, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'http://m.facebook.com/', '2025-09-19 17:30:43'),
(161, 49, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'Direct', '2025-09-19 17:30:44'),
(162, 49, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'Direct', '2025-09-20 17:30:49'),
(163, 49, '2405:8d40:48d8:bef0:185e:7096:ce04:d6f6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'Direct', '2025-09-20 17:30:49'),
(164, 49, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'Direct', '2025-09-21 17:30:52'),
(165, 49, '2405:8d40:48d8:bef0:185e:7096:ce04:d6f6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'Direct', '2025-09-22 17:30:54'),
(166, 49, '2405:8d40:48d8:bef0:185e:7096:ce04:d6f6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'http://m.facebook.com/', '2025-09-22 17:30:58'),
(167, 49, '2405:8d40:48d8:bef0:185e:7096:ce04:d6f6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'http://m.facebook.com/', '2025-09-22 17:30:59'),
(168, 49, '2405:8d40:48d8:bef0:185e:7096:ce04:d6f6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'http://m.facebook.com/', '2025-09-22 17:31:02'),
(169, 49, '2405:8d40:48d8:bef0:185e:7096:ce04:d6f6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'http://m.facebook.com/', '2025-09-22 17:31:02'),
(170, 49, '2405:8d40:48d8:bef0:185e:7096:ce04:d6f6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'http://m.facebook.com/', '2025-09-22 17:31:05'),
(171, 49, '2405:8d40:48d8:bef0:185e:7096:ce04:d6f6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'Direct', '2025-09-22 17:31:06'),
(172, 49, '2405:8d40:48d8:bef0:185e:7096:ce04:d6f6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'http://m.facebook.com/', '2025-09-22 17:31:08'),
(173, 49, '2405:8d40:48d8:bef0:185e:7096:ce04:d6f6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'http://m.facebook.com/', '2025-09-22 17:31:09'),
(174, 49, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'http://m.facebook.com/', '2025-09-22 17:31:16'),
(175, 49, '216.247.20.206', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'Direct', '2025-09-23 17:31:16'),
(176, 49, '216.247.20.206', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'Direct', '2025-09-23 17:31:21'),
(177, 49, '216.247.20.206', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'Direct', '2025-09-23 17:31:21'),
(178, 49, '216.247.20.206', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'WhatsApp/3.0.0.0 A', '2025-09-24 17:31:24'),
(179, 49, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'WhatsApp/3.0.0.0 A', '2025-09-24 17:31:25'),
(180, 49, '2405:8d40:48d8:bef0:185e:7096:ce04:d6f6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'Direct', '2025-09-24 17:31:28'),
(181, 49, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'http://m.facebook.com/', '2025-09-24 17:31:28'),
(182, 49, '216.247.20.206', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'Direct', '2025-09-11 17:31:31'),
(183, 49, '216.247.20.206', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'http://m.facebook.com/', '2025-09-24 17:31:31'),
(184, 49, '216.247.20.206', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'http://m.facebook.com/', '2025-09-24 17:31:34'),
(185, 49, '216.247.20.206', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'Direct', '2025-09-26 17:31:35'),
(186, 49, '2405:8d40:48d8:bef0:185e:7096:ce04:d6f6', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'WhatsApp/3.0.0.0 A', '2025-09-26 17:31:38'),
(187, 49, '216.247.20.206', 'Mozilla/5.0 (Linux; Android 14; V2344 Build/UP1A.231005.007; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/140.0.7339.51 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/524.0.0.44.109;]', 'WhatsApp/3.0.0.0 A', '2025-09-26 17:31:39'),
(188, 49, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 14; V2344 Build/UP1A.231005.007; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/140.0.7339.51 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/524.0.0.44.109;]', 'http://m.facebook.com/', '2025-09-26 17:31:41'),
(189, 49, '49.145.47.255', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'http://m.facebook.com/', '2025-09-26 17:31:42'),
(190, 49, '49.145.47.255', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'http://m.facebook.com/', '2025-09-26 17:31:44'),
(191, 49, '49.145.47.255', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'http://m.facebook.com/', '2025-09-26 17:31:45'),
(192, 49, '49.145.47.255', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'WhatsApp/3.0.0.0 A', '2025-09-26 17:31:48'),
(193, 49, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'Direct', '2025-09-26 17:31:48'),
(194, 49, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'WhatsApp/3.0.0.0 A', '2025-09-26 17:31:51'),
(195, 49, '2405:8d40:48d8:bef0:185e:7096:ce04:d6f6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'Direct', '2025-09-26 17:31:52'),
(196, 49, '2405:8d40:48d8:bef0:185e:7096:ce04:d6f6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'WhatsApp/3.0.0.0 A', '2025-09-26 17:31:55'),
(197, 49, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 14; V2344 Build/UP1A.231005.007; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/140.0.7339.51 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/524.0.0.44.109;]', 'Direct', '2025-09-21 17:31:56'),
(198, 49, '49.145.47.255', 'Mozilla/5.0 (Linux; Android 14; V2344 Build/UP1A.231005.007; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/140.0.7339.51 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/524.0.0.44.109;]', 'WhatsApp/3.0.0.0 A', '2025-09-21 17:31:58'),
(199, 49, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 14; V2344 Build/UP1A.231005.007; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/140.0.7339.51 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/524.0.0.44.109;]', 'Direct', '2025-09-21 17:31:59'),
(200, 49, '49.145.47.255', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'Direct', '2025-09-21 17:32:01'),
(201, 49, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'WhatsApp/3.0.0.0 A', '2025-09-21 17:32:02'),
(202, 49, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'Direct', '2025-09-21 17:32:05'),
(203, 49, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'Direct', '2025-09-21 17:32:06'),
(204, 49, '2405:8d40:48d8:bef0:185e:7096:ce04:d6f6', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'WhatsApp/3.0.0.0 A', '2025-09-21 17:32:08'),
(205, 49, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'Direct', '2025-09-21 17:32:09'),
(206, 49, '2405:8d40:48d8:bef0:185e:7096:ce04:d6f6', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'Direct', '2025-09-21 17:32:12'),
(207, 49, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'Direct', '2025-09-21 17:32:13'),
(208, 49, '216.247.20.206', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'WhatsApp/3.0.0.0 A', '2025-09-21 17:32:15'),
(209, 49, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'WhatsApp/3.0.0.0 A', '2025-09-21 17:32:16'),
(210, 49, '216.247.20.206', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'WhatsApp/3.0.0.0 A', '2025-09-21 17:32:19'),
(211, 49, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'WhatsApp/3.0.0.0 A', '2025-09-21 17:32:19'),
(212, 49, '49.145.47.255', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'WhatsApp/3.0.0.0 A', '2025-09-21 17:32:22'),
(213, 49, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'Direct', '2025-09-21 17:32:23'),
(214, 73, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'Direct', '2025-09-26 18:35:00'),
(215, 96, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'Direct', '2025-09-26 18:36:29');

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
(49, 'URL Codes Database', 'http://localhost/phpmyadmin/index.php?route=/sql&db=url_stn&table=url_codes', 'xct4p8', 65, NULL, '2025-08-13 16:44:28', '2025-09-26 17:32:23'),
(50, 'GDrive Janino Websites', 'https://drive.google.com/drive/folders/10H5yyOLZQnsgFaLVY9cVMo7KV8e1FUpX', 'yulVJN', 6, NULL, '2025-08-13 16:45:05', '2025-09-26 23:11:46'),
(51, 'Janino\'s Pinned Facebook Post', 'https://www.facebook.com/reel/611744281791593', 'cPqnzW', 1, NULL, '2025-08-13 16:45:43', '2025-09-26 23:11:46'),
(52, 'OCS Time Keeping', 'http://100.102.205.120:8080/hris-2023/timekeeping', 'XXH5id', 3, NULL, '2025-08-13 16:46:10', '2025-09-26 23:11:46'),
(53, 'CompTech 2025 Food Ordering System', 'https://grp4foodwebpos.com/client/costumerpage.php', '41OpbE', 6, NULL, '2025-08-13 16:47:46', '2025-09-26 23:11:46'),
(54, 'Sample (Youtube)', 'https://www.youtube.com/watch?v=cALy3S728CQ', 'RKymP2', 1, NULL, '2025-08-13 19:15:40', '2025-09-26 23:11:46'),
(55, 'Adobe', 'https://new.express.adobe.com/id/urn:aaid:sc:AP:c120458d-6997-4575-8726-c8927cce4a9d?taskID=flyer&category=templates&assetCollection=urn%3Aaaid%3Asc%3AVA6C2%3Af05ef460-1717-49f7-8731-89cfa5104360&tab=templates', 'VWe7o6', 2, NULL, '2025-08-13 23:08:02', '2025-09-26 23:11:46'),
(56, 'Adobe Flow Chart Template', 'https://new.express.adobe.com/id/urn:aaid:sc:AP:c120458d-6997-4575-8726-c8927cce4a9d?taskID=flyer&category=templates&assetCollection=urn%3Aaaid%3Asc%3AVA6C2%3Af05ef460-1717-49f7-8731-89cfa5104360&tab=templates', 'rVMbHD', 2, NULL, '2025-08-15 18:35:26', '2025-09-26 23:11:46'),
(60, 'Ako\'y Sayo at Ika\'y Akin Lamang (Khel Pangilinan) | Bandroom Sessions', 'https://www.youtube.com/watch?v=ODzAuOyMI3I&list=RDODzAuOyMI3I&start_radio=1', 'IAXEbr', 0, NULL, '2025-08-18 00:11:11', '2025-09-27 02:00:00'),
(61, 'Khel Pangilinan | BTBT Takeover Full Performance Ep 1', 'https://www.youtube.com/watch?v=nWGpdUhl4KU&list=RDnWGpdUhl4KU&start_radio=1', 'uq5OIG', 1, NULL, '2025-08-18 00:16:36', '2025-09-26 23:11:46'),
(62, 'RAI Rookies Time Keeping', 'https://raihr.com/rairookies/timekeeping', 'nikfjS', 28, NULL, '2025-08-18 00:39:14', '2025-09-26 00:38:48'),
(71, 'Rai Janin GitHub', 'https://github.com/RaiJanin/url_shortener.git', '3xF4MH', 2, NULL, '2025-08-29 07:00:35', '2025-09-26 23:11:46'),
(73, 'Parokya ni Edgar - Gitara || Fingerstyle Guitar Cover Performed by Janino Abrenica', 'https://www.facebook.com/share/r/19hsAqQMYK/', 'lsL2aB', 2, NULL, '2025-08-29 18:13:42', '2025-09-26 18:35:00'),
(75, 'IG Short Riff', 'https://www.instagram.com/reel/DJ-p_j4SUyS/?igsh=MWJsMGJvaHl0NjUwNA==', 'MQSIvu', 1, NULL, '2025-09-01 05:14:28', '2025-09-26 23:11:46'),
(76, 'IG to be continued riff', 'https://www.instagram.com/reel/DNue9Vq5nfh/?igsh=MXRzNGlqZnZqb3ZkdA==', 'Sohe7Y', 0, NULL, '2025-09-01 05:24:27', '2025-09-26 23:11:46'),
(77, 'IG Share Fur Elise Tabs', 'https://www.instagram.com/reel/DHSzxY2SJng/?igsh=eXd3OTlrbXBtNnFx', 'Jq1C6e', 0, NULL, '2025-09-02 07:02:19', '2025-09-26 23:11:46'),
(78, 'IG share Anime 1', 'https://www.instagram.com/reel/DI_5UKayTYh/?igsh=MnlidWFsaHJ6aGt2', 'jgD3yQ', 0, NULL, '2025-09-02 07:32:36', '2025-09-26 23:11:46'),
(79, 'IG share CAGED system', 'https://www.instagram.com/reel/DNDpvoMg__e/?igsh=bnplcmV4czJqYWl2', 'KpRUWo', 1, NULL, '2025-09-02 07:37:39', '2025-09-26 23:11:46'),
(80, 'Tiktok Share Folded Harmonize', 'https://vt.tiktok.com/ZSAG5gG5g/', 'E3oYgG', 1, NULL, '2025-09-02 21:06:11', '2025-09-26 23:11:46'),
(82, 'IG share 2', 'https://www.instagram.com/reel/DItwOztSG4q/?igsh=dTZtYzBsZWs3cHJv', 'ANhroE', 0, NULL, '2025-09-06 08:44:42', '2025-09-26 23:11:46'),
(85, 'FB share 3', 'https://www.facebook.com/share/p/1HvRZfbUdp/', 'KCbJqk', 1, NULL, '2025-09-07 21:33:32', '2025-09-26 23:11:46'),
(90, 'BINI - Shagidi (Behind the Scenes)', 'https://m.youtube.com/watch?v=nSyo-FRhbv0&fbclid=PAT01DUAM15l1leHRuA2FlbQIxMAABp7LZ0ce-a3LEbDwj9wkRuLmMbHNvB4EYIi9j55KDX5uLTGVGS84xPg-pewHO_aem_GCcNNwEFQNCIM9o_iQrEMA', 'C3J58s', 2, '2025-10-15 22:44:10', '2025-09-15 22:44:10', '2025-09-25 22:51:13'),
(91, 'IG share guitar practice tabs', 'https://www.instagram.com/reel/DO3xnl9k0Zn/?igsh=MWdvaXBvdXU1cGZwNQ==', 'QYJevy', 1, NULL, '2025-09-22 19:42:40', '2025-09-25 20:57:33'),
(92, 'Classic Solid Style Icons || file-circle-check', 'https://fontawesome.com/icons/file-circle-check?f=classic&s=solid', 'VcmbdE', 0, NULL, '2025-09-25 22:32:55', '2025-09-25 23:07:33'),
(96, 'Shamrock - Alipin (Khel Pangilinan) | BRS Episode 1 Full Performance', 'https://www.youtube.com/watch?v=oguRGRv59W8&list=RDoguRGRv59W8&start_radio=1', 'denzWW', 2, '2025-10-25 23:57:05', '2025-09-25 23:57:05', '2025-09-26 18:36:29'),
(97, 'Rob Deniel performs \"Ikaw Sana\" and \"Nandito Ako\" LIVE on Wish 107.5', 'https://www.youtube.com/watch?v=FRTvF-OR4M4&list=RDFRTvF-OR4M4&start_radio=1', 'szcAQl', 4, '2025-10-25 23:57:27', '2025-09-25 23:57:27', '2025-09-26 00:33:40'),
(98, 'Rob Deniel performs \"Miss Miss\" LIVE on Wish 107.5', 'https://www.youtube.com/watch?v=OT-fuFhBo9k&list=RDFRTvF-OR4M4&index=2', 'afn6QW', 1, '2025-10-26 00:35:13', '2025-09-26 00:35:13', '2025-09-26 00:35:21');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `url_clicks`
--
ALTER TABLE `url_clicks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `url_clicks_url_id_foreign` (`url_id`);

--
-- Indexes for table `url_codes`
--
ALTER TABLE `url_codes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `url_codes_short_code_unique` (`short_code`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `url_clicks`
--
ALTER TABLE `url_clicks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=216;

--
-- AUTO_INCREMENT for table `url_codes`
--
ALTER TABLE `url_codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `url_clicks`
--
ALTER TABLE `url_clicks`
  ADD CONSTRAINT `url_clicks_url_id_foreign` FOREIGN KEY (`url_id`) REFERENCES `url_codes` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
