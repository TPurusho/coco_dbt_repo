# Code Formatting Standard

All generated dbt code must follow lowercase conventions.

## Rules

1. SQL keywords must be lowercase.

example

select  
from  
where  
join  
group by

---

2. Model names, column names, aliases, cte names, and references must be lowercase.

example

select
    property_id,
    fund_id
from {{ ref('stg_<source_table>') }}

---

3. Uppercase should only be used when required, such as:

- database names
- schema names
- external system identifiers

example

{{ source('ENT_INV_TEST_RAW_DB__YARDI', 'stg_yardi_property') }}

---

4. YAML files must also use lowercase for:

- model names
- column names
- test definitions

---

# DBT Naming Conventions

Follow these naming conventions when generating dbt models.

## Source YAML

sources.yml

---

## Staging Models

stg_<source_table>.sql

examples

stg_yardi_property.sql  
stg_yardi_fund.sql  
stg_redrs_reo_loans.sql

---

## Integration Models

int_<business_process>.sql

example

int_property_loans.sql

---

## Presentation Models

Fact Tables

fact_<business_process>.sql

examples

fact_position_property.sql  
fact_position_fund.sql

Dimension Tables

dim_<entity>.sql

examples

dim_property.sql  
dim_fund.sql

---

## Publish Models

User defined naming.

examples

property_summary.sql  
fund_performance.sql

---

## Seeds

sd__<table_name>.csv

example

sd__state_codes.csv

---

## Snapshots

<snapshot_name>.sql

examples

dim_property_snapshot.sql  
dim_fund_snapshot.sql

snapshot yaml definitions must be maintained in:

snapshots.yml

---

## Macros

mc__<macro_name>.sql

example

mc__generate_surrogate_key.sql

---

# Final CTE Pattern

Every dbt SQL model except staging (integration, presentation, publish) must end with a final CTE that:

1. Is named `final`

2. Explicitly lists all output columns inside the final CTE.

3. Is followed by:

select * from final

as the last statement.

---

# Source Declaration CTE Rules

All source/reference declaration CTEs (non-final CTEs) must use:

select *

instead of explicitly listing columns.

Only the final CTE should explicitly list columns.

---

# Example Pattern

with stg_<source_table> as (

    select *
    from {{ ref('stg_<source_table>') }}

),

final as (

    select
        <column_1>,
        <column_2>,
        <column_3>
    from stg_<source_table>

)

select * from final