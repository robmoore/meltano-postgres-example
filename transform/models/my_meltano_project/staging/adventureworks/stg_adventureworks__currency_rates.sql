with source as (
    select * from {{ source('raw', 'currencyrate') }}
),
renamed as (
    select
      currencyrateid as currency_rate_id,
      currencyratedate as currency_rate_at,
      fromcurrencycode as from_currency_code,
      tocurrencycode as to_currency_code,
      averagerate as average_rate,
      endofdayrate as end_of_day_rate,
      modifieddate as modified_at
    from source
)

select * from renamed
