<?php
// Database configuration
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "akun";

// Create database connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Check if form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Get user input
    $email = $_POST['email'];
    $user_password = $_POST['password'];
    
    // Prepare SQL statement to prevent SQL injection
    $stmt = $conn->prepare("SELECT id, password FROM akun WHERE email = ?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();
    
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        
        // Verify password
        if (password_verify($user_password, $row['password'])) {
            // Delete account
            $delete_stmt = $conn->prepare("DELETE FROM akun WHERE id = ?");
            $delete_stmt->bind_param("i", $row['id']);
            
            if ($delete_stmt->execute()) {
                echo "Account deleted successfully";
            } else {
                echo "Error deleting account";
            }
            $delete_stmt->close();
        } else {
            echo "Invalid password";
        }
    } else {
        echo "Email not found";
    }
    
    $stmt->close();
}

$conn->close();
?>