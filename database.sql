CREATE DATABASE IF NOT EXISTS mentalhealth;
USE mentalhealth;

DROP TABLE IF EXISTS sessions;
DROP TABLE IF EXISTS counsellors;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS clinics;

CREATE TABLE clinics (
    clinic_id INT AUTO_INCREMENT PRIMARY KEY,
    clinic_name VARCHAR(150) NOT NULL,
    contact_info VARCHAR(150) NOT NULL
);

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL
);

CREATE TABLE counsellors (
    counsellor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    clinic_id INT NOT NULL,
    FOREIGN KEY (clinic_id) REFERENCES clinics(clinic_id)
);

CREATE TABLE sessions (
    session_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    counsellor_id INT NOT NULL,
    session_time DATETIME NOT NULL,
    session_type VARCHAR(100) NOT NULL,
    status VARCHAR(50) NOT NULL DEFAULT 'pending',
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (counsellor_id) REFERENCES counsellors(counsellor_id)
);

INSERT INTO clinics (clinic_id, clinic_name, contact_info)
VALUES 
(1, 'Demo Clinic', 'demo@clinic.com');

INSERT INTO users (user_id, first_name, last_name)
VALUES 
(1, 'John', 'Doe'),
(2, 'Sarah', 'Rahman');

INSERT INTO counsellors (counsellor_id, first_name, last_name, clinic_id)
VALUES 
(1, 'Alice', 'Smith', 1),
(2, 'Karim', 'Ahmed', 1);

INSERT INTO sessions (session_id, user_id, counsellor_id, session_time, session_type, status)
VALUES
(1, 1, 1, '2026-04-26 10:30:00', 'Online', 'pending'),
(2, 2, 2, '2026-04-26 12:00:00', 'In-Person', 'pending'),
(3, 1, 2, '2026-04-27 15:00:00', 'Online', 'accepted'),
(4, 2, 1, '2026-04-28 09:30:00', 'In-Person', 'declined');
