{% test is_la_team(model, column_name) %}

with validation as (

    select
        {{ column_name }} as city,
        name

    from {{ model }}

),

validation_errors as (

    select
        city

    from validation

    where city = 'Los Angeles'
     and name not in ('Lakers',  'Clippers')

)

select *
from validation_errors

{% endtest %}