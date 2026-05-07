# Integration Model Creation

## Location

models/integration/

---

## Naming

int_<business_process>.sql

### Examples

int_property_loans.sql

---

## Materialization

table

---

## Input

Always reference staging models.

Use:

{{ ref('stg_<source_table>') }}

### Examples

{{ ref('stg_yardi_property') }}  
{{ ref('stg_redrs_reo_loans') }}

---

## SQL Pattern

Rules:

- Use `select *` in all source declaration CTEs
- Explicitly list all columns only in the final CTE
- The final select outside CTEs must be:

select * from <last_cte>

Example:

{{ config(
    materialized='table'
) }}

with stg_yardi_property as (

    select * from {{ ref('stg_yardi_property') }}

),

stg_redrs_reo_loans as (

    select * from {{ ref('stg_redrs_reo_loans') }}

),

final as (

    select
        p.property_id,
        p.property_name,
        l.loan_id,
        l.loan_amount
    from stg_yardi_property p
    inner join stg_redrs_reo_loans l
        on p.property_id = l.property_id

)

select * from final

---

## Best Practices

- Keep integration models business-focused
- Reuse staging models instead of duplicating logic
- Avoid complex transformations in staging models
- Use meaningful CTE names
- Keep joins and business rules inside integration models

---

# YAML Generation

For every integration model created, also generate the yaml definition file.

## Location

models/integration/

## Naming

Use the same model name for the yaml file.

Format:

int_<business_process>.yml

### Example

int_property_loans.yml

---

## YAML Requirements

Each yaml definition must contain:

- model name
- model description
- column names
- column descriptions
- tests

---

## Example YAML Structure

version: 2

models:
  - name: int_property_loans
    description: Integration model combining property and loan information.

    columns:
      - name: property_id
        description: Unique identifier for the property.
        tests:
          - not_null

      - name: loan_id
        description: Unique identifier for the loan.
        tests:
          - not_null

      - name: loan_amount
        description: Loan amount associated with the property.