with source_months as (
  select * from {{ source('local_sample_data', 'STORE_MONTHS')}}
),

final as (
  select * from source_months
)

select * from final