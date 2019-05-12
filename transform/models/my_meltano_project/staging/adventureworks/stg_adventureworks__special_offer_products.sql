with source as (
    select * from {{ source('raw', 'specialofferproduct') }}
),
renamed as (
    select
      specialofferid as special_offer_id,
      productid as product_id,
      modifieddate as modified_at
    from source
)

select * from renamed
