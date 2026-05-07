# Full Pipeline Prompt Template

Use this template to generate an end-to-end dbt pipeline (source -> staging -> intermediate -> mart -> publish).  
Copy, paste, and modify the values below to match your requirements.

---

## Template

@(skill:dbt-router) Create full DBT pipeline.

Domain: Investment Management

Sources:
- YARDI_DB.DBO.PROPERTY
- LOANS_DB.REDRS.REDRS_REO_LOANS

Primary Keys:
- PROPERTY_ID
- LOAN_ID

Pipeline:
- source
- staging
- intermediate
- snapshot
- mart
- publish

Business Logic:
- Join property and loan data
- Track changes using SCD Type 2
- Build fund and property performance metrics

Outputs:
- dim_property
- dim_fund
- fact_position_property
- fact_position_fund
- pub__investment_overview