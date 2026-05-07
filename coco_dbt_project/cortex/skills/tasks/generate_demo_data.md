# Snowflake Demo Data Generator

Generate Snowflake source tables with realistic sample data based on the project source systems.

## Source Systems

### YARDI

Database:

ENT_INV_TEST_RAW_DB

Schema:

YARDI

Tables:

- STG_YARDI_PROPERTY
- STG_YARDI_FUND

---

### REDRS

Database:

ENT_INV_TEST_RAW_DB

Schema:

LOANS

Tables:

- STG_REDRS_REO_LOANS

---

## Requirements

### Rows

Generate between:

- 50 to 1000 rows per table

---

## Include

- primary keys
- foreign keys
- realistic timestamps
- numeric metrics
- business attributes
- status columns

---

## Relationship Rules

### Fund Relationship

FUND_ID from:

STG_YARDI_FUND

must relate to property records in:

STG_YARDI_PROPERTY

---

### Property Relationship

ASSET_ID_REO from:

STG_YARDI_PROPERTY

must relate to loan/property records in:

STG_REDRS_REO_LOANS

---

## Sample Tables

### STG_YARDI_FUND

Example columns:

- FUND_ID
- FUND_NAME
- LEGAL_ENTITY_NAME
- VINTAGE_YEAR
- STRATEGY
- STATUS
- LOAD_DATE

---

### STG_YARDI_PROPERTY

Example columns:

- AS_OF_DATE
- COMPANY
- LEGAL_ENTITY_ID
- LEGAL_ENTITY_NAME
- ASSET_ID_REO
- ASSET_DESCRIPTION
- PROPERTY_TYPE
- LOCATION
- STATE
- TOTAL_DEBT
- REAL_ESTATE_MARKET_VALUE
- STRATEGY
- LOAD_DATE

---

### STG_REDRS_REO_LOANS

Example columns:

- AS_OF_DATE
- LOAN_NUMBER
- ASSET_DESC
- ASSET_MGR
- BOOK_VALUE_STAT
- COLLATERAL_STATE
- COLLATERAL_TYPE
- LOAD_DATE

---

## Data Guidelines

- Use realistic business names
- Generate matching IDs across related tables
- Include meaningful financial values
- Use realistic dates and timestamps
- Keep demo data simple and understandable
- Ensure referential integrity between tables

---

## Snowflake SQL Requirements

- Use Snowflake-compatible SQL
- Include CREATE TABLE statements
- Include INSERT statements
- Use realistic sample values
- Maintain relationships between datasets