with bronze_sales as (
    select 
        sales_id,
        product_sk,
        customer_sk,
        gross_amount,
        payment_method
    from {{ ref('bronze_sales') }}
),
bronze_product as (
    select 
        product_sk,
        product_name,
        category
    from {{ ref('bronze_product') }}
),
bronze_customer as (
    select 
        customer_sk,
        concat(first_name, ' ', last_name) as customer_name,
        email
    from {{ ref('bronze_customers') }}
)
select 
    s.sales_id,
    s.product_sk,
    p.product_name,
    p.category,
    s.customer_sk,
    c.customer_name,
    c.email,
    s.gross_amount,
    s.payment_method
from bronze_sales s
join bronze_product p on s.product_sk = p.product_sk
join bronze_customer c on s.customer_sk = c.customer_sk