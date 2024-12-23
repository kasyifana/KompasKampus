<?php
header('Content-Type: application/json');

try {
    // Update database connection
    $conn = new PDO("mysql:host=localhost;dbname=kompas_kampus", "root", "");
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $data = json_decode(file_get_contents('php://input'), true);
    
    if (!isset($data['userId'])) {
        throw new Exception('Missing user ID');
    }

    // Begin transaction
    $conn->beginTransaction();

    // Update basic profile info
    $stmt = $conn->prepare("UPDATE users SET phone = ?, email = ? WHERE id = ?");
    $stmt->execute([$data['phone'], $data['email'], $data['userId']]);

    // Commit transaction
    $conn->commit();

    echo json_encode([
        'success' => true,
        'message' => 'Profile updated successfully'
    ]);

} catch (Exception $e) {
    if (isset($conn)) {
        $conn->rollBack();
    }
    echo json_encode([
        'success' => false,
        'message' => $e->getMessage()
    ]);
}
?>
