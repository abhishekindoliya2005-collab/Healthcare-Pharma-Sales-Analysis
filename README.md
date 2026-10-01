
# Healthcare / Pharma Sales Analysis

## 📌 Project Overview

This project focuses on analyzing pharmaceutical sales data to understand **product performance, regional sales trends, customer/doctor activity, and overall revenue patterns**.

The main objective is to use data analytics to identify important business insights that can help a pharmaceutical company improve its sales performance and make better data-driven decisions.

---

## 🎯 Business Objectives

The analysis aims to answer the following questions:

- Which pharmaceutical products generate the highest revenue?
- Which regions have the highest and lowest sales?
- How do sales change over time?
- Which products are growing or declining in sales?
- Which doctors/customers contribute the most to sales?
- What are the major sales trends?
- Which areas may require additional sales attention?
- How can sales performance be improved using data-driven insights?

---

## 🛠️ Tools & Technologies

- **SQL** – Data extraction, transformation and analysis
- **Microsoft Excel** – Data cleaning and preliminary analysis
- **Power BI** – Interactive dashboard and data visualization
- **GitHub** – Project documentation and version control

---

## 📊 Dataset

The dataset contains pharmaceutical sales-related information such as:

| Column | Description |
|---|---|
| Date | Date of transaction |
| Product_ID | Unique product identifier |
| Product_Name | Name of pharmaceutical product |
| Category | Product/therapy category |
| Region | Sales region |
| Sales_Representative | Representative responsible for sales |
| Doctor_ID | Unique doctor identifier |
| Quantity | Number of units sold |
| Unit_Price | Price per unit |
| Revenue | Total revenue generated |

> **Note:** Dataset structure can be modified depending on the source dataset used.

---

## 🔄 Project Workflow

```text
Raw Dataset
     ↓
Data Cleaning
     ↓
SQL Analysis
     ↓
KPI Calculation
     ↓
Trend & Performance Analysis
     ↓
Power BI Dashboard
     ↓
Business Insights
     ↓
Recommendations
```

---

## 🧹 Data Cleaning

The following data-cleaning activities were performed:

- Removed duplicate records
- Checked for missing values
- Standardized product and region names
- Corrected date formats
- Checked numerical columns for invalid values
- Verified revenue calculations
- Created calculated fields required for analysis

---

## 🗄️ SQL Analysis

SQL was used to analyze sales performance and generate business insights.

### Example KPIs

- Total Revenue
- Total Units Sold
- Total Orders
- Average Order Value
- Monthly Revenue
- Revenue by Product
- Revenue by Region
- Product Growth Rate

### Example SQL Query

```sql
SELECT 
    Product_Name,
    SUM(Revenue) AS Total_Revenue
FROM pharma_sales
GROUP BY Product_Name
ORDER BY Total_Revenue DESC;
```

This query identifies the pharmaceutical products generating the highest revenue.

---

## 📈 Power BI Dashboard

The Power BI dashboard contains the following sections:

### 1. Overall Performance

Key metrics:

- Total Revenue
- Total Units Sold
- Total Orders
- Average Order Value

### 2. Product Analysis

Visualizations include:

- Revenue by product
- Units sold by product
- Top-performing products
- Product-wise sales trends

### 3. Regional Analysis

Visualizations include:

- Revenue by region
- Units sold by region
- Regional sales comparison
- Region-wise monthly trends

### 4. Time-Series Analysis

The dashboard analyzes:

- Monthly revenue
- Monthly units sold
- Growth trends
- Seasonal patterns

### 5. Sales Representative Analysis

The dashboard compares:

- Sales by representative
- Revenue contribution
- Units sold
- Regional performance

---

## 🔍 Key Insights

The analysis can be used to identify insights such as:

- A small group of products contributes a significant portion of total revenue.
- Some regions consistently outperform other regions.
- Sales performance changes considerably across different months.
- Certain products show declining sales and may require additional attention.
- High-performing sales representatives contribute significantly to overall revenue.
- Regional performance can help identify areas with potential for sales growth.

> The actual insights should be updated according to the results obtained from the dataset.

---

## 💡 Business Recommendations

Based on the analysis, possible recommendations include:

1. **Focus on high-performing products**  
   Allocate additional sales resources toward products with consistently strong demand.

2. **Identify underperforming regions**  
   Investigate regions with low sales and understand the underlying reasons.

3. **Monitor declining products**  
   Track products with decreasing sales and evaluate whether additional promotional or sales efforts are required.

4. **Use sales trends for planning**  
   Historical trends can help improve sales forecasting and resource allocation.

5. **Analyze sales representative performance**  
   Identify successful strategies used by high-performing representatives and evaluate whether they can be applied more broadly.

---

## 📁 Repository Structure

```text
Healthcare-Pharma-Sales-Analysis/
│
├── data/
│   └── pharma_sales.csv
│
├── sql/
│   └── pharma_analysis.sql
│
├── powerbi/
│   └── pharma_sales_dashboard.pbix
│
├── excel/
│   └── cleaned_pharma_data.xlsx
│
├── images/
│   └── dashboard.png
│
└── README.md
```

---

## 🚀 Skills Demonstrated

This project demonstrates practical skills in:

- Data Cleaning
- SQL
- Data Aggregation
- KPI Development
- Exploratory Data Analysis
- Business Analytics
- Data Visualization
- Power BI Dashboard Development
- Business Problem Solving
- Data-Driven Decision Making

---

## 📌 Conclusion

The Healthcare / Pharma Sales Analysis project demonstrates how raw pharmaceutical sales data can be transformed into meaningful business insights.

By combining **SQL, Excel and Power BI**, the project provides a structured approach to understanding sales performance, identifying trends, comparing regions and products, and supporting data-driven business decisions.

---

## 👤 Author

**Abhishek Indoliya**

B.Tech – Metallurgical & Materials Engineering  
IIT Patna

**Skills:** SQL | Excel | Power BI | Data Analysis
