<?php
header('Content-Type: application/json');
session_start();

try {
    // Get JSON data
    $data = json_decode(file_get_contents('php://input'), true);
    
    // Validate required fields
    if (!isset($data['userId']) || !isset($data['reason'])) {
        throw new Exception('Missing required fields');
    }

    // Database connection - Updated for XAMPP default settings
    $conn = new mysqli('localhost', 'root', '', 'kompas_kampus');
    
    if ($conn->connect_error) {
        throw new Exception('Connection failed: ' . $conn->connect_error);
    }

    // Start transaction
    $conn->begin_transaction();

    try {
        // Insert into account_deletions table
        $stmt = $conn->prepare("INSERT INTO account_deletions (user_id, deletion_date, reason, deleted_by) VALUES (?, ?, ?, ?)");
        
        $userId = $data['userId'];
        $deletionDate = $data['deletionDate'];
        $reason = $data['reason'];
        $deletedBy = $data['deletedBy'];

        $stmt->bind_param("isss", $userId, $deletionDate, $reason, $deletedBy);
        
        if (!$stmt->execute()) {
            throw new Exception('Failed to record deletion');
        }

        // Here you can add more queries to:
        // 1. Update user status in users table
        // 2. Archive user data
        // 3. Remove sensitive information
        
        // Commit transaction
        $conn->commit();
        
        echo json_encode([
            'success' => true,
            'message' => 'Account deleted successfully'
        ]);
        
    } catch (Exception $e) {
        // Rollback on error
        $conn->rollback();
        throw $e;
    }

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode([
        'success' => false,
        'message' => $e->getMessage()
    ]);
}
?>
