-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 02, 2024 at 10:48 AM
-- Server version: 10.6.17-MariaDB-cll-lve
-- PHP Version: 8.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `menoz_on_the_run`
--

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
(6, '2024_03_11_132623_create_products_table', 1),
(7, '2024_03_13_143411_product_images_table', 1),
(13, '2014_10_12_000000_create_users_table', 2),
(14, '2014_10_12_100000_create_password_reset_tokens_table', 2),
(15, '2014_10_12_100000_create_password_resets_table', 2),
(16, '2019_08_19_000000_create_failed_jobs_table', 2),
(17, '2019_12_14_000001_create_personal_access_tokens_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('admin@mailinator.com', '$2y$12$xjxdufkBkhdANA/sz57ihu52s6Hu9kGyUObiL51EVl10O0.Z2ZDE6', '2024-04-16 03:58:46'),
('vikash222@mailinator.com', '$2y$12$gOjc0NHOzriUcBvtUwN5be7vlbrkwAuN0RckkhOWYb/HZ6oPe1Wya', '2024-04-16 05:44:45');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(5, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '4c692e3ff1f088484739f4b5634935dc2e03a3609ac5e9f4bfa95b39ddbae795', '[\"*\"]', '2024-04-16 01:33:35', NULL, '2024-04-09 07:53:54', '2024-04-16 01:33:35'),
(6, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '6519643f48e6dc7c45e72ccb8ca41a8181cd27131778fceaac340c44d4b3c276', '[\"*\"]', NULL, NULL, '2024-04-10 03:04:47', '2024-04-10 03:04:47'),
(7, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '935c93a21f830923cab4537042c3c1721c8a6dcbf240161b3b880d591973def4', '[\"*\"]', NULL, NULL, '2024-04-15 09:20:13', '2024-04-15 09:20:13'),
(8, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '0534b59600abaa42373e867143341621329cd9ef432885f718297d905a2334e3', '[\"*\"]', NULL, NULL, '2024-04-15 09:22:10', '2024-04-15 09:22:10'),
(9, 'App\\Models\\User', 2, 'vikash222@mailinator.com', 'cba8298f4ea0c3a99b8612dee851a4cceaf75ef53b4c08ec1fd84ee1b08ccadd', '[\"*\"]', NULL, NULL, '2024-04-16 00:25:28', '2024-04-16 00:25:28'),
(10, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '18bbbc273342199e7843e2ca5a36f9cea2ab40f9a87269d11d381c6a77506aaa', '[\"*\"]', '2024-04-17 07:59:19', NULL, '2024-04-16 00:27:49', '2024-04-17 07:59:19'),
(11, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '8d6758fd7cced650090b0787d8e0ea75d99a76fdfd8aa87c5be3acb48be7f943', '[\"*\"]', NULL, NULL, '2024-04-16 00:53:09', '2024-04-16 00:53:09'),
(12, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '35d0a0326524d0726a13894a5ba0af49bcf544f3500d06fff98b22cb28099bf6', '[\"*\"]', NULL, NULL, '2024-04-16 00:55:52', '2024-04-16 00:55:52'),
(13, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '410a71363f20205320366e5e18c3a37bec3715baa15bfc3eb72962f534ac4537', '[\"*\"]', NULL, NULL, '2024-04-16 01:02:48', '2024-04-16 01:02:48'),
(14, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '27cc357341d953db26ba6e66a34ed19a8f64e68171ec0e33cf63eac5b42a5c07', '[\"*\"]', NULL, NULL, '2024-04-16 01:14:39', '2024-04-16 01:14:39'),
(15, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '8fd6021e4f4eabf82ae24a41688555690294e078bd3ab239a4206e677e6c436a', '[\"*\"]', NULL, NULL, '2024-04-16 01:25:48', '2024-04-16 01:25:48'),
(16, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '5a01ab2d4853553d5c4410d06ae6376358995bae3f7eb80b17874cf287a93f57', '[\"*\"]', NULL, NULL, '2024-04-16 01:32:36', '2024-04-16 01:32:36'),
(17, 'App\\Models\\User', 2, 'vikash222@mailinator.com', 'edce4f52dd58ddd87c4c6ec816054599c655fed9b552886d4f11907a12566ab9', '[\"*\"]', NULL, NULL, '2024-04-16 01:32:53', '2024-04-16 01:32:53'),
(18, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '4383203b9d677ec4cd6df9c06346ab6fa984505417d932c7d8821e9f6e8a7a98', '[\"*\"]', NULL, NULL, '2024-04-16 01:37:27', '2024-04-16 01:37:27'),
(19, 'App\\Models\\User', 2, 'vikash222@mailinator.com', 'ed2d7f403fc2cad2af25a2ca2550f63be6331e4054501aefd453d69a85ea609c', '[\"*\"]', NULL, NULL, '2024-04-16 02:02:11', '2024-04-16 02:02:11'),
(20, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '1a03c0e126e4b75261983ae481add5c04a08e2c035cad82e138a818f6caf68de', '[\"*\"]', NULL, NULL, '2024-04-16 02:07:24', '2024-04-16 02:07:24'),
(21, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '2203c1c83ec2ff60d56564b246ac8d1342ec8c74d97c9ca016a471b1962077a9', '[\"*\"]', NULL, NULL, '2024-04-16 02:11:48', '2024-04-16 02:11:48'),
(22, 'App\\Models\\User', 2, 'vikash222@mailinator.com', 'b19ed5f7c38a5891c99931bbab7505c2a5251761f0388adaed48a8a3d9c7b6f4', '[\"*\"]', NULL, NULL, '2024-04-16 02:18:26', '2024-04-16 02:18:26'),
(23, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '487e9db0cec8c62b2eebf0cf9806fa95c1ddd86f1079cfb97e32cc3bfd9aae60', '[\"*\"]', NULL, NULL, '2024-04-16 02:22:49', '2024-04-16 02:22:49'),
(24, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '3fff7942619525c4123df3dbbb8bbc299b452b1ffda9c33556839996f929b5d2', '[\"*\"]', NULL, NULL, '2024-04-16 02:26:53', '2024-04-16 02:26:53'),
(25, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '7eecee44d57ad5639e4630d78fd1dadf4832c45b6e1666a0fb1cca958262fd6f', '[\"*\"]', '2024-04-16 03:50:03', NULL, '2024-04-16 02:48:44', '2024-04-16 03:50:03'),
(26, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '3baa75c7a60ca902ae92a45314cc9930322d501693aaecc825945ef1dcf74e8b', '[\"*\"]', NULL, NULL, '2024-04-16 03:50:40', '2024-04-16 03:50:40'),
(27, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '6ef69601619f7d4e7c1be7eac9ad5a52541309a1f5acc2e3d46d855b78d45208', '[\"*\"]', '2024-04-16 04:08:22', NULL, '2024-04-16 03:53:58', '2024-04-16 04:08:22'),
(28, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '5436f58bee90b8550f851e839a4313260b65c4e68d27c7a0f8e152709bdbb791', '[\"*\"]', NULL, NULL, '2024-04-16 04:09:07', '2024-04-16 04:09:07'),
(29, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '6692803430d4bbe1aee99bcdf379ff4f89bf2e8aaee3d341013937acc8b5aaea', '[\"*\"]', NULL, NULL, '2024-04-16 04:10:38', '2024-04-16 04:10:38'),
(30, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '804bb3e273297486c493e2c5700de6b8d088d842b40abe5d9931c9b29629ff89', '[\"*\"]', NULL, NULL, '2024-04-16 04:11:47', '2024-04-16 04:11:47'),
(31, 'App\\Models\\User', 2, 'vikash222@mailinator.com', 'f75de9237df668b21568a9ccc1746535fa5a7639235fb1fafca8b01a5d050712', '[\"*\"]', NULL, NULL, '2024-04-16 04:17:16', '2024-04-16 04:17:16'),
(32, 'App\\Models\\User', 2, 'vikash222@mailinator.com', 'accd337ba75771ecf3cbf28fc9dbaf9f72ae82153f17bffe1237b9c864e718f0', '[\"*\"]', NULL, NULL, '2024-04-16 04:41:38', '2024-04-16 04:41:38'),
(33, 'App\\Models\\User', 2, 'vikash222@mailinator.com', 'b5c1e5a92f1eaadeeb5ef49caa9120d1e046d5f78a2445c639dbc237f0df44bd', '[\"*\"]', '2024-04-16 06:01:00', NULL, '2024-04-16 05:44:14', '2024-04-16 06:01:00'),
(34, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '1bfc7fe3dba8b6f1267bfce336ce40a5d6de193bdf7187b6460575b780c0a18b', '[\"*\"]', NULL, NULL, '2024-04-16 06:01:15', '2024-04-16 06:01:15'),
(35, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '98e55a857baeb38bfd00ccbd1881f1416a626cc54d12f62db4148bda6e312b10', '[\"*\"]', '2024-04-16 07:25:25', NULL, '2024-04-16 06:42:34', '2024-04-16 07:25:25'),
(36, 'App\\Models\\User', 2, 'vikash222@mailinator.com', 'a64d9a53603c2bc07a3a136176cd699c284e21457c28c73a49331a01e84a9346', '[\"*\"]', '2024-04-22 05:28:13', NULL, '2024-04-16 07:26:19', '2024-04-22 05:28:13'),
(37, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '42d86ddaa907ce309c6b0b47b89d0f6b8244b9e67bd730c224641115e70f4e80', '[\"*\"]', '2024-04-17 00:04:56', NULL, '2024-04-17 00:04:49', '2024-04-17 00:04:56'),
(38, 'App\\Models\\User', 2, 'vikash222@mailinator.com', 'a39cc7cb89a05d1e5a1d111ddb1816cccca313908ee7a08d2e49688d60b0511a', '[\"*\"]', '2024-04-17 00:05:20', NULL, '2024-04-17 00:05:10', '2024-04-17 00:05:20'),
(39, 'App\\Models\\User', 2, 'vikash222@mailinator.com', 'd07cd09841a6365baced8d5fbff0a69db0b07ec495d1732e86130e9cb3750b8e', '[\"*\"]', '2024-04-17 00:05:40', NULL, '2024-04-17 00:05:34', '2024-04-17 00:05:40'),
(40, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '3659ead5927ee178303f8c0cf0dc8ea663afd14d1a7e187f5c65a58f460a8436', '[\"*\"]', '2024-04-17 00:12:42', NULL, '2024-04-17 00:11:56', '2024-04-17 00:12:42'),
(41, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '46dac7bf39a5c6cd6aaab8671d7d1d3c8bb4d7a7611b5fca4b845b0eb9dfc0c9', '[\"*\"]', '2024-04-17 00:24:11', NULL, '2024-04-17 00:13:07', '2024-04-17 00:24:11'),
(42, 'App\\Models\\User', 2, 'vikash222@mailinator.com', 'e6462ce0a4c4af070a8adff43f543708578afbfccdacb2d7eebc901646113bfa', '[\"*\"]', '2024-04-17 00:30:20', NULL, '2024-04-17 00:24:18', '2024-04-17 00:30:20'),
(43, 'App\\Models\\User', 2, 'vikash222@mailinator.com', 'aea667ce24a6766538fec7cab747de49debfa32a5c358ce4207ef1b16a37b98f', '[\"*\"]', '2024-04-17 02:00:23', NULL, '2024-04-17 00:33:30', '2024-04-17 02:00:23'),
(44, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '7dc7c7d93951178df95c48e23b915917bbe83b7b8ff95e44489fb09966997fc5', '[\"*\"]', '2024-04-17 02:05:31', NULL, '2024-04-17 02:00:52', '2024-04-17 02:05:31'),
(45, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '14d42e27471aa5ba22f731af5b98c39462bcf8e62992ac0f4f9fb4d33af76577', '[\"*\"]', '2024-04-17 02:28:52', NULL, '2024-04-17 02:05:54', '2024-04-17 02:28:52'),
(46, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '1186a3a5dd469281302d6859c9112fdffb85b2d399412f7a254b9bc4cd71ae25', '[\"*\"]', '2024-04-17 03:57:53', NULL, '2024-04-17 02:29:15', '2024-04-17 03:57:53'),
(47, 'App\\Models\\User', 2, 'vikash222@mailinator.com', 'e248f2f7f284cad5ed070488c2f99e586f988c2d5a14178125b0065ad7f568b8', '[\"*\"]', '2024-04-17 04:09:31', NULL, '2024-04-17 03:58:03', '2024-04-17 04:09:31'),
(48, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '3a31b4a0e021e7f5373708c02d6c7e437bb801b7ec9f53a907643c3735b22392', '[\"*\"]', '2024-04-17 04:09:47', NULL, '2024-04-17 04:09:40', '2024-04-17 04:09:47'),
(49, 'App\\Models\\User', 2, 'vikash222@mailinator.com', 'a0eb15b1a794b7ace6eac60e68fd15c14c9c0a5335b59dc1a1b22eb28c6b1930', '[\"*\"]', '2024-04-17 04:27:59', NULL, '2024-04-17 04:10:46', '2024-04-17 04:27:59'),
(50, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '604f4a3c5604e24197cf1060f7e5e6e0b9e9fb4bb6163de683da1abae268adcf', '[\"*\"]', '2024-04-17 05:20:43', NULL, '2024-04-17 04:28:12', '2024-04-17 05:20:43'),
(51, 'App\\Models\\User', 2, 'vikash222@mailinator.com', 'd2587238d1efd16b56125040783f49803a12364eef6b5f71b97324a7cc449b20', '[\"*\"]', '2024-04-17 05:22:09', NULL, '2024-04-17 05:22:05', '2024-04-17 05:22:09'),
(52, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '7ecc47839672092c19316bc0facd79ac0c6b2fc2e1ecfc0bb7295da259ec5572', '[\"*\"]', '2024-04-17 05:22:26', NULL, '2024-04-17 05:22:15', '2024-04-17 05:22:26'),
(53, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '20e0ed568df3d0b20a0c9a03cdb581f273f4114e6c5232630839a0b9c3c27ca3', '[\"*\"]', '2024-04-17 05:27:29', NULL, '2024-04-17 05:27:29', '2024-04-17 05:27:29'),
(54, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '39e7ccdac05997f69dc7be639755766a9a68003ac8edb3c0f9f3db57ffefc729', '[\"*\"]', '2024-04-17 05:28:16', NULL, '2024-04-17 05:27:41', '2024-04-17 05:28:16'),
(55, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '8e2d7ff9737e21f82b10330ab647e60451d8b667b398411539c123412a4c492a', '[\"*\"]', '2024-04-17 05:37:09', NULL, '2024-04-17 05:32:12', '2024-04-17 05:37:09'),
(56, 'App\\Models\\User', 2, 'vikash222@mailinator.com', 'bd861230cd425465377a3d9650b554ac24d7842b046f96ee4019adf8366e3f91', '[\"*\"]', '2024-04-17 05:43:34', NULL, '2024-04-17 05:37:57', '2024-04-17 05:43:34'),
(57, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '197be1bff4e159376a3ee56950b25ee585238a961d8d4f4ffc627dab33c6858d', '[\"*\"]', '2024-04-17 05:43:55', NULL, '2024-04-17 05:43:54', '2024-04-17 05:43:55'),
(58, 'App\\Models\\User', 2, 'vikash222@mailinator.com', 'e7e6f94c285cca8e6b27845cadadc1dfc6ebaa0a48f8c4880f6ebce13b414532', '[\"*\"]', '2024-04-17 05:44:32', NULL, '2024-04-17 05:44:12', '2024-04-17 05:44:32'),
(59, 'App\\Models\\User', 2, 'vikash222@mailinator.com', 'd421a061657e622d86a7fd50c381aa427cdf7ea611e92e86b238657daaf034bd', '[\"*\"]', '2024-04-17 05:52:21', NULL, '2024-04-17 05:44:34', '2024-04-17 05:52:21'),
(60, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '874d4081d681839bc8c53422b612da6fb35f7630a0e2b7ce9492a574f64877a0', '[\"*\"]', '2024-04-17 05:54:08', NULL, '2024-04-17 05:53:14', '2024-04-17 05:54:08'),
(61, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '29b218ad826766a94f19b2baa58b8d3b5eef024517a765ec292ab79c43510806', '[\"*\"]', '2024-04-17 06:30:11', NULL, '2024-04-17 05:54:24', '2024-04-17 06:30:11'),
(62, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '3aa6ffaae83e347872c2525be010b2998c8bab04e1fc5e49b8c6b1665885e718', '[\"*\"]', '2024-04-17 07:39:35', NULL, '2024-04-17 06:30:17', '2024-04-17 07:39:35'),
(63, 'App\\Models\\User', 2, 'vikash222@mailinator.com', 'a7f09b4c12da71954a51ea1ff20f83c95d95a71e812741c754d53810dcc4d0ef', '[\"*\"]', '2024-04-17 07:41:11', NULL, '2024-04-17 07:41:11', '2024-04-17 07:41:11'),
(64, 'App\\Models\\User', 2, 'vikash222@mailinator.com', 'a9bf18aa64a725d60cac43a351fdc3ab7577c6d174a0cc250b3f58e3c10d4a5e', '[\"*\"]', '2024-04-17 07:57:49', NULL, '2024-04-17 07:53:40', '2024-04-17 07:57:49'),
(65, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '011fbfdeffdd3397bd38b0594f9d20a089a82b224ff10e08d2a51a8f5f4b1a26', '[\"*\"]', '2024-04-17 08:56:43', NULL, '2024-04-17 07:56:46', '2024-04-17 08:56:43'),
(66, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '184cc47658f7ab975af75ef0b0b08d2a3234a3e107c7f40da77a45820879b751', '[\"*\"]', '2024-04-17 08:54:58', NULL, '2024-04-17 07:58:29', '2024-04-17 08:54:58'),
(67, 'App\\Models\\User', 2, 'vikash222@mailinator.com', 'bc042a712d36c022fe5049eed559084a1a79f15baa302ed1d6297a86149f2e42', '[\"*\"]', '2024-04-17 08:04:04', NULL, '2024-04-17 08:03:11', '2024-04-17 08:04:04'),
(68, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '515fdcf137c0ff9a29480675fb5db629df53a334506f215b4bcbf2985931daaa', '[\"*\"]', '2024-04-17 08:12:51', NULL, '2024-04-17 08:05:54', '2024-04-17 08:12:51'),
(69, 'App\\Models\\User', 2, 'vikash222@mailinator.com', 'cec62332e08513417d5ebe6f7ee21b981ff4ff6e9406c4287207b4731288dc0e', '[\"*\"]', '2024-04-18 00:00:27', NULL, '2024-04-17 08:15:33', '2024-04-18 00:00:27'),
(70, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '28d3c532434177ea6eea827ca7a5dda277f0a209a6ec1524e93478d4374af073', '[\"*\"]', '2024-04-17 08:57:04', NULL, '2024-04-17 08:56:47', '2024-04-17 08:57:04'),
(71, 'App\\Models\\User', 2, 'vikash222@mailinator.com', 'da1a735c1796a654c89cd63a3813328d09e65c2877e8c6765518a1fbbda76353', '[\"*\"]', '2024-04-17 08:58:37', NULL, '2024-04-17 08:58:33', '2024-04-17 08:58:37'),
(72, 'App\\Models\\User', 2, 'vikash222@mailinator.com', 'b644004dc163f52c5e43aba52cda60dce7893361b3b90c902a07ad8b232514cb', '[\"*\"]', '2024-04-17 08:58:49', NULL, '2024-04-17 08:58:46', '2024-04-17 08:58:49'),
(73, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '28bbb614c095553631fd1d987f86577f9588a60e96753ceaf0d9f9af9040aa49', '[\"*\"]', '2024-04-17 09:14:37', NULL, '2024-04-17 08:58:52', '2024-04-17 09:14:37'),
(74, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '1496c0e87d72730ab9bd5b3ae2b671004487863f64fd78acc077ebd361acc74c', '[\"*\"]', '2024-04-17 09:08:11', NULL, '2024-04-17 08:59:08', '2024-04-17 09:08:11'),
(75, 'App\\Models\\User', 2, 'vikash222@mailinator.com', 'f9e38bf1f9820ae85339b32e6a87a3ab58545205c0bf6e393061e44cb0da7437', '[\"*\"]', '2024-04-17 09:08:25', NULL, '2024-04-17 09:08:19', '2024-04-17 09:08:25'),
(76, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '61566cb8f8c526cfb9db90d15bfbccf9597d254e1a7dffe72deba71f76a77221', '[\"*\"]', '2024-04-17 09:19:19', NULL, '2024-04-17 09:15:47', '2024-04-17 09:19:19'),
(77, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '282400ee399f8250afe86aea50e838576a804108da71d8f3484a3c49f2dc69ae', '[\"*\"]', '2024-04-18 00:03:23', NULL, '2024-04-18 00:01:45', '2024-04-18 00:03:23'),
(78, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '0bde1bf8042f0216fb18a3147eeb65a475010b255dd395db5b94a8d1fd1a19c9', '[\"*\"]', '2024-04-18 00:06:50', NULL, '2024-04-18 00:06:40', '2024-04-18 00:06:50'),
(79, 'App\\Models\\User', 2, 'vikash222@mailinator.com', 'a000f7155aaa48d1c7102f04830760ca6f665384292c5b2ee4f4997e628e028b', '[\"*\"]', '2024-04-18 00:14:41', NULL, '2024-04-18 00:10:34', '2024-04-18 00:14:41'),
(80, 'App\\Models\\User', 2, 'vikash222@mailinator.com', 'e6dc53c6f33a1f48ce9b8d521548bb0feb3d508bd109dddf5e32b07aeb30abf6', '[\"*\"]', '2024-04-18 00:16:52', NULL, '2024-04-18 00:15:18', '2024-04-18 00:16:52'),
(81, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '0ed13c199248035684b75f1c57e756a99de9c9c384c2d0b5a58660dbbcaf3bc1', '[\"*\"]', '2024-04-18 00:39:48', NULL, '2024-04-18 00:17:08', '2024-04-18 00:39:48'),
(82, 'App\\Models\\User', 2, 'vikash222@mailinator.com', 'e65fafc158fa5906c929d8c9b6c22d7551a416775048538e56e00605496c041d', '[\"*\"]', '2024-04-18 00:19:29', NULL, '2024-04-18 00:18:24', '2024-04-18 00:19:29'),
(83, 'App\\Models\\User', 2, 'vikash222@mailinator.com', 'f8bef37b99f75a3ab9a4ccd86c389f8166efaee06f02ce52bde830458f83eb70', '[\"*\"]', '2024-04-18 01:02:48', NULL, '2024-04-18 00:50:15', '2024-04-18 01:02:48'),
(84, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '8d1c1791c2e1b12f8abb65adb4c36295767a66ccc85fd4244899d6f1161ccb0e', '[\"*\"]', '2024-04-18 00:51:23', NULL, '2024-04-18 00:51:09', '2024-04-18 00:51:23'),
(85, 'App\\Models\\User', 2, 'vikash222@mailinator.com', 'e1f103beb8fd219b1110fe7181a260f1bb70ecf7723280268abc2001c6af540b', '[\"*\"]', '2024-04-18 01:01:58', NULL, '2024-04-18 00:54:03', '2024-04-18 01:01:58'),
(86, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '5a0313399009373a64e0fe09ecb8616cbccb670f9dbdd5e67b3981680999876f', '[\"*\"]', '2024-04-18 02:27:30', NULL, '2024-04-18 01:02:29', '2024-04-18 02:27:30'),
(87, 'App\\Models\\User', 1, 'admin@mailinator.com', 'dece62d7c8d0f6a2bb1d0dc5104a77eb8c20fb86e8641066933660d2f4002cf8', '[\"*\"]', '2024-04-18 01:10:57', NULL, '2024-04-18 01:10:56', '2024-04-18 01:10:57'),
(88, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '60510a2e72b44410d8e37453625b2751493eebf032189af2a831fa9792819fda', '[\"*\"]', '2024-04-18 01:11:41', NULL, '2024-04-18 01:11:40', '2024-04-18 01:11:41'),
(89, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '4d083f5ed5d75d61ff936b0bdce144a577c5ddddab891a1e33c1a6e08b9313a7', '[\"*\"]', '2024-04-18 01:16:24', NULL, '2024-04-18 01:13:27', '2024-04-18 01:16:24'),
(90, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '9a122c02e821c5618f1f8b2b21078075ea88a012a4bc0021a56aba118d9cbc7a', '[\"*\"]', '2024-04-18 02:45:10', NULL, '2024-04-18 01:32:05', '2024-04-18 02:45:10'),
(91, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '66bbe2f50af44b3d706114439fb8b8eb9b94bd8a2a42155cf2c26e5a7d811f3a', '[\"*\"]', '2024-04-22 08:07:37', NULL, '2024-04-18 02:32:48', '2024-04-22 08:07:37'),
(92, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '036f4a6bab52b23089a9a6cf2f000facec5e4c4c7a536ac2bd23e292e2ea04b7', '[\"*\"]', '2024-04-18 03:51:54', NULL, '2024-04-18 03:50:41', '2024-04-18 03:51:54'),
(93, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '8bfaa0f0374de32651adbdecd1ce335a7fcaa70185594d5db5c09bcb97c6b57b', '[\"*\"]', '2024-04-18 09:10:14', NULL, '2024-04-18 09:05:33', '2024-04-18 09:10:14'),
(94, 'App\\Models\\User', 2, 'vikash222@mailinator.com', 'fe95b65bd7279e74aeed245d7cd5316ff75e72c30bb9a03696bec560e1295065', '[\"*\"]', '2024-04-18 09:10:59', NULL, '2024-04-18 09:10:59', '2024-04-18 09:10:59'),
(95, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '09abc1a3aa4bc354304255bd20476aca4f4dc3687e4eb685f4e926926df89ca9', '[\"*\"]', '2024-04-18 09:15:45', NULL, '2024-04-18 09:15:45', '2024-04-18 09:15:45'),
(96, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '57375d8cdd94a7d83d2aa14636910c14849ab39d3bf7e73890aa8f791caddd3d', '[\"*\"]', '2024-04-18 17:17:35', NULL, '2024-04-18 17:17:35', '2024-04-18 17:17:35'),
(97, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '23d3bf673e5eaf3aa68606b87b5f3926ea842aec0c200eeb9c864f4730023536', '[\"*\"]', '2024-04-22 00:58:00', NULL, '2024-04-22 00:54:40', '2024-04-22 00:58:00'),
(98, 'App\\Models\\User', 8, 'kartik@mailinator.com', 'b099194ab9530606909d0da595ff1605fac43297cf7e917d0a96eaf5dbea5640', '[\"*\"]', '2024-04-22 04:02:29', NULL, '2024-04-22 03:57:55', '2024-04-22 04:02:29'),
(99, 'App\\Models\\User', 8, 'kartik@mailinator.com', '6e9b0aad33d18379e97f6a4f006d99797f97b7f8592cc57bb0baa992398b7d85', '[\"*\"]', '2024-04-22 04:15:54', NULL, '2024-04-22 04:15:42', '2024-04-22 04:15:54'),
(100, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '416db637ce3a89a3aaa79181aae7f27f41653f8d03f399433a19824b727689be', '[\"*\"]', '2024-04-22 04:31:28', NULL, '2024-04-22 04:29:02', '2024-04-22 04:31:28'),
(101, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '7bcf00a5ffb4903666af5edc303f455e674160196a6f4cc3a6e7ea21906feb92', '[\"*\"]', '2024-04-22 05:23:08', NULL, '2024-04-22 04:43:00', '2024-04-22 05:23:08'),
(102, 'App\\Models\\User', 8, 'kartik@mailinator.com', '4059d648289491abd5b735aa7aa2a9f48e262a02f8b28fd0c5b5045641ad4704', '[\"*\"]', '2024-04-22 05:17:06', NULL, '2024-04-22 05:15:21', '2024-04-22 05:17:06'),
(103, 'App\\Models\\User', 8, 'kartik@mailinator.com', 'dd01f54fd778406b346f71945dfbe00959946dae597d705acf5193925e186b78', '[\"*\"]', '2024-04-22 05:58:09', NULL, '2024-04-22 05:16:31', '2024-04-22 05:58:09'),
(104, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '8067c5dce9e62d166caeb7a52ffa1344b059313340e7b1374c97ec62bb033d84', '[\"*\"]', '2024-04-23 00:39:32', NULL, '2024-04-23 00:35:56', '2024-04-23 00:39:32'),
(105, 'App\\Models\\User', 2, 'vikash222@mailinator.com', 'aed96cc6527588e7190c2daedbd3eecfbc53ebd0f0ff08e32725e381c838ecdd', '[\"*\"]', '2024-04-23 05:58:39', NULL, '2024-04-23 05:58:39', '2024-04-23 05:58:39'),
(106, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '130bf3e63d9fcb47faeea29622f53a21719f6c2ee024ef3aac2b188a4c531241', '[\"*\"]', '2024-04-23 06:29:46', NULL, '2024-04-23 06:29:45', '2024-04-23 06:29:46'),
(107, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '73450ae81edd383e862ea865c87eb96c7035b84b6b8d30fef724d7c082103229', '[\"*\"]', '2024-04-23 06:30:31', NULL, '2024-04-23 06:30:30', '2024-04-23 06:30:31'),
(108, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '2735f9e50ff9764d1dde4b1a421626af4842ed44c9a61bac24faeb5209185af2', '[\"*\"]', '2024-04-23 09:55:01', NULL, '2024-04-23 09:55:00', '2024-04-23 09:55:01'),
(109, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '3706b58768f414ae95af241fc7fe029f4f5ef6b51e3f9019b83e240652141583', '[\"*\"]', '2024-04-24 15:13:31', NULL, '2024-04-24 15:13:30', '2024-04-24 15:13:31'),
(110, 'App\\Models\\User', 2, 'vikash222@mailinator.com', 'e448de7157003804f396860a8a1d8f3815505ae14126a5cf8d62ee41fb9ad783', '[\"*\"]', '2024-04-24 15:31:08', NULL, '2024-04-24 15:18:17', '2024-04-24 15:31:08'),
(111, 'App\\Models\\User', 9, 'mukesh@yopmail.com', '25b06a8016ad977c1aacfb058f2568a2ef6414e44bfdad41de0b2e757955e128', '[\"*\"]', '2024-04-24 15:31:01', NULL, '2024-04-24 15:28:26', '2024-04-24 15:31:01'),
(112, 'App\\Models\\User', 2, 'vikash222@mailinator.com', 'bbb4e30bba3c3813400cb21ee5d51daa0c2d00fafecd821b97dd4c883f5f5e40', '[\"*\"]', '2024-04-24 15:37:17', NULL, '2024-04-24 15:34:52', '2024-04-24 15:37:17'),
(113, 'App\\Models\\User', 2, 'vikash222@mailinator.com', '8a64fcbb7d0447d95a1cea81bcc9e9e8f088c87f86386d582485f85718cd1ae8', '[\"*\"]', '2024-04-24 16:07:00', NULL, '2024-04-24 16:06:05', '2024-04-24 16:07:00'),
(114, 'App\\Models\\User', 2, 'vikash@mailinator.com', '16b00171661fac849b0ab80a99614e766d2f61d51d62cc1d2195786e4823919b', '[\"*\"]', '2024-04-24 16:13:32', NULL, '2024-04-24 16:13:08', '2024-04-24 16:13:32'),
(115, 'App\\Models\\User', 2, 'vikash1@mailinator.com', 'f7e964572689d110db94a6242d41cb28aedbb09f85469b91f7048b5ce3242a9e', '[\"*\"]', '2024-04-24 16:15:39', NULL, '2024-04-24 16:14:47', '2024-04-24 16:15:39'),
(116, 'App\\Models\\User', 2, 'vikash@mailinator.com', 'f3722f1b0c2e2fe8d34b164e15855fd741d652bc72ae2ead01993ae2c0525eda', '[\"*\"]', '2024-04-24 16:18:13', NULL, '2024-04-24 16:17:43', '2024-04-24 16:18:13'),
(117, 'App\\Models\\User', 2, 'vikas@mailinator.com', '65543661bedfce359d088c3d37807bc32a57adf50bde22f94fe555086d70da6f', '[\"*\"]', '2024-04-24 16:30:45', NULL, '2024-04-24 16:23:20', '2024-04-24 16:30:45'),
(118, 'App\\Models\\User', 2, 'vikas@mailinator.com', 'd8ba75f96fa647d95815b4888ba9415d2ece4026d82d0be6e6c64d03c81adf71', '[\"*\"]', '2024-04-25 09:44:54', NULL, '2024-04-24 16:26:24', '2024-04-25 09:44:54'),
(119, 'App\\Models\\User', 2, 'vikas@mailinator.com', 'c46800df9281cfcb2762c1ad785cd28c04fe458de3d2ff9992a52789a3440078', '[\"*\"]', '2024-04-24 16:29:42', NULL, '2024-04-24 16:27:02', '2024-04-24 16:29:42'),
(120, 'App\\Models\\User', 2, 'vikas@mailinator.com', 'f29497c6f9674cc34bf3d262e0464a28ccff0bb315eed123e4426451fc017396', '[\"*\"]', '2024-04-24 16:29:35', NULL, '2024-04-24 16:27:05', '2024-04-24 16:29:35'),
(121, 'App\\Models\\User', 2, 'vikas@mailinator.com', 'faae84ed61dbebd668eb1e1bea1529e528321c84e2424af2eeda73747d9b1b48', '[\"*\"]', '2024-04-24 18:16:41', NULL, '2024-04-24 18:16:41', '2024-04-24 18:16:41'),
(122, 'App\\Models\\User', 2, 'vikas@mailinator.com', 'ca20bcaee1cece0280cd8873042d6435ffb1136c0b6740284dff25c098a7830f', '[\"*\"]', '2024-04-24 18:17:52', NULL, '2024-04-24 18:17:52', '2024-04-24 18:17:52'),
(123, 'App\\Models\\User', 10, 'james.r.mclemore@outlook.com', '978f47cc967247941a2c41061b996da02770d2d5fc2af0334814cfcd6227d891', '[\"*\"]', '2024-04-24 18:56:13', NULL, '2024-04-24 18:48:21', '2024-04-24 18:56:13'),
(124, 'App\\Models\\User', 10, 'james.r.mclemore@outlook.com', '98cde19b420098134489f85469d262209fa568e14f1bd0a4694d75cc94d7622e', '[\"*\"]', '2024-04-24 19:31:18', NULL, '2024-04-24 18:50:56', '2024-04-24 19:31:18'),
(125, 'App\\Models\\User', 10, 'james.r.mclemore@outlook.com', '63b64ed45c7eb20b3e3d71328c637e5edd0387237f56a94474301b653814a6d3', '[\"*\"]', '2024-04-24 19:02:57', NULL, '2024-04-24 19:02:19', '2024-04-24 19:02:57'),
(126, 'App\\Models\\User', 10, 'james.r.mclemore@outlook.com', '3649d56a2900e38586b4c49e855d4996d819f9f8509c3a403562e3866d8e4786', '[\"*\"]', '2024-04-24 20:08:19', NULL, '2024-04-24 19:31:28', '2024-04-24 20:08:19'),
(127, 'App\\Models\\User', 10, 'james.r.mclemore@outlook.com', '42d64f9db479fb6520b136b34dc4d8b3bc511d3d30949fcc18c5d4fa7cd823d9', '[\"*\"]', '2024-04-24 19:32:54', NULL, '2024-04-24 19:32:37', '2024-04-24 19:32:54'),
(128, 'App\\Models\\User', 10, 'james.r.mclemore@outlook.com', '9fe46e4e921d5cf20201c7ba70279612b8226d88b00ffaad681025151484a89b', '[\"*\"]', '2024-04-24 23:00:11', NULL, '2024-04-24 21:49:13', '2024-04-24 23:00:11'),
(129, 'App\\Models\\User', 10, 'james.r.mclemore@outlook.com', 'ae6b4d13465f0744355433e1869d50f24c5debfcefb8d48a3b92cbbad4cf045f', '[\"*\"]', '2024-04-24 21:52:20', NULL, '2024-04-24 21:51:53', '2024-04-24 21:52:20'),
(130, 'App\\Models\\User', 2, 'vikas@mailinator.com', 'cdd6198952cad91f3804bed560a5bb61ab32f453c7c131e7007bd92f44ffe3d5', '[\"*\"]', '2024-04-25 02:03:20', NULL, '2024-04-24 21:54:35', '2024-04-25 02:03:20'),
(131, 'App\\Models\\User', 10, 'james.r.mclemore@outlook.com', '809028be0e97319aebabba6a1b2eed1523a969660988c3ea147255fb9c969d94', '[\"*\"]', '2024-04-25 03:01:20', NULL, '2024-04-25 02:59:57', '2024-04-25 03:01:20'),
(132, 'App\\Models\\User', 10, 'james.r.mclemore@outlook.com', '0257437dc16f3efac4a7c8970f2cc1f390dd21ed46704be72feb06fee1e880e0', '[\"*\"]', '2024-04-25 07:47:25', NULL, '2024-04-25 07:47:25', '2024-04-25 07:47:25'),
(133, 'App\\Models\\User', 10, 'james.r.mclemore@outlook.com', '479717427f8b2b84474aee16c25ea0bb5db83d5a82673038b9e9e5e00cb5e414', '[\"*\"]', '2024-04-25 07:52:51', NULL, '2024-04-25 07:52:34', '2024-04-25 07:52:51'),
(134, 'App\\Models\\User', 10, 'james.r.mclemore@outlook.com', 'dcd359644f5316d831e6f09922fcc7e972fb7863d59285f7dcafbdea3f7d3444', '[\"*\"]', '2024-04-25 08:44:57', NULL, '2024-04-25 08:44:45', '2024-04-25 08:44:57'),
(135, 'App\\Models\\User', 2, 'vikas@mailinator.com', 'c6edd74e7d2aeee8112301f095703554c435ddd567c8729a63e95516ebd4aa3d', '[\"*\"]', '2024-04-25 11:14:32', NULL, '2024-04-25 09:32:39', '2024-04-25 11:14:32'),
(136, 'App\\Models\\User', 2, 'vikas@mailinator.com', '3c7887c24ae44aa250644bc0fd5a742e68e9f2a21e11e7d720f682cf64e0e4f1', '[\"*\"]', '2024-04-25 09:51:35', NULL, '2024-04-25 09:36:14', '2024-04-25 09:51:35'),
(137, 'App\\Models\\User', 10, 'james.r.mclemore@outlook.com', 'ca4ef96329f4766601b22d3779e8843443f6695310eafd3473f7cafb014d32ea', '[\"*\"]', '2024-04-25 10:38:42', NULL, '2024-04-25 09:43:37', '2024-04-25 10:38:42'),
(138, 'App\\Models\\User', 2, 'vikas@mailinator.com', '09ee13ce642bc3b1884295d2a72342ef64b040633752bbb3dd489dc103bb70ae', '[\"*\"]', '2024-04-25 11:14:07', NULL, '2024-04-25 09:54:04', '2024-04-25 11:14:07'),
(139, 'App\\Models\\User', 2, 'vikas@mailinator.com', '4a287e7232acd6d2da10076d47a01966892a644a28817b167e3dd60ae0eb9c7e', '[\"*\"]', '2024-04-25 09:57:19', NULL, '2024-04-25 09:55:51', '2024-04-25 09:57:19'),
(140, 'App\\Models\\User', 2, 'vikas@mailinator.com', '298cff841d2919d6dceca7eaf053e28fe4dfe52c37fbd8ebc0be290ac962bbe1', '[\"*\"]', '2024-04-25 09:57:35', NULL, '2024-04-25 09:57:34', '2024-04-25 09:57:35'),
(141, 'App\\Models\\User', 2, 'vikas@mailinator.com', '3385be4632ff15cb120b75534e9435817770fd0c8dc23e9e191d83a2ec211157', '[\"*\"]', '2024-04-25 10:16:08', NULL, '2024-04-25 09:58:31', '2024-04-25 10:16:08'),
(142, 'App\\Models\\User', 2, 'vikas@mailinator.com', '7138a3bafd3a209aa63e6d74c3bc23c8966cd6cfa43f2b47b9aec2911b1c4af7', '[\"*\"]', '2024-04-25 11:46:45', NULL, '2024-04-25 10:17:42', '2024-04-25 11:46:45'),
(143, 'App\\Models\\User', 10, 'james.r.mclemore@outlook.com', '274bc237d18d48b4e2dd7b68e26ea0d5c35a375b879bb329941f40e3b96c2286', '[\"*\"]', '2024-04-25 10:40:51', NULL, '2024-04-25 10:40:05', '2024-04-25 10:40:51'),
(144, 'App\\Models\\User', 10, 'james.r.mclemore@outlook.com', '2442164bd5c05fc7e480a79555e2b617f32b269039e3f1fd6266f0221b60bf66', '[\"*\"]', '2024-04-25 12:10:34', NULL, '2024-04-25 10:41:57', '2024-04-25 12:10:34'),
(145, 'App\\Models\\User', 10, 'james.r.mclemore@outlook.com', '5869d379f7fb3346e18671469dc6f16273877c8e6e744a18383e9d60521a2276', '[\"*\"]', '2024-04-25 11:00:07', NULL, '2024-04-25 11:00:07', '2024-04-25 11:00:07'),
(146, 'App\\Models\\User', 2, 'vikas@mailinator.com', '96409c4308508b7d6ac70380cdd20bd34c93e3333e5926f772d0cbccbaf6c055', '[\"*\"]', '2024-04-25 11:16:32', NULL, '2024-04-25 11:14:14', '2024-04-25 11:16:32'),
(147, 'App\\Models\\User', 2, 'vikas@mailinator.com', 'aecba68e7e4ddf3c5cd10cd91f81c60f33267336a2224e21424c0151b637d10c', '[\"*\"]', '2024-04-25 11:18:17', NULL, '2024-04-25 11:18:13', '2024-04-25 11:18:17'),
(148, 'App\\Models\\User', 2, 'vikas@mailinator.com', '32743a20c5300705c6ecb8df10778e1ce05a1a2319cc11f9c8ea14298a9566ef', '[\"*\"]', '2024-04-25 11:18:54', NULL, '2024-04-25 11:18:49', '2024-04-25 11:18:54'),
(149, 'App\\Models\\User', 2, 'vikas@mailinator.com', '265e2735f545154cbfb4140ece8e9519b32a1b6c3943f5e09ab11baab3516e4b', '[\"*\"]', '2024-04-25 11:28:40', NULL, '2024-04-25 11:28:35', '2024-04-25 11:28:40'),
(150, 'App\\Models\\User', 2, 'vikas@mailinator.com', 'f776c03eca4d9909c5f47b1d55c9dc90be827eed32e05f01755036a83a537c9b', '[\"*\"]', '2024-04-25 11:33:28', NULL, '2024-04-25 11:33:28', '2024-04-25 11:33:28'),
(151, 'App\\Models\\User', 2, 'vikas@mailinator.com', '5fe427d9230ca43073f48e17df586ea70062a6154036a67664aacd0cbb25ca41', '[\"*\"]', '2024-04-25 11:33:37', NULL, '2024-04-25 11:33:37', '2024-04-25 11:33:37'),
(152, 'App\\Models\\User', 2, 'vikas@mailinator.com', 'a28385ef199766715007418609bbb820b89c365dbc96190a95df6c330c71b1d1', '[\"*\"]', '2024-04-25 11:36:03', NULL, '2024-04-25 11:35:52', '2024-04-25 11:36:03'),
(153, 'App\\Models\\User', 2, 'vikas@mailinator.com', '648d1c916256d02a0eaa976d44cdb7407bfb9da24e5cecd365a1ce6c6f8bdc1f', '[\"*\"]', '2024-04-25 11:36:11', NULL, '2024-04-25 11:36:10', '2024-04-25 11:36:11'),
(154, 'App\\Models\\User', 2, 'vikas@mailinator.com', '812ed7810c2e8078629f2b98768425f8340ab22169d3c8b52e25e1264c2b110d', '[\"*\"]', '2024-04-25 11:36:49', NULL, '2024-04-25 11:36:48', '2024-04-25 11:36:49'),
(155, 'App\\Models\\User', 2, 'vikas@mailinator.com', '4b08354315ab43e497da11bd3bcfe05adb020ab7a647ecd6b850e8e695dde639', '[\"*\"]', '2024-04-25 11:37:31', NULL, '2024-04-25 11:37:05', '2024-04-25 11:37:31'),
(156, 'App\\Models\\User', 2, 'vikas@mailinator.com', 'e55a5fbe426e1c4d44431d0d4bd76bdff6c5cd54adadfe831220ad2c377cf4a2', '[\"*\"]', '2024-04-25 11:38:18', NULL, '2024-04-25 11:37:43', '2024-04-25 11:38:18'),
(157, 'App\\Models\\User', 2, 'vikas@mailinator.com', '96e3dad272bc7b9af4a34165f14bcc226671904a1c1c663709f1023e77d12b75', '[\"*\"]', '2024-04-25 11:38:36', NULL, '2024-04-25 11:38:25', '2024-04-25 11:38:36'),
(158, 'App\\Models\\User', 2, 'vikas@mailinator.com', 'f74986ffa2a5843f16a792fde6862f72d8bac693d283832b459655b6a6b58df6', '[\"*\"]', '2024-04-25 11:41:04', NULL, '2024-04-25 11:41:03', '2024-04-25 11:41:04'),
(159, 'App\\Models\\User', 2, 'vikas@mailinator.com', 'cb240795744dae79afe5e01db00c75b5e457598ee604e2bf2b4bfb6af5164f8f', '[\"*\"]', '2024-04-25 11:46:16', NULL, '2024-04-25 11:44:15', '2024-04-25 11:46:16'),
(160, 'App\\Models\\User', 2, 'vikas@mailinator.com', '84f660f7525702035d4b5cf0a62c56bc932041a8d17778acd9765a11589e50b3', '[\"*\"]', '2024-04-25 11:56:06', NULL, '2024-04-25 11:55:30', '2024-04-25 11:56:06'),
(161, 'App\\Models\\User', 10, 'james.r.mclemore@outlook.com', '74e576b79cf78ca845850bcdf63f249fc4dd954aaf42214fdb22097028d9b02c', '[\"*\"]', '2024-04-25 12:28:14', NULL, '2024-04-25 12:09:42', '2024-04-25 12:28:14'),
(162, 'App\\Models\\User', 10, 'james.r.mclemore@outlook.com', 'e2a084661f1357f55e7cb8e0a5ecc357717dcbcf60d23434f8b16694b64f9b91', '[\"*\"]', '2024-04-25 12:35:08', NULL, '2024-04-25 12:35:08', '2024-04-25 12:35:08'),
(163, 'App\\Models\\User', 10, 'james.r.mclemore@outlook.com', 'd0415fc3010666d669992a412311a32e40f67a83b8ef2fff63f2c80729fbd269', '[\"*\"]', '2024-04-25 12:35:55', NULL, '2024-04-25 12:35:55', '2024-04-25 12:35:55'),
(164, 'App\\Models\\User', 10, 'james.r.mclemore@outlook.com', '0957785bcb6cfa90b4cbacde30c8bd5c5236e41b2f5b39a7af40d2b172128ceb', '[\"*\"]', '2024-04-25 12:43:30', NULL, '2024-04-25 12:43:30', '2024-04-25 12:43:30'),
(165, 'App\\Models\\User', 11, 'james.r.mclemore@menoz.com', 'c5a221150e9ffe5e1206e53dd9145cb638a31762a5415039ce7c0d680f8f5ff7', '[\"*\"]', '2024-04-25 20:18:33', NULL, '2024-04-25 20:16:13', '2024-04-25 20:18:33'),
(166, 'App\\Models\\User', 11, 'james.r.mclemore@menoz.com', '0812fb6245399f83a06fbb84ce7fcb27b083e8b13c8c77502011de4a6e032a4d', '[\"*\"]', '2024-04-25 22:39:58', NULL, '2024-04-25 22:39:57', '2024-04-25 22:39:58'),
(167, 'App\\Models\\User', 11, 'james.r.mclemore@menoz.com', '42494acb1ddf777c6f0117034f9ae8f40fa60e08d71b2b60f98c94ad54893145', '[\"*\"]', '2024-04-25 22:42:55', NULL, '2024-04-25 22:42:55', '2024-04-25 22:42:55'),
(168, 'App\\Models\\User', 11, 'james.r.mclemore@menoz.com', '4ce976804a51317eef166351644febf06b5907acfde2fdb5934fec194becbf36', '[\"*\"]', '2024-04-25 22:44:39', NULL, '2024-04-25 22:43:06', '2024-04-25 22:44:39'),
(169, 'App\\Models\\User', 11, 'james.r.mclemore@menoz.com', '6e8286494b7d6941dd7e59a85c65d6edad078588e850507057bf5c04bf8b8234', '[\"*\"]', '2024-04-26 00:21:49', NULL, '2024-04-25 22:45:00', '2024-04-26 00:21:49'),
(170, 'App\\Models\\User', 11, 'james.r.mclemore@menoz.com', 'a71dff98bce4c7691517cbfdd3dcb8253a02ffbf69291c798019383ea1c757d1', '[\"*\"]', '2024-04-26 00:25:33', NULL, '2024-04-26 00:25:33', '2024-04-26 00:25:33'),
(171, 'App\\Models\\User', 11, 'james.r.mclemore@menoz.com', '125a347ff8bc3ab9c76955c2638144e98eff32a39aa9d4a8832bcc408d47fec0', '[\"*\"]', '2024-04-26 00:35:26', NULL, '2024-04-26 00:30:08', '2024-04-26 00:35:26'),
(172, 'App\\Models\\User', 11, 'james.r.mclemore@menoz.com', 'c0d7fdb197a35f778e2fad3f9893313298736a2b06cc7d5191f9bafee208e3ad', '[\"*\"]', '2024-04-26 01:51:06', NULL, '2024-04-26 01:51:05', '2024-04-26 01:51:06'),
(173, 'App\\Models\\User', 11, 'james.r.mclemore@menoz.com', '57f3500d7339ca77b6362fff6abcb963146d9ea46db68ee277948a2d3647f12b', '[\"*\"]', '2024-04-26 12:17:32', NULL, '2024-04-26 12:17:32', '2024-04-26 12:17:32'),
(174, 'App\\Models\\User', 11, 'james.r.mclemore@menoz.com', 'a3476423b0b3422deda007ce81f29fa8114be0503e0e303d1754dcb7e640dc76', '[\"*\"]', '2024-04-27 07:21:41', NULL, '2024-04-27 07:21:41', '2024-04-27 07:21:41'),
(175, 'App\\Models\\User', 11, 'james.r.mclemore@menoz.com', '6d684ab60a709933483161e04d22c22f1c489b0d9450605f8f5b6194e2d10544', '[\"*\"]', '2024-04-27 07:39:49', NULL, '2024-04-27 07:39:48', '2024-04-27 07:39:49'),
(176, 'App\\Models\\User', 11, 'james.r.mclemore@menoz.com', '6f908f4a2b1d423f5c03412a836d4a74ded6dac5d9b4924b089518ac12835551', '[\"*\"]', '2024-04-27 07:47:59', NULL, '2024-04-27 07:46:17', '2024-04-27 07:47:59'),
(177, 'App\\Models\\User', 11, 'james.r.mclemore@menoz.com', '2ae2f964f82f347b1ae82c44f736dcb6478d4544570fa5e99aec6c076d559dc9', '[\"*\"]', '2024-04-27 08:08:40', NULL, '2024-04-27 07:48:46', '2024-04-27 08:08:40'),
(178, 'App\\Models\\User', 2, 'vikas@mailinator.com', '868829ae06f7c3175547cb2ec357e86cef3a08041a2448f2421668deda391bf7', '[\"*\"]', '2024-04-28 12:22:05', NULL, '2024-04-28 12:21:46', '2024-04-28 12:22:05'),
(179, 'App\\Models\\User', 11, 'james.r.mclemore@menoz.com', '8780c60caa4a58f3b004585c67673139cb2fb5551d7b44f8cbbcdc57800a6412', '[\"*\"]', '2024-04-29 01:10:38', NULL, '2024-04-29 01:05:20', '2024-04-29 01:10:38'),
(180, 'App\\Models\\User', 11, 'james.r.mclemore@menoz.com', '387900032d87c9423b562f51bc24adb9152547893577a1eec7be47324d13d888', '[\"*\"]', '2024-04-29 01:14:28', NULL, '2024-04-29 01:10:48', '2024-04-29 01:14:28'),
(181, 'App\\Models\\User', 11, 'james.r.mclemore@menoz.com', 'e3a0e55e35308ace3e1e08d15e332006b6de4a5c62865233b8d89ed4b1e75d4c', '[\"*\"]', '2024-04-29 03:27:07', NULL, '2024-04-29 03:27:06', '2024-04-29 03:27:07'),
(182, 'App\\Models\\User', 11, 'james.r.mclemore@menoz.com', '6db048ab618557af6b39d232dcc11745571dfac26e7ce8639d2a245573d4dc5b', '[\"*\"]', '2024-04-30 12:20:28', NULL, '2024-04-30 12:20:28', '2024-04-30 12:20:28'),
(183, 'App\\Models\\User', 12, 'james-richard@menoz.com', '41a5c3d8019e888c2d8bf908e22a8e64f2fac6bbdd0aa36a92850c428826411a', '[\"*\"]', '2024-05-01 07:17:00', NULL, '2024-05-01 07:16:59', '2024-05-01 07:17:00'),
(184, 'App\\Models\\User', 2, 'vikas@mailinator.com', '9b1cb0d18740a04aca9457c5472bbfbeb2911fa7c3734f6ca783c90f24241a10', '[\"*\"]', '2024-05-01 17:11:53', NULL, '2024-05-01 17:11:43', '2024-05-01 17:11:53'),
(185, 'App\\Models\\User', 2, 'vikas@mailinator.com', '840d6bc66051c976fef5eca4abc0bf08e341b3c916958ede79bd891100c36731', '[\"*\"]', '2024-05-01 17:18:34', NULL, '2024-05-01 17:18:34', '2024-05-01 17:18:34'),
(186, 'App\\Models\\User', 2, 'vikas@mailinator.com', 'c39f51654127fd61039f548ee2cbce744b030925142c02c6d1bd4dd9d30f337a', '[\"*\"]', NULL, NULL, '2024-05-02 10:58:03', '2024-05-02 10:58:03');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `name`, `description`, `address`, `latitude`, `longitude`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Client-Store- OTR', '<p><strong>Please pick up at MacDonald&#39;s and deliver to :</strong></p>\r\n\r\n<ol>\r\n	<li><a href=\"http://google.com/map?location=2002 W Central, El Dorado, KS 67042\">2002 W Central, El Dorado, KS 67042</a></li>\r\n	<li><strong><a href=\"tel:316-555-5555\">316-555-5555</a></strong></li>\r\n	<li><strong><a href=\"mailto:client@email.com?subject=About%20Your%20Order\">client@email.com</a></strong></li>\r\n</ol>\r\n\r\n<p>&nbsp;</p>', '2002 W Central, El Dorado, KS 67042', '37.8177322', '-96.8769451', 0, '2024-04-27 07:31:42', '2024-04-29 03:24:58'),
(2, 'JOE-MACDONALDS-OTR', '<p><strong>Please pick up at MacDonald&#39;s and deliver to :</strong></p>\r\n\r\n<ol>\r\n	<li><a href=\"http://google.com/map?location=1945 WEST CENTRAL EL DORADO KS 67042\">1945 WEST CENTRAL EL DORADO KS 67042</a></li>\r\n	<li><strong><a href=\"tel:316-555-5555\">316-555-5555</a></strong></li>\r\n	<li><strong><a href=\"mailto:client@email.com?subject=About%20Your%20Order\">client@email.com</a></strong></li>\r\n</ol>\r\n\r\n<p>&nbsp;</p>', '1945 WEST CENTRAL EL DORADO KS 67042', '37.8170092', '-96.87554139999999', 2, '2024-04-27 07:32:31', '2024-04-29 03:25:13'),
(3, 'SUE-SONICS-OTR', '<p><strong>Please pick up at Sonics and deliver to :</strong></p>\r\n\r\n<ol>\r\n	<li><a href=\"http://google.com/map?location=121 E Sixth Ave, El Dorado Ks. 67042\"><strong>121 E Sixth Ave, El Dorado Ks. 67042</strong></a></li>\r\n	<li><strong><a href=\"tel:316-555-5555\">316-555-5555</a></strong></li>\r\n	<li><strong><a href=\"mailto:client@email.com?subject=About%20Your%20Order\">client@email.com</a></strong></li>\r\n</ol>\r\n\r\n<p>&nbsp;</p>', '121 E Sixth Ave, El Dorado Ks. 67042', '37.8249057', '-96.84944', 0, '2024-04-27 07:33:15', '2024-04-29 03:25:27'),
(4, 'KALEB-CASEYS-OTR', '<p><strong>Please pick up at Casey&#39;s&nbsp;and deliver to :</strong></p>\r\n\r\n<ol>\r\n	<li><a href=\"http://google.com/map?location=1702 W Central Ave in El Dorado, KS\">1702 W Central Ave in El Dorado, KS</a></li>\r\n	<li><strong><a href=\"tel:316-555-5555\">316-555-5555</a></strong></li>\r\n	<li><strong><a href=\"mailto:client@email.com?subject=About%20Your%20Order\">client@email.com</a></strong></li>\r\n</ol>\r\n\r\n<p>&nbsp;</p>', '1702 W Central Ave in El Dorado, KS', '37.8178631', '-96.87163579999999', 0, '2024-04-27 07:34:09', '2024-04-29 03:25:40'),
(5, 'MICHAEL-NOTARY-OTR', '<p><strong>Prior to accepting this task/order - Please notify Michael to schedule signing time and location.&nbsp;Don&#39;t forget to get critical information related to the type of notarial act required, type(s) of documents, and requirements for scanback, mailing, or other medthod of delivery. Also, make sure Michael understands that you will need proof of Identification (State ID or Driver&#39;s License are acceptable examples)</strong></p>\r\n\r\n<ol>\r\n	<li><a href=\"http://google.com/map?location=536 N Main Ave, El Dorado Ks. 67042\">536 N Main Ave, El Dorado Ks. 67042</a></li>\r\n	<li><strong><a href=\"tel:316-555-5555\">316-555-5555</a></strong></li>\r\n	<li><strong><a href=\"mailto:client@email.com?subject=About%20Your%20Order\">client@email.com</a></strong></li>\r\n</ol>\r\n\r\n<p>&nbsp;</p>', '536 N Main Ave, El Dorado Ks. 67042', '37.8233312', '-96.8488778', 0, '2024-04-27 07:39:28', '2024-04-29 03:25:57');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL DEFAULT 2 COMMENT '1 For Admin, 2 For Users',
  `profile_image` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `show_password` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 For Active, 0 For Inactive',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `role_id`, `profile_image`, `email`, `number`, `email_verified_at`, `password`, `show_password`, `remember_token`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Admin', 1, '661e53c726d34.png', 'james.r.mclemore@outlook.com', '8529637410', NULL, '$2y$12$i6i.W73wkA0N91TL/sG/RusCr9tM1SCL7GO.W3IBjjk46HcSmHuMC', '!!M3n0z((', NULL, 1, NULL, '2024-04-25 19:18:14', NULL),
(2, 'Vikas Bapat', 2, '66153fd998aae.jpg', 'vikas@mailinator.com', '7845784500', '2024-04-09 04:58:59', '$2y$12$bhs7UWX9yXw5XnyWKA/1feAokS/Ls5lmEvRl3pHmEXfw4PDIV9nIm', '$2y$12$bhs7UWX9yXw5XnyWKA/1feAokS/Ls5lmEvRl3pHmEXfw4PDIV9nIm', 'qCZuEDAwdYpGmDYWGZIjaSMHEGTlOOCzbu9yRqim7TuXczYvV1NwYe5keI3Z', 1, '2024-04-09 04:58:59', '2024-04-24 16:23:59', NULL),
(8, 'Dinesh Kartik', 2, '66260cd21ab73.jpg', 'kartik@mailinator.com', '7898989889', '2024-04-22 01:38:02', '$2y$12$oDmNLbJbnqm8R/TUqCzoMObMCGgJF0hs16d2mICay8B7N5AGkMdpS', '12345678', NULL, 1, '2024-04-22 01:38:02', '2024-04-22 01:38:02', NULL),
(9, 'Mukesh Sharma', 2, '6628ec7fa91e2.png', 'mukesh@yopmail.com', '8855996655', '2024-04-24 14:53:21', '$2y$12$q.IwBj9mgAX1IuGYY3YuBebxtWsFk3/7brCvKXt4g70ZuA9lk2Cqu', '12345678', NULL, 1, '2024-04-24 14:53:21', '2024-04-24 15:26:55', NULL),
(11, 'James', 2, NULL, 'james.r.mclemore@menoz.com', '3167490634', '2024-04-25 07:56:05', '$2y$12$tQzYbK.YzOCFxzldGftRAOJnuLyfef8dIIGFAz8oRYEoCJ/b3Rlmu', '!!M3n0z((', NULL, 1, '2024-04-25 19:56:05', '2024-04-25 20:17:17', NULL),
(12, 'James2', 2, NULL, 'james-richard@menoz.com', '3162510889', '2024-05-01 07:15:56', '$2y$12$a20Io4RhyLNlj6yOiIPRyu2E0lbUVmLljtv2lsEDdM7N0fuKKdzEG', '12345678', NULL, 1, '2024-05-01 07:15:56', '2024-05-01 07:15:56', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_tasks`
--

CREATE TABLE `user_tasks` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `task_id` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_tasks`
--

INSERT INTO `user_tasks` (`id`, `user_id`, `task_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 2, '2024-04-23 00:36:12', '2024-04-23 00:37:14'),
(2, 2, 2, 2, '2024-04-23 00:37:41', '2024-04-23 00:37:50'),
(3, 2, 3, 2, '2024-04-23 00:38:56', '2024-04-23 00:39:00'),
(4, 2, 4, 2, '2024-04-23 00:39:09', '2024-04-23 00:39:11'),
(5, 2, 6, 2, '2024-04-23 00:39:19', '2024-04-23 00:39:21'),
(6, 2, 5, 2, '2024-04-23 00:39:28', '2024-04-23 00:39:30'),
(7, 9, 7, 2, '2024-04-24 15:29:06', '2024-04-24 15:29:21'),
(8, 2, 8, 2, '2024-04-24 16:27:10', '2024-04-24 16:27:15'),
(9, 2, 9, 2, '2024-04-24 16:28:39', '2024-04-24 16:28:42'),
(10, 2, 10, 2, '2024-04-24 16:29:33', '2024-04-24 16:29:40'),
(11, 10, 11, 2, '2024-04-24 18:48:56', '2024-04-24 22:46:37'),
(12, 2, 11, 2, '2024-04-24 21:55:05', '2024-04-24 21:55:05'),
(13, 10, 12, 2, '2024-04-25 03:01:00', '2024-04-25 03:01:20'),
(14, 2, 13, 2, '2024-04-25 09:57:13', '2024-04-25 09:57:19'),
(15, 10, 14, 2, '2024-04-25 10:40:51', '2024-04-25 10:42:58'),
(16, 2, 15, 2, '2024-04-25 11:04:28', '2024-04-25 11:08:30'),
(17, 2, 16, 2, '2024-04-25 11:13:49', '2024-04-25 11:14:07'),
(18, 2, 17, 2, '2024-04-25 11:15:57', '2024-04-25 11:16:32'),
(19, 2, 18, 2, '2024-04-25 11:29:10', '2024-04-25 11:29:31'),
(20, 2, 19, 2, '2024-04-25 11:33:10', '2024-04-25 11:33:20'),
(21, 2, 20, 2, '2024-04-25 11:46:02', '2024-04-25 11:46:16'),
(22, 10, 21, 2, '2024-04-25 12:11:18', '2024-04-25 12:28:14'),
(23, 11, 22, 2, '2024-04-25 20:17:48', '2024-04-25 20:18:19'),
(24, 11, 23, 2, '2024-04-25 22:44:11', '2024-04-25 22:44:39'),
(25, 11, 24, 2, '2024-04-26 00:31:53', '2024-04-26 00:33:12'),
(26, 11, 26, 2, '2024-04-27 07:50:39', '2024-04-27 08:08:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_tasks`
--
ALTER TABLE `user_tasks`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=187;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user_tasks`
--
ALTER TABLE `user_tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
