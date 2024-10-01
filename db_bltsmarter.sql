-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 01, 2024 at 04:12 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_bltsmarter`
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
-- Table structure for table `forms`
--

CREATE TABLE `forms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kriterias`
--

CREATE TABLE `kriterias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `prioritas` int(11) NOT NULL,
  `bobot` double(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kriterias`
--

INSERT INTO `kriterias` (`id`, `nama`, `prioritas`, `bobot`, `created_at`, `updated_at`) VALUES
(1, 'Stock Habis', 1, 0.52, '2024-07-11 21:49:34', '2024-07-11 23:09:28'),
(2, 'Stock', 2, 0.27, '2024-07-11 21:49:39', '2024-07-11 23:09:28'),
(3, 'Penjualan', 3, 0.15, '2024-07-11 21:49:46', '2024-07-11 23:09:28'),
(4, 'Kategori', 4, 0.06, '2024-07-11 23:09:28', '2024-07-11 23:09:28');

-- --------------------------------------------------------

--
-- Table structure for table `masyarakats`
--

CREATE TABLE `masyarakats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `NIK` bigint(20) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `jenis_kelamin` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_01_12_093418_create_masyarakats_table', 1),
(6, '2023_01_12_093517_create_kriterias_table', 1),
(7, '2023_01_12_093551_create_subkriterias_table', 1),
(8, '2023_01_12_093644_create_penilaian_table', 1),
(9, '2023_01_17_212446_create_tb_user_table', 1),
(10, '2023_06_09_033442_create_forms_table', 1),
(11, '2023_06_09_033527_create_penilaianforms_table', 1),
(12, '2024_07_12_020457_create_produks_table', 2);

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
-- Table structure for table `penilaian`
--

CREATE TABLE `penilaian` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `produk_id` bigint(20) UNSIGNED NOT NULL,
  `subkriteria_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `penilaian`
--

INSERT INTO `penilaian` (`id`, `produk_id`, `subkriteria_id`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '2024-08-06 23:44:53', '2024-08-06 23:44:53'),
(2, 1, 4, '2024-08-06 23:44:53', '2024-08-06 23:44:53'),
(3, 1, 6, '2024-08-06 23:44:53', '2024-08-06 23:44:53'),
(4, 1, 10, '2024-08-06 23:44:53', '2024-08-06 23:44:53'),
(5, 2, 2, '2024-08-06 23:44:53', '2024-08-06 23:44:53'),
(6, 2, 4, '2024-08-06 23:44:53', '2024-08-06 23:44:53'),
(7, 2, 6, '2024-08-06 23:44:53', '2024-08-06 23:44:53'),
(8, 2, 9, '2024-08-06 23:44:53', '2024-08-06 23:44:53'),
(9, 3, 2, '2024-08-06 23:44:53', '2024-08-06 23:44:53'),
(10, 3, 5, '2024-08-06 23:44:53', '2024-08-06 23:44:53'),
(11, 3, 6, '2024-08-06 23:44:53', '2024-08-06 23:44:53'),
(12, 3, 12, '2024-08-06 23:44:53', '2024-08-06 23:44:53'),
(13, 4, 1, '2024-08-06 23:44:53', '2024-08-06 23:44:53'),
(14, 4, 3, '2024-08-06 23:44:53', '2024-08-06 23:44:53'),
(15, 4, 8, '2024-08-06 23:44:53', '2024-08-06 23:44:53'),
(16, 4, 9, '2024-08-06 23:44:53', '2024-08-06 23:44:53'),
(17, 5, 2, '2024-08-06 23:44:53', '2024-08-06 23:44:53'),
(18, 5, 5, '2024-08-06 23:44:53', '2024-08-06 23:44:53'),
(19, 5, 6, '2024-08-06 23:44:53', '2024-08-06 23:44:53'),
(20, 5, 9, '2024-08-06 23:44:53', '2024-08-06 23:44:53'),
(21, 6, 2, '2024-08-06 23:44:53', '2024-08-06 23:44:53'),
(22, 6, 5, '2024-08-06 23:44:53', '2024-08-06 23:44:53'),
(23, 6, 6, '2024-08-06 23:44:53', '2024-08-06 23:44:53'),
(24, 6, 9, '2024-08-06 23:44:53', '2024-08-06 23:44:53'),
(25, 7, 2, '2024-08-06 23:44:53', '2024-08-06 23:44:53'),
(26, 7, 5, '2024-08-06 23:44:53', '2024-08-06 23:44:53'),
(27, 7, 8, '2024-08-06 23:44:53', '2024-08-06 23:44:53'),
(28, 7, 12, '2024-08-06 23:44:53', '2024-08-06 23:44:53'),
(29, 8, 2, '2024-08-06 23:44:53', '2024-08-06 23:44:53'),
(30, 8, 5, '2024-08-06 23:44:53', '2024-08-06 23:44:53'),
(31, 8, 6, '2024-08-06 23:44:53', '2024-08-06 23:44:53'),
(32, 8, 9, '2024-08-06 23:44:53', '2024-08-06 23:44:53'),
(33, 9, 2, '2024-08-06 23:44:53', '2024-08-06 23:44:53'),
(34, 9, 5, '2024-08-06 23:44:53', '2024-08-06 23:44:53'),
(35, 9, 6, '2024-08-06 23:44:53', '2024-08-06 23:44:53'),
(36, 9, 9, '2024-08-06 23:44:53', '2024-08-06 23:44:53'),
(37, 10, 1, '2024-08-06 23:44:53', '2024-08-06 23:44:53'),
(38, 10, 3, '2024-08-06 23:44:53', '2024-08-06 23:44:53'),
(39, 10, 6, '2024-08-06 23:44:53', '2024-08-06 23:44:53'),
(40, 10, 9, '2024-08-06 23:44:53', '2024-08-06 23:44:53'),
(41, 11, 2, '2024-08-06 23:44:53', '2024-08-06 23:44:53'),
(42, 11, 5, '2024-08-06 23:44:53', '2024-08-06 23:44:53'),
(43, 11, 7, '2024-08-06 23:44:53', '2024-08-06 23:44:53'),
(44, 11, 10, '2024-08-06 23:44:53', '2024-08-06 23:44:53'),
(45, 12, 1, '2024-08-06 23:44:53', '2024-08-06 23:44:53'),
(46, 12, 3, '2024-08-06 23:44:53', '2024-08-06 23:44:53'),
(47, 12, 6, '2024-08-06 23:44:53', '2024-08-06 23:44:53'),
(48, 12, 10, '2024-08-06 23:44:53', '2024-08-06 23:44:53');

-- --------------------------------------------------------

--
-- Table structure for table `penilaianforms`
--

CREATE TABLE `penilaianforms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `form_id` bigint(20) UNSIGNED NOT NULL,
  `subkriteria_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `produks`
--

CREATE TABLE `produks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `harga` varchar(255) NOT NULL,
  `kategori` varchar(255) NOT NULL,
  `stock` bigint(20) NOT NULL,
  `sold` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `produks`
--

INSERT INTO `produks` (`id`, `nama`, `harga`, `kategori`, `stock`, `sold`, `created_at`, `updated_at`) VALUES
(1, 'ABC Sarden Saus Tomat 155 g', '12300', 'Mingguan', 11, 7200, '2024-07-11 19:33:10', '2024-07-11 23:17:26'),
(2, 'Lemonilo Mie Instan Goreng 65g', '5900', 'Harian', 53, 1700, '2024-07-11 19:33:44', '2024-07-11 23:17:36'),
(3, 'MEIDIAN GREEN TEA STICK MASKER', '6400', 'Bulanan', 94244, 14700, '2024-07-11 19:34:46', '2024-07-11 23:17:42'),
(4, 'Milku Susu UHT Coklat Premium 200 ml', '2900', 'Harian', 0, 69, '2024-07-11 19:35:47', '2024-07-11 23:17:50'),
(5, 'MOMOTARO Kukis Shortbread AOKA - Netto 45gr', '1999', 'Harian', 611, 4000, '2024-07-11 19:36:21', '2024-07-11 23:17:56'),
(6, 'Pocky Wafer Stick Half Size- Netto 22 gr', '3850', 'Harian', 2311, 26700, '2024-07-11 19:37:19', '2024-07-11 23:18:15'),
(7, 'ABC Saus Sambal Extra Pedas 950 g', '31100', 'Bulanan', 1084, 208, '2024-07-11 19:37:59', '2024-07-11 23:18:08'),
(8, 'SUN KARA SANTAN kelapa siap pakai 65ml', '3099', 'Harian', 73907, 2700, '2024-07-11 19:38:43', '2024-07-11 23:18:23'),
(9, 'LADAKU MERICA BUBUK ISI 12', '10900', 'Harian', 2378, 22200, '2024-07-11 19:39:23', '2024-07-11 23:18:29'),
(10, 'Royco Bumbu Kaldu Mpasi Kaldu Jamur Tanpa Penguat Rasa 170G', '13800', 'Harian', 0, 8400, '2024-07-11 19:40:11', '2024-07-11 23:18:34'),
(11, 'NUTRISARI ISI 10 SACHET', '12500', 'Mingguan', 2581, 590, '2024-07-11 19:41:26', '2024-07-11 23:18:40'),
(12, 'MINYAK GORENG SUNCO POUCH 2 liter', '36800', 'Mingguan', 0, 16900, '2024-07-11 19:43:34', '2024-07-11 23:18:46');

-- --------------------------------------------------------

--
-- Table structure for table `subkriterias`
--

CREATE TABLE `subkriterias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kriteria_id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `prioritas` int(11) NOT NULL,
  `bobot` double(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subkriterias`
--

INSERT INTO `subkriterias` (`id`, `kriteria_id`, `nama`, `prioritas`, `bobot`, `created_at`, `updated_at`) VALUES
(1, 1, 'Ya', 1, 0.75, '2024-07-11 21:49:57', '2024-07-11 21:50:04'),
(2, 1, 'Tidak', 2, 0.25, '2024-07-11 21:50:04', '2024-07-11 21:50:04'),
(3, 2, '<10', 1, 0.61, '2024-07-11 21:50:49', '2024-07-11 21:51:06'),
(4, 2, '10-100', 2, 0.28, '2024-07-11 21:50:58', '2024-07-11 21:51:06'),
(5, 2, '>100', 3, 0.11, '2024-07-11 21:51:06', '2024-07-11 21:51:06'),
(6, 3, '>1000', 1, 0.61, '2024-07-11 21:51:17', '2024-07-11 21:51:33'),
(7, 3, '500-1000', 2, 0.28, '2024-07-11 21:51:26', '2024-07-11 21:51:33'),
(8, 3, '<500', 3, 0.11, '2024-07-11 21:51:33', '2024-07-11 21:51:33'),
(9, 4, 'Harian', 1, 0.61, '2024-07-11 23:12:11', '2024-07-11 23:13:08'),
(10, 4, 'Mingguan', 2, 0.28, '2024-07-11 23:12:52', '2024-07-11 23:13:08'),
(12, 4, 'Bulanan', 3, 0.11, '2024-07-11 23:13:02', '2024-07-11 23:13:08');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`user_id`, `name`, `username`, `password`, `level`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin', '$2y$10$wy6e6.7RIbTQP8b2MVu5HeBBTRgh06dY9gwOyT5fi.d4JIEEt1s1S', 0, '2024-06-21 08:42:59', '2024-06-21 08:42:59'),
(2, 'Petugas', 'petugas', '$2y$10$jSUgCsbDpaTw2XPvi0sfNe57K9q7uHz1Pck05gFnbqIJ15k3Tm7gu', 1, '2024-06-21 08:43:15', '2024-06-21 08:43:15');

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
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `forms`
--
ALTER TABLE `forms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kriterias`
--
ALTER TABLE `kriterias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `masyarakats`
--
ALTER TABLE `masyarakats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `penilaian`
--
ALTER TABLE `penilaian`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `penilaianforms`
--
ALTER TABLE `penilaianforms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `produks`
--
ALTER TABLE `produks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subkriterias`
--
ALTER TABLE `subkriterias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `tb_user_username_unique` (`username`);

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
-- AUTO_INCREMENT for table `forms`
--
ALTER TABLE `forms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kriterias`
--
ALTER TABLE `kriterias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `masyarakats`
--
ALTER TABLE `masyarakats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `penilaian`
--
ALTER TABLE `penilaian`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `penilaianforms`
--
ALTER TABLE `penilaianforms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `produks`
--
ALTER TABLE `produks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `subkriterias`
--
ALTER TABLE `subkriterias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `user_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
