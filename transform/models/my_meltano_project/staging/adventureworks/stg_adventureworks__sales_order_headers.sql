with source as (
    select * from {{ source('raw', 'salesorderheader') }}
),
renamed as (
    select
      salesorderid as sales_order_id,
      revisionnumber as revision_number,
      orderdate as order_date,
      duedate as due_date,
      shipdate as ship_date,
      status as status,
      customerid as customer_id,
      salespersonid as salesperson_id,
      territoryid as territory_id,
      billtoaddressid as bill_to_address_id,
      shiptoaddressid as ship_to_address_id,
      shipmethodid as ship_method_id,
      creditcardid as credit_card_id,
      creditcardapprovalcode as credit_card_approval_code,
      currencyrateid as currency_rate_id,
      subtotal as subtotal,
      taxamt as tax_amt,
      freight as freight,
      totaldue as total_due,
      comment as comment,
      modifieddate as modified_at
    from source
)

select * from renamed
