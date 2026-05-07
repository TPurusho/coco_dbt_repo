{{ config(
    materialized='view'
) }}

with source_data as (

    select
        as_of_date,
        loan_number,
        asset_id_reo,
        asset_desc,
        asset_mgr,
        book_value_stat,
        collateral_state,
        collateral_type,
        load_date
    from {{ source('ENT_INV_TEST_RAW_DB__LOANS', 'stg_redrs_reo_loans') }}

)

select * from source_data
