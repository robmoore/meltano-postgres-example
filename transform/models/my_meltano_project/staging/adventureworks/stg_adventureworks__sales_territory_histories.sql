with source as (
    select * from {{ source('raw', 'salesterritoryhistory') }}
),
renamed as (
    select
      businessentityid as businessentity_id,
      territoryid as territory_id,
      startdate as started_at,
      enddate as ended_at,
      modifieddate as modified_at
    from source
)

select * from renamed
