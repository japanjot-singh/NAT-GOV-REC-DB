# Government Exam Enrollment & Recruitment System
### Built with Oracle PL/SQL

A database-driven system that automates the entire lifecycle of a government exam — from student enrollment to result evaluation and employee recruitment — using Oracle PL/SQL.

---

## Overview

This project simulates a real-world government recruitment pipeline. It manages departments, student registrations, exam enrollments, results, and hiring — all automated through PL/SQL blocks, cursors, and conditional logic.

---

## Database Schema

The system is built on five relational tables:

| Table | Description |
|---|---|
| `DEPARTMENT` | Stores government departments and their associated exams |
| `BRANCHES` | Stores branch locations linked to departments |
| `STUDENT_INFO` | Stores student personal details, region, and enrollment date |
| `ENROLLED` | Tracks exam enrollments with center and exam date |
| `RESULTS` | Stores marks for each enrolled student |
| `EMPLOYEES` | Stores selected candidates who passed the exam |

---

## Automation Features

### 1. Automated Admit Card Generation
Using a **PL/SQL cursor**, the system loops through all registered students and:
- Automatically assigns exam center based on region (`north` → Delhi, `south` → Chennai)
- Inserts enrollment records into the `ENROLLED` table
- Auto-generates and prints a formatted **Admit Card** for each student using `DBMS_OUTPUT`

**Sample Admit Card Output:**
```
==================== ADMIT CARD ====================
EID         : 501
Name        : Aman Sharma
Contact     : 9876543210
Region      : north
Exam Center : DELHI
Exam Date   : 14-NOV-2025
====================================================
```

---

### 2. Automated Result Evaluation & Student Selection
A second PL/SQL cursor processes all results and automatically:
- **Selects students** who scored **85 or above** and inserts them into the `EMPLOYEES` table
- Assigns salary (₹50,000) and joining date automatically
- Generates a **Report Card** for every student
- Generates a **Joining Letter** for selected candidates

**Sample Report Card Output:**
```
==================== REPORT CARD ====================
Exam ID     : 501
Marks       : 85
Result      : PASSED
====================================================
```

**Sample Joining Letter Output:**
```
==================== JOINING LETTER =================
Congratulations!
Ref: EID 501
We are pleased to offer you the position in Department 5.
Your Employee ID will be: 101
Your starting salary will be: 50000
Your joining date is: 29-NOV-2025
====================================================
```

---

### 3. Automated Views for Reporting
Two SQL views are created for easy reporting:
- **EXAMS view** – displays department exams in a readable format
- **RESULT view** – joins student info, enrollment, and marks into a single unified report

---

## Key Technical Concepts Used

- **PL/SQL Cursors** – for iterating through student and result records
- **Conditional Logic (IF/ELSIF)** – for region-based center assignment and pass/fail evaluation
- **Foreign Key Constraints** – maintaining referential integrity across all tables
- **CHECK Constraint** – validating region values (`north` or `south` only)
- **%TYPE attribute** – for dynamic variable declarations
- **DBMS_OUTPUT** – for formatted document generation
- **TO_DATE / DATE arithmetic** – for dynamic exam and joining date calculation
- **COMMIT** – ensuring data persistence after all operations
- **CREATE OR REPLACE VIEW** – for reusable reporting queries

---

## How to Run

1. Run the table creation scripts in order:
   - `DEPARTMENT` → `BRANCHES` → `STUDENT_INFO` → `ENROLLED` → `RESULTS` → `EMPLOYEES`
2. Insert the sample data provided
3. Run the first PL/SQL block to generate admit cards and populate `ENROLLED`
4. Run the second PL/SQL block to evaluate results and populate `EMPLOYEES`
5. Query the views `EXAMS` and `RESULT` for reports

---

## Tech Stack

- **Oracle Database**
- **PL/SQL**
- **SQL (DDL, DML, Views)**

---

*Developed as part of 3rd Semester Database Management coursework at Chandigarh University*
