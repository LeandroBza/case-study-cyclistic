-- Remove trips with invalid duration
DELETE FROM trips
WHERE ended_at <= started_at;
