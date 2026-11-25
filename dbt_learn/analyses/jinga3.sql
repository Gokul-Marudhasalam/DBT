{% set init_fla = 1 %}
{% set last_loaad =3 %}
{% set column_names = ["sales_id","date_sk","order_amount"] %}

select 
    {% for col in column_names %}
        {{ col }} {% if not loop.last %},{% endif %}
    {% endfor %}
from {{ ref('bronze_sales') }} 
{% if init_fla == 1 %}
    where date_sk = {{ last_loaad }}
{% endif %}