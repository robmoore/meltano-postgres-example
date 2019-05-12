with source as (
    select * from {{ source('raw', 'currency') }}
),
renamed as (
    select 
      currencycode as currency_code,
      modifieddate as modified_at
    from source
)

select * from renamed
