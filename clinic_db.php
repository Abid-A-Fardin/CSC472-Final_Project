<?php
// clinic_db.php

$host = 'localhost';
$user = 'root';          // for demo (later you can switch to app_user)
$pass = '';              // keep empty if using root locally
$db   = 'mentalhealth';

// Create connection
$conn = new mysqli($host, $user, $pass, $db);

// Check connection
if ($conn->connect_error) {
    die('Database connection failed: ' . $conn->connect_error);
}

// Set charset (important for avoiding encoding issues)
$conn->set_charset("utf8mb4");
?>
