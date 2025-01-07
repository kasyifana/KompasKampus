<?php
require_once 'config.php';

function updateUserProfile($userId, $name, $email, $phone) {
    global $pdo;
    try {
        $stmt = $pdo->prepare("UPDATE users SET name = ?, email = ?, phone = ? WHERE id = ?");
        return $stmt->execute([$name, $email, $phone, $userId]);
    } catch(PDOException $e) {
        return false;
    }
}

function getUserProfile($userId) {
    global $pdo;
    try {
        $stmt = $pdo->prepare("SELECT * FROM users WHERE id = ?");
        $stmt->execute([$userId]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    } catch(PDOException $e) {
        return false;
    }
}

function deleteUser($userId) {
    global $pdo;
    try {
        $stmt = $pdo->prepare("DELETE FROM users WHERE id = ?");
        return $stmt->execute([$userId]);
    } catch(PDOException $e) {
        return false;
    }
}

function updateUserAvatar($userId, $avatarUrl) {
    global $pdo;
    try {
        $stmt = $pdo->prepare("UPDATE users SET avatar_url = ? WHERE id = ?");
        return $stmt->execute([$avatarUrl, $userId]);
    } catch(PDOException $e) {
        return false;
    }
}
?>
