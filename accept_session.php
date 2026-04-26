<?php
session_start();
require 'clinic_db.php';

if (!isset($_SESSION['clinic_id'])) {
    header("Location: clinic_login.php");
    exit();
}

if (!isset($_GET['session_id']) || !is_numeric($_GET['session_id'])) {
    die("Invalid session ID");
}

$session_id = intval($_GET['session_id']);
$clinic_id = intval($_SESSION['clinic_id']);

// Ensure session belongs to this clinic before updating
$stmt = $conn->prepare("
    UPDATE sessions s
    JOIN counsellors c ON s.counsellor_id = c.counsellor_id
    SET s.status = 'accepted'
    WHERE s.session_id = ? AND c.clinic_id = ?
");

if (!$stmt) {
    die("Query preparation failed: " . $conn->error);
}

$stmt->bind_param("ii", $session_id, $clinic_id);

if (!$stmt->execute()) {
    die("Database update failed: " . $stmt->error);
}

// Redirect back to dashboard
header("Location: clinic_dashboard.php");
exit();
?>
