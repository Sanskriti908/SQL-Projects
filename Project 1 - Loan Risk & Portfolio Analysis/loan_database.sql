-- =========================================================
-- Loan Portfolio & Risk Analysis System
-- Database schema, sample data, and query solutions
-- Engine: MySQL
-- =========================================================

-- ============================
-- 1. DATABASE
-- ============================
CREATE DATABASE Loan_demo;
USE Loan_demo;

-- ============================
-- 2. TABLE: loans
-- ============================
CREATE TABLE loans (
    Loan_ID             INT PRIMARY KEY,
    Customer_ID          INT NOT NULL,
    Customer_Name        VARCHAR(50) NOT NULL,
    Gender               VARCHAR(10) CHECK (Gender IN ('Male','Female')),
    Age                  INT CHECK (Age >= 18),
    City                 VARCHAR(30),
    State                VARCHAR(30),
    Employment_Type      VARCHAR(20),
    Annual_Income        DECIMAL(12,2) CHECK (Annual_Income > 0),
    Loan_Type            VARCHAR(20) CHECK (Loan_Type IN ('Home','Personal','Car','Education','Business')),
    Loan_Amount          DECIMAL(12,2) CHECK (Loan_Amount > 0),
    Interest_Rate        DECIMAL(5,2) CHECK (Interest_Rate > 0),
    Loan_Term            INT,
    Application_Date     DATE,
    Approval_Date        DATE,
    Disbursement_Date    DATE,
    Loan_Status          VARCHAR(20) CHECK (Loan_Status IN ('Applied','Approved','Rejected','Disbursed','Closed')),
    Credit_Score         INT CHECK (Credit_Score BETWEEN 300 AND 900),
    Monthly_EMI          DECIMAL(10,2),
    Amount_Paid          DECIMAL(12,2),
    Outstanding_Amount   DECIMAL(12,2),
    Overdue_Amount       DECIMAL(12,2),
    Payment_Status       VARCHAR(20) CHECK (Payment_Status IN ('Paid','Pending','Overdue','Default'))
);

-- ============================
-- 3. SAMPLE DATA (20 records)
-- ============================
INSERT INTO loans VALUES
(1001, 501, 'Amit Sharma', 'Male', 35, 'Delhi', 'Delhi', 'Salaried', 900000, 'Home', 5000000, 8.50, 240, '2026-01-05', '2026-01-08', '2026-01-10', 'Disbursed', 780, 43391, 500000, 4500000, 0, 'Paid'),
(1002, 502, 'Priya Verma', 'Female', 29, 'Mumbai', 'Maharashtra', 'Salaried', 650000, 'Personal', 800000, 12.50, 60, '2026-01-07', '2026-01-09', '2026-01-12', 'Disbursed', 720, 17992, 180000, 620000, 0, 'Paid'),
(1003, 503, 'Rahul Singh', 'Male', 42, 'Bangalore', 'Karnataka', 'Business', 1200000, 'Business', 2500000, 11.00, 120, '2026-01-10', '2026-01-15', '2026-01-18', 'Disbursed', 680, 34400, 300000, 2200000, 25000, 'Overdue'),
(1004, 504, 'Sneha Gupta', 'Female', 31, 'Pune', 'Maharashtra', 'Salaried', 750000, 'Car', 1200000, 9.25, 60, '2026-01-12', '2026-01-14', '2026-01-16', 'Disbursed', 810, 25000, 100000, 1100000, 0, 'Paid'),
(1005, 505, 'Vikas Kumar', 'Male', 27, 'Delhi', 'Delhi', 'Self-Employed', 550000, 'Personal', 500000, 14.50, 36, '2026-01-15', '2026-01-20', NULL, 'Approved', 640, 17200, 0, 500000, 0, 'Pending'),
(1006, 506, 'Neha Kapoor', 'Female', 24, 'Jaipur', 'Rajasthan', 'Salaried', 450000, 'Education', 600000, 10.50, 60, '2026-01-18', '2026-01-21', '2026-01-25', 'Disbursed', 750, 12900, 50000, 550000, 0, 'Paid'),
(1007, 507, 'Rohit Mehta', 'Male', 45, 'Chennai', 'Tamil Nadu', 'Business', 1500000, 'Business', 4000000, 13.00, 120, '2026-01-20', '2026-01-25', '2026-01-28', 'Disbursed', 590, 53000, 400000, 3600000, 150000, 'Default'),
(1008, 508, 'Anjali Patel', 'Female', 38, 'Ahmedabad', 'Gujarat', 'Salaried', 1000000, 'Home', 3500000, 8.75, 180, '2026-01-22', '2026-01-25', '2026-01-30', 'Disbursed', 800, 31000, 350000, 3150000, 0, 'Paid'),
(1009, 509, 'Suresh Yadav', 'Male', 52, 'Lucknow', 'Uttar Pradesh', 'Self-Employed', 700000, 'Personal', 900000, 15.00, 60, '2026-01-25', '2026-01-28', '2026-02-01', 'Disbursed', 610, 21500, 100000, 800000, 75000, 'Overdue'),
(1010, 510, 'Pooja Malhotra', 'Female', 33, 'Kolkata', 'West Bengal', 'Salaried', 850000, 'Car', 1500000, 9.75, 60, '2026-01-28', '2026-02-01', '2026-02-04', 'Disbursed', 770, 31500, 200000, 1300000, 0, 'Paid'),
(1011, 511, 'Arjun Rao', 'Male', 40, 'Hyderabad', 'Telangana', 'Business', 1100000, 'Business', 3000000, 12.00, 120, '2026-02-02', '2026-02-06', '2026-02-10', 'Disbursed', 690, 43000, 250000, 2750000, 30000, 'Overdue'),
(1012, 512, 'Kavita Joshi', 'Female', 28, 'Delhi', 'Delhi', 'Salaried', 600000, 'Education', 400000, 10.00, 48, '2026-02-05', '2026-02-08', '2026-02-12', 'Disbursed', 735, 10150, 100000, 300000, 0, 'Paid'),
(1013, 513, 'Manish Agarwal', 'Male', 36, 'Noida', 'Uttar Pradesh', 'Self-Employed', 800000, 'Home', 2800000, 9.00, 180, '2026-02-08', '2026-02-12', '2026-02-15', 'Disbursed', 760, 28300, 200000, 2600000, 0, 'Paid'),
(1014, 514, 'Riya Shah', 'Female', 30, 'Surat', 'Gujarat', 'Salaried', 500000, 'Personal', 700000, 13.50, 60, '2026-02-10', '2026-02-14', NULL, 'Approved', 670, 15900, 0, 700000, 0, 'Pending'),
(1015, 515, 'Deepak Mishra', 'Male', 48, 'Bhopal', 'Madhya Pradesh', 'Business', 950000, 'Business', 1800000, 14.00, 84, '2026-02-12', NULL, NULL, 'Rejected', 540, 0, 0, 0, 0, 'Pending'),
(1016, 516, 'Meena Iyer', 'Female', 55, 'Chennai', 'Tamil Nadu', 'Salaried', 1250000, 'Home', 4500000, 8.25, 240, '2026-02-15', '2026-02-18', '2026-02-20', 'Disbursed', 820, 38200, 450000, 4050000, 0, 'Paid'),
(1017, 517, 'Karan Bansal', 'Male', 26, 'Gurgaon', 'Haryana', 'Salaried', 480000, 'Car', 900000, 10.25, 60, '2026-02-18', '2026-02-22', '2026-02-25', 'Disbursed', 700, 19200, 50000, 850000, 10000, 'Overdue'),
(1018, 518, 'Nisha Reddy', 'Female', 34, 'Hyderabad', 'Telangana', 'Self-Employed', 720000, 'Personal', 1000000, 14.00, 60, '2026-02-20', '2026-02-24', '2026-02-28', 'Disbursed', 630, 23200, 100000, 900000, 50000, 'Overdue'),
(1019, 519, 'Sameer Khan', 'Male', 43, 'Mumbai', 'Maharashtra', 'Business', 1400000, 'Business', 5000000, 12.50, 120, '2026-02-22', '2026-02-26', '2026-03-01', 'Disbursed', 580, 70000, 500000, 4500000, 200000, 'Default'),
(1020, 520, 'Divya Nair', 'Female', 32, 'Kochi', 'Kerala', 'Salaried', 900000, 'Home', 3200000, 8.50, 180, '2026-02-25', '2026-02-28', '2026-03-03', 'Closed', 790, 28500, 3200000, 0, 0, 'Paid');

SELECT * FROM loans;

-- =========================================================
-- SECTION A — Basic SQL Analysis
-- =========================================================

-- 1. Display all loan records.
SELECT * FROM loans;

-- 2. Display only customer name, city, loan type and loan amount.
SELECT Customer_Name, City, Loan_Type, Loan_Amount FROM loans;

-- 3. Find all customers who have applied for a Personal Loan.
SELECT Customer_Name FROM loans WHERE Loan_Type = 'Personal';

-- 4. Find customers whose loan amount is greater than 5,00,000.
SELECT Customer_ID, Customer_Name FROM loans WHERE Loan_Amount > 500000;

-- 5. Find customers from a particular city.
SELECT * FROM loans WHERE City = 'Delhi';

-- 6. Display customers whose credit score is greater than 750.
SELECT Customer_Name, Credit_Score FROM loans WHERE Credit_Score > 750;

-- 7. Find customers whose annual income is between 5 lakh and 15 lakh.
SELECT Customer_ID, Customer_Name FROM loans WHERE Annual_Income BETWEEN 500000 AND 1500000;

-- 8. Display all customers whose loan status is Approved.
SELECT Customer_ID, Customer_Name FROM loans WHERE Loan_Status = 'Approved';

-- 9. Find all customers whose payment status is Overdue.
SELECT Customer_Name, Payment_Status FROM loans WHERE Payment_Status = 'Overdue';

-- 10. Display loans where outstanding amount is greater than 2,00,000.
SELECT * FROM loans WHERE Outstanding_Amount > 200000;

-- =========================================================
-- SECTION B — Filtering & Sorting
-- =========================================================

-- 11. Display the 10 largest loans.
SELECT Loan_ID, Customer_Name, City, Loan_Amount FROM loans ORDER BY Loan_Amount DESC LIMIT 10;

-- 12. Display customers in descending order of credit score.
SELECT Customer_Name, Credit_Score FROM loans ORDER BY Credit_Score DESC;

-- 13. Display customers in ascending order of loan amount.
SELECT * FROM loans ORDER BY Loan_Amount;

-- 14. Find loans with interest rates greater than 10%.
SELECT * FROM loans WHERE Interest_Rate > 10;

-- 15. Find customers between the ages of 25 and 40.
SELECT Loan_ID, Customer_Name, Age, City, State FROM loans WHERE Age BETWEEN 25 AND 40;

-- 16. Find customers whose names start with A.
SELECT * FROM loans WHERE Customer_Name LIKE 'A%';

-- 17. Find customers whose city contains the letter a.
SELECT * FROM loans WHERE City LIKE '%a%';

-- 18. Find customers who are not from a particular state.
SELECT Loan_ID, Customer_Name, Age, City, State FROM loans WHERE State NOT IN ('Maharashtra');

-- 19. Find loans that are either Approved or Disbursed.
SELECT * FROM loans WHERE Loan_Status IN ('Approved','Disbursed');

-- 20. Find customers whose payment status is not Paid.
SELECT Loan_ID, Customer_Name, Payment_Status FROM loans WHERE Payment_Status <> 'Paid';

-- =========================================================
-- SECTION C — Aggregate Analysis
-- =========================================================

-- 21. Total number of loan applications.
SELECT COUNT(Loan_ID) AS no_of_loans FROM loans;

-- 22. Total number of approved loans.
SELECT COUNT(Loan_ID) AS no_of_approved_loans FROM loans WHERE Loan_Status = 'Approved';

-- 23. Total loan amount requested.
SELECT SUM(Loan_Amount) AS total_loan_amount FROM loans;

-- 24. Total loan amount disbursed.
SELECT SUM(Loan_Amount) AS total_loan_disbursed FROM loans WHERE Loan_Status = 'Disbursed';

-- 25. Total outstanding loan amount.
SELECT SUM(Outstanding_Amount) AS total_outstanding_amount FROM loans;

-- 26. Total overdue amount.
SELECT SUM(Overdue_Amount) AS total_overdue_amount FROM loans;

-- 27. Average loan amount.
SELECT AVG(Loan_Amount) AS avg_loan_amount FROM loans;

-- 28. Average interest rate.
SELECT AVG(Interest_Rate) AS avg_interest_rate FROM loans;

-- 29. Maximum loan amount.
SELECT MAX(Loan_Amount) AS maximum_loan_amount FROM loans;

-- 30. Minimum loan amount.
SELECT MIN(Loan_Amount) AS minimum_loan_amount FROM loans;

-- 31. Average credit score.
SELECT AVG(Credit_Score) AS avg_credit_score FROM loans;

-- 32. Average annual income of borrowers.
SELECT AVG(Annual_Income) AS avg_annual_income FROM loans;

-- =========================================================
-- SECTION D — GROUP BY Analysis
-- =========================================================

-- 33. Find the number of loans for each loan type.
SELECT Loan_Type, COUNT(Loan_ID) AS no_of_loans FROM loans GROUP BY Loan_Type;

-- 34. Find total loan amount for each loan type.
SELECT Loan_Type, SUM(Loan_Amount) AS total_loan_amount FROM loans GROUP BY Loan_Type;

-- 35. Find average loan amount for each loan type.
SELECT Loan_Type, AVG(Loan_Amount) AS avg_loan_amount FROM loans GROUP BY Loan_Type;

-- 36. Find total loan amount by city.
SELECT City, SUM(Loan_Amount) AS total_loan_amount FROM loans GROUP BY City;

-- 37. Find number of customers by state.
SELECT State, COUNT(DISTINCT Customer_ID) AS no_of_customers FROM loans GROUP BY State;

-- 38. Find average credit score by loan type.
SELECT Loan_Type, AVG(Credit_Score) AS avg_credit_score FROM loans GROUP BY Loan_Type;

-- 39. Find total outstanding amount by loan type.
SELECT Loan_Type, SUM(Outstanding_Amount) AS total_outstanding_amount FROM loans GROUP BY Loan_Type;

-- 40. Find total overdue amount by city.
SELECT City, SUM(Overdue_Amount) AS total_overdue_amount FROM loans GROUP BY City;

-- 41. Find the number of loans by payment status.
SELECT Payment_Status, COUNT(Loan_ID) AS no_of_loans FROM loans GROUP BY Payment_Status;

-- 42. Find the number of loans by employment type.
SELECT Employment_Type, COUNT(Loan_ID) AS no_of_loans FROM loans GROUP BY Employment_Type;

-- =========================================================
-- SECTION E — HAVING Clause
-- =========================================================

-- 43. Find loan types having more than 5 loans.
SELECT Loan_Type, COUNT(Loan_Type) AS no_of_loans
FROM loans GROUP BY Loan_Type HAVING COUNT(Loan_Type) > 5;

-- 44. Find cities where total loan disbursement is greater than 50 lakh.
SELECT City, SUM(Loan_Amount) AS total_loan_disbursement
FROM loans WHERE Loan_Status = 'Disbursed' GROUP BY City HAVING SUM(Loan_Amount) > 5000000;

-- 45. Find loan types whose average loan amount is greater than 3 lakh.
SELECT Loan_Type, AVG(Loan_Amount) AS avg_loan_amount
FROM loans GROUP BY Loan_Type HAVING AVG(Loan_Amount) > 300000;

-- 46. Find cities having total overdue amount greater than 1 lakh.
SELECT City, SUM(Overdue_Amount) AS total_overdue_amount
FROM loans GROUP BY City HAVING SUM(Overdue_Amount) > 100000;

-- 47. Find employment types having more than 10 borrowers.
SELECT Employment_Type, COUNT(Customer_ID) AS no_of_borrowers
FROM loans GROUP BY Employment_Type HAVING COUNT(Customer_ID) > 10;

-- =========================================================
-- SECTION F — CASE Statement: Risk Classification
-- =========================================================
-- Risk rule:  750+  -> Low Risk | 650-749 -> Medium Risk | 550-649 -> High Risk | <550 -> Very High Risk

-- 48. Display customer name, credit score and risk category.
SELECT Customer_Name, Credit_Score,
  (CASE
     WHEN Credit_Score >= 750 THEN 'Low Risk'
     WHEN Credit_Score >= 650 THEN 'Medium Risk'
     WHEN Credit_Score >= 550 THEN 'High Risk'
     ELSE 'Very High Risk'
   END) AS Risk_Category
FROM loans;

-- 49. Count customers in each risk category.
SELECT
  (CASE
     WHEN Credit_Score >= 750 THEN 'Low Risk'
     WHEN Credit_Score >= 650 THEN 'Medium Risk'
     WHEN Credit_Score >= 550 THEN 'High Risk'
     ELSE 'Very High Risk'
   END) AS Risk_Category,
  COUNT(Customer_ID) AS no_of_customers
FROM loans
GROUP BY Risk_Category;

-- 50. Find the total outstanding amount for each risk category.
SELECT
  (CASE
     WHEN Credit_Score >= 750 THEN 'Low Risk'
     WHEN Credit_Score >= 650 THEN 'Medium Risk'
     WHEN Credit_Score >= 550 THEN 'High Risk'
     ELSE 'Very High Risk'
   END) AS Risk_Category,
  SUM(Outstanding_Amount) AS total_outstanding_amount
FROM loans
GROUP BY Risk_Category;

-- 51. Find the total overdue amount for each risk category.
SELECT
  (CASE
     WHEN Credit_Score >= 750 THEN 'Low Risk'
     WHEN Credit_Score >= 650 THEN 'Medium Risk'
     WHEN Credit_Score >= 550 THEN 'High Risk'
     ELSE 'Very High Risk'
   END) AS Risk_Category,
  SUM(Overdue_Amount) AS total_overdue_amount
FROM loans
GROUP BY Risk_Category;

-- =========================================================
-- SECTION G — Business KPI Analysis
-- =========================================================

-- 52. Loan Approval Rate
SELECT COUNT(CASE WHEN Loan_Status = 'Approved' THEN 1 END) * 100 / COUNT(*) AS loan_approval_rate FROM loans;

-- 53. Loan Rejection Rate
SELECT COUNT(CASE WHEN Loan_Status = 'Rejected' THEN 1 END) * 100 / COUNT(*) AS loan_rejection_rate FROM loans;

-- 54. Average Loan Amount
SELECT AVG(Loan_Amount) AS avg_loan_amount FROM loans;

-- 55. Total Disbursed Amount
SELECT SUM(Loan_Amount) AS total_disbursed_amount FROM loans WHERE Loan_Status = 'Disbursed';

-- 56. Total Outstanding Amount
SELECT SUM(Outstanding_Amount) AS total_outstanding_amount FROM loans;

-- 57. Total Overdue Amount
SELECT SUM(Overdue_Amount) AS total_overdue_amount FROM loans;

-- 58. Average Credit Score
SELECT AVG(Credit_Score) AS avg_credit_score FROM loans;

-- 59. Default Customer Count
SELECT COUNT(DISTINCT Customer_ID) AS default_customer_count FROM loans WHERE Payment_Status = 'Default';

-- 60. Percentage of Overdue Loans
SELECT COUNT(CASE WHEN Overdue_Amount > 0 THEN 1 END) * 100 / COUNT(*) AS percentage_of_overdue_loans FROM loans;

-- =========================================================
-- SECTION H — Date Analysis
-- =========================================================

-- 61. Find loans applied for in a particular year.
SELECT * FROM loans WHERE YEAR(Application_Date) = 2026;

-- 62. Find loans approved during a particular month.
SELECT * FROM loans WHERE MONTH(Approval_Date) = 2;

-- 63. Find the number of loans applied for each year.
SELECT YEAR(Application_Date) AS application_year, COUNT(Loan_ID) AS no_of_loans
FROM loans GROUP BY YEAR(Application_Date);

-- 64. Find the total loan amount disbursed each year.
SELECT YEAR(Disbursement_Date) AS disbursement_year, SUM(Loan_Amount) AS total_loan_amount
FROM loans WHERE Disbursement_Date IS NOT NULL GROUP BY YEAR(Disbursement_Date);

-- 65. Find customers whose loan was approved but not yet disbursed.
SELECT Customer_ID, Customer_Name FROM loans WHERE Loan_Status = 'Approved' AND Disbursement_Date IS NULL;

-- 66. Find the number of loans approved in each month.
SELECT MONTH(Approval_Date) AS approval_month, COUNT(Loan_ID) AS no_of_loans
FROM loans WHERE Approval_Date IS NOT NULL GROUP BY MONTH(Approval_Date);

-- 67. Find the average number of days between application and approval.
SELECT AVG(DATEDIFF(Approval_Date, Application_Date)) AS average_days_between_application_and_approval FROM loans;

-- =========================================================
-- SECTION I — Subquery Challenges
-- =========================================================

-- 68. Find customers whose loan amount is greater than the average loan amount.
SELECT Customer_ID, Customer_Name FROM loans WHERE Loan_Amount > (SELECT AVG(Loan_Amount) FROM loans);

-- 69. Find customers whose credit score is greater than the average credit score.
SELECT Customer_ID, Customer_Name FROM loans WHERE Credit_Score > (SELECT AVG(Credit_Score) FROM loans);

-- 70. Find the customer who has taken the highest loan amount.
SELECT Customer_ID, Customer_Name, Loan_Amount FROM loans WHERE Loan_Amount = (SELECT MAX(Loan_Amount) FROM loans);

-- 71. Find customers who have outstanding amounts greater than the average outstanding amount.
SELECT Customer_Name, Outstanding_Amount FROM loans WHERE Outstanding_Amount > (SELECT AVG(Outstanding_Amount) FROM loans);

-- 72. Find the loan type having the highest total loan amount.
SELECT Loan_Type, SUM(Loan_Amount) AS total_loan_amount
FROM loans GROUP BY Loan_Type ORDER BY SUM(Loan_Amount) DESC LIMIT 1;

-- 73. Find customers whose annual income is greater than the average annual income.
SELECT Customer_ID, Customer_Name FROM loans WHERE Annual_Income > (SELECT AVG(Annual_Income) FROM loans);

-- =========================================================
-- SECTION J — Advanced SQL: Top Management Questions
-- =========================================================

-- 74. Find the top 5 customers by total loan amount.
SELECT Customer_ID, Customer_Name, SUM(Loan_Amount) AS total_loan_amount
FROM loans GROUP BY Customer_ID, Customer_Name ORDER BY SUM(Loan_Amount) DESC LIMIT 5;

-- 75. Find the top 3 cities by total loan disbursement.
SELECT City, SUM(Loan_Amount) AS total_loan_disbursement
FROM loans WHERE Loan_Status = 'Disbursed' GROUP BY City ORDER BY SUM(Loan_Amount) DESC LIMIT 3;

-- 76. Find the top 3 loan types by outstanding amount.
SELECT Loan_Type, SUM(Outstanding_Amount) AS total_outstanding_amount
FROM loans GROUP BY Loan_Type ORDER BY SUM(Outstanding_Amount) DESC LIMIT 3;

-- 77. Find customers who have both a credit score below 650 and an overdue amount greater than 50,000.
SELECT Customer_ID, Customer_Name FROM loans WHERE Credit_Score < 650 AND Overdue_Amount > 50000;

-- 78. Identify customers whose loan amount is high compared with their annual income.
SELECT Customer_ID, Customer_Name, Annual_Income, Loan_Amount FROM loans WHERE Loan_Amount > Annual_Income;

-- 79. Identify customers who have multiple loans.
SELECT Customer_ID, Customer_Name, COUNT(Loan_ID) AS loan_count
FROM loans GROUP BY Customer_ID, Customer_Name HAVING COUNT(Loan_ID) > 1;

-- 80. Find customers whose previous loan is closed but who have another active loan.
SELECT DISTINCT l1.Customer_ID, l1.Customer_Name
FROM loans l1
JOIN loans l2 ON l1.Customer_ID = l2.Customer_ID
WHERE l1.Loan_Status = 'Closed' AND l2.Loan_Status = 'Disbursed';

-- =========================================================
-- SECTION K — Final Business Challenge: Loan Risk & Portfolio Report
-- =========================================================

-- ---- Portfolio ----

-- How many total loans does the company have?
SELECT COUNT(Loan_ID) AS total_loans FROM loans;

-- What is the total loan portfolio value?
SELECT SUM(Loan_Amount) AS total_loan_portfolio_value FROM loans;

-- How much has been disbursed?
SELECT SUM(Loan_Amount) AS total_disbursed_amount FROM loans WHERE Loan_Status = 'Disbursed';

-- How much is still outstanding?
SELECT SUM(Outstanding_Amount) AS total_outstanding_amount FROM loans;

-- ---- Customer ----

-- Which customers have the largest loans?
SELECT Customer_ID, Customer_Name, Loan_Amount FROM loans ORDER BY Loan_Amount DESC LIMIT 5;

-- Which cities generate the highest loan business?
SELECT City, SUM(Loan_Amount) AS total_loan_business FROM loans GROUP BY City ORDER BY total_loan_business DESC;

-- Which customer segments have the highest borrowing?
SELECT Employment_Type, SUM(Loan_Amount) AS total_borrowing FROM loans GROUP BY Employment_Type ORDER BY total_borrowing DESC;

-- ---- Risk ----

-- How many customers are High / Very High Risk?
SELECT COUNT(*) AS high_very_high_risk_customers FROM loans WHERE Credit_Score < 650;

-- Which risk category has the highest outstanding amount?
SELECT
  (CASE
     WHEN Credit_Score >= 750 THEN 'Low Risk'
     WHEN Credit_Score >= 650 THEN 'Medium Risk'
     WHEN Credit_Score >= 550 THEN 'High Risk'
     ELSE 'Very High Risk'
   END) AS Risk_Category,
  SUM(Outstanding_Amount) AS total_outstanding_amount
FROM loans
GROUP BY Risk_Category
ORDER BY total_outstanding_amount DESC
LIMIT 1;

-- Which cities have the highest overdue amount?
SELECT City, SUM(Overdue_Amount) AS total_overdue_amount FROM loans GROUP BY City ORDER BY total_overdue_amount DESC;

-- How many customers are in default?
SELECT COUNT(DISTINCT Customer_ID) AS default_customers FROM loans WHERE Payment_Status = 'Default';

-- ---- Performance ----

-- Which loan type is most popular?
SELECT Loan_Type, COUNT(Loan_ID) AS number_of_loans FROM loans GROUP BY Loan_Type ORDER BY number_of_loans DESC LIMIT 1;

-- Which loan type generates the highest disbursement?
SELECT Loan_Type, SUM(Loan_Amount) AS total_disbursement
FROM loans WHERE Loan_Status = 'Disbursed' GROUP BY Loan_Type ORDER BY total_disbursement DESC LIMIT 1;

-- Which loan type has the highest overdue amount?
SELECT Loan_Type, SUM(Overdue_Amount) AS total_overdue_amount FROM loans GROUP BY Loan_Type ORDER BY total_overdue_amount DESC LIMIT 1;

-- What is the loan approval rate?
SELECT COUNT(CASE WHEN Loan_Status = 'Approved' THEN 1 END) * 100.0 / COUNT(*) AS loan_approval_rate FROM loans;
