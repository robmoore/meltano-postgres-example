with source as (
    select * from {{ source('raw', 'salestaxrate') }}
),
renamed as (
    select
      salestaxrateid as sales_tax_rate_id,
      stateprovinceid as state_province_id,
      taxtype as tax_type,
      taxrate as tax_rate,
      modifieddate as modified_at
    from source
)

select * from renamed
