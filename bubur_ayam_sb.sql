-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 30 Sep 2026 pada 05.07
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bubur_ayam_sb`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `bahan_baku`
--

CREATE TABLE `bahan_baku` (
  `id_bahan` int(11) NOT NULL,
  `nama_bahan` varchar(100) NOT NULL,
  `satuan` varchar(30) NOT NULL,
  `stok` decimal(10,2) NOT NULL DEFAULT 0.00,
  `stok_minimum` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `bahan_baku`
--

INSERT INTO `bahan_baku` (`id_bahan`, `nama_bahan`, `satuan`, `stok`, `stok_minimum`, `created_at`) VALUES
(1, 'Beras', 'Kg', 20.00, 5.00, '2026-09-30 03:06:16'),
(2, 'Ayam', 'Kg', 10.00, 3.00, '2026-09-30 03:06:16'),
(3, 'Telur', 'Butir', 50.00, 10.00, '2026-09-30 03:06:16'),
(4, 'Cabai', 'Kg', 5.00, 1.00, '2026-09-30 03:06:16'),
(5, 'Teh', 'Gram', 500.00, 100.00, '2026-09-30 03:06:16'),
(6, 'Jeruk', 'Kg', 5.00, 1.00, '2026-09-30 03:06:16'),
(7, 'Kerupuk', 'Bungkus', 20.00, 5.00, '2026-09-30 03:06:16');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`, `deskripsi`, `created_at`) VALUES
(1, 'Bubur Ayam', 'Menu utama bubur ayam', '2026-09-30 03:06:16'),
(2, 'Minuman', 'Berbagai macam minuman', '2026-09-30 03:06:16'),
(3, 'Makanan Tambahan', 'Makanan pendamping', '2026-09-30 03:06:16');

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu`
--

CREATE TABLE `menu` (
  `id_menu` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `nama_menu` varchar(150) NOT NULL,
  `harga` decimal(12,2) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `status` enum('tersedia','habis') DEFAULT 'tersedia',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `menu`
--

INSERT INTO `menu` (`id_menu`, `id_kategori`, `nama_menu`, `harga`, `deskripsi`, `gambar`, `status`, `created_at`) VALUES
(1, 1, 'Bubur Ayam Biasa', 10000.00, 'Bubur ayam dengan suwiran ayam dan bawang goreng.', 'bubur-biasa.jpg', 'tersedia', '2026-09-30 03:06:16'),
(2, 1, 'Bubur Ayam Spesial', 15000.00, 'Bubur ayam dengan topping lebih lengkap.', 'bubur-spesial.jpg', 'tersedia', '2026-09-30 03:06:16'),
(3, 2, 'Teh Manis', 5000.00, 'Teh manis hangat atau dingin.', 'teh-manis.jpg', 'tersedia', '2026-09-30 03:06:16'),
(4, 2, 'Es Jeruk', 7000.00, 'Minuman jeruk segar.', 'es-jeruk.jpg', 'tersedia', '2026-09-30 03:06:16'),
(5, 3, 'Kerupuk', 2000.00, 'Kerupuk sebagai makanan tambahan.', 'kerupuk.jpg', 'tersedia', '2026-09-30 03:06:16');

-- --------------------------------------------------------

--
-- Struktur dari tabel `stok`
--

CREATE TABLE `stok` (
  `id_stok` int(11) NOT NULL,
  `id_bahan` int(11) NOT NULL,
  `jenis_stok` enum('masuk','keluar') NOT NULL,
  `jumlah` decimal(10,2) NOT NULL,
  `tanggal` date NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `stok`
--

INSERT INTO `stok` (`id_stok`, `id_bahan`, `jenis_stok`, `jumlah`, `tanggal`, `keterangan`, `created_at`) VALUES
(1, 1, 'masuk', 20.00, '2026-09-30', 'Pembelian beras', '2026-09-30 03:06:16'),
(2, 2, 'masuk', 10.00, '2026-09-30', 'Pembelian ayam', '2026-09-30 03:06:16'),
(3, 3, 'masuk', 50.00, '2026-09-30', 'Pembelian telur', '2026-09-30 03:06:16'),
(4, 4, 'masuk', 5.00, '2026-09-30', 'Pembelian cabai', '2026-09-30 03:06:16'),
(5, 5, 'masuk', 500.00, '2026-09-30', 'Pembelian teh', '2026-09-30 03:06:16'),
(6, 6, 'masuk', 5.00, '2026-09-30', 'Pembelian jeruk', '2026-09-30 03:06:16'),
(7, 7, 'masuk', 20.00, '2026-09-30', 'Pembelian kerupuk', '2026-09-30 03:06:16');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `nama`, `email`, `password`, `created_at`) VALUES
(1, 'Admin', 'admin@gmail.com', 'password', '2026-09-30 03:06:16');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `bahan_baku`
--
ALTER TABLE `bahan_baku`
  ADD PRIMARY KEY (`id_bahan`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`),
  ADD KEY `fk_menu_kategori` (`id_kategori`);

--
-- Indeks untuk tabel `stok`
--
ALTER TABLE `stok`
  ADD PRIMARY KEY (`id_stok`),
  ADD KEY `fk_stok_bahan` (`id_bahan`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `bahan_baku`
--
ALTER TABLE `bahan_baku`
  MODIFY `id_bahan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `stok`
--
ALTER TABLE `stok`
  MODIFY `id_stok` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `fk_menu_kategori` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `stok`
--
ALTER TABLE `stok`
  ADD CONSTRAINT `fk_stok_bahan` FOREIGN KEY (`id_bahan`) REFERENCES `bahan_baku` (`id_bahan`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
