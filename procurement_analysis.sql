CREATE DATABASE procurement_analysis;
USE procurement_analysis;
CREATE TABLE procurement (
    PO_ID VARCHAR(20),
    Supplier VARCHAR(50),
    Order_Date DATE,
    Delivery_Date DATE,
    Item_Category VARCHAR(50),
    Order_Status VARCHAR(30),
    Quantity INT,
    Unit_Price DECIMAL(10,2),
    Negotiated_Price DECIMAL(10,2),
    Defective_Units INT,
    Compliance VARCHAR(10)
);
-- Q1: Orders per supplier
select supplier, count(PO_ID) as no_of_orders from procurement
group by supplier order by no_of_orders desc;

-- Q2: Lead time per delivered order (sample rows)
select PO_ID, Supplier, Order_Date, Delivery_Date, 
       DATEDIFF(Delivery_Date, Order_Date) as lead_time_days 
from procurement where Order_Status = 'Delivered' and Delivery_Date is not null
limit 10;

-- Q3: On-time delivery rate per supplier
select supplier, count(PO_ID) as total_Orders,
  sum(case when DATEDIFF(Delivery_Date, Order_Date) <= 11 then 1 else 0 end) as Ontime_orders, 
  Round(sum(case when DATEDIFF(Delivery_Date, Order_Date) <= 11 then 1 else 0 end)/count(*)*100,1) as percentage_ontime 
from procurement
WHERE Order_Status = 'Delivered' AND Delivery_Date IS NOT NULL
group by supplier
order by percentage_ontime desc;

-- Q4: Defect rate per supplier
select supplier, round(sum(Defective_Units)/sum(Quantity)*100,1) as def_pct 
from procurement 
where Order_Status = 'Delivered'
group by supplier
order by def_pct desc;

-- Q5: Compliance rate per supplier
select supplier, count(PO_ID) as total_Orders,
  sum(case when Compliance = 'Yes' then 1 else 0 end) as Comp_check, 
  Round(sum(case when Compliance = 'Yes' then 1 else 0 end)/count(*)*100,1) as Comp_pct 
from procurement
WHERE Order_Status = 'Delivered'
group by supplier
order by Comp_pct desc;

-- Q6: Average lead time per supplier
select Supplier, 
      round(avg(DATEDIFF(Delivery_Date, Order_Date)),1) as avg_lead_time_days 
from procurement where Order_Status = 'Delivered' and Delivery_Date is not null
group by supplier
order by avg_lead_time_days desc;

-- Q7: Combined vendor scorecard — all 4 KPIs per supplier
select supplier, 
  Round(sum(case when DATEDIFF(Delivery_Date, Order_Date) <= 11 then 1 else 0 end)/count(*)*100,1) as ontime_pct,
  round(sum(Defective_Units)/sum(Quantity)*100,1) as def_pct,
  Round(sum(case when Compliance = 'Yes' then 1 else 0 end)/count(*)*100,1) as Comp_pct,
  round(avg(DATEDIFF(Delivery_Date, Order_Date)),1) as avg_lead_time_days
from procurement
WHERE Order_Status = 'Delivered' AND Delivery_Date IS NOT NULL 
group by supplier;

-- Q8: Total monetary value lost to defective units per supplier
select supplier, round(sum(Defective_Units*Unit_Price),1) as def_value 
from procurement 
where Order_Status = 'Delivered'
group by supplier
order by def_value desc;