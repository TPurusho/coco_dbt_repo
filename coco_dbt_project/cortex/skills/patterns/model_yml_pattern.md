# DBT Model YAML Pattern

Each dbt layer must maintain a corresponding yaml definition file.

Examples:

- source.yml
- staging.yml
- integration.yml
- presentation.yml
- snapshots.yml

---

# YAML Requirements

Each yaml definition must include:

- model description
- column descriptions
- generic tests
- relationships tests where applicable

---

# Standard YAML Structure

version: 2

models:
  - name: <model_name>

    description: description of the model

    columns:

      - name: <column_1>

        description: description of the column

        tests:
          - not_null

      - name: <column_2>

        description: description of the column

      - name: <column_3>

        description: description of the column

---

# Example

version: 2

models:
  - name: dim_property

    description: dimension table containing property details

    columns:

      - name: property_id

        description: unique identifier for the property

        tests:
          - unique
          - not_null

      - name: property_name

        description: name of the property

      - name: fund_id

        description: associated fund identifier

        tests:
          - relationships:
              to: ref('dim_fund')
              field: fund_id

---

# Layer YAML Files

## Staging Layer

Location:

models/staging/staging.yml

Contains definitions for:

- stg_yardi_property
- stg_yardi_fund
- stg_redrs_reo_loans

---

## Integration Layer

Location:

models/integration/integration.yml

Contains definitions for:

- int_property_loans

---

## Presentation Layer

Location:

models/presentation/presentation.yml

Contains definitions for:

- dim_property
- dim_fund
- fact_position_property
- fact_position_fund
- publish models

---

## Snapshot Layer

Location:

snapshots/snapshots.yml

Contains definitions for:

- dim_property_snapshot
- dim_fund_snapshot

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
- mandatory fields

---

# YAML Standards

- use lowercase model names
- use lowercase column names
- keep descriptions business-friendly
- avoid duplicate column definitions
- maintain consistent formatting across layers