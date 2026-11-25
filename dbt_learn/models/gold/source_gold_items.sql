with source_data as (
select 
*,
row_number() over (partition by id order by updated_time desc) as row_num
 from 

{{ source('source', 'items') }}

)
select id,name,price,updated_time from source_data
where row_num = 1