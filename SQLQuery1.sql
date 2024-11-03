select *from bank_loan_data


--problem statment

--1)total loan application

select count(id) as Total_Loan_Applications
from bank_loan_data

--MTD Loan Applications
SELECT COUNT(id) AS MTDTotal_Applications FROM bank_loan_data
WHERE MONTH(issue_date) = 12 and YEAR(issue_date) = 2021
SELECT COUNT(id) AS PMTDTotal_Applications FROM bank_loan_data
WHERE MONTH(issue_date) = 11
SELECT SUM(loan_amount) AS Total_Funded_Amount FROM bank_loan_data
SELECT SUM(loan_amount) AS MTDTotal_Funded_Amount FROM bank_loan_data
WHERE MONTH(issue_date) =12 and YEAR(issue_date) =2021
SELECT SUM(loan_amount) AS PMTDTotal_Funded_Amount FROM bank_loan_data
WHERE MONTH(issue_date) = 11 and year(issue_date) =2021
SELECT SUM(total_payment) AS Total_Amount_Collected FROM bank_loan_data
--MTD Total Amount Received
SELECT SUM(total_payment) AS MTDTotal_Amount_Collected FROM bank_loan_data
WHERE MONTH(issue_date) = 12 and year(issue_date) =2021
SELECT SUM(total_payment) AS Total_Amount_Collected FROM bank_loan_data
WHERE MONTH(issue_date) = 11 and year(issue_date) =2021
SELECT AVG(int_rate)*100 AS Avg_Int_Rate FROM bank_loan_data
SELECT AVG(int_rate)*100 AS MTD_Avg_Int_Rate FROM bank_loan_data
WHERE MONTH(issue_date) = 12 and year(issue_date) =2021


--PMTD Average Interest
SELECT AVG(int_rate)*100 AS PMTD_Avg_Int_Rate FROM bank_loan_data
WHERE MONTH(issue_date) = 11 and Year(issue_date)= 2021


--Avg DTI
SELECT AVG(dti)*100 AS Avg_DTI FROM bank_loan_data

--MTD Avg DTI
SELECT AVG(dti)*100 AS MTD_Avg_DTI FROM bank_loan_data
WHERE MONTH(issue_date) = 12 and year(issue_date) =2021
SELECT AVG(dti)*100 AS PMTD_Avg_DTI FROM bank_loan_data
WHERE MONTH(issue_date) = 11 and year(issue_date) =2021
SELECT
 (COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id
END) * 100.0) /
COUNT(id) AS Good_Loan_Percentage
FROM bank_loan_data
SELECT COUNT(id) AS Good_Loan_Applications FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'
SELECT SUM(loan_amount) AS Good_Loan_Funded_amount FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

--Good Loan Amount Received
SELECT SUM(total_payment) AS Good_Loan_amount_received FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'
SELECT
 (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0) /
COUNT(id) AS Bad_Loan_Percentage
FROM bank_loan_data
SELECT COUNT(id) AS Bad_Loan_Applications FROM bank_loan_data
WHERE loan_status = 'Charged Off'


--Bad Loan Funded Amount
SELECT SUM(loan_amount) AS Bad_Loan_Funded_amount FROM bank_loan_data
WHERE loan_status = 'Charged Off'
SELECT SUM(total_payment) AS Bad_Loan_amount_received FROM bank_loan_data
WHERE loan_status = 'Charged Off'
SELECT
 loan_status,
 COUNT(id) AS LoanCount,
 SUM(total_payment) AS Total_Amount_Received,
 SUM(loan_amount) AS Total_Funded_Amount,
 AVG(int_rate * 100) AS Interest_Rate,
 AVG(dti * 100) AS DTI
 FROM
 bank_loan_data
 GROUP BY
 loan_status
loan_status,
SUM(total_payment) AS MTD_Total_Amount_Received,
SUM(loan_amount) AS MTD_Total_Funded_Amount
FROM bank_loan_data
WHERE MONTH(issue_date) = 12
GROUP BY loan_status

--B. BANK LOAN REPORT | OVERVIEW
--MONTH
SELECT
MONTH(issue_date) AS Month_Munber,
DATENAME(MONTH, issue_date) AS Month_name,
COUNT(id) AS Total_Loan_Applications,
SUM(loan_amount) AS Total_Funded_Amount,
SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
ORDER BY MONTH(issue_date)


--STATE

SELECT
address_state AS State,
COUNT(id) AS Total_Loan_Applications,
SUM(loan_amount) AS Total_Funded_Amount,
SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY address_state
ORDER BY address_state


--TERM
SELECT
term AS Term,
COUNT(id) AS Total_Loan_Applications,
SUM(loan_amount) AS Total_Funded_Amount,
SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY term
ORDER BY term
emp_length AS Employee_Length,
COUNT(id) AS Total_Loan_Applications,
SUM(loan_amount) AS Total_Funded_Amount,
SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY emp_length
ORDER BY emp_length
purpose AS PURPOSE,
COUNT(id) AS Total_Loan_Applications,
SUM(loan_amount) AS Total_Funded_Amount,
SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY purpose
ORDER BY purpose



--HOME OWNERSHIP

SELECT
home_ownership AS Home_Ownership,
COUNT(id) AS Total_Loan_Applications,
SUM(loan_amount) AS Total_Funded_Amount,
SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY home_ownership
ORDER BY home_ownership 
