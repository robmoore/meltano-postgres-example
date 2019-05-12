with source as (
    select * from {{ source('raw', 'countryregioncurrency') }}
),
renamed as (
  select
    countryregioncode as country_region_code,
    currencycode as currency_code,
    modifieddate as modified_at
  from source
)

select * from renamed
