<?php
header('Content-Type: application/json');

try {
    // Database configuration
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "tugasbesar";

    // Mengubah koneksi database untuk kampus_db
    $pdo = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $stmt = $pdo->query("SELECT * FROM feedbacks ORDER BY created_at DESC");
    $feedbacks = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Format the feedbacks untuk frontend
    $formattedFeedbacks = array_map(function($feedback) {
        return [
            'id' => $feedback['id'],
            'title' => $feedback['title'],
            'content' => $feedback['content'],
            'category' => $feedback['category'],
            'author' => 'Anonymous', // Static author name
            'time' => formatTimeAgo($feedback['created_at'])
        ];
    }, $feedbacks);

    echo json_encode([
        'success' => true,
        'feedbacks' => $formattedFeedbacks
    ]);
} catch(PDOException $e) {
    echo json_encode([
        'success' => false,
        'error' => $e->getMessage()
    ]);
}

function formatTimeAgo($timestamp) {
    $timestamp = strtotime($timestamp);
    $diff = time() - $timestamp;
    
    if ($diff < 60) {
        return "Baru saja";
    } elseif ($diff < 3600) {
        return floor($diff / 60) . " menit yang lalu";
    } elseif ($diff < 86400) {
        return floor($diff / 3600) . " jam yang lalu";
    } else {
        return floor($diff / 86400) . " hari yang lalu";
    }
}
?>
