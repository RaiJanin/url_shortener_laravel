-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 07, 2025 at 08:19 AM
-- Server version: 11.8.3-MariaDB-log
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u906906778_lara_url_stn`
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
('0HQ6FPZm6BhxkZ9xdgOnpTwdSANaUyyxgRuQgNm9', NULL, '192.133.77.15', 'Twitterbot/1.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib2RsaENHNlk2bkJZRzh4SkZLZ2RKanc0a21FbDNaNXRWZHBtZkVESiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTQ6Imh0dHBzOi8vdGVhbC1wb3JjdXBpbmUtOTY0MzMxLmhvc3RpbmdlcnNpdGUuY29tL2FGVGVvZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1761791938),
('3SM782083rr4uizNwM2Re67aklFLiHwduPzY2C6c', NULL, '199.16.157.182', 'Twitterbot/1.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieUVpNGFwUmNmYXVzQlowbHVDMVFWY3FrcTVZamdhWEF0RW9JdmMwcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTQ6Imh0dHBzOi8vdGVhbC1wb3JjdXBpbmUtOTY0MzMxLmhvc3RpbmdlcnNpdGUuY29tL2FGVGVvZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1761791938),
('ADL2TBVgZW3JXGZEQC39Q3Dxd6z0iEeJ0fOLakQq', NULL, '175.176.66.210', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTzd0TERBQ1ByN0FHbE0yeGlNbVZEd0RrNklBMzBFcHY3NmRjd1NTUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHBzOi8vdGVhbC1wb3JjdXBpbmUtOTY0MzMxLmhvc3RpbmdlcnNpdGUuY29tL3MtYXBwL2xpbmtzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1761925150),
('aoJ5QBG5litDzyAsLvOFnpMefOQGVNy3uvwxXicm', NULL, '49.145.132.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSjM4THhoWVh5Nk9YYk1MN1RqZXlxREp0NWZ0eUNSRjFGdlB6cmdmViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTg6Imh0dHBzOi8vdGVhbC1wb3JjdXBpbmUtOTY0MzMxLmhvc3RpbmdlcnNpdGUuY29tL3MtYXBwL2hvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1762486321),
('Bcpvpf82MM2dYX3xv0ylXUs8bN6Wwep6odzXyCu2', NULL, '34.118.196.164', 'Mozilla/5.0 (iPhone; CPU iPhone OS 12_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.1 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNmxrcEYzRk1xT1U4dTBIQmYxNGlBZDVBOUswZ00wSU1rVkRNMzBVWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTQ6Imh0dHBzOi8vdGVhbC1wb3JjdXBpbmUtOTY0MzMxLmhvc3RpbmdlcnNpdGUuY29tL2FGVGVvZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1761792667),
('DkdmYZG8lnaBKjpJ8Kiff2w7WyqBQAiu5ZS6zCqc', NULL, '34.118.196.164', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ3A4N0JtcjV5N0pzTnZCVTRHdTVOUGJvODY4NzNYSTJqR1lSZlBXRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTQ6Imh0dHBzOi8vdGVhbC1wb3JjdXBpbmUtOTY0MzMxLmhvc3RpbmdlcnNpdGUuY29tL2FGVGVvZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1761792690),
('FxijedHu75YMvsgD782JSWtoU3vUuWgQoi42roJy', NULL, '144.76.23.51', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; trendictionbot0.5.0; trendiction search; http://www.trendiction.de/bot; please let us know of any problems; web at trendiction.com) Gecko/20100101 Firefox/125.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU1hZRXNUS2p4OWtodVp3a01JR09IMzdFVFJza2dMY1pFTFVRc0lTZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTQ6Imh0dHBzOi8vdGVhbC1wb3JjdXBpbmUtOTY0MzMxLmhvc3RpbmdlcnNpdGUuY29tL2FGVGVvZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1761791947),
('jgeAA2mPUBLIVvD5tzfasJQA8zn2KBYwjvwocc6C', NULL, '34.168.161.242', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieHJROUlNNWFGb2tJVDN1RDRSTTAwZ25yM3hGdFpORkJGcGRucDJVNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTQ6Imh0dHBzOi8vdGVhbC1wb3JjdXBpbmUtOTY0MzMxLmhvc3RpbmdlcnNpdGUuY29tL2FGVGVvZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1761791968),
('KiOJaRIupwJrQUxudrU8i0taxP6aStK6ZNsYDDbW', NULL, '49.145.132.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWkVNcVFod2RmdVJWdTA0V2daczJHRTU3cFhIemNNeWpacGpEU3lGRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDc6Imh0dHBzOi8vdGVhbC1wb3JjdXBpbmUtOTY0MzMxLmhvc3RpbmdlcnNpdGUuY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1762503469),
('kIpc7shqpqurPlbtNbbhUEmC6Jqpq2yhxIq7oBGI', NULL, '1.37.67.198', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaWgzMFlVTFBmSG80NTlTcFU3aEdLS0dzQmJKUlQ4Z2I1dEE3YkxtaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTQ6Imh0dHBzOi8vdGVhbC1wb3JjdXBpbmUtOTY0MzMxLmhvc3RpbmdlcnNpdGUuY29tL2FGVGVvZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1761791949),
('l6m1KK3Yxuw4hgwXzJhP2om0ThCBGIqQrVSjks2G', NULL, '34.169.148.217', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicldUOGZubVZsUld6eGRBQzNYV3VJejJKaVFha2thbW9LN3pVOVJieCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTQ6Imh0dHBzOi8vdGVhbC1wb3JjdXBpbmUtOTY0MzMxLmhvc3RpbmdlcnNpdGUuY29tL2FGVGVvZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1761793162),
('ljLpV453RPONSaoIGgRXKENMm7N7K2be8tyUQgy6', NULL, '167.114.1.28', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiczNSRXBFbzhyMkVVczF3TUdFaHNrYThMMXM0NlV5d2xqQ0d6RXo2SCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTQ6Imh0dHBzOi8vdGVhbC1wb3JjdXBpbmUtOTY0MzMxLmhvc3RpbmdlcnNpdGUuY29tL2FGVGVvZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1761792038),
('OY1Yux1ajSMPRURiQA6yetKprGFjW74VSIxIUeyy', NULL, '34.168.161.242', 'Mozilla/5.0 (iPhone; CPU iPhone OS 12_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.1 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTEJ6ejRZQ2VKZW5OU2ZHN0NqaFhPRjNrdkFzV3JhMEFvemdCT0o1ZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTQ6Imh0dHBzOi8vdGVhbC1wb3JjdXBpbmUtOTY0MzMxLmhvc3RpbmdlcnNpdGUuY29tL2FGVGVvZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1761791970),
('Q8RMAhCZ9KpREayo3rdmVm6zrYacLYC7wDKHj0QJ', NULL, '199.16.157.182', 'Twitterbot/1.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRUtwaTd1aEFUNERURFYyRXpkNUdrbnY1Zjk1Z3ZKQVE2S0V0YUJYQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTQ6Imh0dHBzOi8vdGVhbC1wb3JjdXBpbmUtOTY0MzMxLmhvc3RpbmdlcnNpdGUuY29tL2FGVGVvZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1761791937),
('q9KPuKwsboktxeYUsDwApBaPE74nlsfyRXdwAnbk', NULL, '199.16.157.180', 'Twitterbot/1.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid3lqZktaQzVaenVTMXBmb0VxVEtYcjJBbDluMUNKNkswM3JYdG5MbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTQ6Imh0dHBzOi8vdGVhbC1wb3JjdXBpbmUtOTY0MzMxLmhvc3RpbmdlcnNpdGUuY29tL2FGVGVvZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1762399576),
('r0wTnngjxmAKJXw4rRp5DkJDg3fs16eNGhpq6tdF', NULL, '49.145.132.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNVZNRlN3OGxiMFprZk5tc0E3d2hIWDRFQktabTdYZWoyQ2lDNURFQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTg6Imh0dHBzOi8vdGVhbC1wb3JjdXBpbmUtOTY0MzMxLmhvc3RpbmdlcnNpdGUuY29tL3MtYXBwL2hvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1762410256),
('sXhsR0HjqANRtWggoCq5rix5MwTrrmzDJnLIbhpE', NULL, '45.56.186.96', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicDhETWg5ZzN5MERGNjlMejNXVUhrVGNoVUlkRm1KTURGRnhYQ0I1cyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTQ6Imh0dHBzOi8vdGVhbC1wb3JjdXBpbmUtOTY0MzMxLmhvc3RpbmdlcnNpdGUuY29tL2FGVGVvZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1761792848),
('tcIpqUUtC7Yr08ehWjp8iTPLSkeXeiYwqO6yTDwJ', NULL, '34.235.48.77', 'Mozilla/5.0 (compatible)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaXRzM0xORkdodVE5cVl1WEV6VG5DakhYcE44aUxiVjYxczQ3dW9yYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTQ6Imh0dHBzOi8vdGVhbC1wb3JjdXBpbmUtOTY0MzMxLmhvc3RpbmdlcnNpdGUuY29tL2FGVGVvZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1761791942),
('TSZ5CdLhXTDjKqqmjlKOljyljsFXi0gAiDTPNJea', NULL, '34.118.196.164', 'Mozilla/5.0 (iPhone; CPU iPhone OS 12_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.1 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidVZGaTY5YXFrdWZRczZZTWdmQmtnanlxZTFjSG1QMDJZRFJuU2NOdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTQ6Imh0dHBzOi8vdGVhbC1wb3JjdXBpbmUtOTY0MzMxLmhvc3RpbmdlcnNpdGUuY29tL2FGVGVvZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1761792691),
('TTrBPoBLc9apk8txmBdYvaXdfomrESxhYyPWNfoU', NULL, '34.168.161.242', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaDlBQlRLS1dRYjVZRGRHaUZYSXRZUzNDVG1IM2RYRVRydVRhcmtjbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTQ6Imh0dHBzOi8vdGVhbC1wb3JjdXBpbmUtOTY0MzMxLmhvc3RpbmdlcnNpdGUuY29tL2FGVGVvZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1761791971),
('tZpC58Q016Q4SZ4XAJLbtu5cIalUoRIER8E68M3q', NULL, '34.168.161.242', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibTlrSWJiQVhORTV5dmN2SzljWkZMcUFabzZmaFY3eUxuemx4Mm1FQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTQ6Imh0dHBzOi8vdGVhbC1wb3JjdXBpbmUtOTY0MzMxLmhvc3RpbmdlcnNpdGUuY29tL2FGVGVvZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1761791969),
('uQlLxbBN88RMdkXyrDhdCx4RLOTXz3fd1fHbmMZm', NULL, '199.16.157.183', 'Twitterbot/1.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZGdGUFJ3cWZzaHRTWWxVTFZLZDZnSjUwVHdXQVdJUURJRUNKVnBOWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTQ6Imh0dHBzOi8vdGVhbC1wb3JjdXBpbmUtOTY0MzMxLmhvc3RpbmdlcnNpdGUuY29tL2FGVGVvZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1761791936),
('uy97kLtNycMGudk63jQKtazZxHn2fCfFv5qqGhcJ', NULL, '34.118.196.164', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibTlwNEFhSEtjQklyTXVrN1NvdWdXcXFvMVVKSzY4N3RVdWpCMjF1TiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTQ6Imh0dHBzOi8vdGVhbC1wb3JjdXBpbmUtOTY0MzMxLmhvc3RpbmdlcnNpdGUuY29tL2FGVGVvZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1761792663),
('vGbnBh3ueX1wTsE4XUcAzgafrlpTGA0ytDaQ5hYO', NULL, '49.145.129.13', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidHpHRGtQRFdlcTNOTGhOQXQ0Z3l5ekgyQXpGS2lsZVo3Umdud3NoZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTg6Imh0dHBzOi8vdGVhbC1wb3JjdXBpbmUtOTY0MzMxLmhvc3RpbmdlcnNpdGUuY29tL3MtYXBwL2hvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1761793395),
('wqXn8O5f18BhCZtwf5m2XQAoYauJ8ZWaVFDej8ZP', NULL, '175.176.66.164', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSUs0cmFiamdzRWtrWFhVR3JtS1NyamJUQ2xJTmdtdTdpZDBUYTdmNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHBzOi8vdGVhbC1wb3JjdXBpbmUtOTY0MzMxLmhvc3RpbmdlcnNpdGUuY29tL3MtYXBwL2xpbmtzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1762309962),
('XWXDEJIFr6lZxARP9uDvbFEKoGAjVRoH5P9TI91B', NULL, '34.118.196.164', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRGFZanVJdXkxcVY0UmRYaXFpdUtVMkpoN0tMM1FrTG0xbkVIYTk4cyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTQ6Imh0dHBzOi8vdGVhbC1wb3JjdXBpbmUtOTY0MzMxLmhvc3RpbmdlcnNpdGUuY29tL2FGVGVvZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1761792689),
('Ybj6kowTaf0QMp4xR9DEKTbuGN7Gu6M9jzxdPLJP', NULL, '49.145.129.13', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWXJweWJsd25DWklVUHluNnZDU1NHMThxc29qaU5rU0RoeW1jMTZpbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTQ6Imh0dHBzOi8vdGVhbC1wb3JjdXBpbmUtOTY0MzMxLmhvc3RpbmdlcnNpdGUuY29tL3l1bFZKTiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1761808753),
('yNWi3YoiUdKNHx4ak1eW0UgNndosyX7jFJQ4ud7z', NULL, '49.145.129.13', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidmRRb2l0c0NyZ1Y1WmdaY0ViNlVIcEgwNElXbmlnTzJZWGdZaGNIVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHBzOi8vdGVhbC1wb3JjdXBpbmUtOTY0MzMxLmhvc3RpbmdlcnNpdGUuY29tL3MtYXBwL2xpbmtzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1761793102),
('yx8vnsgCRv03qFsmTt44eXS9qdXnCfCCPNV58X4X', NULL, '144.76.23.148', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; trendictionbot0.5.0; trendiction search; http://www.trendiction.de/bot; please let us know of any problems; web at trendiction.com) Gecko/20100101 Firefox/125.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWjNuQ2hYZGJtSm5sWjA1akJ5UEpkdUthdzVUWWhqWWZXRnpXUm5QSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTQ6Imh0dHBzOi8vdGVhbC1wb3JjdXBpbmUtOTY0MzMxLmhvc3RpbmdlcnNpdGUuY29tL2FGVGVvZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1761793137);

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
(7, 54, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'Direct', '2025-08-14 03:15:48'),
(8, 55, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'Direct', '2025-08-14 07:08:09'),
(9, 55, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'Direct', '2025-08-16 00:48:36'),
(10, 56, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'Direct', '2025-08-16 02:38:47'),
(11, 50, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'Direct', '2025-08-16 02:43:25'),
(12, 56, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'Direct', '2025-08-16 03:20:59'),
(13, 52, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'Direct', '2025-08-17 23:59:05'),
(16, 51, '103.161.61.18', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'Direct', '2025-08-27 08:49:59'),
(20, 53, '216.247.21.16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'Direct', '2025-08-28 15:59:13'),
(21, 53, '216.247.21.16', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'Direct', '2025-08-28 16:05:51'),
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
(129, 62, '216.247.21.220', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'Direct', '2025-09-18 23:16:22'),
(130, 62, '216.247.12.67', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'Direct', '2025-09-19 23:47:00'),
(132, 62, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'Direct', '2025-09-25 16:34:53'),
(133, 62, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'Direct', '2025-09-25 16:34:59'),
(134, 62, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'Direct', '2025-09-25 16:35:04'),
(136, 91, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'Direct', '2025-09-25 20:57:33'),
(137, 62, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'Direct', '2025-09-25 20:58:27'),
(155, 62, '216.247.20.206', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'Direct', '2025-09-26 00:38:48'),
(214, 73, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'Direct', '2025-09-26 18:35:00'),
(216, 101, '103.161.60.69', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'Direct', '2025-10-08 11:28:51'),
(217, 101, '103.161.60.69', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'Direct', '2025-10-08 11:29:57'),
(218, 101, '103.161.60.65', 'Mozilla/5.0 (Linux; Android 13; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.7339.207 Mobile Safari/537.36', 'Direct', '2025-10-08 11:31:01'),
(223, 99, '216.247.15.58', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'Direct', '2025-10-09 09:34:55'),
(224, 100, '216.247.15.58', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'Direct', '2025-10-09 09:37:13'),
(225, 62, '49.148.247.249', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'Direct', '2025-10-11 14:29:00'),
(226, 107, '49.148.247.249', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'Direct', '2025-10-12 04:51:21'),
(227, 62, '175.176.64.50', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'Direct', '2025-10-12 23:38:23'),
(228, 62, '216.247.19.57', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'Direct', '2025-10-13 06:38:22'),
(229, 62, '175.176.64.50', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'Direct', '2025-10-14 00:32:13'),
(230, 62, '104.164.158.137', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'Direct', '2025-10-14 05:05:06'),
(231, 62, '23.27.31.4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'Direct', '2025-10-14 05:05:12'),
(232, 62, '180.190.196.96', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'Direct', '2025-10-14 05:05:16'),
(233, 62, '180.190.196.96', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'Direct', '2025-10-14 05:06:56'),
(234, 62, '180.190.196.96', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'Direct', '2025-10-14 05:07:02'),
(235, 62, '175.176.64.50', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'Direct', '2025-10-17 09:06:33'),
(236, 109, '175.176.64.91', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'Direct', '2025-10-18 14:03:54'),
(237, 91, '216.247.19.40', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'Direct', '2025-10-20 09:04:52'),
(238, 91, '175.176.65.66', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'Direct', '2025-10-20 11:07:09'),
(239, 62, '49.145.129.13', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'Direct', '2025-10-21 04:00:33'),
(240, 62, '175.176.65.139', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'Direct', '2025-10-25 12:18:44'),
(241, 110, '103.161.61.34', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'Direct', '2025-10-27 01:13:02'),
(242, 62, '49.145.39.102', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'Direct', '2025-10-27 08:42:54'),
(243, 110, '49.145.39.102', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'Direct', '2025-10-27 08:43:41'),
(244, 62, '49.145.39.102', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'Direct', '2025-10-28 01:26:54'),
(245, 111, '199.16.157.181', 'Twitterbot/1.0', 'Direct', '2025-10-29 04:28:47'),
(246, 111, '199.16.157.183', 'Twitterbot/1.0', 'Direct', '2025-10-29 04:28:47'),
(247, 111, '199.16.157.180', 'Twitterbot/1.0', 'Direct', '2025-10-29 04:28:47'),
(248, 111, '199.16.157.183', 'Twitterbot/1.0', 'Direct', '2025-10-29 04:28:47'),
(249, 111, '192.133.77.14', 'Twitterbot/1.0', 'Direct', '2025-10-29 04:28:48'),
(250, 111, '144.76.22.179', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; trendictionbot0.5.0; trendiction search; http://www.trendiction.de/bot; please let us know of any problems; web at trendiction.com) Gecko/20100101 Firefox/125.0', 'Direct', '2025-10-29 04:28:59'),
(251, 111, '34.169.216.3', NULL, 'Direct', '2025-10-29 04:29:19'),
(252, 111, '199.16.157.183', 'Twitterbot/1.0', 'Direct', '2025-10-30 02:38:56'),
(253, 111, '199.16.157.182', 'Twitterbot/1.0', 'Direct', '2025-10-30 02:38:57'),
(254, 111, '192.133.77.15', 'Twitterbot/1.0', 'Direct', '2025-10-30 02:38:58'),
(255, 111, '199.16.157.182', 'Twitterbot/1.0', 'Direct', '2025-10-30 02:38:58'),
(256, 111, '49.145.129.13', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'Direct', '2025-10-30 02:38:59'),
(257, 111, '34.235.48.77', 'Mozilla/5.0 (compatible)', 'Direct', '2025-10-30 02:39:02'),
(258, 111, '1.37.67.198', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Mobile Safari/537.36', 'Direct', '2025-10-30 02:39:05'),
(259, 111, '144.76.23.51', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; trendictionbot0.5.0; trendiction search; http://www.trendiction.de/bot; please let us know of any problems; web at trendiction.com) Gecko/20100101 Firefox/125.0', 'Direct', '2025-10-30 02:39:07'),
(260, 111, '1.37.67.198', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Mobile Safari/537.36', 'Direct', '2025-10-30 02:39:09'),
(261, 111, '34.168.161.242', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'Direct', '2025-10-30 02:39:28'),
(262, 111, '34.168.161.242', NULL, 'Direct', '2025-10-30 02:39:29'),
(263, 111, '34.168.161.242', 'Mozilla/5.0 (iPhone; CPU iPhone OS 12_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.1 Mobile/15E148 Safari/604.1', 'Direct', '2025-10-30 02:39:30'),
(264, 111, '34.168.161.242', NULL, 'Direct', '2025-10-30 02:39:31'),
(265, 111, '167.114.1.28', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', 'Direct', '2025-10-30 02:40:38'),
(266, 103, '49.145.129.13', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'Direct', '2025-10-30 02:47:30'),
(267, 111, '49.145.129.13', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'Direct', '2025-10-30 02:50:04'),
(268, 111, '49.145.129.13', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'Direct', '2025-10-30 02:50:34'),
(269, 111, '34.118.196.164', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'Direct', '2025-10-30 02:51:03'),
(270, 111, '34.118.196.164', 'Mozilla/5.0 (iPhone; CPU iPhone OS 12_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.1 Mobile/15E148 Safari/604.1', 'Direct', '2025-10-30 02:51:07'),
(271, 111, '34.118.196.164', NULL, 'Direct', '2025-10-30 02:51:29'),
(272, 111, '34.118.196.164', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'Direct', '2025-10-30 02:51:30'),
(273, 111, '34.118.196.164', 'Mozilla/5.0 (iPhone; CPU iPhone OS 12_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.1 Mobile/15E148 Safari/604.1', 'Direct', '2025-10-30 02:51:31'),
(274, 111, '45.56.186.96', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'Direct', '2025-10-30 02:54:08'),
(275, 111, '49.145.129.13', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'Direct', '2025-10-30 02:55:10'),
(276, 111, '144.76.23.148', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; trendictionbot0.5.0; trendiction search; http://www.trendiction.de/bot; please let us know of any problems; web at trendiction.com) Gecko/20100101 Firefox/125.0', 'Direct', '2025-10-30 02:58:57'),
(277, 111, '34.169.148.217', NULL, 'Direct', '2025-10-30 02:59:22'),
(278, 50, '49.145.129.13', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'Direct', '2025-10-30 07:19:13'),
(279, 111, '199.16.157.180', 'Twitterbot/1.0', 'Direct', '2025-11-06 03:26:16');

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
(50, 'GDrive Janino Websites', 'https://drive.google.com/drive/folders/10H5yyOLZQnsgFaLVY9cVMo7KV8e1FUpX', 'yulVJN', 7, NULL, '2025-08-13 16:45:05', '2025-10-30 07:19:13'),
(51, 'Janino\'s Pinned Facebook Post', 'https://www.facebook.com/reel/611744281791593', 'cPqnzW', 1, NULL, '2025-08-13 16:45:43', '2025-09-26 23:11:46'),
(52, 'OCS Time Keeping', 'http://100.102.205.120:8080/hris-2023/timekeeping', 'XXH5id', 3, NULL, '2025-08-13 16:46:10', '2025-09-26 23:11:46'),
(53, 'CompTech 2025 Food Ordering System', 'https://grp4foodwebpos.com/client/costumerpage.php', '41OpbE', 6, NULL, '2025-08-13 16:47:46', '2025-09-26 23:11:46'),
(54, 'Sample (Youtube)', 'https://www.youtube.com/watch?v=cALy3S728CQ', 'RKymP2', 1, NULL, '2025-08-13 19:15:40', '2025-09-26 23:11:46'),
(55, 'Adobe', 'https://new.express.adobe.com/id/urn:aaid:sc:AP:c120458d-6997-4575-8726-c8927cce4a9d?taskID=flyer&category=templates&assetCollection=urn%3Aaaid%3Asc%3AVA6C2%3Af05ef460-1717-49f7-8731-89cfa5104360&tab=templates', 'VWe7o6', 2, NULL, '2025-08-13 23:08:02', '2025-09-26 23:11:46'),
(56, 'Adobe Flow Chart Template', 'https://new.express.adobe.com/id/urn:aaid:sc:AP:c120458d-6997-4575-8726-c8927cce4a9d?taskID=flyer&category=templates&assetCollection=urn%3Aaaid%3Asc%3AVA6C2%3Af05ef460-1717-49f7-8731-89cfa5104360&tab=templates', 'rVMbHD', 2, NULL, '2025-08-15 18:35:26', '2025-09-26 23:11:46'),
(60, 'Ako\'y Sayo at Ika\'y Akin Lamang (Khel Pangilinan) | Bandroom Sessions', 'https://www.youtube.com/watch?v=ODzAuOyMI3I&list=RDODzAuOyMI3I&start_radio=1', 'IAXEbr', 0, NULL, '2025-08-18 00:11:11', '2025-09-27 02:00:00'),
(61, 'Khel Pangilinan | BTBT Takeover Full Performance Ep 1', 'https://www.youtube.com/watch?v=nWGpdUhl4KU&list=RDnWGpdUhl4KU&start_radio=1', 'uq5OIG', 1, NULL, '2025-08-18 00:16:36', '2025-09-26 23:11:46'),
(62, 'RAI Rookies Time Keeping', 'https://raihr.com/rairookies/timekeeping', 'nikfjS', 42, NULL, '2025-08-18 00:39:14', '2025-10-28 01:26:54'),
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
(91, 'IG share guitar practice tabs', 'https://www.instagram.com/reel/DO3xnl9k0Zn/?igsh=MWdvaXBvdXU1cGZwNQ==', 'QYJevy', 3, NULL, '2025-09-22 19:42:40', '2025-10-20 11:07:09'),
(92, 'Classic Solid Style Icons || file-circle-check', 'https://fontawesome.com/icons/file-circle-check?f=classic&s=solid', 'VcmbdE', 0, NULL, '2025-09-25 22:32:55', '2025-09-25 23:07:33'),
(99, 'Interactive Loader by louloudev59', 'https://uiverse.io/louloudev59/modern-cougar-64', 'FsNqGH', 1, NULL, '2025-10-08 08:11:04', '2025-10-09 09:34:55'),
(100, 'Interactive Loader by Emmaline-ozi', 'https://uiverse.io/Emmaline-ozi/angry-dragon-5', 'WV87p4', 1, NULL, '2025-10-08 08:11:57', '2025-10-09 09:37:13'),
(101, '오징어 게임 Loader by JaydipPrajapati1910', 'https://uiverse.io/JaydipPrajapati1910/white-newt-56', 'hE7IvF', 3, NULL, '2025-10-08 08:12:29', '2025-10-08 11:31:01'),
(103, 'Interactive Loader by SynDrTreves', 'https://uiverse.io/SnyDeTreves/average-dodo-82', 'M8L36b', 1, NULL, '2025-10-08 08:13:51', '2025-10-30 02:47:30'),
(105, 'white-toad-924114.hostingersite.com', 'https://white-toad-924114.hostingersite.com/atj85J', 'M62YKh', 0, '2025-11-07 08:15:12', '2025-10-08 08:15:12', '2025-10-08 08:15:12'),
(107, 'FB reel Goldern hour tabs', 'https://www.facebook.com/share/v/1BShf3Pxbc/', 'QPEuhB', 1, NULL, '2025-10-12 04:47:45', '2025-10-12 04:51:21'),
(108, 'Chat GPT Laravel Auth and REST API Form Submission Chat', 'https://chatgpt.com/share/68f2e6fa-1758-8001-a74d-bdafac3d29a4', 'm9qbXB', 0, NULL, '2025-10-18 01:03:57', '2025-10-18 01:53:24'),
(109, 'Chat GPT Agenda Module Explanation Chat', 'https://chatgpt.com/share/68f2fc43-f254-8001-982f-cf6799ed58ef', 'm6hM2Y', 1, NULL, '2025-10-18 02:33:29', '2025-10-18 14:03:54'),
(110, 'IG share blues tab', 'https://www.instagram.com/reel/DOtZ0taEa7L/?igsh=MWx0M3VsdDhyOGUzNw==', 'Ua6t3E', 2, NULL, '2025-10-27 01:12:35', '2025-10-27 08:43:41'),
(111, 'Bini First Luv', 'https://open.spotify.com/track/0qHbCeNAPB7EaKxWiyaAMP?si=2C5_eLjvT6KwK9gbZIT10A%0A&context=spotify%3Aalbum%3A6hR079yVpoqUG4sOswANT4', 'aFTeog', 33, NULL, '2025-10-29 04:28:35', '2025-11-06 03:26:16'),
(112, 'Chat GPT Laravel Calendar Set-up and events', 'https://chatgpt.com/share/6902ce9c-cf68-8001-b716-023fb7ba5348', 'ScM9GB', 0, NULL, '2025-10-30 02:34:51', '2025-10-30 02:34:51'),
(113, 'Black box AI Profiles Page', 'https://www.blackbox.ai/share/4eefd759-e801-4c42-a646-a923d1bb30f4?fullScreen=true', 'qieXI4', 0, NULL, '2025-11-07 07:12:41', '2025-11-07 07:12:41');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=280;

--
-- AUTO_INCREMENT for table `url_codes`
--
ALTER TABLE `url_codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

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
