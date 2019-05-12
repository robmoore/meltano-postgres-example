with source as (
    select * from {{ source('raw', 'specialoffer') }}
),
renamed as (
    select
      specialofferid as special_offer_id,
      description,
      discountpct as discount_pct,
      type,
      category,
      startdate as started_at,
      enddate as ended_at,
      minqty as min_qty,
      maxqty as max_qty,
      modifieddate as modified_at
    from source
)

select * from renamed
