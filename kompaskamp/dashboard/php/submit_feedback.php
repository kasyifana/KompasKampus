<?php
header('Content-Type: application/json');

try {
    // Get POST data
    $data = json_decode(file_get_contents('php://input'), true);
    
    // Validasi data
    if (!isset($data['subject']) || !isset($data['detail']) || !isset($data['category'])) {
        throw new Exception('Data tidak lengkap');
    }
    
    // Database configuration
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "tugasbesar";

    // Koneksi ke database yang benar
    $pdo = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Insert feedback
    $stmt = $pdo->prepare("INSERT INTO feedbacks (title, content, category) VALUES (?, ?, ?)");
    $success = $stmt->execute([
        $data['subject'],
        $data['detail'],
        $data['category']
    ]);

    if (!$success) {
        throw new Exception('Gagal menyimpan feedback');
    }
    
    // Ambil data feedback yang baru dimasukkan
    $feedbackId = $pdo->lastInsertId();
    $stmt = $pdo->prepare("SELECT * FROM feedbacks WHERE id = ?");
    $stmt->execute([$feedbackId]);
    $feedback = $stmt->fetch(PDO::FETCH_ASSOC);

    echo json_encode([
        'success' => true,
        'feedback' => [
            'id' => $feedback['id'],
            'title' => $feedback['title'],
            'content' => $feedback['content'],
            'category' => $feedback['category'],
            'author' => 'Anonymous',
            'time' => 'Baru saja'
        ]
    ]);

} catch(Exception $e) {
    http_response_code(400);
    echo json_encode([
        'success' => false,
        'error' => $e->getMessage()
    ]);
}
?>