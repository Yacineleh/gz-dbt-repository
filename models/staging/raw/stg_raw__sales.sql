with 

source as (

    select * from {{ source('raw', 'sales') }}

),

renamed as (

    select
        date_date,
        orders_id,
        pdt_id AS products_id,
        revenue,
        quantity,
        concat(orders_id,"_", pdt_id) AS primary_key

    from source

)

select * from renamed
