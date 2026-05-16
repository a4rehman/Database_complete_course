# Mini Project: The Data Analyst's Dashboard

## Project Overview
You've been promoted to lead Data Analyst for a SaaS company. The Executive team wants a dashboard summarizing the health of the business based on raw subscription data. 

**Goal:** Transform raw, noisy subscription data into high-level business intelligence metrics using `GROUP BY`, Aggregate functions, `WHERE`, and `HAVING`.

## Schema Design (Provided)

### Table: `subscriptions`
- `sub_id` (INT, PK)
- `user_id` (INT)
- `plan_tier` ('Basic', 'Pro', 'Enterprise')
- `status` ('Active', 'Canceled', 'Past_Due')
- `monthly_fee` (DECIMAL)
- `signup_date` (DATE)
- `cancelation_date` (DATE, can be NULL)

## Business Logic Requirements

**Report 1: Total Active MRR (Monthly Recurring Revenue)**
The CEO wants to know the total revenue generated *this month* per plan tier, but only for users who are currently 'Active'.
*Strategy:* Filter for 'Active', group by `plan_tier`, sum the `monthly_fee`.

**Report 2: The Churn Problem**
The Product team wants to know which tiers have a high cancellation rate. They only care about tiers that have had *more than 50* cancellations in total.
*Strategy:* Filter for 'Canceled', group by `plan_tier`, use `HAVING` to ensure the `COUNT` is > 50.

**Report 3: Enterprise Whale Hunting**
The Sales team wants to see the average Monthly Fee being paid, grouped by Signup Year and Plan Tier, but they want to exclude the 'Basic' tier completely from the report to focus on high-value clients.
*Strategy:* Use `EXTRACT(YEAR FROM signup_date)`, filter out 'Basic' in the `WHERE` clause, group by both Year and Tier, average the fee.

## Sample Solution Queries

**Report 1 Solution:**
```sql
SELECT 
    plan_tier, 
    SUM(monthly_fee) AS active_mrr,
    COUNT(*) AS total_subscribers
FROM subscriptions
WHERE status = 'Active'
GROUP BY plan_tier;
```

**Report 2 Solution:**
```sql
SELECT 
    plan_tier, 
    COUNT(*) AS total_cancellations
FROM subscriptions
WHERE status = 'Canceled'
GROUP BY plan_tier
HAVING COUNT(*) > 50;
```

**Report 3 Solution:**
```sql
SELECT 
    EXTRACT(YEAR FROM signup_date) AS signup_year,
    plan_tier,
    AVG(monthly_fee) AS average_fee,
    SUM(monthly_fee) AS total_revenue
FROM subscriptions
WHERE plan_tier != 'Basic'
GROUP BY EXTRACT(YEAR FROM signup_date), plan_tier
ORDER BY signup_year DESC, total_revenue DESC;
```

## Advanced Extensions
- Use SQL Window Functions (e.g., `SUM(monthly_fee) OVER ()`) to show the percentage of total MRR that each tier contributes. (Preview of advanced SQL).
- Create a cohort analysis grouped by the exact month of signup.
