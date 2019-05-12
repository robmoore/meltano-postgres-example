with source as (
    select * from {{ source('raw', 'salespersonquotahistory') }}
),
renamed as (
    select
      businessentityid as business_entity_id,
      quotadate as quota_at,
      salesquota as sales_quota,
      modifieddate as modified_at
    from source
)

select * from renamed
