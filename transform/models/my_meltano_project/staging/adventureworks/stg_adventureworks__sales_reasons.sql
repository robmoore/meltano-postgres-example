with source as (
    select * from {{ source('raw', 'salesreason') }}
),
renamed as (
    select
      salesreasonid as sales_reason_id,
      modifieddate as modified_at
    from source
)

select * from renamed
