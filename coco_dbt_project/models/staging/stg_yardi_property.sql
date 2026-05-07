{{ config(
    materialized='view'
) }}

with source_data as (

    select
        as_of_date,
        company,
        legal_entity_id,
        legal_entity_name,
        asset_id_reo,
        asset_description,
        property_type,
        location,
        state,
        total_debt,
        real_estate_market_value,
        strategy,
        fund_id,
        load_date
    from {{ source('ENT_INV_TEST_RAW_DB__YARDI', 'stg_yardi_property') }}

)

select * from source_data
