# Power BI Dashboard Plan

## Page 1 — Executive Overview
Cards:
- Total Revenue
- Total Profit
- Total Orders
- Total Units
- Average Order Value
- Profit Margin %

Charts:
1. Line chart: Month vs Revenue
2. Bar chart: Region vs Revenue
3. Bar chart: Category vs Revenue
4. Top 10 Products by Revenue

Slicers:
- Date
- Region
- Category
- Product
- Sales Representative

## Page 2 — Product & Region Analysis
Visuals:
- Product revenue ranking
- Product profit ranking
- Region revenue comparison
- Region x Category matrix
- City performance

## Page 3 — Sales Force & Doctor Analysis
Visuals:
- Sales representative revenue
- Sales representative profit
- Top 10 doctors by revenue
- Orders per doctor

## Suggested DAX Measures

Total Revenue = SUM(pharma_sales[Revenue])

Total Profit = SUM(pharma_sales[Profit])

Total Units = SUM(pharma_sales[Quantity])

Total Orders = DISTINCTCOUNT(pharma_sales[Order_ID])

Average Order Value = DIVIDE([Total Revenue], [Total Orders])

Profit Margin % = DIVIDE([Total Profit], [Total Revenue])

## Design Principle
Keep the dashboard business-focused: show the KPI first, then the trend, then the drivers, and finally the details.
