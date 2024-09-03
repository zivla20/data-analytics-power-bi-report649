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

Contains information about each order, including the order date, shipping date, customer, store, and product IDs. **Tasks Performed:**

-   Connected to the Azure SQL Database and imported the orders_powerbi table.

-   Deleted the [Card Number] column for data privacy.

-   Split the [Order Date] and [Shipping Date] columns into separate date and time columns.

-   Filtered out rows with missing or null values in the [Order Date] column.

-   Renamed columns to align with Power BI naming conventions.

### 2\. **Products Table (CSV File)**

Contains details about the products, including product code, name, category, cost price, and sale price. **Tasks Performed:**

-   Imported the Products.csv file into Power BI.

-   Removed duplicates in the product_code column.

-   Renamed columns to align with Power BI naming conventions.

### 3\. **Stores Table (Azure Blob Storage)**

Contains store details, including store code, store type, country, and region. **Tasks Performed:**

-   Connected to Azure Blob Storage and imported the Stores table.

-   Renamed columns to match Power BI naming conventions.

### 4\. **Customers Table (CSV Files)**

Contains customer details split across three regions. **Tasks Performed:**

-   Imported the Customers.zip folder using the Folder data connector.

-   Combined and transformed the three CSV files into one query.

-   Created a Full Name column by combining [First Name] and [Last Name].

-   Deleted unused columns and renamed remaining columns.
