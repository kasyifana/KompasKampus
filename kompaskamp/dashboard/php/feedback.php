<?php
// Enable error reporting for debugging
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Database configuration
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "tugasbesar";

// Set header for JSON response
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type');

try {
    // Create connection using PDO
    $dsn = "mysql:host=$servername;dbname=$dbname;charset=utf8mb4";
    $options = [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        PDO::ATTR_EMULATE_PREPARES => false,
    ];
    
    $pdo = new PDO($dsn, $username, $password, $options);

    // Prepare and execute the query
    $stmt = $pdo->prepare("
        SELECT 
            id,
            kategori AS category,
            subjek AS subject,
            detail
        FROM feedback
        ORDER BY id ASC
    ");
    
    $stmt->execute();
    
    // Fetch all feedback
    $feedbacks = $stmt->fetchAll();
    
    // Check if feedbacks were found
    if (count($feedbacks) > 0) {
        // Send successful response
        echo json_encode([
            'status' => 'success',
            'message' => 'Feedback retrieved successfully',
            'data' => $feedbacks,
            'total' => count($feedbacks)
        ]);
    } else {
        // No feedback found
        http_response_code(404);
        echo json_encode([
            'status' => 'error',
            'message' => 'No feedback found in the database'
        ]);
    }

} catch (PDOException $e) {
    // Handle database errors
    http_response_code(500);
    echo json_encode([
        'status' => 'error',
        'message' => 'Database error occurred',
        'debug' => $e->getMessage() // Remove this line in production
    ]);
} catch (Exception $e) {
    // Handle general errors
    http_response_code(500);
    echo json_encode([
        'status' => 'error',
        'message' => 'An unexpected error occurred',
        'debug' => $e->getMessage() // Remove this line in production
    ]);
}
?>
