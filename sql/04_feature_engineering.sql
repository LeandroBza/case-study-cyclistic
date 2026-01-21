-- Add ride length in minutes
ALTER TABLE trips ADD COLUMN ride_length INT;

UPDATE trips
SET ride_length = TIMESTAMPDIFF(MINUTE, started_at, ended_at);

-- Add day of week
ALTER TABLE trips ADD COLUMN day_of_week TINYINT;

UPDATE trips
SET day_of_week = DAYOFWEEK(started_at);

-- Add month
ALTER TABLE trips ADD COLUMN ride_month TINYINT;

UPDATE trips
SET ride_month = MONTH(started_at);

-- Add hour of day
ALTER TABLE trips ADD COLUMN ride_hour TINYINT;

UPDATE trips
SET ride_hour = HOUR(started_at);
