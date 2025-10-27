WITH CTE AS (   -- Common Table Expression

select TO_TIMESTAMP(STARTED_AT) AS STARTED_AT, /*"STARTED_AT" from BIKE Table in Snowflake, "TO_TIMESTAMP()" in Snowflake converts String to Timestamp data type.  
"AS STARTED_AT" renames header from TO_TIMESTAMP(STARTED_AT) to "STARTED_AS" */
DATE(TO_TIMESTAMP(STARTED_AT)) AS DATE_STARTED_AT, -- Parses out only DATE from timestamp. 
HOUR(TO_TIMESTAMP(STARTED_AT)) AS HOUR_STARTED_AT, -- Parse out Hour only
CASE
WHEN DAYNAME(TO_TIMESTAMP(STARTED_AT)) in ('Sat','Sun') --Shows day of week name and filters out Sat and Sun
THEN 'WEEKEND'
ELSE 'BUSINESSDAY'
END AS DAY_TYPE,

CASE WHEN MONTH(TO_TIMESTAMP(STARTED_AT)) in (12,1,2)
    THEN 'WINTER'
    WHEN MONTH(TO_TIMESTAMP(STARTED_AT)) in (3,4,5)
    THEN 'SPRING'
    WHEN MONTH(TO_TIMESTAMP(STARTED_AT)) in (6,7,8)
    THEN 'SUMMER'
    ELSE 'AUTUMN'
    END AS STATION_OF_YEAR


from
{{ source('DEMO', 'BIKE') }}
--where STARTED != 'started_at' --He used this since he had first row equal header. But I dont. 

)

select *
FROM CTE

