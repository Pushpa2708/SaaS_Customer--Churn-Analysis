CREATE DATABASE saas_churn;
-- Verifying the impoted data 
USE saas_churn;

SELECT COUNT(*) AS total_customers
FROM customers;

-- checking the table structure 
DESCRIBE customers;


-- Overall customer churn
-- Business Question: How many customers have churned, and  is the churn rate ?
SELECT
    COUNT(*) AS total_customers,
    SUM(Is_Churned) AS churned_customers,
    ROUND(SUM(Is_Churned) * 100.0 / COUNT(*), 2) AS churn_rate
FROM customers;


-- Which payment status has the most churn?
-- Business question: Are customers with failed payments more likely to churn?
SELECT
    Payment_Status,
    COUNT(*) AS total_customers,
    SUM(Is_Churned) AS churned_customers,
    ROUND(SUM(Is_Churned) * 100.0 / COUNT(*), 2) AS churn_rate
FROM customers
GROUP BY Payment_Status
ORDER BY churn_rate DESC;


-- Does feature adoption relate to churn?
-- Business question: Do churned customers use fewer product features?
SELECT
    Is_Churned,
    COUNT(*) AS total_customers,
    CONCAT(ROUND(AVG(Feature_Adoption_Rate), 2), '%')
        AS avg_feature_adoption
FROM customers
GROUP BY Is_Churned;



-- Analysis
-- 1. Which company sizes have the highest churn?
SELECT
    Company_Size,
    COUNT(*) AS total_customers,
    SUM(Is_Churned) AS churned_customers,
    ROUND(SUM(Is_Churned) * 100.0 / COUNT(*), 2) AS churn_rate
FROM customers
GROUP BY Company_Size
ORDER BY churn_rate DESC;

-- 2. Which subscription plans have the highest churn?
SELECT
    Plan_Tier,
    COUNT(*) AS total_customers,
    SUM(Is_Churned) AS churned_customers,
    ROUND(SUM(Is_Churned) * 100.0 / COUNT(*), 2) AS churn_rate
FROM customers
GROUP BY Plan_Tier
ORDER BY churn_rate DESC;

-- 3. Which industries have the highest churn?

SELECT
    Industry,
    COUNT(*) AS total_customers,
    SUM(Is_Churned) AS churned_customers,
    ROUND(SUM(Is_Churned) * 100.0 / COUNT(*), 2) AS churn_rate
FROM customers
GROUP BY Industry
ORDER BY churn_rate DESC;

-- 4. Which countries have the highest churn?
SELECT
    Country,
    COUNT(*) AS total_customers,
    SUM(Is_Churned) AS churned_customers,
    ROUND(100.0 * SUM(Is_Churned) / COUNT(*), 2) AS churn_rate
FROM customers
GROUP BY Country
ORDER BY churn_rate DESC;

-- 5. Does billing cycle affect churn?

SELECT
    Billing_Cycle,
    COUNT(*) AS total_customers,
    SUM(Is_Churned) AS churned_customers,
    ROUND(100.0 * SUM(Is_Churned) / COUNT(*), 2) AS churn_rate
FROM customers
GROUP BY Billing_Cycle
ORDER BY churn_rate DESC;

-- 6. Does support activity relate to churn?
-- We'll group customers by their number of support tickets.
SELECT
    CASE
        WHEN Support_Tickets_30d = 0 THEN '0 tickets'
        WHEN Support_Tickets_30d BETWEEN 1 AND 2 THEN '1-2 tickets'
        WHEN Support_Tickets_30d BETWEEN 3 AND 5 THEN '3-5 tickets'
        ELSE '6+ tickets'
    END AS support_group,
    COUNT(*) AS total_customers,
    SUM(Is_Churned) AS churned_customers,
    ROUND(100.0 * SUM(Is_Churned) / COUNT(*), 2) AS churn_rate
FROM customers
GROUP BY support_group
ORDER BY churn_rate DESC;

-- 7. How much MRR is associated with churned customers?
SELECT
    Is_Churned,
    COUNT(*) AS total_customers,
    SUM(Monthly_Recurring_Revenue) AS total_mrr,
    ROUND(AVG(Monthly_Recurring_Revenue), 2) AS average_mrr
FROM customers
GROUP BY Is_Churned;

-- 8. Does churn risk score relate to actual churn?
-- Business question: Are customers with High risk scores more likely to churn?
SELECT
    Churn_Risk_Score,
    COUNT(*) AS total_customers,
    SUM(Is_Churned) AS churned_customers,
    ROUND(100.0 * SUM(Is_Churned) / COUNT(*), 2) AS churn_rate
FROM customers
GROUP BY Churn_Risk_Score
ORDER BY churn_rate DESC;

-- 9. Does seat usage differ between churned and retained customers?
-- Business question: Are customers who use fewer of their available seats more likely to churn?
SELECT
    Is_Churned,
    COUNT(*) AS total_customers,
    ROUND(AVG(Active_Seats_Used * 100.0 /
        NULLIF(Total_Seats_Allowed, 0)), 2) AS avg_seat_utilization
FROM customers
GROUP BY Is_Churned;