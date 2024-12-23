<?php
// Enable error reporting for debugging
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Database configuration
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "latihan_soal";

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
            question,
            option_a,
            option_b,
            option_c,
            option_d,
            correct_answer
        FROM pai
        ORDER BY id ASC
    ");
    
    $stmt->execute();
    
    // Fetch all questions
    $questions = $stmt->fetchAll();
    
    // Check if questions were found
    if (count($questions) > 0) {
        // Format the response
        $formattedQuestions = array_map(function($question) {
            return [
                'id' => (int)$question['id'],
                'question' => htmlspecialchars_decode($question['question']),
                'options' => [
                    'A' => htmlspecialchars_decode($question['option_a']),
                    'B' => htmlspecialchars_decode($question['option_b']),
                    'C' => htmlspecialchars_decode($question['option_c']),
                    'D' => htmlspecialchars_decode($question['option_d'])
                ],
                'correct_answer' => $question['correct_answer']
            ];
        }, $questions);

        // Send successful response
        echo json_encode([
            'status' => 'success',
            'message' => 'Questions retrieved successfully',
            'data' => $formattedQuestions,
            'total' => count($formattedQuestions)
        ]);
    } else {
        // No questions found
        http_response_code(404);
        echo json_encode([
            'status' => 'error',
            'message' => 'No questions found in the database'
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