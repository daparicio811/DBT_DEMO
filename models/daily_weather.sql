WITH daily_weather AS ( --Creating a CTE


select 

date(TIME) as daily_weather, WEATHER, TEMP, PRESSURE, HUMIDITY, CLOUDS --TIME from Weather table is already in Timestamp data type. No need to convert.

from {{ source('DEMO', 'WEATHER') }}

limit 20

),

daily_weather_agg AS ( --Creating second CTE for daily weather aggregate

select 
daily_weather,
weather,
round(avg(TEMP),2) AS AVG_TEMP,
round(avg(PRESSURE),2) AS AVG_PRESSURE,
round(avg(HUMIDITY),2) AS AVG_HUMIDTY,
round(avg(CLOUDS),2) AS AVG_CLOUDS

from daily_weather --previous CTE

group by daily_weather, weather

qualify ROW_NUMBER() OVER (PARTITION BY daily_weather ORDER BY count(weather) desc) = 1 --filters for only 1 row for each day. Using a window fuction


)

select *
from daily_weather_agg