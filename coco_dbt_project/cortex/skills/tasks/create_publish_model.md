# Publish Model Creation

## Location

models/presentation/

---

## Naming

User defined

### Examples

property_summary.sql  
fund_performance.sql  
loan_exposure_report.sql

---

## Materialization

view

---

## Source

Always reference presentation (mart) models.

Use:

{{ ref('<mart_model_name>') }}

### Examples

{{ ref('fact_position_property') }}  
{{ ref('fact_position_fund') }}  
{{ ref('dim_property') }}  
{{ ref('dim_fund') }}

---

## SQL Pattern

Rules:

- Use `select *` in all source declaration CTEs
- Explicitly list all columns only in the final CTE
- The final select outside CTEs must be:

select * from <last_cte>

Example:

{{ config(
    materialized='view'
) }}

with fact_position_property as (

    select * from {{ ref('fact_position_property') }}

),

dim_property as (

    select * from {{ ref('dim_property') }}

),

final as (

    select
        f.property_id,
        d.property_name,
        f.position_amount,
        f.as_of_date
    from fact_position_property f
    left join dim_property d
        on f.property_id = d.property_id

)

select * from final

---

## Best Practices

- Keep publish models business-consumable
- Use clear and user-friendly column names
- Avoid heavy transformations in publish models
- Reuse logic from presentation models
- Publish only curated and validated data

---

# YAML Generation

For every publish model created, also generate the yaml definition file.

## Location

models/presentation/

## Naming

Use the same model name for the yaml file.

Format:

<publish_model_name>.yml

### Examples

property_summary.yml  
fund_performance.yml  
loan_exposure_report.yml

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

Apply tests where appropriate based on business requirements.

---

## Example YAML Structure

version: 2

models:
  - name: property_summary
    description: Published property summary view for reporting.

    columns:
      - name: property_id
        description: Unique identifier for the property.
        tests:
          - not_null

      - name: property_name
        description: Name of the property.

      - name: position_amount
        description: Current position amount for the property.