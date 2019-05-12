with source as (
    select * from {{ source('raw', 'personcreditcard') }}
),
renamed as (
    select
      businessentityid as business_entity_id,
      creditcardid as credit_card_id,
      modifieddate as modified_at
    from source
)

select * from renamed
