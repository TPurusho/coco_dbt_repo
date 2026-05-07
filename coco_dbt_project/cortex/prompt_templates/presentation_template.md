# Mart Model Prompt Template

Use this template to create dbt mart models (facts and dimensions).  
Copy, paste, and modify the values below to match your requirements.

---

## Template

@(skill:dbt-router) Create marts.

Pipeline folder: investment_pipeline

Fact Tables:
- fact_position_property
- fact_position_fund

Dimensions:
- dim_property
- dim_fund

---

### Fact Table: fact_position_property

@(skill:dbt-router) Create fact_position_property

Grain: One row per property per month

Measures:
- market_value
- debt

Dimensions:
- property_id
- portfolio_id
- month_end_date

Materialization: incremental  
Unique Key: property_id, month_end_date

---

### Fact Table: fact_position_fund

@(skill:dbt-router) Create fact_position_fund

Grain: One row per fund per month

Measures:
- nav
- commitment

Dimensions:
- fund_id
- portfolio_id
- month_end_date

Materialization: incremental  
Unique Key: fund_id, month_end_date

---

### Dimension: dim_property

Grain: One row per property

Columns:
- property_id
- property_name
- property_type
- state
- company

Materialization: table

---

### Dimension: dim_fund

Grain: One row per fund

Columns:
- fund_id
- fund_name
- legal_entity_name
- vintage

Materialization: table