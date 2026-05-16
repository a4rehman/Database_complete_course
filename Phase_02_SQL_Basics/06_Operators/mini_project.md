# Mini Project: Real-World Data Filtering Pipeline

## Project Overview
You are working as a Backend Engineer for a healthcare platform. The hospital has a massive database of patient records and appointments. Your task is to extract very specific lists of patients for different departments based on complex, intersecting logic.

**Goal:** Master the combination of various SQL operators (Logical, Comparison, Pattern Matching, Range) to generate precise business reports.

## Schema Design (Provided)

### Tables
1. **`patients`**
   - `patient_id` (PK)
   - `first_name`, `last_name`
   - `date_of_birth`
   - `blood_type`
   - `insurance_provider` (Can be NULL)
   - `is_active` (Boolean)

2. **`appointments`**
   - `appointment_id` (PK)
   - `patient_id` (FK)
   - `appointment_date`
   - `status` ('Completed', 'No Show', 'Cancelled', 'Scheduled')
   - `department` ('Cardiology', 'Pediatrics', 'General', 'Neurology')

## Business Logic Requirements

**Report 1: The Pediatric Outreach**
The hospital wants to send vaccination reminders.
*Requirement:* Find all active patients under the age of 18 (approximated by checking if DOB is after '2006-01-01').
*SQL Operator Focus:* `<`, `AND`.

**Report 2: Insurance Audit**
The finance department needs a list of patients who had 'Completed' or 'Scheduled' appointments in the 'Cardiology' or 'Neurology' departments, but who currently have NO `insurance_provider` listed.
*SQL Operator Focus:* `IN`, `IS NULL`, `AND`.

**Report 3: The "No Show" Problem**
Management is tracking chronic "No Show" appointments.
*Requirement:* Find all appointments in the year 2023 that were 'No Show', where the patient ID is between 1000 and 2000.
*SQL Operator Focus:* `BETWEEN`, `AND`, `=`, string comparisons.

**Report 4: Family Search**
A doctor remembers a patient whose last name started with "Mac" or "Mc", but isn't sure.
*Requirement:* Search for patients whose `last_name` matches either pattern.
*SQL Operator Focus:* `LIKE`, `OR`.

## Sample Queries

**Report 2 Solution:**
```sql
SELECT a.appointment_id, p.first_name, p.last_name, a.department
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_id
WHERE a.status IN ('Completed', 'Scheduled')
  AND a.department IN ('Cardiology', 'Neurology')
  AND p.insurance_provider IS NULL;
```

**Report 4 Solution:**
```sql
SELECT first_name, last_name 
FROM patients 
WHERE last_name LIKE 'Mac%' OR last_name LIKE 'Mc%';
```

## Advanced Extensions
- Use `ILIKE` (in PostgreSQL) to perform case-insensitive pattern matching for Report 4.
- Use Bitwise operators to store boolean flags (e.g., allergies: `001` for Peanuts, `010` for Dairy) and query them. (Advanced/C++ style optimization in DBs).
