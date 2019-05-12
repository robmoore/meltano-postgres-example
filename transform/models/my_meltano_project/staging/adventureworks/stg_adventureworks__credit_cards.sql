with source as (
    select * from {{ source('raw', 'creditcard') }}
),
renamed as (
    select
      creditcardid as credit_card_id,
      cardtype as card_type,
      cardnumber as card_number,
      expmonth as exp_month,
      expyear as exp_year,
      modifieddate as modified_at
    from source
)

select * from renamed
