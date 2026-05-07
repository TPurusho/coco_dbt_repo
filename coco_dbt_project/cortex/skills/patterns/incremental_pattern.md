# Incremental SQL Pattern

## Applicable Layer

Presentation Layer

Used for:

- fact models
- dimension models

Examples:

- fact_position_property.sql
- fact_position_fund.sql
- dim_property.sql
- dim_fund.sql

---

# Materialization

incremental

---

# Incremental Strategy

Use merge-based incremental logic.

---

# Column Listing Rules

- Use `select *` in all source declaration CTEs
- Explicitly list all columns only in the final CTE
- The final select outside CTEs must be:

select * from final

---

# Standard SQL Structure

{{ config(
    materialized='incremental',
    unique_key='property_id'
) }}

with int_property_loans as (

    select *
    from {{ ref('int_property_loans') }}

),

final as (

    select
        property_id,
        property_name,
        fund_id,
        loan_id,
        market_value,
        debt_amount,
        updated_at
    from int_property_loans

    {% if is_incremental() %}

    where updated_at > (
        select max(updated_at)
        from {{ this }}
    )

    {% endif %}

)

select * from final

---

# Rules

1. Always reference integration models using `ref()`

2. Never reference source tables directly

3. Only the final CTE should explicitly list columns

4. Incremental filtering must use a timestamp column such as:

- updated_at
- load_date
- modified_date

5. The final query must always be:

select * from final

---

# Recommended Columns

Include metadata columns where applicable:

- created_at
- updated_at
- load_date

---

# Best Practices

- Keep incremental filters efficient
- Use meaningful unique keys
- Avoid transformations inside incremental filters
- Ensure business keys remain stable
- Keep logic modular and reusable