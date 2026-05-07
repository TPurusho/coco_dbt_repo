# Presentation Model Creation

## Location

models/presentation/

---

## Naming

### Fact Tables

fact_<business_process>.sql

### Dimension Tables

dim_<entity>.sql

### Examples

fact_position_property.sql  
fact_position_fund.sql  
dim_property.sql  
dim_fund.sql

---

## Materialization

incremental

---

## Incremental Pattern

Use merge logic.

Refer to:

patterns/incremental_pattern.md

---

## Input

Always reference integration models.

Use:

{{ ref('int_<business_process>') }}

### Example

{{ ref('int_property_loans') }}

---

## SQL Pattern

Rules:

- Use `select *` in all source declaration CTEs
- Explicitly list all columns only in the final CTE
- The final select outside CTEs must be:

select * from <last_cte>

Example:

{{ config(
    materialized='incremental',
    unique_key='property_id'
) }}

with int_property_loans as (

    select * from {{ ref('int_property_loans') }}

),

final as (

    select
        property_id,
        property_name,
        loan_id,
        loan_amount,
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

## Best Practices

- Keep mart models business-ready and analytics-focused
- Store reusable business logic in integration models
- Use clear naming for fact and dimension tables
- Keep incremental filters efficient
- Ensure unique keys are properly defined

---

# YAML Generation

For every presentation model created, also generate the yaml definition file.

## Location

models/presentation/

## Naming

Use the same model name for the yaml file.

### Formats

fact_<business_process>.yml  
dim_<entity>.yml

### Examples

fact_position_property.yml  
fact_position_fund.yml  
dim_property.yml  
dim_fund.yml

---

## YAML Requirements

Each yaml definition must contain:

- model name
- model description
- column names
- column descriptions
- tests

---

## Recommended Tests

Use standard dbt tests such as:

- unique
- not_null
- relationships

Apply tests where appropriate, especially on:

- surrogate keys
- business keys
- foreign keys
- mandatory columns

---

## Example YAML Structure

version: 2

models:
  - name: dim_property
    description: Dimension table containing property details.

    columns:
      - name: property_id
        description: Unique identifier for the property.
        tests:
          - unique
          - not_null

      - name: property_name
        description: Name of the property.
        tests:
          - not_null

      - name: fund_id
        description: Associated fund identifier.
        tests:
          - relationships:
              to: ref('dim_fund')
              field: fund_id