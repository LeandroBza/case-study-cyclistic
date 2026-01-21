-- Check null values in key columns
SELECT
    SUM(start_station_name IS NULL) AS start_station_nulls,
    SUM(end_station_name IS NULL) AS end_station_nulls,
    SUM(start_lat IS NULL) AS start_lat_nulls,
    SUM(start_lng IS NULL) AS start_lng_nulls,
    SUM(end_lat IS NULL) AS end_lat_nulls,
    SUM(end_lng IS NULL) AS end_lng_nulls
FROM trips;

-- Check invalid ride durations
SELECT COUNT(*) AS invalid_rides
FROM trips
WHERE ended_at <= started_at;
