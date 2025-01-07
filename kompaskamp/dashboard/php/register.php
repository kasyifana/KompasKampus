<?php
session_start();

// Konfigurasi database
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "akun";

// Membuat koneksi
$conn = new mysqli($servername, $username, $password, $dbname);

// Memeriksa koneksi
if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
}

// Mendapatkan data dari form register
$fullname = $_POST['fullname'];
$email = $_POST['email'];
$password = $_POST['password'];

// Mencegah SQL Injection
$fullname = $conn->real_escape_string($fullname);
$email = $conn->real_escape_string($email);
$password = $conn->real_escape_string($password);

// Hash password
$hashed_password = password_hash($password, PASSWORD_DEFAULT);

// Memeriksa apakah email sudah terdaftar
$sql = "SELECT * FROM akun WHERE email='$email'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // Email sudah terdaftar
    echo "Email sudah terdaftar. Silakan gunakan email lain.";
} else {
    // Memasukkan data pengguna baru
    $sql = "INSERT INTO akun (nama_lengkap, email, password) VALUES ('$fullname', '$email', '$hashed_password')";
    
    if ($conn->query($sql) === TRUE) {
        // Registrasi berhasil
        $_SESSION['email'] = $email;
        echo "<script>alert('Register telah berhasil, silahkan login'); window.location.href = '/kompaskamp/homebeforelogin/index.html';</script>";
        // header("Location: /kompaskamp/homebeforelogin/index.html"); // Ganti dengan halaman tujuan setelah registrasi
        
    } else {
        // Registrasi gagal
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}

$conn->close();
?>
