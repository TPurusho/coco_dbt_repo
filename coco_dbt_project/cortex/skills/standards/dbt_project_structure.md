# DBT Project Structure Standard

This document defines the required directory structure for the dbt project.

All dbt models must follow this structure.

project/
├── models/
│   ├── staging/
│   │   ├── sources.yml
│   │   ├── stg_<source_table>.sql
│   │   └── staging.yml
│   │
│   ├── integration/
│   │   ├── int_<business_process>.sql
│   │   └── integration.yml
│   │
│   ├── presentation/
│   │   ├── dim_<entity>.sql
│   │   ├── fact_<business_process>.sql
│   │   ├── <publish_view_name>.sql
│   │   └── presentation.yml
│
├── macros/
│   └── mc__<macro_name>.sql
│
├── seeds/
│   └── sd__<table_name>.csv
│
├── snapshots/
│   ├── <snapshot_name>.sql
│   └── snapshots.yml
│
├── cortex/
│   ├── skills/
│   │
│   │   ├── dbt_router_skill.md
│   │
│   │   ├── tasks/
│   │   │   ├── create_source_model.md
│   │   │   ├── create_staging_model.md
│   │   │   ├── create_integration_model.md
│   │   │   ├── create_presentation_model.md
│   │   │   ├── create_publish_model.md
│   │   │   ├── generate_full_pipeline.md
│   │   │   ├── generate_demo_data.md
│   │   │
│   │   ├── patterns/
│   │   │   ├── staging_sql_pattern.md
│   │   │   ├── incremental_pattern.md
│   │   │   ├── surrogate_key_pattern.md
│   │   │
│   │   └── standards/
│   │       ├── dbt_project_structure.md
│   │       ├── naming_conventions.md
│   │       ├── testing_rules.md
│   │
│   └── prompt_templates/
│       ├── source_template.md
│       ├── staging_template.md
│       ├── integration_template.md
│       ├── presentation_template.md
│       ├── publish_template.md
│       ├── full_pipeline_template.md
│       ├── demo_data_template.md

---

# Rules

1. One model per file.
2. Each layer must maintain a single yaml definition file.
3. Snapshot definitions must be maintained in a single `snapshots.yml` file.
4. Folder names must reflect business purpose or model layer.
5. Do not mix models from different layers in the same folder.
6. Always separate staging, integration, presentation, and publish models.

---

# YAML Definition Files

## Staging

All staging model definitions must be stored in:

staging.yml

---

## Integration

All integration model definitions must be stored in:

integration.yml

---

## Presentation

All presentation and publish model definitions must be stored in:

presentation.yml

---

## Snapshots

All snapshot definitions must be stored in:

snapshots.yml