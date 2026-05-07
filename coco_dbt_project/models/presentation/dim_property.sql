{{ config(
    materialized='incremental',
    unique_key='asset_id_reo'
) }}

with int_property_loans as (

    select * from {{ ref('int_property_loans') }}

),

final as (

    select distinct
        asset_id_reo,
        asset_description,
        property_type,
        location,
        state,
        company,
        property_strategy,
        fund_id,
        load_date
    from int_property_loans

    {% if is_incremental() %}

    where load_date > (
        select max(load_date)
        from {{ this }}
    )

    {% endif %}

)

select * from final
