# Demo Data Prompt Template

Use this template to generate Snowflake demo tables with realistic sample data.  
Copy, paste, and modify the values below to match your requirements.

---

## Template

@(skill:dbt-router) Generate Snowflake demo tables.

Domain: Investment Management

Database: ENT_INV_UAT_PL_DB
Schema: INV_DM

Tables:
- DIM_FUND (FUND_ID, FUND_NAME, LEGAL_ENTITY_NAME, VINTAGE, LOAD_DATE)
- DIM_PROPERTY (PROPERTY_ID, PROPERTY_NAME, PROPERTY_TYPE, STATE, COMPANY, LOAD_DATE)
- FACT_POSITION_FUND (FUND_ID, PORTFOLIO_ID, MONTH_END_DATE, NAV, COMMITMENT, LOAD_DATE)
- FACT_POSITION_PROPERTY (PROPERTY_ID, PORTFOLIO_ID, MONTH_END_DATE, MARKET_VALUE, DEBT, LOAD_DATE)

Rows per table: 200