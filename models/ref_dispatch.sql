{% set cols = all_col1( ref('list_dispatch')) %}

select 
  {{ across1( cols) }}
from {{ ref('list_dispatch') }}