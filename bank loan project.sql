create database project;
use project;
CREATE TABLE financial_loa(
    id INT NOT NULL,
    address_state VARCHAR(20),
    application_type VARCHAR(20),
    emp_length VARCHAR(20),
    emp_title VARCHAR(100),
    grade VARCHAR(10),
    home_ownership VARCHAR(20),
    issue_date DATE,
    last_credit_pull_date DATE,
    last_payment_date DATE,
    loan_status VARCHAR(20),
    next_payment_date DATE,
    member_id INT,
    purpose VARCHAR(20),
    sub_grade VARCHAR(10),
    term VARCHAR(20),
    verification_status VARCHAR(50),
    annual_income DOUBLE,
    dti DECIMAL(10,5),
    installment DECIMAL(10,2),
    int_rate DECIMAL(10,4),
    loan_amount DOUBLE,
    total_acc INT,
    total_payment DOUBLE,
    PRIMARY KEY (id)
);
select * from financial_loa;
-- Total Application
select count(id) as total_application from financial_loa;
-- Total Application MTD
select count(id) as total_application from financial_loa
where month(issue_date) = 12 and year(issue_date) = 2021;
-- Total Application PMTD
select count(id) as total_application from financial_loa
where month(issue_date) = 11;
-- Total Application MoM
SELECT
    (SELECT COUNT(id) FROM financial_loa WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021) AS mtd_applications,
    (SELECT COUNT(id) FROM financial_loa WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021) AS pmtd_applications,
    ROUND(
        (
            ( (SELECT COUNT(id) FROM financial_loa WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021) -
              (SELECT COUNT(id) FROM financial_loa WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021)
            ) 
            / 
            NULLIF((SELECT COUNT(id) FROM financial_loa WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021), 0)
        ) * 100, 2
    ) AS mom_percentage_change;
-- Total Amount Recieved
select sum(total_payment) from financial_loa;
-- MTD
select sum(total_payment) from financial_loa
where month(issue_date) = 12;
-- PMTD
select sum(total_payment) from financial_loa
where month(issue_date) = 11;
-- MoM
SELECT
    (SELECT SUM(total_payment) FROM financial_loa WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021) AS mtd_payment,
    (SELECT SUM(total_payment) FROM financial_loa WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021) AS pmtd_payment,
    ROUND(
        (
            (
                (SELECT SUM(total_payment) FROM financial_loa WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021) -
                (SELECT SUM(total_payment) FROM financial_loa WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021)
            )
            /
            NULLIF((SELECT SUM(total_payment) FROM financial_loa WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021), 0)
        ) * 100, 2
    ) AS mom_percentage_change;

-- total funded amount
select sum(loan_amount) from financial_loa;
-- Total Funded Amount MTD
select sum(loan_amount) from financial_loa
where month(issue_date) = 12;
-- Total Funded Amount PMTD
select sum(loan_amount) from financial_loa
where month(issue_date) = 11;
-- Total Funded Amount MoM
select
		(select sum(loan_amount) from financial_loa where month(issue_date) = 12) as Total_funded_MTD,
        (select sum(loan_amount) from financial_loa where month(issue_date) = 11) as Total_funded_PMTD,
	round(
		(
        (
            (select sum(loan_amount) from financial_loa where month(issue_date)= 12)-
            (select sum(loan_amount) from financial_loa where month(issue_date) = 11)
        ) 
        /
        NULLIF((select sum(loan_Amount) from financial_loa where month(issue_date) = 11),0)
        )*100 , 2
         )as Total_Funded_Amount_MoM;
-- Average dti
select avg(dti) from financial_loa;
-- MTD
select avg(dti) from financial_loa
where month(issue_date) = 12;
-- PMTD
select avg(dti) from financial_loa
where month(issue_date) = 11;
-- MoM
select
		(select avg(dti) from financial_loa where month(issue_date) = 12)as MTD,
        (select avg(dti) from financial_loa where month(issue_Date)= 11)as PMTD,
        round(
			(
                (
                (select avg(dti) from financial_loa where month(issue_date)=12)-
                (select avg(dti) from financial_loa where month(issue_date)=11)
                )
                /
                nullif((select avg(dti) from financial_loa where month(issue_date)=11),0)
                )*100,2
				)as AVG_DTI_MoM;
-- Avg int rate
select avg(int_rate) from financial_loa;
-- avg int rate MTD
select avg(int_rate) from financial_loa
where month(issue_Date) = 12;
-- Avg int rate PMTD
select avg(int_rate) from financial_loa
where month(issue_date) = 11;
-- MoM
select
		(select )
        
