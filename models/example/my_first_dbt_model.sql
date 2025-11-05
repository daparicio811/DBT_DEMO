
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }} {#Jinja. Template language that's intop of SQL. Used a lot in dbt to do more stuff without SQL. 
{{}} used for expressions. {%%} used for macros or statements (for loops, logic). Macros are function you can reuse.#}


with source_data as (

    select 1 as id
    union all
    select null as id

)

select *
from source_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
