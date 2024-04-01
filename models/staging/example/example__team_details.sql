{{ config(
    query_tag = 'dbt_special_tag'
) }}

with team_locations as (
  select * from {{ ref('team_locations') }}
),

final as (
  select
    name,
    city,
    state,
    iff(name = '{{ var("current_champion") }}', true, false) as is_champion,
    division
  from team_locations
)

select * from final