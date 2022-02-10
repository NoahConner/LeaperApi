-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 09, 2022 at 10:25 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lw`
--

-- --------------------------------------------------------

--
-- Table structure for table `deals`
--

CREATE TABLE `deals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurent_id` int(11) NOT NULL,
  `deal_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deal_image` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `deal_price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deal_person_quantity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deal_quantity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deal_menu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deals`
--

INSERT INTO `deals` (`id`, `restaurent_id`, `deal_name`, `deal_image`, `deal_price`, `deal_person_quantity`, `deal_quantity`, `deal_menu`, `created_at`, `updated_at`) VALUES
(5, 12, 'deal 1', '', '20', '1', '20', 'burger, fries, shake', '2022-01-27 07:47:57', '2022-01-27 07:47:57'),
(6, 12, 'deal 2', '', '200', '1', '20', 'burger, fries, shake, coffee', '2022-01-28 00:11:59', '2022-01-28 00:20:47'),
(7, 13, 'deal 1', '', '200', '1', '20', 'burger, fries, shake', '2022-01-28 02:37:09', '2022-01-28 02:37:09');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(10, '2022_01_14_195357_create_restaurents_table', 2),
(11, '2022_01_17_172146_create_pre_users_table', 3),
(12, '2022_01_20_231123_create_deals_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('03362c893783f2523894bbffd0a758d487cf07a30fa8a3dd17609c4ba2705dd79b288cb859dc570d', 39, 2, NULL, '[]', 0, '2022-01-20 16:41:09', '2022-01-20 16:41:09', '2023-01-20 21:41:09'),
('11ea7565bdfe96b1b914ffc52ea5a02da45f95e3505633e1bef8b18b3f7df2d2222e8a82cf14f6d9', 1, 2, NULL, '[]', 0, '2022-01-17 11:08:20', '2022-01-17 11:08:20', '2023-01-17 16:08:20'),
('16a25ce858a646e7b575bb808bb534f3e643a3be76318d00e26fb85e95ca0f89fe4542a8d8e215bb', 1, 2, NULL, '[]', 1, '2022-01-17 15:56:54', '2022-01-17 15:56:54', '2023-01-17 20:56:54'),
('18393a1bedd317130393815c0e5853478716da6374fa722f91a2a2462f4a7d66f7b8e2e38731fb15', 44, 2, NULL, '[]', 0, '2022-01-27 01:59:32', '2022-01-27 01:59:32', '2023-01-27 06:59:32'),
('19a0b7b2feaeb1d629c21be4011d3a0130ef088091ef89be012aa5b4e44e9142d1eeaf2a9f04bca3', 1, 2, NULL, '[]', 0, '2022-01-17 15:43:44', '2022-01-17 15:43:44', '2023-01-17 20:43:44'),
('1a8982f6dca8a4f7ee6f21e75b62e893f34627f45ae7c67002cf288430af935decdf48fa528ceff3', 1, 2, NULL, '[]', 0, '2022-01-14 10:52:25', '2022-01-14 10:52:25', '2023-01-14 15:52:25'),
('1cadebffbf851cfe0eff08b89a435eff93dc7bb864e7f1f72deb8875dc22f46f9b33a51ed83df049', 20, 2, NULL, '[]', 1, '2022-01-17 17:15:54', '2022-01-17 17:15:54', '2023-01-17 22:15:54'),
('20156902f2f4d2fe5eb27a73cecc5002fe444ff39bdd0678b88ccba32903017707c304896ce970f0', 1, 2, NULL, '[]', 0, '2022-01-14 10:44:01', '2022-01-14 10:44:01', '2023-01-14 15:44:01'),
('2409383793fa545c485551b13f4c3806345e5883700cd8687ac764822547ed9a7405c149e63e8a4b', 20, 2, NULL, '[]', 0, '2022-01-17 17:12:31', '2022-01-17 17:12:31', '2023-01-17 22:12:31'),
('250d4b1b46af947e1d7df89c228fd5c88fb75f4465c27f5905cdcd93be11892845efc3497019de25', 31, 2, NULL, '[]', 0, '2022-01-20 14:37:09', '2022-01-20 14:37:09', '2023-01-20 19:37:09'),
('25c672309615764d8c916205165d0590a0484b3870f4d24d0f56f96ea64a6314ab188685223ee8ae', 40, 2, NULL, '[]', 0, '2022-01-24 00:56:45', '2022-01-24 00:56:45', '2023-01-24 05:56:45'),
('267e7dd5510c7312c1c1248f0652ea7af9042e74ed9e284fd1aae6cdc74a4eea337d2c7d8f6070ed', 46, 2, NULL, '[]', 0, '2022-01-27 02:35:05', '2022-01-27 02:35:05', '2023-01-27 07:35:05'),
('2681d519665cc7cbb57674e3a0b2fc8ffc23263ce29446b330a1529120a1e84cda9091fbb2f6242e', 35, 2, NULL, '[]', 0, '2022-01-20 14:50:37', '2022-01-20 14:50:37', '2023-01-20 19:50:37'),
('27c7cf961f81a601deb258800222e894395252d3f01eda3e6fa7a287bc28287913518b33ac30fbf5', 22, 2, NULL, '[]', 0, '2022-01-17 18:12:49', '2022-01-17 18:12:49', '2023-01-17 23:12:49'),
('28b2c0db63867350249232d142214cd35f59eacaa17bc7dc76117b051ea36cb5d6b67a865bb83b6b', 40, 2, NULL, '[]', 0, '2022-01-20 18:19:54', '2022-01-20 18:19:54', '2023-01-20 23:19:54'),
('349df993c27b02f97cb71de7f6fcb981394d169e41ff8f6adbbd56fb16145f3f5dec9c0b45f573be', 1, 2, NULL, '[]', 1, '2022-01-14 17:25:39', '2022-01-14 17:25:39', '2023-01-14 22:25:39'),
('3d689506e7d7f789fc0222de0ce4e336792f518c775c1630604f11645b37f9c9d6361eed362c5bcf', 37, 2, NULL, '[]', 0, '2022-01-20 15:15:12', '2022-01-20 15:15:12', '2023-01-20 20:15:12'),
('4c47c534d5e43573a8527f9861d63c427520d8410a6206c42a91fd6e79f1fb53a88f85e9c1e96250', 47, 2, NULL, '[]', 0, '2022-01-27 05:04:43', '2022-01-27 05:04:43', '2023-01-27 10:04:43'),
('4fa189d28e4421d64f97da8bfe2eb071ad0675ac22fd3c99c687e38e5b08fca1728200a2c898a034', 49, 2, NULL, '[]', 0, '2022-01-28 04:18:50', '2022-01-28 04:18:50', '2023-01-28 09:18:50'),
('4fefb30d2101c61a87ddee79c0218669f2aa2fec3d26468e629cbd4146b4d46e53582796a5071baa', 1, 2, NULL, '[]', 0, '2022-01-17 15:53:45', '2022-01-17 15:53:45', '2023-01-17 20:53:45'),
('5385e11807b218c9ac0026d1afd6c48b4c6fcbdb3895073013dc8773cb7db5295d94eca4e630df1c', 1, 2, NULL, '[]', 0, '2022-01-17 15:42:39', '2022-01-17 15:42:39', '2023-01-17 20:42:39'),
('54d567feea6ec1aef07fc1a730f708a1a5350cf1b4fc741c4674b82abe6d29b50f4952296debaa8c', 29, 2, NULL, '[]', 0, '2022-01-20 14:26:51', '2022-01-20 14:26:51', '2023-01-20 19:26:51'),
('5c0666c594c645cbe7f1cbc6e3e272a7d918b507707c87783a0e116932c24e5109c21ceb8c68c39e', 49, 2, NULL, '[]', 0, '2022-02-09 01:38:04', '2022-02-09 01:38:04', '2023-02-09 06:38:04'),
('5ed5bf12221a244acc2baa6c4e3c86bd7ee1e65768321e860b7811784ce12c6f6f97b1ec596efede', 32, 2, NULL, '[]', 0, '2022-01-20 14:39:42', '2022-01-20 14:39:42', '2023-01-20 19:39:42'),
('629dfe8e776c20781bd13c52362880b52c07835139714d309cb7fadc33cdc3f9df2a718e6c17707d', 47, 2, NULL, '[]', 0, '2022-01-27 02:36:47', '2022-01-27 02:36:47', '2023-01-27 07:36:47'),
('682a3305f41764c887225552ba9031f78db932fcbb639677b6857e2a893c14276d62213e7e5e3988', 49, 2, NULL, '[]', 0, '2022-02-09 04:02:56', '2022-02-09 04:02:56', '2023-02-09 09:02:56'),
('6bbd206410cc48eb0d810f2fb7b756f77ae3175a333da73989b4e9cc57b53d1f1a2e5d919f2ac639', 47, 2, NULL, '[]', 0, '2022-01-27 02:43:35', '2022-01-27 02:43:35', '2023-01-27 07:43:35'),
('6c7efa6938138a6874d4d2c0b2623fdbd351f192868c12569ebf9bf3cff79e9207d94f91d34afddf', 1, 2, NULL, '[]', 0, '2022-01-14 10:52:31', '2022-01-14 10:52:31', '2023-01-14 15:52:31'),
('6f1caaa0f7138a078148876e082779edb769b09d2fc816506fd9f8d3c4a0970409ffc173bdc12c4b', 28, 2, NULL, '[]', 0, '2022-01-20 11:49:16', '2022-01-20 11:49:16', '2023-01-20 16:49:16'),
('749ad87d5c8e8cff1b478a36d2d317f97b8297a808c56b936c5627e9be8ca80b06fd80b7b4a67748', 1, 2, NULL, '[]', 0, '2022-01-14 10:49:22', '2022-01-14 10:49:22', '2023-01-14 15:49:22'),
('7d18ff2e43df52f217866de9e68717d6feed3e148a0ab62e41a25b82a86ce26d41f05ec340e85361', 1, 2, NULL, '[]', 0, '2022-01-17 10:35:20', '2022-01-17 10:35:20', '2023-01-17 15:35:20'),
('803f089f211b5d8471c656f1bbcbb9c22cc6a43b679e7d69777b7da6ebb74697ed2fbca245a02e22', 48, 2, NULL, '[]', 0, '2022-01-27 07:47:05', '2022-01-27 07:47:05', '2023-01-27 12:47:05'),
('81aa58b2089ecb03f92b13338b1cda3559a7a2cc599ed5e0d721f16016adf71e798fe2c1dce36c09', 1, 2, NULL, '[]', 0, '2022-01-17 15:40:52', '2022-01-17 15:40:52', '2023-01-17 20:40:52'),
('88bd34a6e13e2c1e0fe39dfb6fd1fc2911562e8435696a564b50c14e4991be5b5fbf3b3dc055a526', 1, 2, NULL, '[]', 1, '2022-01-14 17:43:42', '2022-01-14 17:43:42', '2023-01-14 22:43:42'),
('8c6dc1fe95e1b746d87e74a35867a4448bfd31665db01cd01d732a5cc44bc9bc6df9781ca7c56ffa', 26, 2, NULL, '[]', 0, '2022-01-20 11:40:34', '2022-01-20 11:40:34', '2023-01-20 16:40:34'),
('8fa4f1df0c2a32f905f102847fc9ab8d67afed2e136bdeb620e404a676e899170c21bec512234ffd', 43, 2, NULL, '[]', 0, '2022-01-27 00:42:35', '2022-01-27 00:42:35', '2023-01-27 05:42:35'),
('914e3678c15218dc7191206d8adc1b417109e06477ce870c66f9cc05da894fb3b56f201842a8ac53', 42, 2, NULL, '[]', 0, '2022-01-27 00:34:41', '2022-01-27 00:34:41', '2023-01-27 05:34:41'),
('934f4d26d3e898c3a78acac58d4f2eebca496ddbe9cde41fde2835df76e127f463f3cf35d35c388f', 20, 2, NULL, '[]', 1, '2022-01-17 17:24:40', '2022-01-17 17:24:40', '2023-01-17 22:24:40'),
('9485a518caed41e0742886bfd78f5e67b36cad4f87ca3bb82f0134854937182031934db76ae1d2b5', 49, 2, NULL, '[]', 0, '2022-02-09 01:03:30', '2022-02-09 01:03:30', '2023-02-09 06:03:30'),
('9f1eab95ff8577f0f7cdff4a65a87416614d98466bec16a32c5b3f1bdc3dcb9b10f759ba2cf70822', 33, 2, NULL, '[]', 0, '2022-01-20 14:47:34', '2022-01-20 14:47:34', '2023-01-20 19:47:34'),
('aab6097a8fd848cd9120cc7b381ad74643d60e02b0043dbce9c7412d43a70bf320cf72fae773db20', 25, 2, NULL, '[]', 0, '2022-01-17 18:25:45', '2022-01-17 18:25:45', '2023-01-17 23:25:45'),
('ac17060f991960587742a6b9a9565e2bdd02d5a4789625b0b9df9ad4db5167a6f126fdb3b9c4b8ec', 45, 2, NULL, '[]', 0, '2022-01-27 02:16:40', '2022-01-27 02:16:40', '2023-01-27 07:16:40'),
('ad56c867bffa4b9a6ec2bbe9734177cceff6fa5b77f33f547e595cb00834411bee54e085260dd408', 1, 2, NULL, '[]', 0, '2022-01-14 14:27:52', '2022-01-14 14:27:52', '2023-01-14 19:27:52'),
('bb90880b3a687432c92cf24256d6b9ac0c5e40472306251743e9a290ea841218da3080be9ae6962a', 1, 2, NULL, '[]', 1, '2022-01-17 10:28:03', '2022-01-17 10:28:03', '2023-01-17 15:28:03'),
('bd43ad0e7b39f3774500a3de42a8f152458e7a412b7bc1104b99fe58fa5476926d38cdcd2b9935a4', 48, 2, NULL, '[]', 0, '2022-01-27 05:34:25', '2022-01-27 05:34:25', '2023-01-27 10:34:25'),
('bf1a051f41597b4c7c74452d3e8c0e3e842845703d9e80ada134167b076982b6af5e6ff751682631', 20, 2, NULL, '[]', 0, '2022-01-17 17:20:14', '2022-01-17 17:20:14', '2023-01-17 22:20:14'),
('bf6b337597493f9583a3bc125ac38e3fe609ac1f4d23f6c52feeacab23d4b93a378e78a432343e08', 1, 2, NULL, '[]', 0, '2022-01-17 15:17:59', '2022-01-17 15:17:59', '2023-01-17 20:17:59'),
('c0c201fa59b7059b8e6e7fdf6b9fbb66361564826a51e9a88c2561d7d3f681c1b65693a8a4b2e390', 1, 2, NULL, '[]', 0, '2022-01-14 14:33:14', '2022-01-14 14:33:14', '2023-01-14 19:33:14'),
('c270c4cca62839d009bbe827ac8b194aa0656599d3d76a3e3fa6495efba6a47bd7363d6109292a74', 30, 2, NULL, '[]', 0, '2022-01-20 14:36:13', '2022-01-20 14:36:13', '2023-01-20 19:36:13'),
('c461d3bf19c578bdad75ffb4039be975ffdef5c54e901ef27c761feb4cb49e94fe32ad29519d8ca8', 1, 2, NULL, '[]', 1, '2022-01-17 13:35:06', '2022-01-17 13:35:06', '2023-01-17 18:35:06'),
('c4f4c560eee4daca2af53a3ed827b784cc7ff4fd4d064d1b0695723078dd266d4b94758d20187e67', 1, 2, NULL, '[]', 0, '2022-01-14 10:47:57', '2022-01-14 10:47:57', '2023-01-14 15:47:57'),
('c5d54876dd1b6045ff4c4dc7e620bc9ae096f71434599ccf0ad64edcf556587d84ac3c63d77afae5', 38, 2, NULL, '[]', 0, '2022-01-20 16:27:37', '2022-01-20 16:27:37', '2023-01-20 21:27:37'),
('cb9c232dcf8696abc76327adc1817b14b1dd11a866a702c5123a49685a97575cee303c64065bdbe7', 21, 2, NULL, '[]', 0, '2022-01-17 17:44:40', '2022-01-17 17:44:40', '2023-01-17 22:44:40'),
('cd83a5ac8fc3e1cfd8797aaed25c549f49f5c6785372385d977bdfec3497c6eb2fc84d1950002cc1', 1, 2, NULL, '[]', 0, '2022-01-14 10:42:04', '2022-01-14 10:42:04', '2023-01-14 15:42:04'),
('d1a0b8a1ad5e5adb9d8dabb4a5210b1de36f1c3fec29f6f44be63d57848c996f126787e4ebfea0de', 49, 2, NULL, '[]', 0, '2022-01-28 02:16:16', '2022-01-28 02:16:16', '2023-01-28 07:16:16'),
('d29cbeccde155c0d5fb0b64338f54cbd80b59b2d9cfcb890a3aca1da32c1e64be290db6174a68b73', 36, 2, NULL, '[]', 0, '2022-01-20 15:14:33', '2022-01-20 15:14:33', '2023-01-20 20:14:33'),
('d5f8a64e24ce514245597f1079c7e2b110d15766ab0a3a6d4e5f91ff928d6fc51db50db66e9e480a', 48, 2, NULL, '[]', 0, '2022-01-27 07:48:17', '2022-01-27 07:48:17', '2023-01-27 12:48:17'),
('dd9a3473b3e8d49bfd2fc0519831021892d1f4cd05b0f3d10e3c30b413429a9b64ff328a70b948a2', 34, 2, NULL, '[]', 0, '2022-01-20 14:48:05', '2022-01-20 14:48:05', '2023-01-20 19:48:05'),
('e1b532d158dbb8974b61e04b45435ab71e357e15b1a3cea78d4ca5368da145db4d7877254f853e1c', 40, 2, NULL, '[]', 0, '2022-01-20 18:06:28', '2022-01-20 18:06:28', '2023-01-20 23:06:28'),
('e4cbc59f28ea34b349224b0b5ba374dccabf092e3d8ce120835e4dd98bf09c5d1a91a68304ba4500', 41, 2, NULL, '[]', 0, '2022-01-24 00:56:35', '2022-01-24 00:56:35', '2023-01-24 05:56:35'),
('e517f16a886768e5213d5c39390ac99f861e9cefd2211915f2ec667e7b3239e8bc4585374c088fc4', 24, 2, NULL, '[]', 0, '2022-01-17 18:17:00', '2022-01-17 18:17:00', '2023-01-17 23:17:00'),
('e78c27def0594219fc81805316b86563c147b697f5056c5f882b2652a7fa990e1b6472d10ef2bc95', 49, 2, NULL, '[]', 0, '2022-01-28 05:56:24', '2022-01-28 05:56:24', '2023-01-28 10:56:24'),
('eb08c067b18c73179c25723f5b1f57277f5b597c70199c29529f75611023a3900c3870cfd4529aa4', 20, 2, NULL, '[]', 0, '2022-01-17 17:15:39', '2022-01-17 17:15:39', '2023-01-17 22:15:39'),
('eb65c701529576822c7d2cd1f0cec3edd446c46c2f2bb370fbfec52483057b9b962b40c72f8ecd04', 47, 2, NULL, '[]', 0, '2022-01-27 02:37:50', '2022-01-27 02:37:50', '2023-01-27 07:37:50'),
('f1c5469e9dec2265936ae1e873b04b54b78cbc38a6ef87529fd1285092d4a562c4895207a9fb8a84', 1, 2, NULL, '[]', 1, '2022-01-14 17:48:13', '2022-01-14 17:48:13', '2023-01-14 22:48:13'),
('f89d27e34b8caec3f3aa5216b4c7cb8780caa2ad01087a76b1141c21c7fe0306c70ea5405e26fe7b', 49, 2, NULL, '[]', 0, '2022-02-09 00:55:44', '2022-02-09 00:55:44', '2023-02-09 05:55:44'),
('f99fed1deadf0041e03597c32bbc4c6a0a76efc6bed7641b4e83beb563d18c64ba1a793b572207f4', 43, 2, NULL, '[]', 0, '2022-01-27 01:13:43', '2022-01-27 01:13:43', '2023-01-27 06:13:43');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'ajtBmGr4gcyWff6nzKg9JmkEvXyXcpajhkH9EGMZ', NULL, 'http://localhost', 1, 0, 0, '2022-01-14 10:18:44', '2022-01-14 10:18:44'),
(2, NULL, 'Laravel Password Grant Client', 'fUnsTPRYDYy0coFYhtDaZ6oGn6OAP9gqhdQ5PoRI', 'users', 'http://localhost', 0, 1, 0, '2022-01-14 10:18:44', '2022-01-14 10:18:44');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2022-01-14 10:18:44', '2022-01-14 10:18:44');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_refresh_tokens`
--

INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
('041f28f6228ac62a1e6fdb4e20e6cb59052f4bd786c8bc4573b558766e6ed4cc01b55a404ec57d8e', '2681d519665cc7cbb57674e3a0b2fc8ffc23263ce29446b330a1529120a1e84cda9091fbb2f6242e', 0, '2023-01-20 19:50:37'),
('051f917db3899c42f1e4d123482fb94fbab147c5be8952e975bfe411df1745e48be2e2d18094b488', 'c5d54876dd1b6045ff4c4dc7e620bc9ae096f71434599ccf0ad64edcf556587d84ac3c63d77afae5', 0, '2023-01-20 21:27:38'),
('083428ce9ba82d28e13d606d4ea91e91e33c91228f28b1112265fd8254c1b5b8c471040083c8398e', '18393a1bedd317130393815c0e5853478716da6374fa722f91a2a2462f4a7d66f7b8e2e38731fb15', 0, '2023-01-27 06:59:32'),
('108e7797f511a1b4d7bf88fc12ef30738f47086142ce0b284f4fbcb228601736d074f133fe1abb87', '914e3678c15218dc7191206d8adc1b417109e06477ce870c66f9cc05da894fb3b56f201842a8ac53', 0, '2023-01-27 05:34:42'),
('15aae3aa85c95bbf02291c1d20915be5c78293d5a38c5dbaccafa8f069adcfffb5800cda39e7a3df', 'c0c201fa59b7059b8e6e7fdf6b9fbb66361564826a51e9a88c2561d7d3f681c1b65693a8a4b2e390', 0, '2023-01-14 19:33:14'),
('1c5ce9b9e4aef6e2868563a2acbcfb1cec84332326c995e1d19b6c0b537517c04e04d1c02b186f8f', 'e78c27def0594219fc81805316b86563c147b697f5056c5f882b2652a7fa990e1b6472d10ef2bc95', 0, '2023-01-28 10:56:24'),
('211db07a6d01fc0a1e69f5c9938c288f7571bc1c072d885559324d97948a3dd7df851958ce10f741', 'ac17060f991960587742a6b9a9565e2bdd02d5a4789625b0b9df9ad4db5167a6f126fdb3b9c4b8ec', 0, '2023-01-27 07:16:40'),
('226ad5ab5a7ca249c7fdaaabc18a325118e673de7ab7710884eb5b6d6c7cfc7f8639a527f84dfac4', '8fa4f1df0c2a32f905f102847fc9ab8d67afed2e136bdeb620e404a676e899170c21bec512234ffd', 0, '2023-01-27 05:42:35'),
('25162f8772d9178ad503eff98e2000fa89761007bd690ac0e9d7c486b9ae70e1251378ee13b52e2f', '2409383793fa545c485551b13f4c3806345e5883700cd8687ac764822547ed9a7405c149e63e8a4b', 0, '2023-01-17 22:12:31'),
('28c7890de69f5967f0a54e1d4461e94160a66f4259a1b7c6e285057f464107caf3c5878bf97cc5e2', '6c7efa6938138a6874d4d2c0b2623fdbd351f192868c12569ebf9bf3cff79e9207d94f91d34afddf', 0, '2023-01-14 15:52:31'),
('2c23ada7c1d483244b5cc80ee7228cf3e9909291da77e3805304fa143fafb22d4fa276dba50aab97', '803f089f211b5d8471c656f1bbcbb9c22cc6a43b679e7d69777b7da6ebb74697ed2fbca245a02e22', 0, '2023-01-27 12:47:05'),
('2c60f0991e7eafa91378e575a5235c70d9436c1b3a8fd9ad97e61db82d385435095b0024f8a03902', '5ed5bf12221a244acc2baa6c4e3c86bd7ee1e65768321e860b7811784ce12c6f6f97b1ec596efede', 0, '2023-01-20 19:39:42'),
('2e394336eb443afc4a25b93d0efe0ebe7abb2f3b77854fff66015cd418d9100dbf29b2f51a69fce4', '4fefb30d2101c61a87ddee79c0218669f2aa2fec3d26468e629cbd4146b4d46e53582796a5071baa', 0, '2023-01-17 20:53:45'),
('38fd761e48b48ec12241b3445ccb8ecc44dda18ac6a6a460d2c6f5fdbc4a467c70e7741349447959', 'f1c5469e9dec2265936ae1e873b04b54b78cbc38a6ef87529fd1285092d4a562c4895207a9fb8a84', 1, '2023-01-14 22:48:13'),
('3befd7a777c4c725205b692116391624f20e8ffa25b4c8914b42fc52f012d3d38f10c3bbabc3b81f', '3d689506e7d7f789fc0222de0ce4e336792f518c775c1630604f11645b37f9c9d6361eed362c5bcf', 0, '2023-01-20 20:15:12'),
('467e745facf0ed0283191f32dab4bccc033fffd7d9f0e557cd862e683eea49a39a8201e34a448d0e', '25c672309615764d8c916205165d0590a0484b3870f4d24d0f56f96ea64a6314ab188685223ee8ae', 0, '2023-01-24 05:56:45'),
('4a6896fe1d6d381ef4a5414b7fd4f65a965236eba69268cefe844b245830a3ff6a734715d6f1ef10', '682a3305f41764c887225552ba9031f78db932fcbb639677b6857e2a893c14276d62213e7e5e3988', 0, '2023-02-09 09:02:56'),
('4bdc54a24fc5aa0f0e5590ec67e9de8a13467746d1e548281d67dab4bf60f3bd91f71b333ff8af4d', 'dd9a3473b3e8d49bfd2fc0519831021892d1f4cd05b0f3d10e3c30b413429a9b64ff328a70b948a2', 0, '2023-01-20 19:48:05'),
('4fe7986e1576230b10eff28197e45eb2d0776171fe0a0c47ff3d83f19702945da15b224bcc165eca', '8c6dc1fe95e1b746d87e74a35867a4448bfd31665db01cd01d732a5cc44bc9bc6df9781ca7c56ffa', 0, '2023-01-20 16:40:34'),
('63d74dc28b38b80402525ecc09e52f7f6f90af73048c7af3703000c65d3cb61933239a74f92c2eda', 'c270c4cca62839d009bbe827ac8b194aa0656599d3d76a3e3fa6495efba6a47bd7363d6109292a74', 0, '2023-01-20 19:36:13'),
('689d25e4a89672665b3e21ff4870dce0a0ab32b03a4e2c5f4814d833998a5bc2d6517154a98ddc6c', '5385e11807b218c9ac0026d1afd6c48b4c6fcbdb3895073013dc8773cb7db5295d94eca4e630df1c', 0, '2023-01-17 20:42:39'),
('6abcf257d41e9946370abcab8f153d74932f9f71df435d636127fccac678b0d5021887677caa4c70', 'd1a0b8a1ad5e5adb9d8dabb4a5210b1de36f1c3fec29f6f44be63d57848c996f126787e4ebfea0de', 0, '2023-01-28 07:16:16'),
('74d6af22b2567374a899c3c81ddd6d6607769793ad34a20c017419e24ef6e92c1e2d8ecc90ecd138', '54d567feea6ec1aef07fc1a730f708a1a5350cf1b4fc741c4674b82abe6d29b50f4952296debaa8c', 0, '2023-01-20 19:26:52'),
('7573ce2f6ba7b59faeab7da03ab38b0bbf62028eee2d046a62fa1488b145a7758d33a2e509f69a06', '5c0666c594c645cbe7f1cbc6e3e272a7d918b507707c87783a0e116932c24e5109c21ceb8c68c39e', 0, '2023-02-09 06:38:04'),
('7c2d31ef0e1561fef79e0ec8487d28495ef61da10fcac4149be4162ca264197c4eaf4b12cce0664b', 'bf6b337597493f9583a3bc125ac38e3fe609ac1f4d23f6c52feeacab23d4b93a378e78a432343e08', 0, '2023-01-17 20:17:59'),
('7df2d8df0ff57319c624815418baac604a02439cbd748cd860d655f944b97478bb86e8957780cea5', '6f1caaa0f7138a078148876e082779edb769b09d2fc816506fd9f8d3c4a0970409ffc173bdc12c4b', 0, '2023-01-20 16:49:16'),
('807f1087e168ae43723c46accc0e39159e0613f8b9befaac9470c13754957051ef478205cac652f8', 'f99fed1deadf0041e03597c32bbc4c6a0a76efc6bed7641b4e83beb563d18c64ba1a793b572207f4', 0, '2023-01-27 06:13:43'),
('85668fb32a9523b244b41ea6f2d0a94479bde9c242a6e351d5fb2d4ece4552b5db03ae8bf508a364', 'c461d3bf19c578bdad75ffb4039be975ffdef5c54e901ef27c761feb4cb49e94fe32ad29519d8ca8', 1, '2023-01-17 18:35:06'),
('87ecef5f17e9d43dbb34a9a8e4b75cc505fa44cd22a3c00ebe196cfb6037f83bf2f0447d642d9d68', 'aab6097a8fd848cd9120cc7b381ad74643d60e02b0043dbce9c7412d43a70bf320cf72fae773db20', 0, '2023-01-17 23:25:45'),
('8bf0ed0c1196bfd3452dcbc9cbcbf1e5b2665369160f8f1bfc6580b6b9480aa6f1adaf973eb0ab77', 'bf1a051f41597b4c7c74452d3e8c0e3e842845703d9e80ada134167b076982b6af5e6ff751682631', 0, '2023-01-17 22:20:14'),
('943dfe7d6caee271c8f7fb596bececb94fa5d15eccf16a38089be99fb91fcae2587df05b2e2dde40', 'e4cbc59f28ea34b349224b0b5ba374dccabf092e3d8ce120835e4dd98bf09c5d1a91a68304ba4500', 0, '2023-01-24 05:56:36'),
('995ab9e1e6fb9ee4ee2b522bd893dfb650d5f734bc16eccd2bd5e6ddd58bc11efb5b66aaa7e39d76', 'e517f16a886768e5213d5c39390ac99f861e9cefd2211915f2ec667e7b3239e8bc4585374c088fc4', 0, '2023-01-17 23:17:00'),
('9c122302b7d8d7bade86a5d25b74913b25cff7bd20f63a594d91ddb6d16933cbae515e4fbd7e51a1', 'cb9c232dcf8696abc76327adc1817b14b1dd11a866a702c5123a49685a97575cee303c64065bdbe7', 0, '2023-01-17 22:44:40'),
('a063a699a42b3a53fe33e9e2851c78bc9fbd99afa307177e4de77a996a8b3ee2447543a09831b5b7', 'd5f8a64e24ce514245597f1079c7e2b110d15766ab0a3a6d4e5f91ff928d6fc51db50db66e9e480a', 0, '2023-01-27 12:48:17'),
('a29e19054fccbb1dc95c01a65a6e11de96bb4680a42cbc18c08ac35577f19df97b65ca2f3d324298', '7d18ff2e43df52f217866de9e68717d6feed3e148a0ab62e41a25b82a86ce26d41f05ec340e85361', 0, '2023-01-17 15:35:20'),
('a4265302f25f7a7c75341687c88eb66bc398275da6aeb02de2da152fcd1b580a0ac6f3ef3f55c0f0', '03362c893783f2523894bbffd0a758d487cf07a30fa8a3dd17609c4ba2705dd79b288cb859dc570d', 0, '2023-01-20 21:41:09'),
('a83a744a703a68cbcbe1463c53e114f32a12f7318522229d54dd99e9f851154b1ddbcb8dfb8be1f1', '6bbd206410cc48eb0d810f2fb7b756f77ae3175a333da73989b4e9cc57b53d1f1a2e5d919f2ac639', 0, '2023-01-27 07:43:35'),
('ac0f75317a77f9c1e1cb38d29423badb5f858596c635190a44cde3b824fe32a637c24a84f8a598fa', '9f1eab95ff8577f0f7cdff4a65a87416614d98466bec16a32c5b3f1bdc3dcb9b10f759ba2cf70822', 0, '2023-01-20 19:47:34'),
('b24d6ba99dd2be3b2b1a7a61454c694d38a09bdc827c79d698e644dcaaa6c65ee8171e9581d94ffb', '28b2c0db63867350249232d142214cd35f59eacaa17bc7dc76117b051ea36cb5d6b67a865bb83b6b', 0, '2023-01-20 23:19:54'),
('b4fc55ded2e4ae065ede0243569fe9a2ff90e5e8b482f38ce3feb3605bbe33f10450854ea593a689', 'bd43ad0e7b39f3774500a3de42a8f152458e7a412b7bc1104b99fe58fa5476926d38cdcd2b9935a4', 0, '2023-01-27 10:34:25'),
('b7f0046a712619fc193d4bb7d2202d3ff2ec05192f57646b8e4acb6ce3f7462f12c8ca0b01214f7d', '267e7dd5510c7312c1c1248f0652ea7af9042e74ed9e284fd1aae6cdc74a4eea337d2c7d8f6070ed', 0, '2023-01-27 07:35:05'),
('bc84a56f69c0c2b89abd47edc9fc9b6f02c6eefa50cbdb6988344948f27af1a63bf89a97d55217f7', '1cadebffbf851cfe0eff08b89a435eff93dc7bb864e7f1f72deb8875dc22f46f9b33a51ed83df049', 1, '2023-01-17 22:15:54'),
('bd9999b9e8fea6b5a45a95073962600f5562210d43740aeeba194ee808c1abf2f3b0b98ddcd2191b', '11ea7565bdfe96b1b914ffc52ea5a02da45f95e3505633e1bef8b18b3f7df2d2222e8a82cf14f6d9', 0, '2023-01-17 16:08:20'),
('c0f7fecd5f3af4394cf230abdbe9f17bad906b12fddae4a896a51de08747bc94d67ba6a9c86ac4b8', '4fa189d28e4421d64f97da8bfe2eb071ad0675ac22fd3c99c687e38e5b08fca1728200a2c898a034', 0, '2023-01-28 09:18:50'),
('c22eb92415501773d1996b754c93ca27a80afcbbe231ccbcdb3b4a48b23bb6462f7557f3fa093ea8', 'c4f4c560eee4daca2af53a3ed827b784cc7ff4fd4d064d1b0695723078dd266d4b94758d20187e67', 0, '2023-01-14 15:47:57'),
('c35560439c599e94b0d57caaa0c5e3019896cc088039f720be6405843d2244f97d37ebcc5cc160c3', 'ad56c867bffa4b9a6ec2bbe9734177cceff6fa5b77f33f547e595cb00834411bee54e085260dd408', 0, '2023-01-14 19:27:52'),
('c3c0c9fd5cba5ad48977c69038f602900617a3173fa7e993363e5d46e5cc76128f7ef564ce3e1efa', '4c47c534d5e43573a8527f9861d63c427520d8410a6206c42a91fd6e79f1fb53a88f85e9c1e96250', 0, '2023-01-27 10:04:43'),
('c460caee834dfcd9ce48bf2a85eff7f629f4b018b86e2ad795df0e83798ca954a6b410c593ea8edf', 'bb90880b3a687432c92cf24256d6b9ac0c5e40472306251743e9a290ea841218da3080be9ae6962a', 1, '2023-01-17 15:28:03'),
('c5561794d4946782ac63f23c79b17a36a5e2e9ea25ab7a962acfef3dcade4c45b0191e40402f53e5', '88bd34a6e13e2c1e0fe39dfb6fd1fc2911562e8435696a564b50c14e4991be5b5fbf3b3dc055a526', 1, '2023-01-14 22:43:42'),
('c623d3abbed4d96ea1975ed8134e57e567652e47f941152297c2c2758589f2bb833b8cffbded4a26', '16a25ce858a646e7b575bb808bb534f3e643a3be76318d00e26fb85e95ca0f89fe4542a8d8e215bb', 1, '2023-01-17 20:56:54'),
('c86a03721777bb3c5570fb8b1ed1cd7b8c5217781ea2afa59a4febd860ccbd632eb62d4186257df9', '20156902f2f4d2fe5eb27a73cecc5002fe444ff39bdd0678b88ccba32903017707c304896ce970f0', 0, '2023-01-14 15:44:01'),
('cc1bb9f421de8ad5c6805044a45be469e4e667e6e6cfe695612aff192a908c156a3e0ef624fda4ea', '934f4d26d3e898c3a78acac58d4f2eebca496ddbe9cde41fde2835df76e127f463f3cf35d35c388f', 1, '2023-01-17 22:24:40'),
('cf99d5cb59c34a6adc9dbd92390fb8c51e2ed5a0d4063d87c4e6846717f26b8ff22706df7cb48af6', '250d4b1b46af947e1d7df89c228fd5c88fb75f4465c27f5905cdcd93be11892845efc3497019de25', 0, '2023-01-20 19:37:09'),
('d1bd833e04ee8dd8a2690109a7e7888431090f0d234cfabffe27485e42a8e0f9f01885238fb5ab4e', '629dfe8e776c20781bd13c52362880b52c07835139714d309cb7fadc33cdc3f9df2a718e6c17707d', 0, '2023-01-27 07:36:47'),
('d48dd3c5854bc1f785faa92062a7f44b21a1925ea11516f100fb1d024ab32d2db16211ee80e4cccc', '19a0b7b2feaeb1d629c21be4011d3a0130ef088091ef89be012aa5b4e44e9142d1eeaf2a9f04bca3', 0, '2023-01-17 20:43:44'),
('d74757d0717e7858aaef621216a536791b398f58a0725f07bce22c72e8e9b58e27087d62dc5b3ee1', '349df993c27b02f97cb71de7f6fcb981394d169e41ff8f6adbbd56fb16145f3f5dec9c0b45f573be', 1, '2023-01-14 22:25:39'),
('d82f82f12e86aad6fe0bf04225b48a8c0f90e7e4cc0673336a73f05e1be77e9e7479666272ea3cd0', 'eb08c067b18c73179c25723f5b1f57277f5b597c70199c29529f75611023a3900c3870cfd4529aa4', 0, '2023-01-17 22:15:39'),
('dcd77897899475fee0aa6d9e2c5e6e433c32b0ac29edf6c20dbd8ce71c547ca2f3fbe98e2724e7dd', '81aa58b2089ecb03f92b13338b1cda3559a7a2cc599ed5e0d721f16016adf71e798fe2c1dce36c09', 0, '2023-01-17 20:40:52'),
('e2645a87c933c93ae4e055d7927bb21d1b651339b22d3f7e36706b1d296f24bf14e8c5e39c5139c7', 'd29cbeccde155c0d5fb0b64338f54cbd80b59b2d9cfcb890a3aca1da32c1e64be290db6174a68b73', 0, '2023-01-20 20:14:33'),
('e91b67e7d7df26506b6a8b298544c13c1b81ffd3c054c92f330e2e21da62d5ac1711b7becedd0ce2', 'f89d27e34b8caec3f3aa5216b4c7cb8780caa2ad01087a76b1141c21c7fe0306c70ea5405e26fe7b', 0, '2023-02-09 05:55:44'),
('ef09f89d4c516ff8518042cb83872265078bb0bb19c93a61777cd51a252ab8cfd46c20c4b094d9ba', 'e1b532d158dbb8974b61e04b45435ab71e357e15b1a3cea78d4ca5368da145db4d7877254f853e1c', 0, '2023-01-20 23:06:29'),
('f099e3f9104be2a4126634b41d277bd50fbe1378a653d39c96e7f37d8806e4a3bd8b3556a898b1cb', '1a8982f6dca8a4f7ee6f21e75b62e893f34627f45ae7c67002cf288430af935decdf48fa528ceff3', 0, '2023-01-14 15:52:25'),
('f31aa5dc09c97478bbe270e2bc440b04dfa45600cda742aca5609658c2eaf7adce126060f8567e54', '9485a518caed41e0742886bfd78f5e67b36cad4f87ca3bb82f0134854937182031934db76ae1d2b5', 0, '2023-02-09 06:03:30'),
('f8de7cb1a017deacd2a307342bafc2e341449d465a4417d37840b5a968e388eeaa2ac1dc5e390f36', '749ad87d5c8e8cff1b478a36d2d317f97b8297a808c56b936c5627e9be8ca80b06fd80b7b4a67748', 0, '2023-01-14 15:49:22'),
('fa64088ee3bfee72f5be6bc8cc4814600eabb3d20939fad3b7c35d7a46ed635aa23f070d1e7c8cc4', '27c7cf961f81a601deb258800222e894395252d3f01eda3e6fa7a287bc28287913518b33ac30fbf5', 0, '2023-01-17 23:12:49'),
('fcbac24570ec5544a715c824ad4b96421cc007cc2fe75b2f264cd92233c762b5f0fb30bc28cb0893', 'cd83a5ac8fc3e1cfd8797aaed25c549f49f5c6785372385d977bdfec3497c6eb2fc84d1950002cc1', 0, '2023-01-14 15:42:04'),
('fe8c0e6078364113343485d9098dee7def7f95b01bce52c49888895d66cb3e5ef5857a1a9c10b592', 'eb65c701529576822c7d2cd1f0cec3edd446c46c2f2bb370fbfec52483057b9b962b40c72f8ecd04', 0, '2023-01-27 07:37:50');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pre_users`
--

CREATE TABLE `pre_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `otp` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pre_users`
--

INSERT INTO `pre_users` (`id`, `email`, `otp`, `created_at`, `updated_at`) VALUES
(3, 'ammar@yahoo.com', 2907, '2022-01-17 12:53:47', '2022-01-17 12:59:36'),
(4, 'ammar1@yahoo.com', 9773, '2022-01-17 12:54:20', '2022-01-17 13:35:28'),
(5, 'ammar22@yahoo.com', 5755, '2022-01-17 15:51:35', '2022-01-17 15:51:35'),
(6, 'apo1@yahoo.com', 7931, '2022-01-17 15:58:28', '2022-01-17 15:58:28'),
(7, 'apo5@yahoo.com', 5446, '2022-01-17 16:07:02', '2022-01-17 16:07:02'),
(8, 'a00@yahoo.com', 8322, '2022-01-17 16:44:42', '2022-01-17 16:44:42'),
(9, 'a000@yahoo.com', 2636, '2022-01-17 16:48:52', '2022-01-17 16:48:52'),
(10, 'a0000@yahoo.com', 8744, '2022-01-17 17:04:03', '2022-01-17 17:04:03'),
(11, 'a1@yahoo.com', 4279, '2022-01-17 17:05:34', '2022-01-17 17:05:34'),
(12, 'a11@yahoo.com', 5055, '2022-01-17 17:10:18', '2022-01-17 17:10:18'),
(13, 'a110@yahoo.com', 2741, '2022-01-17 17:12:03', '2022-01-17 17:12:03'),
(14, 'noahconner1512@gmail.com', 1910, '2022-01-17 17:41:41', '2022-02-01 07:42:54'),
(15, 'ddfgdf@gmail.com', 5911, '2022-01-20 14:38:25', '2022-01-20 14:38:25'),
(16, 'uzair@gmail.com', 7239, '2022-01-20 17:11:05', '2022-01-20 17:11:05'),
(17, 'ammarali1208@gmail.com', 6375, '2022-01-24 01:02:18', '2022-01-24 07:19:19'),
(18, 'fostile@gmail.com', 1392, '2022-01-27 00:34:02', '2022-01-27 00:34:02');

-- --------------------------------------------------------

--
-- Table structure for table `restaurents`
--

CREATE TABLE `restaurents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `restaurents`
--

INSERT INTO `restaurents` (`id`, `user_id`, `city`, `state`, `country`, `address`, `created_at`, `updated_at`) VALUES
(13, 49, 'Karachi', 'Sindh', 'Pakistan', '172-B, Najeeb Center, Shahrah-e-Qaideen, Tariq Rd, P.E.C.H.S Block 2 Block 2 PECHS, Karachi, Karachi City, Sindh, Pakistan', '2022-01-28 02:16:14', '2022-01-28 02:16:14');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latlng` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verification_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `image`, `phone`, `email`, `email_verified_at`, `type`, `status`, `password`, `latlng`, `verification_code`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Code With Ammar', NULL, NULL, 'info@yahoo.com', NULL, 'user', 'active', '$2y$10$t6OualhBR/HPI/nFAWQ92.xv92j2dnLs5K5knKULDI/anTqo39mtG', NULL, '0', NULL, NULL, NULL),
(49, 'McDonald', 'mcdonald.png', '090078601', 'mcdonald@mcdonald.com', NULL, 'restaurant ', 'active', '$2y$10$zSrdeQ2LwuV9DKx.ru1buODyJ6L0SXt3NWl7GT12ZYmDfwd0N8hEC', '24.8646255,67.0568941', 'McDonald-97909', NULL, '2022-01-28 02:16:14', '2022-01-28 02:16:14');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `deals`
--
ALTER TABLE `deals`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `pre_users`
--
ALTER TABLE `pre_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restaurents`
--
ALTER TABLE `restaurents`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `deals`
--
ALTER TABLE `deals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pre_users`
--
ALTER TABLE `pre_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `restaurents`
--
ALTER TABLE `restaurents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
