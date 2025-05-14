# Pharmacy Management System – Oracle PL/SQL Project

This is a simple backend implementation of a **Pharmacy Management System** using Oracle PL/SQL, created as part of an academic assignment.

---

## Project Structure

.
├── SQLscripts.sql # Table creation and sample data insertion
├── Package.sql # PL/SQL package with business logic
├── TestScript.sql # Anonymous blocks to test package and trigger
├── Trigger.sql # Trigger to prevent invalid sales
└── README.md # This guide

pgsql
Copy
Edit

---

## 💻 Requirements

- Oracle Database XE 18c (or compatible)
- SQL*Plus or SQL Developer
- Oracle user with CONNECT and RESOURCE privileges

---

## How to Run the Project

### 1. **Create a New Oracle User (Optional)**

Open SQL*Plus and log in as `SYSTEM`:

```sql
CREATE USER pharmacy_user IDENTIFIED BY pharmacy123;
GRANT CONNECT, RESOURCE TO pharmacy_user;
Connect to your new user:

sql
Copy
Edit
CONNECT pharmacy_user/pharmacy123;
2. Execute Scripts in Order
In SQL*Plus:

sql
Copy
Edit
-- 1. Create tables and insert data
@SQLscripts.sql

-- 2. Create the PL/SQL package
@Package.sql

-- 3. Create the trigger
@Trigger.sql

-- 4. Run the test script (includes package & trigger tests)
SET SERVEROUTPUT ON;
@TestScript.sql
What This Project Demonstrates
✅ Table creation with constraints and sample data

✅ PL/SQL package:

Public procedure: make_sale

Public function: get_stock

Private procedure: update_stock

✅ Use of:

Cursors

Exception handling

Composite data types

✅ Trigger to block invalid inserts/updates

✅ Anonymous PL/SQL blocks to test functionalitydates

✅ Anonymous PL/SQL blocks to test functionality
