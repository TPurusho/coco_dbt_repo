# Staging SQL Pattern

## Purpose

Staging models read data from source systems and prepare them for integration and presentation layers.

---

# Rules

- minimal or no transformations
- staging models must contain only one source CTE
- explicitly list all columns inside the staging CTE
- the final select outside the CTE must be:

select * from <last_cte>

- no joins
- no aggregations
- always reference source definitions using `source()`
- never reference raw tables directly

---

# Materialization

view

---

# Naming Convention

stg_<source_table>.sql

Examples:

- stg_yardi_property.sql
- stg_yardi_fund.sql
- stg_redrs_reo_loans.sql

---

# Standard SQL Structure

{{ config(
    materialized='view'
) }}

with source_data as (

    select

        -- explicitly list all columns

        as_of_date,
        company,
        legal_entity_id,
        legal_entity_name,
        asset_id_reo,
        asset_description,
        property_type,
        total_debt,
        real_estate_market_value,
        load_date

    from {{ source('ENT_INV_TEST_RAW_DB__YARDI', 'stg_yardi_property') }}

)

select * from source_data

---

# Example Using REDRS Source

{{ config(
    materialized='view'
) }}

with source_data as (

    select

        as_of_date,
        loan_number,
        asset_desc,
        asset_mgr,
        book_value_stat,
        collateral_state,
        collateral_type,
        load_date

    from {{ source('ENT_INV_TEST_RAW_DB__LOANS', 'stg_redrs_reo_loans') }}

)

select * from source_data

---

# Best Practices

- keep staging logic simple
- standardize column naming if required
- preserve source granularity
- avoid business logic in staging
- ensure staging models are reusable
- use lowercase sql formatting