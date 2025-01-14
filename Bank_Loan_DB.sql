SELECT * FROM Bank_Lone_data

--KPI'S--

SELECT COUNT(id) AS Total_lone_Application FROM  Bank_Lone_data

SELECT COUNT(id) AS MTD_Total_lone_Application FROM  Bank_Lone_data
WHERE MONTH(issue_date) =12 and YEAR(issue_date) = 2021

SELECT SUM(loan_amount) AS MTD_Total_Funded_Amount FROM Bank_Lone_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

SELECT SUM(loan_amount) AS PMTD_Total_Funded_Amount FROM Bank_Lone_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

SELECT SUM(total_payment) AS MTD_Total_Amount_Recivred FROM  Bank_Lone_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

SELECT SUM(total_payment) AS PMTD_Total_Amount_Recivred FROM  Bank_Lone_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

SELECT ROUND(AVG(int_rate),4) *100 AS Ave_Intrest_Rate FROM Bank_Lone_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) =2021

SELECT ROUND(AVG(int_rate),4) *100 AS Ave_Intrest_Rate FROM Bank_Lone_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) =2021

SELECT ROUND(AVG(dti),4) * 100 AS MTD_Avg_DTI FROM Bank_Lone_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) =2021

SELECT ROUND(AVG(dti),4) * 100 AS PMTD_Avg_DTI FROM Bank_Lone_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) =2021

--Dashboard 1 (Summary)
--Good Loan KPI’s--

SELECT * FROM Bank_Lone_data

SELECT (COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END)*100)
			/ COUNT(id) AS Good_Loan_Percentage
FROM Bank_Lone_data

SELECT COUNT(id) AS Good_Loan_Application FROM Bank_Lone_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current' 

SELECT SUM(loan_amount) AS Good_Loan_Funded_Amount FROM Bank_Lone_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current' 

SELECT SUM(total_payment) AS Good_Loan_Recieved_Amount FROM Bank_Lone_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current' 

--Bad Loan KPI's--

SELECT (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END)*100.0)
			/ COUNT(id) AS Bad_Loan_Percentage
FROM Bank_Lone_data

SELECT COUNT(id) AS Bad_Loan_Application FROM Bank_Lone_data
WHERE loan_status = 'Charged Off'

SELECT SUM(loan_amount) AS Bad_Loan_Funded_Amount FROM Bank_Lone_data
WHERE loan_status = 'Charged Off'

SELECT SUM(total_payment) AS Bad_Loan_Recieved_Amount FROM Bank_Lone_data
WHERE loan_status = 'Charged Off'  

--Loan Status Grid View--

SELECT 
		loan_status,
		COUNT(id) AS Total_Loan_Application,
		SUM(total_payment) AS Total_Amount_Recived,
		SUM(loan_amount) AS Total_Funded_Amount,
		AVG(int_rate * 100) AS Interest_Rate,
		AVG(dti * 100) AS DTI
FROM 
		Bank_Lone_data
GROUP BY
		loan_status

SELECT 
		loan_status,
		SUM(total_payment) AS MTD_Total_Amount_Recived,
		SUM(loan_amount) AS MTD_Total_Funded_Amount
FROM 
		Bank_Lone_data
WHERE 
		MONTH(issue_date) = 12
GROUP BY
		loan_status

--Dasboard 2 (Overview)
--Monthly Trends by Issue Date --
SELECT 
		MONTH(issue_date) AS Month_Number,
		DATENAME(MONTH, issue_date) AS Month_Name,
		COUNT(id) Total_Loan_Application,
		SUM(total_payment) AS Total_Amount_Recived,
		SUM(loan_amount) AS Total_Funded_Amount
FROM 
		Bank_Lone_data
GROUP BY
		DATENAME(MONTH,issue_date),MONTH(issue_date)
ORDER BY
		MONTH(issue_date) 

--Regional Analysis by State --
SELECT 
		address_state,
		COUNT(id) Total_Loan_Application,
		SUM(total_payment) AS Total_Amount_Recived,
		SUM(loan_amount) AS Total_Funded_Amount
FROM 
		Bank_Lone_data
GROUP BY
		address_state
ORDER BY
		address_state

--Loan Term Analysis--
SELECT 
		term,
		COUNT(id) Total_Loan_Application,
		SUM(total_payment) AS Total_Amount_Recived,
		SUM(loan_amount) AS Total_Funded_Amount
FROM 
		Bank_Lone_data
GROUP BY
		term
ORDER BY
		term

--Employee Length Analysis --

SELECT 
		emp_length,
		COUNT(id) Total_Loan_Application,
		SUM(total_payment) AS Total_Amount_Recived,
		SUM(loan_amount) AS Total_Funded_Amount
FROM 
		Bank_Lone_data
GROUP BY
		emp_length
ORDER BY
		emp_length

--Loan Purpose Breakdown --

SELECT 
		purpose,
		COUNT(id) Total_Loan_Application,
		SUM(total_payment) AS Total_Amount_Recived,
		SUM(loan_amount) AS Total_Funded_Amount
FROM 
		Bank_Lone_data
GROUP BY
		purpose
ORDER BY
		purpose

--Home Ownership Analysis --

SELECT 
		home_ownership,
		COUNT(id) Total_Loan_Application,
		SUM(total_payment) AS Total_Amount_Recived,
		SUM(loan_amount) AS Total_Funded_Amount
FROM 
		Bank_Lone_data
GROUP BY
		home_ownership
ORDER BY
		home_ownership

