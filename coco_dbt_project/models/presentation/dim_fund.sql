{{ config(
    materialized='incremental',
    unique_key='fund_id'
) }}

with int_property_loans as (

    select * from {{ ref('int_property_loans') }}

),

final as (

    select distinct
        fund_id,
        fund_name,
        legal_entity_name,
        vintage_year,
        fund_strategy,
        fund_status,
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
