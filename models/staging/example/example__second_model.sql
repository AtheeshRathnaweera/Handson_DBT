
-- Use the `ref` function to select from other models

select *
from {{ ref('example__first_model') }}
where id = 1
