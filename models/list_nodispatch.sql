{% set cols = ['a','b'] %}

with source_data as (

    select 
      1 as a, 
      2 as b,
      3 as c

)

select 
  {{ across2(cols) }}
from source_data