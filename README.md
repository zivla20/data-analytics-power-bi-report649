# Power BI Quarterly Business Report
==================================

## Project Overview:

This project involves creating a comprehensive **Quarterly Business Report** for a medium-sized international retailer using **Microsoft Power BI**. 

The goal is to provide actionable insights by transforming raw data into a visually appealing and insightful report, enabling better decision-making for C-suite executives and other stakeholders. 

The project includes extracting, cleaning, and modeling data from disparate sources, building a robust **star-schema data model**, and designing a multi-page report that focuses on high-level business summaries, customer segmentation, product performance, and store metrics. 

To ensure accessibility for clients without Power BI access, we also extracted insights from the data using SQL queries on a PostgreSQL database

## Table of Contents:
- [Installation](#installation)
- [Usage](#usage)
- [File Structure](#file-structure)
- [Project Documentation](#project-documentation)

## Installation

1. **Copy the repository link.**
  - On the main page of the GitHub Repo, click the green button "<> Code".
  - Copy the HTTPS URL that is shown.
2. **Clone the repository on your local machine.**
  - Open your bash CLI.
  - Navigate to the location you wish to clone to the repository to.
  - In the Terminal, type in the following bash command:
```bash
  git clone https://github.com/zivla20/data-analytics-power-bi-report649.git
```
  - Press the Enter key.
  - You will now be able to open the repository files on your local machine.

## Usage

1. To open the project, ensure that the repository has been cloned successfully and is present in your local machine.
2. The *power_bi_project.pbix* file contains the PowerBI report. Open this file to view the following 4 report pages:
  * **Executive Summary**
      - Provides a high-level overview of key business metrics.
  * **Customer Detail**
      - Offers detailed insights into customer behavior and performance.
  * **Product Detail**
      - Gives insight into product performance, showcasing metrics and visualizations on product sales, categories, and profitability.
  * **Stores Map**
      - Maps out store locations, with tooltips and drill-downs offering detailed insights on individual store metrics.
3. To access the SQL and CSV answers for each question mentioned in Milestone 10, the *sql_question_answers* folder should be opened, and the relevant .sql and/or .csv file loaded. 

## File Structure

```bash
├── power_bi_project.pbix # Power BI project report
├── sql_question_answers # Folder containing .sql and .csv files of insights - Milestone 10
│ ├── question_1.csv
│ ├── question_1.sql
│ ├── question_2.csv
│ ├── question_2.sql
│ ├── question_3.csv
│ ├── question_3.sql
│ ├── question_4.csv
│ ├── question_4.sql
│ ├── question_5.csv
│ ├── question_5.sql
│ ├── column_names # Folder containing the names of the columns in the PostgreSQL database tables
  │ ├── dim_products_columns.csv # Names of columns in the Products Table
  │ ├── dim_stores_columns.csv # Names of columns in the Stores Table
  │ ├── dim_users_columns.csv # Names of columns in the Customers Table
  │ ├── orders_powerbi_columns.csv # Names of columns in the Orders Table

```

## Project Documentation

This project was broken down into Milestones by the AI Core Team. A detailed look at the most important tasks in each milestone will follow:

### Milestone 2

The .pbix file was created in Milestone 1. 4 tables were then connected to:

1. "Orders" fact table imported from an Azure SQL database:
    - The [Card Number] column was deleted to ensure confidentiality
    - The date columns were spilt into their respective time and date components
    - Rows with missing values were removed from the [Order Date] columnn
    - Columns were renamed using the snakecase format
2. "Product" dimension table from a .csv file:
    - Duplicates were removed from the [Product Code] column
    - Columns were renamed using the snakecase format
3. "Stores" dimension table from Azure Blob Storage:
    - Columns were renamed using the snakecase format
4. "Customers" dimension table by combining 3 .csv files:
    - A [Full Name] column was created by combining together the [First Name] and [Last Name] columns.
    - Columns were renamed using the snakecase format
