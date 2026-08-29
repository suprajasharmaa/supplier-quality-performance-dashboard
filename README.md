📊 Supplier Quality & Performance Dashboard
📄 [Case Study Report](https://github.com/suprajasharmaa/supplier-quality-performance-dashboard/blob/main/Supplier_Quality_Performance_Dashboard_Writeup.docx) | 🗃️ [SQL Queries](https://github.com/suprajasharmaa/supplier-quality-performance-dashboard/blob/main/procurement_analysis.sql) | 📈 [Excel Workbook](https://github.com/suprajasharmaa/supplier-quality-performance-dashboard/blob/main/Vendor_Scorecard_Composite_Ranking.xlsx) | 📊 [Power BI Dashboard](https://github.com/suprajasharmaa/supplier-quality-performance-dashboard/blob/main/Supplier_Quality_Performance_Dashboard.pbix)

A SQL + Excel + Power BI analysis of 777 procurement orders across 5 suppliers to identify who's underperforming on delivery, quality, and compliance - built with CASE logic, weighted composite scoring, DAX measures, a drillthrough page, a Supplier slicer for cross-filtering, a What-if Parameter, and AI-driven segmentation.

## Overview

This project analyses supplier performance across a procurement dataset of 777 purchase orders. The goal was to identify which suppliers are most likely to be underperforming on delivery reliability, product quality, and contract compliance, and to convert that into a specific, actionable recommendation per supplier.

## Dataset

- **Source:** [Kaggle - Procurement KPI Analysis Dataset](https://www.kaggle.com/datasets/shahriarkabir/procurement-kpi-analysis-dataset)
- **Size:** 777 rows × 11 columns
- **Time period:** January 2022 - January 2024
- **Key columns:** Supplier, Order_Date, Delivery_Date, Item_Category, Quantity, Unit_Price, Negotiated_Price, Defective_Units, Compliance

## Tools Used

MySQL (MySQL Workbench) · Excel (min-max normalization, weighted scoring) · Power BI (DAX measures, drillthrough, What-if Parameter, Key Influencers/Top Segments AI visual, custom theme)

## Key Findings

1. Gamma_Co leads on-time delivery at 61.3%, while Beta_Supplies trails at just 46.0% - over half of its deliveries arrive late
2. Delta_Logistics has the highest defect rate of all 5 suppliers (10.6%), translating to ₹7.83L in defective-unit costs - the single largest cost impact in the portfolio
3. A weighted composite score (30% On-Time, 40% Defect Rate, 20% Compliance, 10% Lead Time) reveals a genuine two-tier split: three suppliers score 74-81, while two score just 21-31
4. AI-driven segmentation found Beta_Supplies' lateness problem concentrates specifically outside Office Supplies orders - a 74-order cluster with a 59.5% late rate, nearly double the company average
5. Price variance from the negotiated price is flat across all 5 suppliers (~8.5-8.9%) and uncorrelated with the Compliance flag, disproving the assumption that compliance is pricing-related

## Recommendations

1. Issue a 90-day performance improvement notice to Beta_Supplies with a defined 11-day on-time SLA target, focused on the categories where its lateness concentrates
2. Commission a root-cause audit for Delta_Logistics to determine whether defects originate at manufacture or in transit before deciding on contract action
3. Reallocate order volume toward Gamma_Co, the top-ranked supplier, for categories currently served by the two lowest-performing vendors

## Files in This Repository

- `procurement_analysis.sql` - all 8 queries with comments
- `Vendor_Scorecard_Composite_Ranking.xlsx` - normalization and weighted composite scoring, with live formulas
- `Supplier_Quality_Performance_Dashboard.pbix` - full interactive Power BI dashboard
- `Supplier_Quality_Performance_Dashboard_Writeup.docx` - case study write-up (problem, method, insights, recommendations)
- `data/Procurement_KPI_Analysis_Dataset.csv` - source dataset
- `README.md` - this file

## How to Run

1. Download the dataset from Kaggle (Procurement KPI Analysis Dataset)
2. Create a schema called `procurement_analysis` in MySQL Workbench, import the CSV into a table called `procurement`, and run the queries in `procurement_analysis.sql` in order - each is commented with its business question
3. Open `Vendor_Scorecard_Composite_Ranking.xlsx` to see the normalization and composite scoring built on the SQL output
4. Open `Supplier_Quality_Performance_Dashboard.pbix` in Power BI Desktop for the full interactive experience - includes a Supplier slicer on the Overview page, a drillthrough page, a What-if Parameter, and AI-driven segmentation.
