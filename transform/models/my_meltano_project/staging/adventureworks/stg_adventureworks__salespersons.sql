with source as (
    select * from {{ source('raw', 'salesperson') }}
),
renamed as (
    select
      businessentityid as business_entity_id,
      territoryid as territory_id,
      salesquota as sales_quota,
      bonus,
      commissionpct as commission_pct,
      salesytd as sales_ytd,
      saleslastyear as sales_last_year,
      modifieddate as modified_at
    from source
)

select * from renamed
