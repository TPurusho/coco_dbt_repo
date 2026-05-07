# Intermediate Model Prompt Template

Use this template to create a dbt intermediate model that joins, filters, or aggregates staging models.  
Copy, paste, and modify the values below to match your requirements.

---

## Template

@(skill:dbt-router) Create intermediate model.

Pipeline folder: investment_pipeline

Input staging tables:
- stg_yardi_property
- stg_redrs_reo_loans

Transformations:
- joins: Join property with loans on property_id
- filters: None
- aggregations: None
- computed columns:
  - debt_flag = CASE WHEN debt > 0 THEN 'Y' ELSE 'N' END