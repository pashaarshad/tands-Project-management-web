# 📋 Technical Architecture & Connectivity Summary

This document provides a detailed technical overview of the **Project Management Web Application**, its underlying architecture, system connectivity, database design, and Git merge protection setup.

---

## 🏗️ 1. Technical Stack & Architecture

- **Backend Framework**: Laravel 12 (PHP 8.3/8.4)
- **Frontend Engine**: Vite + Tailwind CSS + Blade / Livewire
- **Database Layer**: SQLite (Local Dev) / MySQL (Hostinger Production)
- **Authentication**: Laravel Fortify / Sanctum / Multi-Guard (Admin, Sales, Developer)
- **Media Asset Storage**: Local Public Disk (`public/images`, `storage/app/public`)

---

## 🔗 2. System Connectivity & Data Flow

```
[ Client / Web Browser ] 
        │
        ▼
[ Laravel Router (routes/web.php) ]
        │
   ┌────┴───────────────────────────┐
   ▼                                ▼
[ Blade / Livewire Views ]    [ Middleware & Guards ]
   │ (Vite Asset Hot Reload)        │ (Admin, Sale, Developer)
   └────────────────┬───────────────┘
                    ▼
          [ Controller Layer ]
                    │
                    ▼
          [ Eloquent ORM Models ]
                    │
         ┌──────────┴──────────┐
         ▼                     ▼
[ Local SQLite DB ]    [ Hostinger MySQL DB ]
 (Development)          (Production Server)
```

### Key Relationships & Data Wiring:
1. **Leads → Orders → Projects**:
   - Leads are converted into **Orders** with attached Services and Plans.
   - Orders trigger **Project** creation, which are assigned to **Developers** and **Sales Reps**.
2. **Projects → Tasks & Feedback**:
   - Projects track sub-tasks (`project_tasks`), assigned developers (`project_task_assigns`), and client feedback (`client_feedback`).
3. **Billing → Invoices & Payments**:
   - Orders link to **Invoices** and **Payments** with status tracking (`Paid`, `Partially Paid`, `Due`).
4. **Support Tickets**:
   - Tickets link to clients with JSON multi-file attachments and threaded replies.

---

## 🛡️ 3. Git Merge Protection (`merge=ours`)

To prevent local documentation files (`starting.md` and `summary.md`) from being overwritten when merging changes across different repositories:

### Configuration Setup:
- **`.gitattributes` Rule**:
  ```gitattributes
  starting.md merge=ours
  summary.md merge=ours
  ```
- **Local Merge Driver**:
  ```bash
  git config merge.ours.driver true
  ```

When merging branches or foreign repositories, Git preserves the target repository's versions of `starting.md` and `summary.md` automatically.

---

## 🌐 4. Hostinger / Production Deployment Flow

1. **Local Development**: Code changes are built, run, and verified locally at `http://127.0.0.1:8000`.
2. **GitHub Synchronization**: Verified changes are pushed to `main` branch on GitHub (`https://github.com/Afridi214/project-management-web.git`).
3. **Hostinger Auto-Deployment**: Hostinger webhooks / GitHub Actions automatically pull updates from `main` to the production server.
4. **Environment Isolation**: Server settings stay safe inside Hostinger's `.env` without being overwritten by local configs.
