<?php
session_start();

// Clear all session variables
$_SESSION = array();

// Destroy the session
session_destroy();

// Clear session storage
echo "<script>
    sessionStorage.clear();
    window.location.href = '../../homebeforelogin/index.html';
</script>";
exit;
?>