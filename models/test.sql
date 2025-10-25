select *
from {{ source('DEMO', 'BIKE') }} {#Jijna shortcut for sources syntax by typing '__sources' (double underscore). It created "{{source('source_name', 'object_name)}}"  #}
limit 10 -- limits to 10 rows


{#
select *
from {{ ref('my_second_dbt_model') }} --references another model

limit 10 #}