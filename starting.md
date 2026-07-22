# 🚀 Application Quick Startup Guide

This guide contains everything you need to start, run, and interact with the **Project Management Web Application** on your local machine.

---

## ⚡ Quick Start Commands

### 1️⃣ Start Backend Server (Laravel)
Run the built-in PHP development server:
```bash
php artisan serve
```
- **Local URL**: [http://127.0.0.1:8000](http://127.0.0.1:8000)

*(If using standalone PHP installed in your user profile: `C:\Users\Admin\php\php.exe artisan serve`)*

---

### 2️⃣ Start Frontend Asset Compiler (Vite)
Run Vite hot-reloading in a second terminal:
```bash
npm run dev
```
- **Vite Dev URL**: [http://localhost:5174](http://localhost:5174)

---

## 🔑 Login Portals & Default Credentials

The database comes pre-seeded with initial test accounts for all role levels:

| Role | Login URL | Email | Password |
| :--- | :--- | :--- | :--- |
| **Super Admin** | `http://127.0.0.1:8000/login` | `admin@mail.com` | `12345` |
| **Sales Executive** | `http://127.0.0.1:8000/login` | `sale@mail.com` | `12345` |
| **Developer** | `http://127.0.0.1:8000/login` | `developer@mail.com` | `12345` |

---

## 📌 Core System Functions & Key Modules

- **Leads & Inquiries**: Create, track, assign sales reps, log follow-ups, and convert leads into active orders.
- **Orders & Plans**: Manage order inquiries, pricing plans, advance payments, discounts, and renewal dates.
- **Project Management**: Assign projects to developers, track project tasks, sale assignments, and client feedback.
- **Invoices & Payments**: Generate PDF invoices, track payment statuses (Paid, Partial, Due), and manage sender details.
- **Support System**: Manage client support tickets with replies and multi-attachment uploads.
- **Attendance & KYC**: Track developer/sales attendance, lunch break times, and KYC credentials verification.
- **Meetings**: Schedule, track, and log client/team meeting sessions.

---

## 🛠️ Database Commands (If Reset Needed)

To reset and re-seed the local database with initial test data:
```bash
php artisan migrate:fresh --seed
```
