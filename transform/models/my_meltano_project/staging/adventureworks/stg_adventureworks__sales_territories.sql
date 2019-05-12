with source as (
    select * from {{ source('raw', 'salesterritory') }}
),
renamed as (
    select
      territoryid as territory_id,
      countryregioncode as country_region_code,
      'group' as name,
      salesytd as sales_ytd,
      saleslastyear as sales_last_year,
      costytd as cost_ytd,
      costlastyear as cost_last_year,
      modifieddate as modified_at
    from source
)

select * from renamed
