<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "tugasbesar";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Update SQL query to limit to 10 questions
$sql = "SELECT id, soal, opsi_a, opsi_b, opsi_c, poin_a, poin_b, poin_c FROM gaya_belajar LIMIT 10";
$result = $conn->query($sql);

$questions = [];
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $questions[] = [
            'id' => $row['id'],
            'text' => $row['soal'],
            'options' => [
                ['type' => 'V', 'text' => $row['opsi_a'], 'points' => $row['poin_a']],
                ['type' => 'A', 'text' => $row['opsi_b'], 'points' => $row['poin_b']],
                ['type' => 'K', 'text' => $row['opsi_c'], 'points' => $row['poin_c']]
            ]
        ];
    }
}

// Handle GET request for fetching questions
if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    echo json_encode($questions);
    exit;
}

// Handle POST request for calculating results
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $answers = json_decode(file_get_contents('php://input'), true)['answers'];
    $scores = ['V' => 0, 'A' => 0, 'K' => 0];

    // Calculate scores based on selected answers and their points
    foreach ($answers as $index => $answer) {
        foreach ($questions[$index]['options'] as $option) {
            if ($option['type'] === $answer) {
                $scores[$answer] += intval($option['points']);
                break;
            }
        }
    }

    // Determine learning style and prepare detailed report
    $maxScore = max($scores);
    $learningStyles = [
        'V' => [
            'name' => 'Visual',
            'description' => 'Anda adalah pembelajar visual yang lebih mudah memahami informasi melalui gambar, diagram, dan visualisasi.',
            'recommendations' => [
                'Gunakan peta pikiran (mind mapping)',
                'Buat catatan dengan warna-warna berbeda',
                'Gunakan diagram dan grafik',
                'Tonton video pembelajaran'
            ]
        ],
        'A' => [
            'name' => 'Auditorial',
            'description' => 'Anda adalah pembelajar auditorial yang lebih mudah memahami informasi melalui pendengaran dan diskusi.',
            'recommendations' => [
                'Rekam dan dengarkan materi pembelajaran',
                'Ikuti diskusi kelompok',
                'Jelaskan konsep secara verbal',
                'Gunakan musik dalam belajar'
            ]
        ],
        'K' => [
            'name' => 'Kinestetik',
            'description' => 'Anda adalah pembelajar kinestetik yang lebih mudah memahami informasi melalui praktik dan pengalaman langsung.',
            'recommendations' => [
                'Lakukan eksperimen praktis',
                'Gunakan model atau objek fisik',
                'Ambil istirahat aktif saat belajar',
                'Praktikkan konsep dalam situasi nyata'
            ]
        ]
    ];

    $dominantStyle = array_search($maxScore, $scores);
    $result = [
        'scores' => $scores,
        'learningStyle' => $learningStyles[$dominantStyle]['name'],
        'description' => $learningStyles[$dominantStyle]['description'],
        'recommendations' => $learningStyles[$dominantStyle]['recommendations']
    ];

    echo json_encode($result);
    exit;
}

$conn->close();
?>
