<?php
session_start();

header('Content-Type: application/json');

// Database configuration
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "akun";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die(json_encode([
        'status' => 'error',
        'message' => 'Connection failed: ' . $conn->connect_error
    ]));
}

// Check if user is logged in
if (!isset($_SESSION['user_id'])) {
    echo json_encode([
        'status' => 'error',
        'message' => 'User not logged in'
    ]);
    exit;
}

// Get POST data
$data = json_decode(file_get_contents('php://input'), true);

if (!isset($data['recommendations']) || count($data['recommendations']) !== 4) {
    echo json_encode([
        'status' => 'error',
        'message' => 'Invalid recommendations data'
    ]);
    exit;
}

$userId = $_SESSION['user_id'];
$rek1 = $data['recommendations'][0];
$rek2 = $data['recommendations'][1];
$rek3 = $data['recommendations'][2];
$rek4 = $data['recommendations'][3];

// Update recommendations in database
$stmt = $conn->prepare("UPDATE akun SET rek1 = ?, rek2 = ?, rek3 = ?, rek4 = ? WHERE id = ?");
$stmt->bind_param("ssssi", $rek1, $rek2, $rek3, $rek4, $userId);

if ($stmt->execute()) {
    echo json_encode([
        'status' => 'success',
        'message' => 'Recommendations saved successfully'
    ]);
} else {
    echo json_encode([
        'status' => 'error',
        'message' => 'Failed to save recommendations: ' . $stmt->error
    ]);
}

$stmt->close();
$conn->close();
?>
