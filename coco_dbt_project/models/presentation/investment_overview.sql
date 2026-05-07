{{ config(
    materialized='view'
) }}

with fact_position_property as (

    select * from {{ ref('fact_position_property') }}

),

dim_property as (

    select * from {{ ref('dim_property') }}

),

dim_fund as (

    select * from {{ ref('dim_fund') }}

),

final as (

    select
        f.asset_id_reo,
        d.asset_description,
        d.property_type,
        d.state,
        d.company,
        df.fund_name,
        df.fund_strategy,
        df.vintage_year,
        f.total_debt,
        f.real_estate_market_value,
        f.book_value_stat,
        f.loan_number,
        f.collateral_type,
        f.as_of_date,
        f.load_date
    from fact_position_property f
    left join dim_property d
        on f.asset_id_reo = d.asset_id_reo
    left join dim_fund df
        on f.fund_id = df.fund_id

)

select * from final
