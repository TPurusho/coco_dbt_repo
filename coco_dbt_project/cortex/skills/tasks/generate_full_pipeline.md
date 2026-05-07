# Full DBT Pipeline Generator

Generate the complete dbt pipeline based on the project architecture.

---

# Pipeline Order

1. Source
2. Staging
3. Integration
4. Presentation
5. Publish

---

# Pipeline Requirements

Generate all required dbt objects for a table or business process.

---

## 1. Source Layer

Create:

- source yaml definition
- source metadata
- column definitions
- source tests

### Location

models/staging/sources.yml

### Requirements

Include:

- database
- schema
- table name
- descriptions
- column names
- data types
- tests

### Recommended Tests

- unique
- not_null

---

## 2. Staging Layer

Create:

- staging sql model
- staging yaml definition

### Location

models/staging/

### Naming

stg_<source_table>.sql

### Materialization

view

### Rules

- Always reference source models
- Never reference raw tables directly
- Use one source CTE
- Explicitly list columns inside the CTE
- Final select must be:

select * from <last_cte>

---

## 3. Integration Layer

Create:

- integration sql model
- integration yaml definition

### Location

models/integration/

### Naming

int_<business_process>.sql

### Materialization

table

### Rules

- Always reference staging models
- Use `select *` in source CTEs
- Explicitly list columns only in final CTE
- Final select must be:

select * from <last_cte>

---

## 4. Presentation Layer

Create:

- fact or dimension model
- yaml definition

### Location

models/presentation/

### Naming

#### Dimension

dim_<entity>.sql

#### Fact

fact_<business_process>.sql

### Materialization

incremental

### Rules

- Always reference integration models
- Use merge incremental logic
- Use `select *` in source CTEs
- Explicitly list columns only in final CTE
- Final select must be:

select * from <last_cte>

---

## 5. Publish Layer

Create:

- publish sql view
- publish yaml definition

### Location

models/presentation/

### Naming

User defined

### Materialization

view

### Rules

- Always reference presentation models
- Use `select *` in source CTEs
- Explicitly list columns only in final CTE
- Final select must be:

select * from <last_cte>

---

# SQL Standards

Apply these standards across all layers:

- Use readable CTE names
- Keep SQL modular and maintainable
- Avoid hardcoded values where possible
- Maintain consistent naming conventions
- Use Snowflake-compatible SQL syntax

---

# YAML Standards

Generate yaml files for:

- staging models
- integration models
- presentation models
- publish models

Each yaml must include:

- model name
- model description
- column descriptions
- tests

---

# Recommended Tests

Use standard dbt tests such as:

- unique
- not_null

Apply tests appropriately based on:

- primary keys
- foreign keys
- business keys
- mandatory columns

---

# Supported Source Systems

Examples:

- YARDI
- REDRS
- Snowflake source tables

---

# Expected Output

Generate:

- source yaml
- staging sql
- staging yaml
- integration sql
- integration yaml
- presentation sql
- presentation yaml
- publish sql
- publish yaml