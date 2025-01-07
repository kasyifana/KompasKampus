<?php
header('Content-Type: application/json');

try {
    // Update database connection
    $conn = new PDO("mysql:host=dbkampus;dbname=kampus", "root", "kampus");
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    if (!isset($_FILES['avatar']) || !isset($_POST['userId'])) {
        throw new Exception('Missing required data');
    }

    $userId = $_POST['userId'];
    $file = $_FILES['avatar'];

    // Validate file
    $allowedTypes = ['image/jpeg', 'image/png', 'image/gif'];
    if (!in_array($file['type'], $allowedTypes)) {
        throw new Exception('Invalid file type');
    }

    if ($file['size'] > 2 * 1024 * 1024) { // 2MB
        throw new Exception('File too large');
    }

    // Create upload directory if it doesn't exist
    $uploadDir = '../uploads/avatars/';
    if (!file_exists($uploadDir)) {
        mkdir($uploadDir, 0777, true);
    }

    // Generate unique filename with timestamp
    $timestamp = date('Y-m-d_H-i-s');
    $fileName = 'photo_' . $timestamp . '_' . uniqid() . '.' . pathinfo($file['name'], PATHINFO_EXTENSION);
    $targetPath = $uploadDir . $fileName;
    $dbPath = 'uploads/avatars/' . $fileName;

    // Move uploaded file
    if (move_uploaded_file($file['tmp_name'], $targetPath)) {
        // Update database with new image path
        $stmt = $conn->prepare("UPDATE users SET profile_image = ? WHERE id = ?");
        $stmt->execute([$dbPath, $userId]);

        // Delete old image if exists
        $stmt = $conn->prepare("SELECT profile_image FROM users WHERE id = ?");
        $stmt->execute([$userId]);
        $oldImage = $stmt->fetchColumn();
        
        if ($oldImage && file_exists('../' . $oldImage) && $oldImage != 'avatar.jpg') {
            unlink('../' . $oldImage);
        }

        echo json_encode([
            'success' => true,
            'message' => 'Profile picture updated successfully',
            'imagePath' => $dbPath
        ]);
    } else {
        throw new Exception('Failed to upload file');
    }

} catch (Exception $e) {
    echo json_encode([
        'success' => false,
        'message' => $e->getMessage()
    ]);
}
?>
