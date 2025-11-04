WITH CTE AS (   -- Common Table Expression

select TO_TIMESTAMP(STARTED_AT) AS STARTED_AT, /*"STARTED_AT" from BIKE Table in Snowflake, "TO_TIMESTAMP()" in Snowflake converts String to Timestamp data type.  
"AS STARTED_AT" renames header from TO_TIMESTAMP(STARTED_AT) to "STARTED_AS" */
DATE(TO_TIMESTAMP(STARTED_AT)) AS DATE_STARTED_AT, -- Parses out only DATE from timestamp. 
HOUR(TO_TIMESTAMP(STARTED_AT)) AS HOUR_STARTED_AT, -- Parse out Hour only

{{get_day_type('STARTED_AT')}} AS DAY_TYPE, --Logic is in macros folder data_utils.sql file, we are calling the macros here

{{get_season('STARTED_AT')}} AS STATION_OF_YEAR --Logic is in macros folder data_utils.sql file, we are calling the macros here

   

from
{{ source('DEMO', 'BIKE') }}
--where STARTED != 'started_at' --He used this since he had first row equal header. But I dont. 

)

select *
FROM CTE


