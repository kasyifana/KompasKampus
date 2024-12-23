<?php
session_start();
header('Content-Type: application/json');

// Enable error reporting for debugging
error_reporting(E_ALL);
ini_set('display_errors', 1);

require_once 'conn.php';

try {
    // Get the POST data
    $data = json_decode(file_get_contents('php://input'), true);
    
    // Validate required data
    if (!$data || empty($data['email']) || empty($data['jur1']) || empty($data['jur2']) || empty($data['jur3'])) {
        throw new Exception('Missing required data');
    }

    // Sanitize inputs
    $email = filter_var($data['email'], FILTER_SANITIZE_EMAIL);
    $jur1 = mysqli_real_escape_string($conn, $data['jur1']);
    $jur2 = mysqli_real_escape_string($conn, $data['jur2']);
    $jur3 = mysqli_real_escape_string($conn, $data['jur3']);

    // First check if email exists
    $checkStmt = $conn->prepare("SELECT email FROM akun WHERE email = ?");
    $checkStmt->bind_param("s", $email);
    $checkStmt->execute();
    $result = $checkStmt->get_result();

    if ($result->num_rows === 0) {
        throw new Exception('Email not found in database');
    }
    $checkStmt->close();

    // Prepare and execute update statement
    $updateStmt = $conn->prepare("UPDATE akun SET jur1 = ?, jur2 = ?, jur3 = ? WHERE email = ?");
    $updateStmt->bind_param("ssss", $jur1, $jur2, $jur3, $email);
    
    if ($updateStmt->execute()) {
        // Check if any rows were affected
        if ($updateStmt->affected_rows > 0) {
            echo json_encode([
                'status' => 'success',
                'message' => 'Program choices updated successfully',
                'data' => [
                    'jur1' => $jur1,
                    'jur2' => $jur2,
                    'jur3' => $jur3
                ]
            ]);
        } else {
            throw new Exception('No changes were made to the database');
        }
    } else {
        throw new Exception('Failed to update program choices: ' . $updateStmt->error);
    }

    $updateStmt->close();

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode([
        'status' => 'error',
        'message' => $e->getMessage()
    ]);
}

// Close the database connection
$conn->close();
?>
