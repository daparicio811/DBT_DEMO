WITH TRIPS AS (

    select 
        RIDE_ID,
        -- RIDEABLE_TYPE, Not needed since corrected data error from 2023 to 2018
        DATE(TO_TIMESTAMP(STARTED_AT)) AS TRIP_DATE,
        START_STATION_ID,
        END_STATION_ID,
        MEMBER_CASUAL,
        TIMESTAMPDIFF(SECOND, TO_TIMESTAMP(STARTED_AT), TO_TIMESTAMP(ENDED_AT)) AS TRIP_DURATION_SECONDS


    from {{ ref('stg_bike') }}

    where RIDE_ID != 'ride_id' 


)


select *
from TRIPS