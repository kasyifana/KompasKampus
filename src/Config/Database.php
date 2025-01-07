<?php
namespace App\Config;

use PDO;
use PDOException;

class Database {
    private static $instance = null;
    
    public static function getInstance() {
        if (self::$instance === null) {
            try {
                $dotenv = \Dotenv\Dotenv::createImmutable(__DIR__ . '/../../');
                $dotenv->load();
                
                self::$instance = new PDO(
                    "mysql:host=" . $_ENV['DB_HOST'] . 
                    ";dbname=" . $_ENV['DB_NAME'],
                    $_ENV['DB_USER'],
                    $_ENV['DB_PASS']
                );
                self::$instance->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            } catch(PDOException $e) {
                echo "Connection failed: " . $e->getMessage();
            }
        }
        return self::$instance;
    }
} 