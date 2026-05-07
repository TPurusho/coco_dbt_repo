# Staging Model Creation

## Location

models/staging/

---

## Upstream Dependency

Always reference source models.

Never reference raw tables directly.

Use:

{{ source('<database>__<schema>', '<table>') }}

---

## Naming

stg_<source_table>.sql

### Examples

stg_yardi_property.sql  
stg_redrs_reo_loans.sql

---

## Materialization

view

---

## SQL Pattern

Refer to: patterns/staging_sql_pattern.md

Since staging models have only one CTE, explicitly list all columns inside that CTE.

The final select must be:

select * from <last_cte>

Example:

with source_data as (

    select
        column_1,
        column_2,
        column_3
    from {{ source('<database>__<schema>', '<table>') }}

)

select * from source_data

---

## Tests

Use standard dbt tests such as:

- unique
- not_null

Apply tests where appropriate, especially on:

- primary keys
- mandatory fields
- business keys

---

# YAML Generation

For every staging model created, also generate the yaml definition file.

## Location

models/staging/

## Naming

Use the same model name for the yaml file.

Format:

stg_<source_table>.yml

### Examples

stg_yardi_property.yml  
stg_redrs_reo_loans.yml

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
  - name: stg_yardi_property
    description: Staging model for Yardi property data.

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