with orders as (
  select * from {{ ref('orders_snapshot') }}
),

final as (
  select
    id,
    status,
    updated_at,
    dbt_scd_id,
    dbt_updated_at,
    dbt_valid_from
  from orders
  where dbt_valid_to is null
),

invocation_id_added as (
  select
    *,
    '{{ invocation_id }}' as invocation_id
  from final
)

select * from invocation_id_added