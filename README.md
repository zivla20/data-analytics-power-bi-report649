# Power BI Quarterly Business Report
==================================

## Project Overview
----------------

This project involves creating a comprehensive **Quarterly Business Report** for a medium-sized international retailer using **Microsoft Power BI**. The goal is to provide actionable insights by transforming raw data into a visually appealing and insightful report, enabling better decision-making for C-suite executives and other stakeholders. The project includes extracting, cleaning, and modeling data from disparate sources, building a robust **star-schema data model**, and designing a multi-page report that focuses on high-level business summaries, customer segmentation, product performance, and store metrics.

## Objectives
----------

-   Extract and transform data from various sources, ensuring data quality and consistency.
-   Design a **star-schema data model** for efficient reporting.
-   Create insightful visualizations, including a **high-level executive summary**, detailed customer and product insights, and performance metrics of retail outlets across regions.
-   Implement Power BI **time intelligence** features and DAX measures for key metrics such as revenue, profit, and customer activity.
-   Develop a report with an intuitive **navigation and drill-down** functionality.

## Data Sources
------------

### 1\. **Orders Table (Azure SQL Database)**

Contains information about each order, including the order date, shipping date, customer, store, and product IDs. 
**Tasks Performed:**

-   Connected to the Azure SQL Database and imported the orders_powerbi table.
-   Deleted the [Card Number] column for data privacy.
-   Split the [Order Date] and [Shipping Date] columns into separate date and time columns.
-   Filtered out rows with missing or null values in the [Order Date] column.
-   Renamed columns to align with Power BI naming conventions.

### 2\. **Products Table (CSV File)**

Contains details about the products, including product code, name, category, cost price, and sale price. 
**Tasks Performed:**

-   Imported the Products.csv file into Power BI.
-   Removed duplicates in the product_code column.
-   Renamed columns to align with Power BI naming conventions.

### 3\. **Stores Table (Azure Blob Storage)**

Contains store details, including store code, store type, country, and region. 
**Tasks Performed:**

-   Connected to Azure Blob Storage and imported the Stores table.
-   Renamed columns to match Power BI naming conventions.

### 4\. **Customers Table (CSV Files)**

Contains customer details split across three regions. 
**Tasks Performed:**

-   Imported the Customers.zip folder using the Folder data connector.

## Data Modeling
-------------

A **star-schema** data model was implemented to enhance performance and clarity. The following relationships were created:

-   `Products[product_code]` → `Orders[product_code]`
-   `Stores[store code]` → `Orders[Store Code]`
-   `Customers[User UUID]` → `Orders[User ID]`
-   `Date[date]` → `Orders[Order Date]` (active relationship)
-   `Date[date]` → `Orders[Shipping Date]`

* * * * *

## DAX Measures
------------

The following key measures were created for detailed analysis and reporting:

-   **Total Orders:** Counts the number of orders in the Orders table.
-   **Total Revenue:** Calculates total revenue by multiplying `Orders[Product Quantity]` by `Products[Sale_Price]`.
-   **Total Profit:** Computes total profit by subtracting `Products[Cost_Price]` from `Products[Sale_Price]` and multiplying by `Orders[Product Quantity]`.
-   **Total Customers:** Counts the number of unique customers in the Orders table.
-   **Total Quantity:** Sums the total number of products sold.
-   **Profit YTD:** Year-to-date total profit.
-   **Revenue YTD:** Year-to-date total revenue.
-   **Revenue per Customer:** Total Revenue divided by Total Customers.

* * * * *

## Time Intelligence
-----------------

A **continuous date table** was created for time-based analysis, including the following columns:

-   Day of Week
-   Month Number
-   Month Name
-   Quarter
-   Year
-   Start of Year
-   Start of Quarter
-   Start of Month
-   Start of Week

Two hierarchies were built for drilling down into data:

-   **Date Hierarchy:** Year → Quarter → Month → Week → Date.
-   **Geography Hierarchy:** World Region → Country → Country Region.

* * * * *

## Report Pages
------------

### 1\. **Executive Summary**

Provides an overview of key business metrics, including total revenue, profit, and high-level insights.

### 2\. **Customer Detail**

Provides a deep dive into customer data, including:

-   **Unique Customers** and **Revenue per Customer** metrics.
-   Donut chart showing customers by country.
-   Column chart showing customers by product category.
-   Line chart displaying customer trends over time, with a forecast.
-   Top 20 customers ranked by revenue.
-   Cards showing insights about the top customer.
-   Date slicer for filtering by year.

### 3\. **Product Detail**

Provides insights into product performance, including sales by product category and profitability analysis.

### 4\. **Stores Map**

A map-based visualization showcasing store performance across regions, with drill-through capabilities for deeper insights.

* * * * *

## Visuals and Design
------------------

The report features a consistent design theme, using Power BI's predefined color themes. A sidebar has been added to the left side of each page for easy navigation across report sections.

* * * * *

## Conclusion
----------

This report is designed to provide actionable insights across various dimensions, including customer behavior, product performance, and store operations. The combination of DAX measures, time intelligence, and intuitive visualizations enables the retailer to make informed business decisions and track key performance indicators effectively.

* * * * *

## Future Work
-----------

-   Further refinement of visualizations.
-   Additional metrics for sales forecasting.
-   Continuous optimization of the data model as new data becomes available.

-   Combined and transformed the three CSV files into one query.

-   Created a Full Name column by combining [First Name] and [Last Name].

-   Deleted unused columns and renamed remaining columns.
