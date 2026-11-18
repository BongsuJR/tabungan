-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 15 Jun 2020 pada 07.39
-- Versi server: 10.1.37-MariaDB
-- Versi PHP: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tabungan`
--

-- --------------------------------------------------------


--
-- Struktur dari tabel `tb_pengguna`
--

CREATE TABLE `tb_pengguna` (
  `id_pengguna` int(11) NOT NULL,
  `nama_pengguna` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(15) NOT NULL,
  `level` enum('Administrator','Wali Murid') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_pengguna`
--

INSERT INTO `tb_pengguna` (`id_pengguna`, `nama_pengguna`, `username`, `password`, `level`) VALUES
(1, 'Epi Kurnia', 'epi', '1', 'Administrator'),
(2, 'Orang Tua Siswa', 'wali', '1', 'Wali Murid');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_profil`
--

CREATE TABLE `tb_profil` (
  `id_profil` int(11) NOT NULL,
  `nama_sekolah` varchar(200) NOT NULL,
  `alamat` varchar(400) NOT NULL,
  `akreditasi` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_profil`
--

INSERT INTO `tb_profil` (`id_profil`, `nama_sekolah`, `alamat`, `akreditasi`) VALUES
(1, 'TK Nurul Falah', 'Rumbio Jaya', 'A');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_siswa`
--

CREATE TABLE `tb_siswa` (
  `nis` char(12) NOT NULL,
  `nama_siswa` varchar(40) NOT NULL,
  `jekel` enum('Laki-Laki','Perempuan') NOT NULL,
  `kelas` varchar(10) NOT NULL,
  `status` enum('Aktif','Lulus','Pindah') NOT NULL,
  `th_masuk` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_siswa`
--

  INSERT INTO `tb_siswa` (`nis`, `nama_siswa`, `jekel`, `kelas`, `status`, `th_masuk`) VALUES
  ('100', 'Abdul', 'Laki-Laki', 'Kelas A', 'Aktif', 2022),
  ('123', 'Ana', 'Perempuan', 'Kelas A', 'Aktif', 2022),
  ('124', 'Una', 'Perempuan', 'Kelas B', 'Aktif', 2022),
  ('145', 'Candra', 'Laki-Laki', 'Kelas C', 'Aktif', 2022);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_tabungan`
--

CREATE TABLE `tb_tabungan` (
  `id_tabungan` int(11) NOT NULL,
  `nis` char(12) NOT NULL,
  `setor` int(11) NOT NULL,
  `tarik` int(11) NOT NULL,
  `tgl` date NOT NULL,
  `jenis` enum('ST','TR') NOT NULL,
  `petugas` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_tabungan`
--

INSERT INTO `tb_tabungan` (`id_tabungan`, `nis`, `setor`, `tarik`, `tgl`, `jenis`, `petugas`) VALUES
(39, '123', 20000, 0, '2022-11-01', 'ST', 'Epi Kurnia'),
(40, '124', 5000, 0, '2022-11-01', 'ST', 'Epi Kurnia'),
(41, '145', 50000, 0, '2022-11-01', 'ST', 'Epi Kurnia'),
(42, '123', 50000, 0, '2022-11-01', 'ST', 'Epi Kurnia'),
(43, '145', 20000, 0, '2022-11-02', 'ST', 'Epi Kurnia'),
(44, '124', 10000, 0, '2022-11-02', 'ST', 'Epi Kurnia'),
(45, '145', 0, 50000, '2022-11-02', 'TR', 'Epi Kurnia'),
(46, '124', 20000, 0, '2022-11-19', 'ST', 'Epi Kurnia'),
(47, '124', 0, 30000, '2022-11-19', 'TR', 'Epi Kurnia');

--
-- Indexes for dumped tables
--


--
-- Indeks untuk tabel `tb_pengguna`
--
ALTER TABLE `tb_pengguna`
  ADD PRIMARY KEY (`id_pengguna`);

--
-- Indeks untuk tabel `tb_profil`
--
ALTER TABLE `tb_profil`
  ADD PRIMARY KEY (`id_profil`);

--
-- Indeks untuk tabel `tb_siswa`
--
ALTER TABLE `tb_siswa`
  ADD PRIMARY KEY (`nis`);

--
-- Indeks untuk tabel `tb_tabungan`
--
ALTER TABLE `tb_tabungan`
  ADD PRIMARY KEY (`id_tabungan`),
  ADD KEY `nis` (`nis`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--


--
-- AUTO_INCREMENT untuk tabel `tb_pengguna`
--
ALTER TABLE `tb_pengguna`
  MODIFY `id_pengguna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tb_profil`
--
ALTER TABLE `tb_profil`
  MODIFY `id_profil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tb_tabungan`
--
ALTER TABLE `tb_tabungan`
  MODIFY `id_tabungan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_tabungan`
--
ALTER TABLE `tb_tabungan`
  ADD CONSTRAINT `tb_tabungan_ibfk_1` FOREIGN KEY (`nis`) REFERENCES `tb_siswa` (`nis`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
