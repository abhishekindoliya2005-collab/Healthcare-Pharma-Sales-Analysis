# Healthcare / Pharma Sales Analysis

## Project Overview
A portfolio-ready analytics project that analyzes pharmaceutical sales data to understand product, regional, representative, doctor, and monthly performance.

## Objective
Convert raw transaction data into business insights that can support sales planning, resource allocation, and performance monitoring.

## Tech Stack
- SQL (MySQL 8+)
- Microsoft Excel
- Power BI
- GitHub

## Dataset
The project includes a synthetic dataset of 1,500 pharmaceutical sales transactions covering January–December 2025.

Main fields:
- Order_ID
- Date / Month
- Product
- Category
- Region / City
- Sales Representative
- Doctor_ID
- Quantity
- Unit_Price
- Discount
- Revenue
- Profit
- Profit_Margin

## Workflow
Raw CSV → Data validation/cleaning → SQL analysis → KPI calculations → Power BI dashboard → Business insights

## Business Questions
1. What is total revenue, profit, units sold and average order value?
2. Which products generate the most revenue?
3. Which regions perform best?
4. How does revenue change month to month?
5. Which doctors and sales representatives contribute most?
6. Which categories are most profitable?
7. Which products/regions need attention?
8. Does discounting appear to affect profitability?

## Repository Structure
```
Healthcare_Pharma_Sales_Analysis/
├── data/
│   └── pharma_sales.csv
├── excel/
│   └── pharma_sales_analysis.xlsx
├── sql/
│   └── pharma_analysis.sql
├── dashboard/
│   └── powerbi_dashboard_plan.md
├── docs/
│   └── project_report.md
└── README.md
```

## How to Use
1. Import `data/pharma_sales.csv` into MySQL.
2. Run `sql/pharma_analysis.sql`.
3. Open `excel/pharma_sales_analysis.xlsx` for pre-aggregated summaries.
4. Load the CSV into Power BI.
5. Recreate the dashboard using the dashboard plan provided in `dashboard/`.

## Skills Demonstrated
SQL, data cleaning, aggregation, joins/window functions, KPI design, exploratory analysis, dashboard design, business interpretation, and data-driven recommendations.

## Interview Summary
"I analyzed 1,500 pharmaceutical sales transactions across products, regions, doctors and sales representatives. I used SQL to calculate business KPIs and performance metrics, Excel for validation and summary analysis, and Power BI for visualization. The analysis focused on identifying high-performing products and regions, monthly trends, representative performance, and profitability so that sales teams could prioritize resources based on data."

## Important
This repository uses a synthetic dataset created for portfolio/interview practice. Do not present the generated findings as real pharmaceutical-company data.
