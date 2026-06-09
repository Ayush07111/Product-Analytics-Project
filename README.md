# Product-Analytics-Project
# E-Commerce Product Analytics Suite

An end-to-end Product Analytics project simulating user behavior on an e-commerce platform using synthetic clickstream data. The project covers the complete analytics workflow from data generation and SQL analysis to customer segmentation, churn prediction, and interactive Power BI dashboards.

## Project Overview

The objective of this project was to analyze user engagement, conversion behavior, acquisition performance, retention trends, and customer value to generate actionable business insights.

### Dataset

* 5,000 Users
* 500 Products
* ~48K Sessions
* ~180K User Events
* ~8K Orders

## Tech Stack

* SQL (MySQL)
* Python (Pandas, NumPy, Scikit-learn, Matplotlib)
* Power BI
* Jupyter Notebook

## Key Analyses

### Product Analytics

* DAU / WAU / MAU Analysis
* Funnel Analysis
* Conversion Rate Analysis
* Cart Abandonment Analysis
* Device Performance Analysis
* Traffic Source Performance
* Revenue Analysis
* Month-on-Month Growth Analysis
* Cohort Retention Analysis

### Customer Analytics

* RFM Segmentation
* Customer Lifetime Value (CLTV) Analysis
* Churn Prediction using Machine Learning

### Dashboarding

Developed a multi-page Power BI Reports covering:

* Executive KPI Overview
* Funnel Performance
* Device & Traffic Source Insights
* Revenue & Growth Trends
* Customer Segmentation & Churn Analysis

## Key Insights

* Largest user drop-off occurred between Product View and Add to Cart.
* Organic traffic delivered the highest conversion efficiency.
* Desktop users demonstrated the strongest conversion performance.
* Customer recency emerged as the strongest predictor of churn.
* A small segment of high-value customers contributed a significant share of total revenue.

## Business Recommendations

* Optimize product detail pages to improve Add-to-Cart conversion.
* Reduce checkout friction and cart abandonment.
* Increase investment in high-performing acquisition channels.
* Launch retention campaigns targeting at-risk customers.
* Develop loyalty programs for high-value users.

## Repository Structure

```text
Ecommerce-Product-Analytics/
│
├── data/
├── sql/
├── python/
├── powerbi/
├── reports/
├── README.md
│
├── users.csv
├── products.csv
├── sessions.csv
├── events.csv
└── orders.csv
```

## Project Outcome

This project demonstrates an end-to-end Product Analytics workflow, transforming raw clickstream data into business insights through SQL, Python, Machine Learning, and Power BI. It showcases the analytical techniques commonly used by Product Analysts and Data Analysts to support data-driven decision making.
