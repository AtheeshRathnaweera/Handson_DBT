
-- Use the `ref` function to select from other models

select
  *,
  '{{ invocation_id }}' as invocation_id
from {{ ref('example__first_model') }}
where id = 1
