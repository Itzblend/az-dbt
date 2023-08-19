{{ config(materialized='table') }}

SELECT DATE_TRUNC('day' ,tpep_pickup_datetime::DATE),
       AVG(trip_distance::DOUBLE PRECISION)
FROM taxi_trips
GROUP BY DATE_TRUNC('day', tpep_pickup_datetime::DATE)