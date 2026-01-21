-- 4.1 Total trips by user type
SELECT
    member_casual,
    COUNT(*) AS total_trips
FROM trips
GROUP BY member_casual;

-- 4.2 Trips by day of week and user type
SELECT
    member_casual,
    day_of_week,
    COUNT(*) AS total_trips
FROM trips
GROUP BY member_casual, day_of_week
ORDER BY day_of_week;

-- 4.3 Average ride length by user type
SELECT
    member_casual,
    ROUND(AVG(ride_length), 2) AS avg_ride_length_minutes
FROM trips
GROUP BY member_casual;

-- 4.4 Trips by hour and user type
SELECT
    member_casual,
    ride_hour,
    COUNT(*) AS total_trips
FROM trips
GROUP BY member_casual, ride_hour
ORDER BY ride_hour;
