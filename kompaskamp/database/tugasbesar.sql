-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 23, 2024 at 09:37 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tugasbesar`
--

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `kategori` varchar(255) NOT NULL,
  `subjek` text NOT NULL,
  `detail` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `kategori`, `subjek`, `detail`) VALUES
(1, 'ui', 'Tampilan Menu Utama', 'Menu utama perlu lebih responsif di mobile view'),
(2, 'performance', 'Waktu Loading', 'Website loading terlalu lama saat membuka bagian latihan soal'),
(3, 'accuracy', 'Hasil Rekomendasi', 'Hasil rekomendasi jurusan tidak sesuai dengan inputan nilai yang saya masukkan'),
(4, 'ui', 'Font Size', 'Ukuran font di halaman beasiswa terlalu kecil untuk dibaca dengan nyaman'),
(5, 'performance', 'Error Saat Upload', 'Sering terjadi error saat mengupload dokumen persyaratan beasiswa'),
(6, 'accuracy', 'Ketepatan Prediksi', 'Hasil prediksi peluang diterima di universitas kurang akurat'),
(7, 'ui', 'Warna Background', 'Warna background terlalu terang, membuat mata cepat lelah'),
(8, 'performance', 'Responsivitas Button', 'Tombol-tombol di form pendaftaran lambat merespon saat diklik'),
(9, 'accuracy', 'Skor Penilaian', 'Skor penilaian tes minat bakat tidak sesuai dengan ekspektasi'),
(10, 'performance', 'Kecepatan Load Data', 'Data universitas loadingnya lama saat pertama kali dibuka');

-- --------------------------------------------------------

--
-- Table structure for table `gaya_belajar`
--

CREATE TABLE `gaya_belajar` (
  `id` int(11) NOT NULL,
  `soal` text NOT NULL,
  `opsi_a` text NOT NULL,
  `opsi_b` text NOT NULL,
  `opsi_c` text NOT NULL,
  `poin_a` varchar(10) NOT NULL,
  `poin_b` varchar(10) NOT NULL,
  `poin_c` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gaya_belajar`
--

INSERT INTO `gaya_belajar` (`id`, `soal`, `opsi_a`, `opsi_b`, `opsi_c`, `poin_a`, `poin_b`, `poin_c`) VALUES
(1, 'Ketika mempelajari materi baru, apa yang paling membantu Anda untuk memahami?', 'Melihat diagram atau gambar', 'Mendengarkan penjelasan', 'Melakukan simulasi atau praktik langsung', 'Visual', 'Auditorial', 'Kinestetik'),
(2, 'Apa yang biasanya Anda lakukan saat mengingat informasi?', 'Menggambar atau membuat peta konsep', 'Mengulang kata-kata atau berbicara', 'Melakukan gerakan atau aktivitas fisik', 'Visual', 'Auditorial', 'Kinestetik'),
(3, 'Bagaimana Anda lebih suka menerima instruksi?', 'Melihat petunjuk tertulis atau diagram', 'Mendengarkan seseorang menjelaskannya', 'Mencoba sendiri sambil dipandu', 'Visual', 'Auditorial', 'Kinestetik'),
(4, 'Ketika membaca buku, apa yang paling membantu Anda memahami isi?', 'Melihat ilustrasi atau grafik', 'Membaca dengan suara keras', 'Mencoba langsung apa yang dijelaskan', 'Visual', 'Auditorial', 'Kinestetik'),
(5, 'Ketika menghadiri pelajaran atau seminar, apa yang paling menarik perhatian Anda?', 'Presentasi visual seperti slide atau video', 'Penjelasan verbal dari pembicara', 'Aktivitas atau praktik langsung', 'Visual', 'Auditorial', 'Kinestetik'),
(6, 'Ketika belajar, bagaimana Anda biasanya mencatat?', 'Menggunakan warna dan diagram', 'Menulis ulang atau membaca dengan suara keras', 'Membuat catatan sambil berjalan atau bergerak', 'Visual', 'Auditorial', 'Kinestetik'),
(7, 'Ketika Anda menjelaskan sesuatu kepada orang lain, bagaimana Anda melakukannya?', 'Menggunakan gambar atau diagram', 'Berbicara dengan detail', 'Menunjukkan dengan tindakan atau gestur', 'Visual', 'Auditorial', 'Kinestetik'),
(8, 'Bagaimana Anda lebih suka menyelesaikan sebuah proyek?', 'Melihat contoh hasil akhir terlebih dahulu', 'Mendengarkan arahan atau diskusi tentang proyek', 'Langsung mencoba dan bereksperimen', 'Visual', 'Auditorial', 'Kinestetik'),
(9, 'Ketika Anda santai, kegiatan apa yang paling Anda nikmati?', 'Melihat video atau membaca buku', 'Mendengarkan musik atau podcast', 'Melakukan olahraga atau aktivitas fisik', 'Visual', 'Auditorial', 'Kinestetik'),
(10, 'Ketika Anda belajar cara menggunakan alat baru, apa yang Anda lakukan?', 'Membaca manual atau melihat diagram', 'Mendengarkan instruksi seseorang', 'Mencoba langsung menggunakannya', 'Visual', 'Auditorial', 'Kinestetik');

-- --------------------------------------------------------

--
-- Table structure for table `mbti`
--

CREATE TABLE `mbti` (
  `id` int(11) NOT NULL,
  `soal` text NOT NULL,
  `opsi_a` text NOT NULL,
  `opsi_b` text NOT NULL,
  `poin_a` varchar(4) NOT NULL,
  `poin_b` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mbti`
--

INSERT INTO `mbti` (`id`, `soal`, `opsi_a`, `opsi_b`, `poin_a`, `poin_b`) VALUES
(1, 'Ketika menghadiri pesta, apakah Anda lebih suka menjadi pusat perhatian atau mengamati dari sisi ruangan?', 'Menjadi pusat perhatian', 'Mengamati dari sisi ruangan', 'E', 'I'),
(2, 'Apakah Anda merasa lebih berenergi setelah bersosialisasi atau setelah menyendiri?', 'Setelah bersosialisasi', 'Setelah menyendiri', 'E', 'I'),
(3, 'Apakah Anda lebih suka berbicara langsung atau berpikir dulu sebelum berbicara?', 'Berbicara langsung', 'Berpikir dulu', 'E', 'I'),
(4, 'Apakah Anda sering memulai pembicaraan dengan orang baru atau lebih memilih menunggu mereka mendekati Anda?', 'Memulai pembicaraan', 'Menunggu didekati', 'E', 'I'),
(5, 'Apakah Anda lebih suka bekerja dalam tim atau sendiri?', 'Dalam tim', 'Sendiri', 'E', 'I'),
(6, 'Apakah Anda lebih suka berfokus pada fakta saat bekerja atau ide-ide abstrak?', 'Fakta', 'Ide-ide abstrak', 'S', 'N'),
(7, 'Apakah Anda lebih memperhatikan detail atau gambaran besar?', 'Detail', 'Gambaran besar', 'S', 'N'),
(8, 'Apakah Anda lebih mempercayai pengalaman langsung atau firasat?', 'Pengalaman langsung', 'Firasat', 'S', 'N'),
(9, 'Apakah Anda lebih suka metode yang telah terbukti atau mencoba pendekatan baru?', 'Metode yang terbukti', 'Pendekatan baru', 'S', 'N'),
(10, 'Apakah Anda lebih menghargai hal-hal praktis atau imajinatif?', 'Hal-hal praktis', 'Hal-hal imajinatif', 'S', 'N'),
(11, 'Ketika membuat keputusan, apakah Anda lebih mengandalkan logika atau perasaan?', 'Logika', 'Perasaan', 'T', 'F'),
(12, 'Apakah Anda lebih suka keadilan yang objektif atau belas kasih yang personal?', 'Keadilan objektif', 'Belas kasih personal', 'T', 'F'),
(13, 'Apakah Anda lebih menghargai efisiensi atau harmoni?', 'Efisiensi', 'Harmoni', 'T', 'F'),
(14, 'Apakah Anda sering mengutamakan hasil atau dampak emosional dari tindakan Anda?', 'Hasil', 'Dampak emosional', 'T', 'F'),
(15, 'Apakah Anda lebih suka memberi kritik yang jujur atau menjaga perasaan orang lain?', 'Kritik jujur', 'Menjaga perasaan', 'T', 'F'),
(16, 'Apakah Anda lebih suka membuat rencana atau membiarkan hal-hal terjadi secara spontan?', 'Membuat rencana', 'Secara spontan', 'J', 'P'),
(17, 'Apakah Anda lebih merasa nyaman dengan jadwal tetap atau fleksibel?', 'Jadwal tetap', 'Fleksibel', 'J', 'P'),
(18, 'Apakah Anda lebih suka menyelesaikan tugas sebelum tenggat atau mendekati tenggat waktu?', 'Sebelum tenggat', 'Mendekati tenggat waktu', 'J', 'P'),
(19, 'Apakah Anda lebih suka memiliki struktur yang jelas atau kebebasan untuk berimprovisasi?', 'Struktur yang jelas', 'Kebebasan', 'J', 'P'),
(20, 'Apakah Anda lebih suka menyelesaikan satu tugas sebelum memulai tugas lain atau bekerja multitasking?', 'Menyelesaikan satu tugas', 'Multitasking', 'J', 'P'),
(21, 'Ketika menghadapi konflik, apakah Anda lebih suka menyelesaikannya secara langsung atau menunggu hingga emosi reda?', 'Secara langsung', 'Menunggu emosi reda', 'T', 'F'),
(22, 'Apakah Anda lebih suka rutinitas sehari-hari atau variasi dalam aktivitas Anda?', 'Rutinitas', 'Variasi', 'J', 'P'),
(23, 'Ketika membaca buku, apakah Anda lebih menikmati fakta atau cerita imajinatif?', 'Fakta', 'Cerita imajinatif', 'S', 'N'),
(24, 'Apakah Anda lebih suka berbicara dengan teman tentang ide baru atau pengalaman sehari-hari?', 'Ide baru', 'Pengalaman sehari-hari', 'N', 'S'),
(25, 'Ketika bekerja di proyek, apakah Anda lebih suka memimpin tim atau memberikan kontribusi dari belakang layar?', 'Memimpin tim', 'Belakang layar', 'E', 'I');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gaya_belajar`
--
ALTER TABLE `gaya_belajar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mbti`
--
ALTER TABLE `mbti`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `gaya_belajar`
--
ALTER TABLE `gaya_belajar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `mbti`
--
ALTER TABLE `mbti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
