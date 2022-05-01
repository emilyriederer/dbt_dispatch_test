{% set cols = all_col2( ref('list_dispatch')) %}

select 
  {{ across1(cols) }}
from {{ ref('list_dispatch') }}