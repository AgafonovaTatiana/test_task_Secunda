select * from db
where "SubdivisionName" = 'Онлайн' and 
extract(year from to_timestamp("issueDateTimestamp", 'DD.MM.YYYY HH24:MI')) = 2024

select "Status", count(distinct "NumContract") as cnt_distinct_customers, 
sum("LoanAmount" ) as sum_loan_amount from db
group by "Status" 
order by sum_loan_amount desc

SELECT
  COALESCE(db2.contract_id, db."NumContract") AS contract_id,
  db2.issue_date,
  db2.sum_issued,
  db2.debt_od,
  db2.debt_perc,
  db2.days_overdue,
  db."ClientID",
  db."inner_lead_id",
  db."SubdivisionName",
  db."issueDateTimestamp",
  db."RepaymentPlanDate",
  db."LoanAmount",
  db."Status",
  db."DateStatus",
  db."SumLastPay"
FROM db
FULL OUTER JOIN db2
  ON db."NumContract" = db2.contract_id