<?php
namespace App\Services;

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

class EmailService {
    private $mailer;
    
    public function __construct() {
        $this->mailer = new PHPMailer(true);
        
        // Server settings
        $this->mailer->isSMTP();
        $this->mailer->Host = $_ENV['MAIL_HOST'];
        $this->mailer->SMTPAuth = true;
        $this->mailer->Username = $_ENV['MAIL_USERNAME'];
        $this->mailer->Password = $_ENV['MAIL_PASSWORD'];
        $this->mailer->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
        $this->mailer->Port = $_ENV['MAIL_PORT'];
    }
    
    public function sendWelcomeEmail($userEmail, $userName) {
        try {
            $this->mailer->setFrom($_ENV['MAIL_FROM_ADDRESS'], 'Kompas Kampus');
            $this->mailer->addAddress($userEmail, $userName);
            
            $this->mailer->isHTML(true);
            $this->mailer->Subject = 'Welcome to Kompas Kampus!';
            $this->mailer->Body = $this->getWelcomeTemplate($userName);
            
            $this->mailer->send();
            return true;
        } catch (Exception $e) {
            return false;
        }
    }
    
    private function getWelcomeTemplate($userName) {
        // Load email template
        return file_get_contents(__DIR__ . '/../../resources/views/emails/welcome.html');
    }
} 