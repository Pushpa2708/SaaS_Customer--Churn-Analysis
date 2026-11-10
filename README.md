# SaaS Customer Churn & Retention Analysis

## Project Overview

This project analyses customer churn in a synthetic Software-as-a-Service (SaaS) dataset containing 50,000 customer records.

The goal is to understand customer behaviour, identify patterns associated with churn, and develop business recommendations that could help improve customer retention.

The analysis was performed using **Microsoft Excel, MySQL, and Python**.

## Business Objectives

- Analyse the overall customer churn rate.
- Identify customer segments with higher churn.
- Understand the relationship between payment status and churn.
- Examine feature adoption and customer engagement.
- Analyse support tickets, revenue, and customer tenure.
- Provide actionable recommendations for improving customer retention.

## Tools and Technologies

| Tool | Purpose |
|---|---|
| Microsoft Excel | Data cleaning, pivot tables, and initial analysis |
| MySQL | SQL queries and customer segmentation |
| Python | Data cleaning, exploratory data analysis, and visualisation |
| Pandas | Data manipulation and analysis |
| NumPy | Numerical operations |
| Matplotlib | Data visualisation |
| Seaborn | Statistical charts and visualisation |
| Google Colab | Python development environment |

## Dataset Information

- **Dataset size:** 50,000 rows
- **Number of columns:** 18
- **Data type:** Synthetic SaaS customer data
- **Customer identifier:** Customer_ID

The dataset includes information about:

- Customer industry and country
- Company size and subscription plan
- Billing cycle and payment status
- Monthly recurring revenue (MRR)
- Signup and last active dates
- Active and allowed seats
- Support tickets
- Feature adoption rate
- Churn risk score
- Customer churn status

*Note: The dataset contains synthetic data and does not represent actual company customers.*

## Project Workflow

### 1. Data Understanding and Cleaning
- Inspected the dataset structure and data types.
- Checked missing values and duplicate records.
- Converted date columns into proper date formats.
- Corrected the feature adoption percentage format.
- Identified 59 records where the last active date was earlier than the signup date.
- Excluded these 59 invalid-date records from the cleaned analysis dataset.

### 2. Excel Analysis
- Created a data dictionary.
- Performed data quality checks.
- Used pivot tables to analyse customer churn.
- Examined payment status, feature adoption, and customer tenure.
- Prepared business insights.

### 3. MySQL Analysis
Used SQL queries to investigate:
- Overall customer churn.
- Churn by payment status.
- Churn by company size and subscription plan.
- Churn by industry, country, and billing cycle.
- Support tickets and customer revenue.
- Churn risk score and seat utilisation.

### 4. Python Exploratory Data Analysis
- Cleaned and prepared the dataset using Pandas.
- Performed categorical and numerical analysis.
- Analysed churn patterns across customer segments.
- Examined feature adoption, support activity, revenue, and tenure.
- Created charts and a correlation heatmap.

## Key Findings

The following findings are based on the cleaned dataset of 49,941 records.

| Analysis | Key Finding |
|---|---|
| Overall churn | 857 customers churned (1.72%) |
| Payment status | Failed-payment customers had a 13.47% churn rate |
| Subscription plan | Starter customers had a 2.15% churn rate |
| Feature adoption | Churned customers had 51.91% average adoption |
| Non-churned adoption | Non-churned customers had 70.12% average adoption |
| Support tickets | Churned customers averaged 4.99 tickets |
| Customer revenue | Churned customers had lower average MRR (437.94) |
| Customer tenure | Churned customers had lower average tenure |

## Business Recommendations

1. **Improve payment recovery:** Introduce payment reminders and follow-up processes for failed transactions.
2. **Strengthen Starter-plan onboarding:** Provide better guidance and support to customers on the Starter plan.
3. **Increase feature adoption:** Use tutorials, onboarding sessions, and feature recommendations to encourage product engagement.
4. **Improve customer support:** Investigate recurring support issues and identify customers who may need additional assistance.
5. **Monitor at-risk customers:** Use payment issues, feature adoption, and support activity as indicators for further investigation.

## Project Conclusion

This project demonstrates how Excel, MySQL, and Python can be used together to analyse SaaS customer data and identify patterns associated with customer churn.

The analysis highlighted payment failures, lower feature adoption, and higher support activity among churned customers. These findings can help guide further investigation and customer retention strategies.

Because the dataset is synthetic, the findings should be treated as analytical observations rather than verified real-world business results.

## Skills Demonstrated

- Data Cleaning and Preparation
- Exploratory Data Analysis (EDA)
- SQL Querying
- Data Analysis with Python
- Data Visualisation
- Customer Segmentation
- Business Insights and Recommendations
