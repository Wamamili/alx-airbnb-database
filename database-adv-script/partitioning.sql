-- Step 1: Create a partitioned version of the Bookings table
-- Partitioned by RANGE on start_date

CREATE TABLE Bookings_partitioned (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    booking_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    amount DECIMAL(10, 2),
    status VARCHAR(50)
) PARTITION BY RANGE (start_date);

-- Step 2: Create partitions for specific years
CREATE TABLE Bookings_2024 PARTITION OF Bookings_partitioned
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE Bookings_2025 PARTITION OF Bookings_partitioned
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- Step 3: Insert data into the partitioned table (as an example)
INSERT INTO Bookings_partitioned (user_id, property_id, start_date, end_date, amount, status)
SELECT user_id, property_id, start_date, end_date, amount, status
FROM Bookings
WHERE start_date >= '2024-01-01';

-- Step 4: Run performance tests on date range queries
EXPLAIN ANALYZE
SELECT * 
FROM Bookings_partitioned
WHERE start_date BETWEEN '2025-01-01' AND '2025-03-31';

EXPLAIN ANALYZE
SELECT * 
FROM Bookings_partitioned
WHERE start_date BETWEEN '2024-06-01' AND '2024-12-31';
