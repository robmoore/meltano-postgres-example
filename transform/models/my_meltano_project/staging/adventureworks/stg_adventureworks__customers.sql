with source as (
    select * from {{ source('raw', 'customer') }}
),
renamed as (
    select
      customerid as customer_id,
      personid as person_id,
      storeid as store_id,
      territoryid as territory_id,
      modifieddate as modified_at
    from source
)

select * from renamed
