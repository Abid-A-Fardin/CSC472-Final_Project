# CSC472-Final_Project

# 🏥 Clinic Dashboard Deployment on AWS EC2

## 📌 Overview

This project demonstrates the deployment of a **PHP-based Clinic Dashboard module** on an AWS EC2 instance.
The goal is to showcase a minimal, working full-stack flow:

* User login
* Viewing pending session requests
* Accepting or declining sessions
* Verifying database updates via terminal (PuTTY)

This is a **focused demo implementation**, not a full production system.

---

## 📁 Project Structure

```
clinic_dashboard.php    # Main dashboard (view + actions)
clinic_login.php        # Login page (entry point)
clinic_db.php           # Database connection
accept_session.php      # Accept session handler
decline_session.php     # Decline session handler
logout.php              # Session termination
database.sql            # Database schema + sample data
```

---

## ⚙️ Technology Stack

* **Backend:** PHP (mysqli)
* **Frontend:** HTML, CSS
* **Database:** MySQL / MariaDB
* **Server:** Apache (httpd)
* **Cloud Platform:** AWS EC2 (Amazon Linux)

---

## 🚀 Environment Setup (EC2)

### 1. Launch EC2 Instance

* OS: **Amazon Linux 2023**
* Allow inbound:

  * `22` (SSH) → your IP
  * `80` (HTTP) → Anywhere

---

### 2. Configure Server (User Data)

Paste this in **Advanced → User Data**:

```bash
#!/bin/bash

dnf update -y
dnf install -y httpd php php-mysqli mariadb105-server

systemctl enable httpd
systemctl start httpd

systemctl enable mariadb
systemctl start mariadb

chown -R apache:apache /var/www/html
chmod -R 755 /var/www/html

systemctl restart httpd
```

---

### 3. Upload Project Files

Connect via SSH / PuTTY and move files to:

```bash
/var/www/html
```

---

### 4. Import Database

```bash
cd /var/www/html
mysql -u root < database.sql
```

---

### 5. Restart Apache

```bash
sudo systemctl restart httpd
```

---

## 🌐 Running the Application

Open in browser:

```
http://<EC2_PUBLIC_IP>/clinic_login.php
```

### Demo Credentials

```
Clinic ID: 1
Contact Info: demo@clinic.com
```

---

## 🔄 Application Flow

1. **Login**

   * Authenticates clinic using database

2. **Dashboard**

   * Displays all pending session requests

3. **Actions**

   * Accept → updates status to `accepted`
   * Decline → updates status to `declined`

4. **Logout**

   * Destroys session and redirects to login

---

## 🧪 Verifying Database Changes (PuTTY)

Connect to MySQL:

```bash
mysql -u root
```

```sql
USE mentalhealth;
SELECT session_id, status FROM sessions;
```

Perform actions from the dashboard and re-run the query to observe updates.

---

## 🧠 Key Notes

* This project uses a **minimal reconstructed database schema** for demonstration.
* Only a **single module (clinic dashboard)** is deployed to keep the demo focused.
* Database is hosted locally on the same EC2 instance.

---

## ⚠️ Limitations

* No full authentication system (simplified login)
* No production-level security
* No external API integrations
* Database is not separated (single-tier architecture)

---

## 📌 Purpose

This project demonstrates:

* EC2 environment setup
* PHP application deployment
* Database provisioning and interaction
* End-to-end request handling (UI → backend → DB → verification)

---

## 👨‍💻 Author

Deployed as part of an academic assignment to demonstrate **cloud-based application migration and execution**.

---
