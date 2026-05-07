{{ config(
    materialized='table'
) }}

with stg_yardi_property as (

    select * from {{ ref('stg_yardi_property') }}

),

stg_yardi_fund as (

    select * from {{ ref('stg_yardi_fund') }}

),

stg_redrs_reo_loans as (

    select * from {{ ref('stg_redrs_reo_loans') }}

),

final as (

    select
        p.asset_id_reo,
        p.asset_description,
        p.property_type,
        p.location,
        p.state,
        p.company,
        p.total_debt,
        p.real_estate_market_value,
        p.strategy as property_strategy,
        p.as_of_date,
        f.fund_id,
        f.fund_name,
        f.legal_entity_name,
        f.vintage_year,
        f.strategy as fund_strategy,
        f.status as fund_status,
        l.loan_number,
        l.asset_desc as loan_asset_desc,
        l.asset_mgr,
        l.book_value_stat,
        l.collateral_state,
        l.collateral_type,
        p.load_date
    from stg_yardi_property p
    inner join stg_yardi_fund f
        on p.fund_id = f.fund_id
    left join stg_redrs_reo_loans l
        on p.asset_id_reo = l.asset_id_reo

)

select * from final
