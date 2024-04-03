select
  name,
  city,
  state
from
  {{ ref('team_locations') }}