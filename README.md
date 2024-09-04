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

### Milestone 2:

The .pbix file was created on PowerBI Desktop - installation instructions were given. 

The file was then connected to 4 tables:

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

### Milestone 3:

* A continuous date table was created, starting from the earliest date in the 'Orders'[Order Date] column and ending with the lastest date in the 'Orders'[Shipping Date] column
  The following DAX formula was used:
  Date = CALENDAR(Min( Orders[OrderDate]), ENDOFYEAR(Orders[ShippingDate]))
  The following columns were then created within the date table:
  1. Day of Week
  2. Month Number
  3. Month Name
  4. Quarter
  5. Year
  6. Start of Year
  7. Start of Quarter
  8. Start of Month
  9. Start of Week
     
  Some examples of the DAX formulas used include:
  
  - DayOfWeek = WEEKDAY('Date'[Date], 2)
  - MonthName = FORMAT('Date'[Date], "MMMM")
  - Start of Week = 'Date'[Date] - WEEKDAY('Date'[Date], 2) + 1
  - Year = YEAR('Date'[Date])

  A date hierarchy was then made, from the Start of Year down to the Date.

* A star schema was then created by formulating the following one-to-many relationships between the relevant fact tables and the 'Orders' dimension table:

    - Products[Product Code] to Orders[Product Code]
    - Stores[store code] to Orders[Store Code]
    - Customers[User UUID] to Orders[User ID]
    - Dates[Date] to Orders[Order Date]
    - Dates[Date] to Orders[Shipping Date]

* Then a measures table was created to organise all the measures needed in our report. The DAX formulas needed to create each measure have been included.

  The following measures were created at this stage:
  1. **Total Orders**: Total Orders = COUNT(Orders[ProductCode])
  2. **Total Revenue**: Total Revenue = SUMX(Orders, Orders[ProductQuantity] * LOOKUPVALUE(Products[SalePrice], Products[ProductCode], Orders[ProductCode]))
  3. **Total Profit**: Total Profit = SUMX(Orders, (RELATED(Products[SalePrice]) - RELATED(Products[CostPrice])) * Orders[ProductQuantity])
  4. **Total Customers:** Total Customers = DISTINCTCOUNT(Orders[UserID])
  5. **Total Quantity:** Total Quantity = SUM(Orders[ProductQuantity])
  6. **Profit YTD:** Profit YTD = TOTALYTD([Total Profit], 'Date'[Date])
  7. **Revenue YTD:** Revenue YTD = TOTALYTD([Total Revenue], 'Date'[Date])

 * After this, a calculated column [Geography] was created in the 'Stores' table to generate a full name for each row, based on the region name and the country name. The following DAX formula was used:

   Geography = Stores[CountryRegion] & ", " & Stores[Country]

   In addition, another calculated column [Country] was created in the same table to show the full name of the Country for each row. The following DAX formula was used:

   Country = SWITCH(
    Stores[CountryCode],
    "GB", "United Kingdom",
    "US", "United States",
    "DE", "Germany",
    BLANK())
   
 * Finally, a Geography hierarchy was created in the 'Stores' table with the following structure: Region --> Country --> Country Region.

Here is a screenshot of the data model that has been created.

![image](https://github.com/user-attachments/assets/0ef9b8f8-3b8e-4036-bbcd-20b3043bab53)



  






















