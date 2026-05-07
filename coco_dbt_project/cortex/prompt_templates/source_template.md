# Source Model Prompt Template

Use this template to create dbt source definitions for existing Snowflake tables.  
Copy, paste, and modify the values below to match your requirements.

---

## Template

@(skill:dbt-router) Create dbt source model:

Database: YARDI_DB
Schema: DBO

Tables:
- PROPERTY

---

@(skill:dbt-router) Create dbt source model:

Database: LOANS_DB
Schema: REDRS

Tables:
- REDRS_REO_LOANS