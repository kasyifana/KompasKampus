-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 23, 2024 at 09:38 AM
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
-- Database: `latihan_soal`
--

-- --------------------------------------------------------

--
-- Table structure for table `english_questions`
--

CREATE TABLE `english_questions` (
  `id` int(11) NOT NULL,
  `question` text NOT NULL,
  `option_a` varchar(255) NOT NULL,
  `option_b` varchar(255) NOT NULL,
  `option_c` varchar(255) NOT NULL,
  `option_d` varchar(255) NOT NULL,
  `correct_answer` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `english_questions`
--

INSERT INTO `english_questions` (`id`, `question`, `option_a`, `option_b`, `option_c`, `option_d`, `correct_answer`) VALUES
(1, 'What is the past tense of \"go\"?', 'Going', 'Gone', 'Went', 'Goes', 'C'),
(2, 'Which word is a synonym for \"happy\"?', 'Sad', 'Joyful', 'Angry', 'Tired', 'B'),
(3, 'Which sentence is correct?', 'He can sings well', 'He can sing well', 'He can sung well', 'He can singing well', 'B'),
(4, 'What does \"impossible\" mean?', 'Possible', 'Unlikely', 'Not able to happen', 'Interesting', 'C'),
(5, 'Choose the correct sentence.', 'She don\'t like tea', 'She doesn\'t like tea', 'She don\'t likes tea', 'She doesn\'t likes tea', 'B'),
(6, 'What is the opposite of \"young\"?', 'Old', 'Tall', 'Small', 'Big', 'A'),
(7, 'What does \"bilingual\" mean?', 'Able to speak one language', 'Able to speak two languages', 'Able to speak many languages', 'Able to speak no languages', 'B'),
(8, 'Which word is an adjective?', 'Run', 'Happiness', 'Beautiful', 'Quickly', 'C'),
(9, 'Which of these sentences is in the present continuous tense?', 'He runs every day', 'He is running right now', 'He ran yesterday', 'He will run tomorrow', 'B'),
(10, 'What is the plural form of \"child\"?', 'Children', 'Childs', 'Childes', 'Childeren', 'A'),
(11, 'Which of these is a preposition?', 'In', 'Quickly', 'Tall', 'Running', 'A'),
(12, 'Which word is a noun?', 'Quick', 'Quickly', 'Quickness', 'Quicker', 'C'),
(13, 'Which sentence uses the correct form of \"there\"?', 'There going to the park', 'Their going to the park', 'They\'re going to the park', 'There is going to the park', 'C'),
(14, 'What is the comparative form of \"good\"?', 'Gooder', 'Best', 'Better', 'More good', 'C'),
(15, 'Which of the following is a verb?', 'Happy', 'Happiness', 'Running', 'Quick', 'C'),
(16, 'Which sentence is correct?', 'I have seen him yesterday', 'I saw him yesterday', 'I seen him yesterday', 'I seeing him yesterday', 'B'),
(17, 'What is the past tense of \"eat\"?', 'Eats', 'Ate', 'Eaten', 'Eating', 'B'),
(18, 'Which word is a conjunction?', 'And', 'Red', 'Quick', 'Blue', 'A'),
(19, 'Choose the correct sentence.', 'She can plays the piano', 'She can play the piano', 'She can playing the piano', 'She can played the piano', 'B'),
(20, 'Which of these words is an adverb?', 'Quick', 'Quickly', 'Quicker', 'Quickness', 'B'),
(21, 'Which word is an antonym of \"difficult\"?', 'Easy', 'Hard', 'Challenging', 'Complicated', 'A'),
(22, 'Which of these is the correct form of \"be\" for the sentence \"He ___ a teacher\"?', 'Is', 'Am', 'Are', 'Be', 'A'),
(23, 'Which sentence is in the past perfect tense?', 'She has been to the store', 'She had been to the store', 'She goes to the store', 'She is going to the store', 'B'),
(24, 'What is the superlative form of \"big\"?', 'Bigger', 'Most big', 'Biggest', 'More big', 'C'),
(25, 'Which word is an article?', 'The', 'And', 'Quick', 'Run', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `pai`
--

CREATE TABLE `pai` (
  `id` int(11) NOT NULL,
  `question` text NOT NULL,
  `option_a` text NOT NULL,
  `option_b` text NOT NULL,
  `option_c` text NOT NULL,
  `option_d` text NOT NULL,
  `correct_answer` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pai`
--

INSERT INTO `pai` (`id`, `question`, `option_a`, `option_b`, `option_c`, `option_d`, `correct_answer`) VALUES
(1, 'Rukun Islam yang pertama adalah:', 'Shalat', 'Zakat', 'Puasa', 'Syahadat', 'D'),
(2, 'Arti dari \"Tauhid\" adalah:', 'Beriman kepada malaikat', 'Mengakui keesaan Allah', 'Beriman kepada nabi', 'Membayar zakat', 'B'),
(3, 'Kitab suci yang bukan diturunkan kepada nabi adalah:', 'Zabur', 'Al-Qur\'an', 'Injil', 'Hadits', 'D'),
(4, 'Asmaul Husna \"Ar-Rahman\" berarti:', 'Maha Adil', 'Maha Pengampun', 'Maha Pengasih', 'Maha Perkasa', 'C'),
(5, 'Rukun iman yang ke-4 adalah:', 'Beriman kepada Allah', 'Beriman kepada malaikat', 'Beriman kepada kitab-kitab', 'Beriman kepada rasul', 'D'),
(6, 'Siapakah nabi terakhir dalam Islam?', 'Nabi Musa', 'Nabi Isa', 'Nabi Muhammad', 'Nabi Ibrahim', 'C'),
(7, 'Apa itu zakat fitrah?', 'Sedekah wajib untuk fakir miskin', 'Pajak penghasilan', 'Zakat wajib sebelum Idulfitri', 'Amal jariyah', 'C'),
(8, 'Berapa jumlah rakaat dalam shalat Maghrib?', '2', '3', '4', '5', 'B'),
(9, 'Dalam shalat, apa arti gerakan sujud?', 'Menghormati Allah', 'Memohon ampunan', 'Pengakuan kebesaran Allah', 'Memulai shalat', 'C'),
(10, 'Apa hukum puasa bagi umat Islam yang baligh dan sehat?', 'Sunnah', 'Makruh', 'Wajib', 'Mubah', 'C'),
(11, 'Apa arti dari kata \"Islam\"?', 'Kesejahteraan', 'Kesucian', 'Keamanan', 'Penyerahan diri', 'D'),
(12, 'Apa isi dari kalimat tasbih?', 'Laa ilaaha illallah', 'Subhanallah', 'Alhamdulillah', 'Allahu Akbar', 'B'),
(13, 'Apa tujuan utama dari ibadah haji?', 'Membersihkan dosa', 'Mendapat pahala', 'Mendapat pengakuan', 'Mendekatkan diri kepada Allah', 'D'),
(14, 'Apa arti dari kalimat \"Subhanallah\"?', 'Maha Besar Allah', 'Maha Agung Allah', 'Maha Suci Allah', 'Maha Bijaksana Allah', 'C'),
(15, 'Sebutkan salah satu keutamaan membaca Al-Qur\'an!', 'Mendapat pahala 10 kali lipat setiap huruf', 'Bebas masuk surga', 'Menjauhkan diri dari rasa lapar', 'Mendapat ilmu dunia', 'A'),
(16, 'Nabi yang dikenal sebagai \"Khalilullah\" (kekasih Allah) adalah:', 'Nabi Musa', 'Nabi Ibrahim', 'Nabi Nuh', 'Nabi Isa', 'B'),
(17, 'Shalat lima waktu pertama kali diwajibkan pada peristiwa:', 'Isra Mikraj', 'Hijrah ke Madinah', 'Perang Badar', 'Haji Wada', 'A'),
(18, 'Surah pertama dalam Al-Qur\'an adalah:', 'Al-Baqarah', 'Al-Fatihah', 'An-Nas', 'Al-Ikhlas', 'B'),
(19, 'Hari kiamat disebut juga dengan istilah:', 'Yaumul Hisab', 'Yaumul Qiyamah', 'Yaumul Akhir', 'Yaumul Mahsyar', 'B'),
(20, 'Di antara berikut ini, manakah yang merupakan bulan haram?', 'Ramadan', 'Syawal', 'Dzulhijjah', 'Rabiul Awwal', 'C'),
(21, 'Puasa yang dilakukan pada hari Senin dan Kamis hukumnya:', 'Wajib', 'Sunnah', 'Makruh', 'Mubah', 'B'),
(22, 'Pahala shalat berjamaah lebih besar dibanding shalat sendirian sebanyak:', '20 derajat', '25 derajat', '27 derajat', '30 derajat', 'C'),
(23, 'Surah pendek yang sering dibaca dalam shalat adalah:', 'Al-Falaq', 'Al-Ikhlas', 'An-Nas', 'Al-Baqarah', 'B'),
(24, 'Rukun Haji yang pertama adalah:', 'Ihram', 'Thawaf', 'Sa\'i', 'Wukuf di Arafah', 'A'),
(25, 'Doa Qunut biasanya dibaca pada shalat:', 'Subuh', 'Isya', 'Tarawih', 'Witir', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `soal_kedokteran_dasar`
--

CREATE TABLE `soal_kedokteran_dasar` (
  `id` int(11) NOT NULL,
  `question` text NOT NULL,
  `option_a` varchar(255) NOT NULL,
  `option_b` varchar(255) NOT NULL,
  `option_c` varchar(255) NOT NULL,
  `option_d` varchar(255) NOT NULL,
  `correct_answer` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `soal_kedokteran_dasar`
--

INSERT INTO `soal_kedokteran_dasar` (`id`, `question`, `option_a`, `option_b`, `option_c`, `option_d`, `correct_answer`) VALUES
(1, 'Apa yang dimaksud dengan homeostasis dalam tubuh manusia?', 'Proses pencernaan makanan', 'Proses pengaturan suhu tubuh', 'Proses pernapasan', 'Proses pengolahan darah', 'B'),
(2, 'Organ tubuh yang berfungsi untuk memompa darah ke seluruh tubuh adalah?', 'Hati', 'Ginjal', 'Paru-paru', 'Jantung', 'D'),
(3, 'Sistem peredaran darah manusia terbagi menjadi dua, yaitu:', 'Sistem peredaran darah besar dan kecil', 'Sistem peredaran darah terbuka dan tertutup', 'Sistem peredaran darah vena dan arteri', 'Sistem peredaran darah oksigen dan karbon dioksida', 'A'),
(4, 'Proses pembentukan urine terjadi di dalam?', 'Lambung', 'Ginjal', 'Hati', 'Paru-paru', 'B'),
(5, 'Apa yang dimaksud dengan fotosintesis?', 'Proses pengolahan makanan oleh tubuh', 'Proses pembuatan makanan oleh tumbuhan dengan bantuan cahaya', 'Proses pernafasan tumbuhan', 'Proses pencernaan makanan dalam tubuh', 'B'),
(6, 'Zat yang diperlukan tumbuhan untuk fotosintesis adalah?', 'Karbon dioksida dan oksigen', 'Karbon dioksida dan air', 'Oksigen dan air', 'Oksigen dan nitrogen', 'B'),
(7, 'Apa nama organ tubuh manusia yang berfungsi untuk mengatur keseimbangan cairan dalam tubuh?', 'Hati', 'Ginjal', 'Lambung', 'Jantung', 'B'),
(8, 'Apa yang dimaksud dengan pH?', 'Ukuran keasaman atau kebasaan suatu zat', 'Ukuran berat jenis suatu zat', 'Ukuran kelarutan zat dalam air', 'Ukuran kerapatan suatu zat', 'A'),
(9, 'Senyawa kimia yang berfungsi sebagai katalis dalam reaksi biokimia tubuh adalah?', 'Enzim', 'Karbohidrat', 'Lemak', 'Protein', 'A'),
(10, 'Proses pernapasan pada manusia terjadi melalui?', 'Hidung, tenggorokan, paru-paru', 'Mulut, jantung, paru-paru', 'Mata, mulut, paru-paru', 'Tenggorokan, hati, paru-paru', 'A'),
(11, 'Apa yang terjadi pada tubuh jika kadar glukosa darah terlalu tinggi?', 'Terjadi dehidrasi', 'Terjadi hipoglikemia', 'Terjadi diabetes', 'Terjadi hipertensi', 'C'),
(12, 'Apa nama organ tubuh manusia yang berfungsi untuk menghasilkan hormon insulin?', 'Hati', 'Ginjal', 'Pankreas', 'Paru-paru', 'C'),
(13, 'Proses pencernaan makanan yang pertama kali terjadi adalah?', 'Di mulut', 'Di lambung', 'Di usus halus', 'Di usus besar', 'A'),
(14, 'Apa yang dimaksud dengan ekosistem?', 'Kelompok tumbuhan dalam suatu habitat', 'Kumpulan makhluk hidup yang saling berinteraksi dengan lingkungan', 'Sistem pencernaan pada tubuh makhluk hidup', 'Proses pertumbuhan pada tumbuhan', 'B'),
(15, 'Senyawa kimia yang membentuk dinding sel tumbuhan adalah?', 'Lignin', 'Selulosa', 'Protein', 'Karbohidrat', 'B'),
(16, 'Sifat-sifat cahaya yang paling penting dalam proses fotosintesis adalah?', 'Refleksi dan difraksi', 'Refraksi dan polarisasi', 'Absorbsi dan transmisi', 'Absorbsi dan refleksi', 'C'),
(17, 'Gas yang dihasilkan oleh tumbuhan selama fotosintesis adalah?', 'Karbon dioksida', 'Oksigen', 'Nitrogen', 'Amonia', 'B'),
(18, 'Alat yang digunakan untuk mengukur tekanan darah adalah?', 'Termometer', 'Stetoskop', 'Sphygmomanometer', 'Oximeter', 'C'),
(19, 'Berikut ini yang bukan merupakan bagian dari sistem pencernaan manusia adalah?', 'Lambung', 'Hati', 'Jantung', 'Pankreas', 'C'),
(20, 'Apa yang dimaksud dengan sel darah merah?', 'Sel yang berfungsi untuk membawa oksigen ke seluruh tubuh', 'Sel yang berfungsi untuk melawan infeksi', 'Sel yang berfungsi untuk membekukan darah', 'Sel yang berfungsi untuk mengangkut nutrisi', 'A'),
(21, 'Bahan dasar pembentukan protein dalam tubuh adalah?', 'Asam amino', 'Asam lemak', 'Glukosa', 'Mineral', 'A'),
(22, 'Sistem saraf pusat manusia terdiri dari?', 'Otak dan saraf', 'Otak dan sumsum tulang belakang', 'Otak dan otot', 'Otak dan ginjal', 'B'),
(23, 'Senyawa kimia yang dapat menyebabkan kanker jika terpapar dalam jangka panjang adalah?', 'Alkohol', 'Nikotin', 'Asam sulfat', 'Klorin', 'B'),
(24, 'Reaksi biokimia yang menghasilkan energi bagi tubuh adalah?', 'Fotosintesis', 'Respirasi sel', 'Transpirasi', 'Fermentasi', 'B'),
(25, 'Apa yang dimaksud dengan oksidasi dalam reaksi kimia?', 'Proses pelepasan elektron', 'Proses penyerapan elektron', 'Proses pembentukan gas', 'Proses pengendapan zat', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `soal_logika_analitik`
--

CREATE TABLE `soal_logika_analitik` (
  `id` int(11) NOT NULL,
  `question` text NOT NULL,
  `option_a` varchar(255) NOT NULL,
  `option_b` varchar(255) NOT NULL,
  `option_c` varchar(255) NOT NULL,
  `option_d` varchar(255) NOT NULL,
  `correct_answer` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `soal_logika_analitik`
--

INSERT INTO `soal_logika_analitik` (`id`, `question`, `option_a`, `option_b`, `option_c`, `option_d`, `correct_answer`) VALUES
(1, 'Jika semua mawar adalah bunga dan semua bunga adalah tanaman, maka yang benar adalah:', 'Semua mawar adalah tanaman', 'Beberapa mawar adalah tanaman', 'Beberapa mawar adalah bunga', 'Semua mawar adalah bunga', 'A'),
(2, 'Jika dua pernyataan pertama benar, apakah pernyataan terakhir benar? \"Semua kucing adalah hewan. Semua hewan adalah makhluk hidup. Oleh karena itu, semua kucing adalah makhluk hidup.\"', 'Ya', 'Tidak', 'Tidak dapat ditentukan', 'Sebagian benar', 'A'),
(3, 'Angka mana yang logis menggantikan tanda tanya? 2, 5, 10, 17, ?', '26', '30', '28', '24', 'B'),
(4, 'Semua bujangan tidak menikah. John adalah seorang bujangan. Pernyataan yang benar adalah:', 'John sudah menikah', 'John belum menikah', 'John seorang wanita', 'John bukan manusia', 'B'),
(5, 'Cari angka yang hilang: 3, 6, 9, 12, ?', '14', '15', '18', '17', 'B'),
(6, 'Jika semua apel berwarna merah dan beberapa benda merah manis, maka yang benar adalah:', 'Semua apel manis', 'Beberapa apel manis', 'Tidak ada apel yang manis', 'Semua benda manis adalah apel', 'B'),
(7, 'Jika \"A\" lebih tinggi dari \"B\" dan \"B\" lebih tinggi dari \"C\", maka:', 'A lebih tinggi dari C', 'C lebih tinggi dari A', 'B lebih tinggi dari C', 'Tidak dapat disimpulkan', 'A'),
(8, 'Jika semua mahasiswa suka matematika dan beberapa mahasiswa menyukai fisika, maka yang benar adalah:', 'Semua mahasiswa suka fisika', 'Beberapa mahasiswa tidak suka matematika', 'Beberapa mahasiswa suka matematika dan fisika', 'Semua mahasiswa suka fisika', 'C'),
(9, 'Jika beberapa orang memiliki kucing dan beberapa orang memiliki anjing, maka yang benar adalah:', 'Semua orang memiliki kucing dan anjing', 'Beberapa orang memiliki kucing dan anjing', 'Semua orang memiliki kucing', 'Beberapa orang tidak memiliki kucing atau anjing', 'B'),
(10, 'Jika A lebih cepat dari B, dan B lebih cepat dari C, maka yang benar adalah:', 'C lebih cepat dari A', 'A lebih cepat dari C', 'B lebih cepat dari A', 'Tidak dapat disimpulkan', 'B'),
(11, 'Jika semua mobil beroda empat dan beberapa mobil berwarna merah, maka yang benar adalah:', 'Semua mobil berwarna merah', 'Beberapa mobil berwarna merah', 'Semua mobil beroda empat berwarna merah', 'Tidak ada mobil berwarna merah', 'B'),
(12, 'Jika \"X\" lebih besar dari \"Y\", dan \"Y\" lebih besar dari \"Z\", maka yang benar adalah:', 'X lebih besar dari Z', 'Z lebih besar dari X', 'Y lebih besar dari Z', 'Tidak dapat disimpulkan', 'A'),
(13, 'Angka mana yang harus menggantikan tanda tanya? 1, 4, 9, 16, ?', '25', '36', '24', '20', 'A'),
(14, 'Jika semua bunga berwarna merah dan beberapa bunga berbau harum, maka yang benar adalah:', 'Semua bunga berbau harum', 'Beberapa bunga berbau harum', 'Tidak ada bunga yang berbau harum', 'Semua bunga tidak berwarna merah', 'B'),
(15, 'Jika \"A\" lebih pintar dari \"B\" dan \"B\" lebih pintar dari \"C\", maka yang benar adalah:', 'A lebih pintar dari C', 'C lebih pintar dari A', 'B lebih pintar dari C', 'Tidak dapat disimpulkan', 'A'),
(16, 'Jika 3 dikalikan dengan 5 menghasilkan 15, dan 5 dikalikan dengan 4 menghasilkan 20, maka yang benar adalah:', 'Semua perkalian antara dua angka menghasilkan angka lebih besar', 'Perkalian dua angka dapat menghasilkan angka lebih kecil', 'Perkalian dua angka selalu menghasilkan angka yang sama', 'Tidak ada pola dalam perkalian tersebut', 'B'),
(17, 'Jika dua angka bertambah 10, maka hasilnya:', 'Lebih besar dari 10', 'Lebih kecil dari 10', 'Sama dengan 10', 'Tidak dapat ditentukan', 'A'),
(18, 'Jika A lebih lambat dari B dan B lebih lambat dari C, maka yang benar adalah:', 'A lebih cepat dari C', 'C lebih cepat dari A', 'B lebih cepat dari A', 'Tidak dapat disimpulkan', 'B'),
(19, 'Jika beberapa burung terbang dan beberapa burung berenang, maka yang benar adalah:', 'Semua burung terbang', 'Semua burung berenang', 'Beberapa burung terbang dan berenang', 'Tidak ada burung yang terbang atau berenang', 'C'),
(20, 'Jika 2 lebih kecil dari 5 dan 5 lebih kecil dari 10, maka yang benar adalah:', '2 lebih kecil dari 10', '5 lebih kecil dari 2', '10 lebih kecil dari 5', 'Tidak dapat disimpulkan', 'A'),
(21, 'Jika \"X\" lebih tinggi dari \"Y\", dan \"Y\" lebih tinggi dari \"Z\", maka yang benar adalah:', 'Z lebih tinggi dari X', 'X lebih tinggi dari Z', 'Y lebih tinggi dari Z', 'Tidak dapat disimpulkan', 'B'),
(22, 'Jika semua manusia membutuhkan oksigen dan beberapa manusia berada di bawah air, maka yang benar adalah:', 'Semua manusia bisa hidup di bawah air', 'Beberapa manusia bisa hidup di bawah air', 'Tidak ada manusia yang bisa hidup di bawah air', 'Semua manusia tidak membutuhkan oksigen', 'B'),
(23, 'Angka mana yang menggantikan tanda tanya? 3, 6, 12, 24, ?', '48', '72', '36', '56', 'A'),
(24, 'Jika beberapa buah berwarna hijau dan beberapa buah manis, maka yang benar adalah:', 'Semua buah berwarna hijau dan manis', 'Beberapa buah berwarna hijau dan manis', 'Tidak ada buah yang berwarna hijau dan manis', 'Semua buah berwarna hijau', 'B'),
(25, 'Jika A lebih tinggi dari B dan B lebih tinggi dari C, maka yang benar adalah:', 'A lebih tinggi dari C', 'C lebih tinggi dari A', 'B lebih tinggi dari C', 'Tidak dapat disimpulkan', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `soal_matematika_aritmatika`
--

CREATE TABLE `soal_matematika_aritmatika` (
  `id` int(11) NOT NULL,
  `question` text NOT NULL,
  `option_a` varchar(255) NOT NULL,
  `option_b` varchar(255) NOT NULL,
  `option_c` varchar(255) NOT NULL,
  `option_d` varchar(255) NOT NULL,
  `correct_answer` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `soal_matematika_aritmatika`
--

INSERT INTO `soal_matematika_aritmatika` (`id`, `question`, `option_a`, `option_b`, `option_c`, `option_d`, `correct_answer`) VALUES
(1, 'Berapa hasil dari 15 + 8?', '20', '22', '23', '25', 'C'),
(2, 'Jika x = 5, berapa nilai dari 3x + 7?', '12', '17', '22', '15', 'C'),
(3, 'Hasil dari 12 x 8 acdalah?', '90', '96', '100', '104', 'B'),
(4, 'Berapa hasil dari 50 ÷ 5?', '5', '8', '10', '12', 'C'),
(5, 'Jumlah dari 25 dan 35 adalah?', '50', '55', '60', '65', 'B'),
(6, 'Hasil dari 18 - 7 adalah?', '11', '12', '13', '14', 'A'),
(7, 'Jika panjang sebuah segitiga adalah 6 cm dan lebar 8 cm, berapa luas segitiga tersebut?', '24 cm²', '30 cm²', '48 cm²', '24,5 cm²', 'A'),
(8, 'Berapa hasil dari 2² + 3²?', '11', '13', '15', '17', 'B'),
(9, 'Jika 5x - 3 = 17, berapa nilai x?', '3', '4', '5', '6', 'B'),
(10, 'Berapa hasil dari 7 x 7 + 3?', '51', '52', '53', '54', 'A'),
(11, 'Jika A = 3 dan B = 4, berapa nilai dari A² + B²?', '12', '16', '18', '25', 'D'),
(12, 'Hasil dari 35 + 25 ÷ 5 adalah?', '40', '45', '50', '55', 'A'),
(13, 'Sebuah persegi memiliki panjang sisi 10 cm, berapa luas persegi tersebut?', '100 cm²', '50 cm²', '150 cm²', '200 cm²', 'A'),
(14, 'Berapa hasil dari (4 + 8) x 5?', '60', '55', '50', '45', 'A'),
(15, 'Hasil dari 14 x 3 - 5 adalah?', '37', '38', '39', '40', 'A'),
(16, 'Jika 3y + 4 = 19, maka nilai y adalah?', '4', '5', '6', '7', 'A'),
(17, 'Hasil dari 25 ÷ 5 x 3 adalah?', '10', '12', '15', '20', 'A'),
(18, 'Berapa hasil dari 9 x 6 - 12?', '42', '43', '44', '45', 'A'),
(19, 'Jika a = 6 dan b = 8, berapa nilai dari a² - b²?', '4', '10', '20', '52', 'A'),
(20, 'Hasil dari 12 x 12 + 4 adalah?', '148', '148', '140', '130', 'A'),
(21, 'Sebuah lingkaran memiliki diameter 14 cm, berapa jari-jari lingkaran tersebut?', '6 cm', '7 cm', '8 cm', '9 cm', 'B'),
(22, 'Berapa hasil dari 6³?', '116', '124', '216', '270', 'C'),
(23, 'Berapa hasil dari 10 x (3 + 5)?', '80', '70', '60', '50', 'A'),
(24, 'Jika ada 4 apel dan 3 jeruk, berapa total buah tersebut?', '5', '6', '7', '8', 'C'),
(25, 'Berapa hasil dari 10 x 10 ÷ 5?', '10', '12', '15', '20', 'A');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `english_questions`
--
ALTER TABLE `english_questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pai`
--
ALTER TABLE `pai`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `soal_kedokteran_dasar`
--
ALTER TABLE `soal_kedokteran_dasar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `soal_logika_analitik`
--
ALTER TABLE `soal_logika_analitik`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `soal_matematika_aritmatika`
--
ALTER TABLE `soal_matematika_aritmatika`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `english_questions`
--
ALTER TABLE `english_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `pai`
--
ALTER TABLE `pai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `soal_kedokteran_dasar`
--
ALTER TABLE `soal_kedokteran_dasar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `soal_logika_analitik`
--
ALTER TABLE `soal_logika_analitik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `soal_matematika_aritmatika`
--
ALTER TABLE `soal_matematika_aritmatika`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
