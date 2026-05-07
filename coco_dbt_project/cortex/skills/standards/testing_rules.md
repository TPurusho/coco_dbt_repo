# DBT Testing Rules

This document defines mandatory testing requirements.

---

# Staging Layer

Each staging model must include:

- at least one unique test
- at least one not_null test

Example

models:
  - name: stg_yardi_property

    columns:
      - name: asset_id_reo
        tests:
          - unique
          - not_null

---

# Presentation Layer

Fact and dimension models must include:

- primary key unique test
- not_null tests on key fields

---

## Dimension Example

models:
  - name: dim_property

    columns:
      - name: property_id
        tests:
          - unique
          - not_null

---

## Fact Example

models:
  - name: fact_position_property

    columns:
      - name: property_id
        tests:
          - not_null

      - name: month_end_date
        tests:
          - not_null

---

# Integration Layer

Tests are optional.

---

# Publish Layer

Tests are optional unless required by analytics consumers.

---

# Source Layer

Source definitions inside:

sources.yml

should include:

dbt_expectations.expect_table_columns_to_match_set

IMPORTANT:

This test must ONLY be placed in:

sources.yml

Do NOT add:

dbt_expectations.expect_table_columns_to_match_set

to staging, integration, presentation, publish, or snapshot yaml files unless explicitly required.

---

# YAML Definition Rules

Each layer must maintain a single yaml definition file.

---

## Staging

All staging model definitions must be stored in:

models/staging/staging.yml

---

## Integration

All integration model definitions must be stored in:

models/integration/integration.yml

---

## Presentation

All presentation and publish model definitions must be stored in:

models/presentation/presentation.yml

---

## Snapshots

All snapshot definitions must be stored in:

snapshots/snapshots.yml

---

# Composite Key Testing

If a model has a composite key, use:

dbt_utils.unique_combination_of_columns

Example

tests:
  - dbt_utils.unique_combination_of_columns:
      combination_of_columns:
        - property_id
        - month_end_date

---

# Presentation Model Testing

## Fact Tables

- primary key must be unique where applicable
- not_null on primary key
- not_null on business keys

---

## Dimension Tables

- surrogate key or business key must be unique
- not_null on surrogate key or primary identifier

---

# Recommended Tests

Use standard dbt tests such as:

- unique
- not_null
- relationships
- accepted_values

Apply tests based on:

- primary keys
- foreign keys
- business rules
- mandatory columns