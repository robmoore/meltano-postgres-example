with source as (
    select * from {{ source('raw', 'salesorderheadersalesreason') }}
),
renamed as (
    select
      salesorderid as sales_order_id,
      salesreasonid as sales_reason_id,
      modifieddate as modified_at
    from source
)

select * from renamed
