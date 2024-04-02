{{ config(
    query_tag = 'dbt_special_tag',
    tags=['special'],
    materialized='ephemeral'
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
),

invocation_id_added as (
  select
    *,
    '{{ invocation_id }}' as invocation_id
  from final
)

select * from invocation_id_added