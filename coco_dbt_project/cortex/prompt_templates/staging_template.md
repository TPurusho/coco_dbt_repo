# Staging Model Prompt Template

Use this template to create dbt staging models that select from sources.  
Copy, paste, and modify the values below to match your requirements.

---

## Template

@(skill:dbt-router) Create staging model:

Database: YARDI_DB
Schema: DBO
Table Name: PROPERTY

Primary Key: PROPERTY_ID

---

@(skill:dbt-router) Create staging model:

Database: LOANS_DB
Schema: REDRS
Table Name: REDRS_REO_LOANS

Primary Key: LOAN_ID