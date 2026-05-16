# Mini Project: Data Cleaning & Formatting Pipeline

## Project Overview
You are tasked with migrating legacy data into a modern CRM system. The old data is messy: names are inconsistently capitalized, phone numbers have weird characters, dates are just strings, and missing data is rampant.

**Goal:** Use SQL string, date, math, and control flow functions to clean the dataset dynamically using a single `SELECT` statement.

## Schema Design (Provided)

### Table: `legacy_leads`
- `lead_id` (INT)
- `raw_name` (VARCHAR) - e.g., "   jOhN sMiTh  "
- `contact_number` (VARCHAR) - e.g., "555-123-4567" or NULL
- `creation_string` (VARCHAR) - e.g., "2022-01-15"
- `projected_value` (DECIMAL) - e.g., 1045.67

## Business Logic Requirements

1. **Name Formatting:** Trim all leading/trailing whitespace. Capitalize the first letter of the first name, and lowercase the rest. (Assume single names for simplicity).
2. **Contact Fallback:** If `contact_number` is NULL, output 'Requires Follow-up'.
3. **Date Conversion:** Convert the `creation_string` into an actual Date format (using `CAST` or `::DATE`), and extract just the Year to create a `cohort_year` column.
4. **Value Categorization:** Use a `CASE` statement on `projected_value`:
   - > 5000: 'High Priority'
   - 1000 to 5000: 'Standard'
   - < 1000: 'Low Priority'
5. **Rounding:** Round the `projected_value` to the nearest whole number.

## Sample Solution Query

```sql
SELECT 
    lead_id,
    
    -- 1. Name Formatting (PostgreSQL specific string slicing)
    UPPER(SUBSTRING(TRIM(raw_name), 1, 1)) || LOWER(SUBSTRING(TRIM(raw_name), 2)) AS formatted_name,
    
    -- 2. Contact Fallback
    COALESCE(contact_number, 'Requires Follow-up') AS contact_status,
    
    -- 3. Date Extraction
    EXTRACT(YEAR FROM CAST(creation_string AS DATE)) AS cohort_year,
    
    -- 4. Value Categorization
    CASE
        WHEN projected_value > 5000 THEN 'High Priority'
        WHEN projected_value >= 1000 THEN 'Standard'
        ELSE 'Low Priority'
    END AS priority_level,
    
    -- 5. Rounding
    ROUND(projected_value, 0) AS rounded_value

FROM legacy_leads;
```

## Advanced Extensions
- Use regex functions (like `REGEXP_REPLACE` in PostgreSQL) to strip all non-numeric characters from the `contact_number`.
- Calculate the exact number of days since the `creation_string` to `CURRENT_DATE`.
