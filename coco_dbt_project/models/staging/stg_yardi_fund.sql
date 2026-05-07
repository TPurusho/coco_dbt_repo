{{ config(
    materialized='view'
) }}

with source_data as (

    select
        fund_id,
        fund_name,
        legal_entity_name,
        vintage_year,
        strategy,
        status,
        load_date
    from {{ source('ENT_INV_TEST_RAW_DB__YARDI', 'stg_yardi_fund') }}

)

select * from source_data
