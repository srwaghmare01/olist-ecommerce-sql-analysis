# Olist Brazilian E-Commerce — SQL Analysis

## Project Overview

This project analyses real transactional data from Olist, Brazil's largest e-commerce marketplace. Using SQL, I explored customer behaviour, revenue trends, product performance, seller activity, delivery times, and customer satisfaction across nearly 100,000 orders.

The goal was to answer key business questions that a data analyst would realistically be asked in a commercial setting — and to identify any data quality issues along the way.

---

## Dataset

- **Source:** [Kaggle — Brazilian E-Commerce Public Dataset by Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)
- **Size:** 99,441 orders
- **Tool:** SQLiteOnline.com (SQLite)

---

## Tables Used

| Table | Description |
|---|---|
| orders | Order IDs, statuses, and timestamps |
| customers | Customer IDs and city locations |
| order_items | Products within each order |
| payments | Payment types and values |
| reviews | Customer review scores |
| products | Product categories and details |
| sellers | Seller IDs and locations |
| name_translation | Portuguese to English category translations |

---

## Questions Answered

| # | Question |
|---|---|
| Q1 | How many total orders are in the dataset? |
| Q2 | What are the different order statuses? |
| Q3 | What is the total revenue? |
| Q4 | What are the most popular payment methods? |
| Q5 | What is the average order value? |
| Q6 | What is the highest and lowest order value? |
| Q7 | How many orders were placed each year? |
| Q8 | Which cities have the most customers? |
| Q9 | What are the top 10 best selling product categories? |
| Q10 | What is the average review score? |
| Q11 | What is the full review score distribution? |
| Q12 | Which sellers made the most sales? |
| Q13 | What is the average delivery time in days? |
| Q14 | Which product categories generate the most revenue? |
| Q15 | Which customers spent the most? |

---

## Key Findings

- **99,441 total orders** across the dataset
- **96.4% of orders were successfully delivered**
- **R$16,008,872** total revenue generated
- **Credit card** is the dominant payment method — 74% of all transactions
- **Average order value** is R$154.10
- **Sao Paulo and Rio de Janeiro** account for 22% of all customers
- **Bed, table & bath** is the top selling category by volume (11,115 units)
- **Computer accessories** rank 3rd in revenue despite being 5th in units — higher price per item
- **Average customer review score** is 4.09 out of 5
- **1-star reviews outnumber 2-star reviews** — a J-curve pattern indicating customers who are unhappy tend to leave the worst possible rating
- **Average delivery time** is 12.6 days — expected given Brazil's size and geography
- **Top customer spent R$13,664** — matching the highest single order value, suggesting a bulk or business purchase

---

## Data Quality Issues Found

| Issue | Where Found |
|---|---|
| 3 orders with undefined payment type and R$0 revenue | Q4 |
| Lowest order value of R$0 — linked to undefined payment issue | Q6 |
| 2016 and 2018 are incomplete years — not suitable for direct year-on-year comparison | Q7 |
| Some orders have no delivery date — filtered using IS NOT NULL to avoid distorting averages | Q13 |

---

## SQL Concepts Used

- SELECT, FROM, WHERE
- COUNT, SUM, AVG, MAX, MIN
- GROUP BY, ORDER BY, LIMIT
- ROUND, JULIANDAY, strftime
- JOIN across 2 and 3 tables
- IS NOT NULL filtering
- Aliases using AS

---

## Power BI Dashboard

[View Interactive Dashboard] (https://app.powerbi.com/view?r=eyJrIjoiYzNiMjc0OGEtMTUxNy00YTEyLTgyM2ItYjQ1YTVlMDliYzY5IiwidCI6ImJkYjc0YjMwLTk1NjgtNDg1Ni1iZGJmLTA2NzU5Nzc4ZmNiYyIsImMiOjh9)

---

## Files in This Repository

| File | Description |
|---|---|
| olist_ecommerce_analysis.sql | All 15 SQL queries with comments |
| Olist_SQL_Analysis_Shweta_Waghmare.docx | Full project report with results and insights |
| olist_dashboard_data.xlsx | Data used to build the Power BI dashboard |
| README.md | This file |

---

## Author

**Shweta Waghmare**
GitHub: [srwaghmare01](https://github.com/srwaghmare01)
