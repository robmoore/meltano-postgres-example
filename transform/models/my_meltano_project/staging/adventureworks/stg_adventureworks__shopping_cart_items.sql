with source as (
    select * from {{ source('raw', 'shoppingcartitem') }}
),
renamed as (
    select
      shoppingcartitemid as shopping_cart_item_id,
      shoppingcartid as shopping_cart_id,
      quantity as quantity,
      productid as product_id,
      datecreated as created_at,
      modifieddate as modified_at
    from source
)

select * from renamed
