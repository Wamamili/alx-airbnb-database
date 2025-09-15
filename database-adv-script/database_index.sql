-- Index creation for optimization

-- 1. Index on Users table for frequent lookups by email and id
CREATE INDEX idx_users_email ON Users(email);
CREATE INDEX idx_users_id ON Users(id);

-- 2. Index on Bookings table for joins and searches
CREATE INDEX idx_bookings_userid ON Bookings(user_id);
CREATE INDEX idx_bookings_propertyid ON Bookings(property_id);
CREATE INDEX idx_bookings_date ON Bookings(booking_date);

-- 3. Index on Properties table for filtering and joins
CREATE INDEX idx_properties_location ON Properties(location);
CREATE INDEX idx_properties_id ON Properties(id);

-- Measure performance BEFORE indexes
-- Example query to analyze
EXPLAIN ANALYZE
SELECT u.id, u.name, b.id, b.booking_date
FROM Users u
JOIN Bookings b ON u.id = b.user_id
WHERE u.email = 'test@example.com';

EXPLAIN ANALYZE
SELECT p.id, p.title, COUNT(b.id) as total_bookings
FROM Properties p
LEFT JOIN Bookings b ON p.id = b.property_id
GROUP BY p.id, p.title
ORDER BY total_bookings DESC;

-- After indexes are created, re-run EXPLAIN ANALYZE
-- PostgreSQL will automatically use indexes where beneficial
EXPLAIN ANALYZE
SELECT u.id, u.name, b.id, b.booking_date
FROM Users u
JOIN Bookings b ON u.id = b.user_id
WHERE u.email = 'test@example.com';

EXPLAIN ANALYZE
SELECT p.id, p.title, COUNT(b.id) as total_bookings
FROM Properties p
LEFT JOIN Bookings b ON p.id = b.property_id
GROUP BY p.id, p.title
ORDER BY total_bookings DESC;
