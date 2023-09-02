{{ config(materialized='table') }}

SELECT DATE_TRUNC('month' ,tpep_pickup_datetime::DATE),
       AVG(trip_distance::DOUBLE PRECISION)
FROM {{ source('taxi', 'taxi_trips') }}
GROUP BY DATE_TRUNC('month', tpep_pickup_datetime::DATE)