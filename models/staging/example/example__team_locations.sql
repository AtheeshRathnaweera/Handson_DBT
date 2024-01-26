with team_locations as (
  select * from {{ ref('team_locations') }}
),

final as (
  select * from team_locations
)

select * from final