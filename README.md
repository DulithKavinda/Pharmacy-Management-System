# Pharmacy Management System – How to Run

This guide explains how to execute the Pharmacy Management System PL/SQL project using SQL*Plus or SQL Developer.

---

## 🛠️ Requirements

- Oracle Database XE 18c
- SQL*Plus or SQL Developer
- Oracle user with CONNECT and RESOURCE privileges

---

## 🚀 How to Run

### 1. Create a New User (Optional)

```sql
CREATE USER pharmacy_user IDENTIFIED BY pharmacy123;
GRANT CONNECT, RESOURCE TO pharmacy_user;
CONNECT pharmacy_user/pharmacy123;
```

---

### 2. Execute Scripts in Order

```sql
-- Create tables and insert data
@SQLscripts.sql

-- Create the PL/SQL package
@Package.sql

-- Create the trigger
@Trigger.sql

-- Run test script (includes package & trigger tests)
SET SERVEROUTPUT ON;
@TestScript.sql
```
