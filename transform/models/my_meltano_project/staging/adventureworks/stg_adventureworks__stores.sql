with source as (
    select * from {{ source('raw', 'store') }}
),
renamed as (
  select
    businessentityid as business_entity_id,
    salespersonid as salesperson_id,
    modifieddate as modified_at
  from source
)

select * from renamed
