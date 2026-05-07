# Source Model Creation Skill

Create dbt source YAML files for the staging layer.

## Source YAML Location

models/staging/sources.yml

## Requirements

Each source definition must contain:

- database
- schema
- table name
- table description
- column names
- column data types
- column descriptions
- basic dbt tests

## Required Tests

Use standard dbt tests such as:

- unique
- not_null

Apply tests where appropriate, especially on:

- primary keys
- mandatory fields
- business keys

## Source Naming Convention

<database>__<schema>

### Examples

raw__yardi  
raw__redrs

## Example sources.yml

version: 2

sources:
  - name: raw__yardi
    database: raw
    schema: yardi

    tables:
      - name: property
        description: Raw property details from Yardi source system.

        columns:
          - name: property_id
            data_type: varchar
            description: Unique identifier for the property.
            tests:
              - unique
              - not_null

          - name: property_name
            data_type: varchar
            description: Name of the property.
            tests:
              - not_null

          - name: fund_id
            data_type: varchar
            description: Associated fund identifier.

          - name: created_at
            data_type: timestamp
            description: Record creation timestamp.
            tests:
              - not_null