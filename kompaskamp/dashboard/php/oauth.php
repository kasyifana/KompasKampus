<?php
session_start();

// Tambahkan ini di awal file untuk debugging
error_reporting(E_ALL);
ini_set('display_errors', 1);

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

// Handle GET request for points
if ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['action']) && $_GET['action'] === 'get_points') {
    if (!isset($_SESSION['user_id'])) {
        echo json_encode([
            'status' => 'error',
            'message' => 'Not logged in',
            'debug' => ['session' => $_SESSION]  // Tambah debug info
        ]);
        exit;
    }

    $userId = $_SESSION['user_id'];
    
    try {
        $stmt = $conn->prepare("SELECT poin FROM akun WHERE id = ?");
        $stmt->bind_param("i", $userId);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        
        if ($row) {
            echo json_encode([
                'status' => 'success',
                'points' => (int)$row['poin'],
                'debug' => [
                    'userId' => $userId,
                    'data' => $row
                ]
            ]);
        } else {
            echo json_encode([
                'status' => 'error',
                'message' => 'User not found',
                'debug' => ['userId' => $userId]
            ]);
        }
        
        $stmt->close();
    } catch (Exception $e) {
        echo json_encode([
            'status' => 'error',
            'message' => $e->getMessage(),
            'debug' => ['userId' => $userId ?? null]
        ]);
    }
    exit;
}

// Add this new endpoint for getting personality type
if ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['action']) && $_GET['action'] === 'get_personality') {
    if (!isset($_SESSION['user_id'])) {
        echo json_encode([
            'status' => 'error',
            'message' => 'Not logged in'
        ]);
        exit;
    }

    $userId = $_SESSION['user_id'];
    
    try {
        $stmt = $conn->prepare("SELECT rek1 FROM akun WHERE id = ?");
        $stmt->bind_param("i", $userId);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        
        if ($row && $row['rek1']) {
            echo json_encode([
                'status' => 'success',
                'personalityType' => $row['rek1']
            ]);
        } else {
            echo json_encode([
                'status' => 'error',
                'message' => 'No personality type found'
            ]);
        }
        
        $stmt->close();
    } catch (Exception $e) {
        echo json_encode([
            'status' => 'error',
            'message' => $e->getMessage()
        ]);
    }
    exit;
}

// Add this new endpoint for getting user profile
if ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['action']) && $_GET['action'] === 'get_profile') {
    if (!isset($_SESSION['user_id'])) {
        echo json_encode([
            'status' => 'error',
            'message' => 'Not logged in'
        ]);
        exit;
    }

    $userId = $_SESSION['user_id'];
    
    try {
        $stmt = $conn->prepare("SELECT nama_lengkap, email, poin, rek1 FROM akun WHERE id = ?");
        $stmt->bind_param("i", $userId);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        
        if ($row) {
            // Add some static profile data
            $profileData = [
                'fullname' => $row['nama_lengkap'],
                'email' => $row['email'],
                'points' => (int)$row['poin'],
                'personalityType' => $row['rek1'],
                'joinDate' => '2023', // Static join date
                'role' => 'Student', // Static role
                'status' => 'Active', // Static status
                'avatar' => '../assets/default-avatar.png' // Static avatar path
            ];
            
            echo json_encode([
                'status' => 'success',
                'profile' => $profileData
            ]);
        } else {
            echo json_encode([
                'status' => 'error',
                'message' => 'User not found'
            ]);
        }
        
        $stmt->close();
    } catch (Exception $e) {
        echo json_encode([
            'status' => 'error',
            'message' => $e->getMessage()
        ]);
    }
    exit;
}

// Handle POST request for saving recommendations
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_GET['action']) && $_GET['action'] === 'save_recommendations') {
    // Decode JSON request body
    $data = json_decode(file_get_contents('php://input'), true);
    
    if (!isset($_SESSION['user_id'])) {
        echo json_encode([
            'status' => 'error',
            'message' => 'Not logged in'
        ]);
        exit;
    }

    if (!isset($data['personalityType'])) {
        echo json_encode([
            'status' => 'error',
            'message' => 'Invalid personality type data'
        ]);
        exit;
    }

    $userId = $_SESSION['user_id'];
    $personalityType = $data['personalityType'];

    try {
        $stmt = $conn->prepare("UPDATE akun SET rek1 = ? WHERE id = ?");
        $stmt->bind_param("si", $personalityType, $userId);
        $success = $stmt->execute();

        if ($success) {
            echo json_encode([
                'status' => 'success',
                'message' => 'Personality type saved successfully'
            ]);
        } else {
            echo json_encode([
                'status' => 'error',
                'message' => 'Failed to save personality type'
            ]);
        }
        $stmt->close();
    } catch (Exception $e) {
        echo json_encode([
            'status' => 'error',
            'message' => $e->getMessage()
        ]);
    }
    exit;
}

// Add this new endpoint for getting contact info
if ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['action']) && $_GET['action'] === 'get_contact_info') {
    if (!isset($_SESSION['user_id'])) {
        echo json_encode([
            'status' => 'error',
            'message' => 'Not logged in'
        ]);
        exit;
    }

    $userId = $_SESSION['user_id'];
    
    try {
        $stmt = $conn->prepare("SELECT email, telp FROM akun WHERE id = ?");
        $stmt->bind_param("i", $userId);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        
        if ($row) {
            echo json_encode([
                'status' => 'success',
                'data' => [
                    'email' => $row['email'],
                    'phone' => $row['telp']
                ]
            ]);
        } else {
            echo json_encode([
                'status' => 'error',
                'message' => 'User not found'
            ]);
        }
        
        $stmt->close();
    } catch (Exception $e) {
        echo json_encode([
            'status' => 'error',
            'message' => $e->getMessage()
        ]);
    }
    exit;
}

// Add this new endpoint for updating contact info
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_GET['action']) && $_GET['action'] === 'update_contact_info') {
    $input = json_decode(file_get_contents('php://input'), true);
    
    if (!isset($_SESSION['user_id'])) {
        echo json_encode([
            'status' => 'error',
            'message' => 'Not logged in'
        ]);
        exit;
    }

    if (!isset($input['email']) || !isset($input['phone'])) {
        echo json_encode([
            'status' => 'error',
            'message' => 'Missing required fields'
        ]);
        exit;
    }

    $userId = $_SESSION['user_id'];
    $email = $input['email'];
    $phone = $input['phone'];
    
    try {
        $stmt = $conn->prepare("UPDATE akun SET email = ?, telp = ? WHERE id = ?");
        $stmt->bind_param("ssi", $email, $phone, $userId);
        
        if ($stmt->execute()) {
            echo json_encode([
                'status' => 'success',
                'message' => 'Contact information updated successfully'
            ]);
        } else {
            echo json_encode([
                'status' => 'error',
                'message' => 'Failed to update contact information'
            ]);
        }
        
        $stmt->close();
    } catch (Exception $e) {
        echo json_encode([
            'status' => 'error',
            'message' => $e->getMessage()
        ]);
    }
    exit;
}

// Replace the existing POST handler with this updated version:
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $input = json_decode(file_get_contents('php://input'), true);
    
    // Handle points update request
    if (isset($input['type']) && $input['type'] === 'update_points' && isset($input['score'])) {
        if (!isset($_SESSION['user_id'])) {
            echo json_encode([
                'status' => 'error',
                'message' => 'Not logged in'
            ]);
            exit;
        }

        $userId = $_SESSION['user_id'];
        // Convert score to integer, removing any % symbol and decimals
        $score = intval(str_replace('%', '', $input['score']));
        
        try {
            error_log("Processing score update: " . $score); // Debug log
            
            // Simple update with integer value
            $updatePoints = $conn->prepare("UPDATE akun SET poin = ? WHERE id = ?");
            $updatePoints->bind_param("ii", $score, $userId); // Using integer binding
            
            if ($updatePoints->execute()) {
                // Verify the stored value
                $getPoints = $conn->prepare("SELECT poin FROM akun WHERE id = ?");
                $getPoints->bind_param("i", $userId);
                $getPoints->execute();
                $result = $getPoints->get_result();
                $storedPoints = $result->fetch_assoc()['poin'];
                
                echo json_encode([
                    'status' => 'success',
                    'message' => 'Points updated successfully',
                    'score_sent' => $score,
                    'points_stored' => $storedPoints
                ]);
                
                $getPoints->close();
            } else {
                echo json_encode([
                    'status' => 'error',
                    'message' => 'Failed to update points'
                ]);
            }
            $updatePoints->close();
            exit;
        } catch (Exception $e) {
            echo json_encode([
                'status' => 'error',
                'message' => $e->getMessage()
            ]);
            exit;
        }
    }
    
    // Handle regular login request
    if (isset($_POST['email']) && isset($_POST['password'])) {
        $email = $_POST['email'] ?? '';
        $password = $_POST['password'] ?? '';

        if (empty($email) || empty($password)) {
            echo "Email dan password harus diisi";
            exit;
        }

        $stmt = $conn->prepare("SELECT id, nama_lengkap, email, password, poin FROM akun WHERE email = ?");
        $stmt->bind_param("s", $email);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            $user = $result->fetch_assoc();
            if (password_verify($password, $user['password'])) {
                $_SESSION['user_id'] = $user['id'];
                $_SESSION['email'] = $user['email'];
                $_SESSION['fullname'] = $user['nama_lengkap'];
                
                echo "<script>
                    sessionStorage.setItem('fullname', '" . htmlspecialchars($user['nama_lengkap'], ENT_QUOTES) . "');
                    sessionStorage.setItem('email', '" . htmlspecialchars($email, ENT_QUOTES) . "');
                    window.location.href = '../dash.html';
                </script>";
                exit;
            }
        }
        
        echo "Email atau password salah";
        $stmt->close();
    }
}

$conn->close();
?>