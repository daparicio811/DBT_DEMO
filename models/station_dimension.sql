WITH BIKE AS (

    select 
        DISTINCT
        START_STATION_ID,
        START_STATION_NAME,
        START_LAT,
        START_LNG

    from {{ source('DEMO', 'BIKE')}}

    --where RIDE_ID != 'ride_id' 


)


select *
from BIKE