-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 12 Apr 2025 pada 07.08
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `goassignment23`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `inventaris`
--

CREATE TABLE `inventaris` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `jumlah` bigint(20) NOT NULL,
  `lokasi` varchar(75) NOT NULL,
  `produk_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `inventaris`
--

INSERT INTO `inventaris` (`id`, `created_at`, `updated_at`, `deleted_at`, `jumlah`, `lokasi`, `produk_id`) VALUES
(1, '2025-04-12 01:08:53.666', '2025-04-12 11:11:39.519', NULL, 151, 'West Nehaburgh', 1),
(2, '2025-04-12 05:59:03.771', '2025-04-12 11:12:06.950', NULL, 10, 'North Roosevelt', 2),
(3, '2025-04-12 06:06:48.624', '2025-04-12 06:06:48.624', NULL, 489, 'Enidfurt', 3),
(4, '2025-04-12 06:18:10.867', '2025-04-12 06:18:10.867', NULL, 620, 'New Adelleside', 4),
(5, NULL, NULL, NULL, 10, 'South Jakarta', 1),
(6, '2025-04-12 10:44:55.329', '2025-04-12 10:44:55.329', NULL, 803, 'North Abigayleland', 6),
(7, '2025-04-12 10:45:31.884', '2025-04-12 10:45:31.884', NULL, 853, 'West Franciscoland', 7),
(8, '2025-04-12 10:45:39.874', '2025-04-12 10:45:39.874', NULL, 523, 'Addisonton', 8),
(9, '2025-04-12 10:53:42.708', '2025-04-12 10:53:42.708', NULL, 631, 'West Laisha', 9),
(10, '2025-04-12 10:55:18.821', '2025-04-12 10:55:18.821', NULL, 21, 'Riverside', 10);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesanans`
--

CREATE TABLE `pesanans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `jumlah` bigint(20) NOT NULL,
  `tanggal_pesan` date NOT NULL,
  `produk_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pesanans`
--

INSERT INTO `pesanans` (`id`, `created_at`, `updated_at`, `deleted_at`, `jumlah`, `tanggal_pesan`, `produk_id`) VALUES
(1, '2025-04-12 06:01:54.820', '2025-04-12 06:01:54.820', NULL, 5, '2025-04-12', 2),
(2, '2025-04-12 06:27:55.230', '2025-04-12 06:27:55.230', NULL, 4, '2025-04-12', 2),
(3, '2025-04-12 06:28:07.027', '2025-04-12 06:28:07.027', NULL, 5, '2025-04-12', 1),
(4, '2025-04-12 06:28:12.124', '2025-04-12 06:28:12.124', NULL, 1, '2025-04-12', 1),
(6, NULL, NULL, NULL, 3, '2024-10-10', 1),
(7, '2025-04-12 11:11:39.516', '2025-04-12 11:11:39.516', NULL, 2, '2025-04-12', 1),
(8, '2025-04-12 11:11:45.302', '2025-04-12 11:11:45.302', NULL, 2, '2025-04-12', 2),
(9, '2025-04-12 11:12:06.948', '2025-04-12 11:12:06.948', NULL, 2, '2025-04-12', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `produks`
--

CREATE TABLE `produks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `harga` bigint(20) NOT NULL,
  `kategori` varchar(50) NOT NULL,
  `produk_image` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `produks`
--

INSERT INTO `produks` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `deskripsi`, `harga`, `kategori`, `produk_image`) VALUES
(1, '2025-04-12 01:08:53.662', '2025-04-12 01:21:39.883', '2025-04-12 01:23:34.180', 'Handmade Cotton Chair', 'test update description', 659, '', NULL),
(2, '2025-04-12 05:59:03.769', '2025-04-12 05:59:03.769', NULL, 'Awesome Granite Car', 'Voluptatem accusantium suscipit soluta nemo ipsa.\nMaxime in ut.\nCulpa voluptate nobis accusantium dicta debitis aut dolor et.', 2, 'Frozen', NULL),
(3, '2025-04-12 06:06:48.623', '2025-04-12 06:06:48.623', NULL, 'Ergonomic Rubber Car', 'Nemo officiis in.\nFugit nisi minus autem enim doloribus quisquam.\nCorrupti rerum at eos est voluptatem.', 114, 'Metal', 'http://localhost:8080/storages/1744412808_403019_avatar_male_man_person_user_icon (1).png'),
(4, '2025-04-12 06:18:10.862', '2025-04-12 06:18:10.862', NULL, 'Small Concrete Cheese', 'Laboriosam illo rerum voluptatum consectetur earum modi omnis ut.', 453, 'Concrete', 'http://localhost:8080/storages/1744413490_photo_6242525465277481107_y.jpg'),
(5, NULL, NULL, NULL, 'Permen', 'Manisan', 10000, 'Snack', NULL),
(6, '2025-04-12 10:44:55.322', '2025-04-12 10:57:24.232', NULL, 'Handmade Plastic Soap', 'test update description', 863, '', 'http://localhost:8080/storages/1744429495_photo_6242525465277481107_y.jpg'),
(7, '2025-04-12 10:45:31.878', '2025-04-12 10:45:31.878', NULL, 'Tasty Concrete Ball', 'Delectus dolor beatae libero aut.\nProvident ipsum dolores provident deleniti nobis.\nUllam delectus itaque est omnis maiores architecto ea quia ea.\nUnde dolores dicta dolor officiis aliquam nihil ipsum molestiae rerum.', 459, 'Plastic', 'http://localhost:8080/storages/1744429531_photo_6242525465277481107_y.jpg'),
(8, '2025-04-12 10:45:39.873', '2025-04-12 10:45:39.873', NULL, 'Small Concrete Soap', 'Eveniet sint in aut.\nMolestiae expedita voluptatem facere.\nEst velit et dolorem et itaque quidem voluptatem.\nEt voluptas quam illo sunt voluptatem doloremque iure et.', 249, 'Rubber', 'http://localhost:8080/storages/1744429539_photo_6242525465277481107_y.jpg'),
(9, '2025-04-12 10:53:42.706', '2025-04-12 10:53:42.706', NULL, 'Intelligent Granite Hat', 'Dolorem et illo quia ea.\nMolestiae autem exercitationem et aut.\nQuisquam sunt veniam quam.\nMaxime aut aut exercitationem sed consequuntur in maiores.', 853, 'Wooden', 'http://localhost:8080/storages/1744430022_photo_6242525465277481107_y.jpg'),
(10, '2025-04-12 10:55:18.818', '2025-04-12 10:55:18.818', NULL, 'Refined Plastic Gloves', 'Fugiat eos harum libero.', 268, 'Plastic', 'http://localhost:8080/storages/1744430118_photo_6242525465277481107_y.jpg');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `inventaris`
--
ALTER TABLE `inventaris`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_inventaris_deleted_at` (`deleted_at`),
  ADD KEY `fk_produks_inventaris` (`produk_id`);

--
-- Indeks untuk tabel `pesanans`
--
ALTER TABLE `pesanans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_pesanans_deleted_at` (`deleted_at`),
  ADD KEY `fk_pesanans_produk` (`produk_id`);

--
-- Indeks untuk tabel `produks`
--
ALTER TABLE `produks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_produks_deleted_at` (`deleted_at`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `inventaris`
--
ALTER TABLE `inventaris`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `pesanans`
--
ALTER TABLE `pesanans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `produks`
--
ALTER TABLE `produks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `inventaris`
--
ALTER TABLE `inventaris`
  ADD CONSTRAINT `fk_produks_inventaris` FOREIGN KEY (`produk_id`) REFERENCES `produks` (`id`);

--
-- Ketidakleluasaan untuk tabel `pesanans`
--
ALTER TABLE `pesanans`
  ADD CONSTRAINT `fk_pesanans_produk` FOREIGN KEY (`produk_id`) REFERENCES `produks` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
