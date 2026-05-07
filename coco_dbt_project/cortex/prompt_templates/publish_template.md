# Publish Model Prompt Template

Use this template to create publish layer models for reporting and BI.  
Copy, paste, and modify the values below to match your requirements.

---

## Template

@(skill:dbt-router) Create a publish model.

Pipeline Folder: investment_pipeline

Publish Folder Name: reporting

Model Name: pub__investment_overview

Input Mart Models:
- fact_position_property
- fact_position_fund
- dim_property
- dim_fund

Columns Required:
- property_id
- property_name
- fund_id
- fund_name
- portfolio_id
- month_end_date
- market_value
- nav
- debt
- commitment

Filters: None

Business Description:
Dataset used for investment analytics combining fund and property performance.

Materialization: view