-- 3.1 Create index on Users table for frequent lookups by email
CREATE INDEX idx_users_email ON users(email);

-- 3.2 Create index on Bookings table for joins and filtering by user_id
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- 3.3 Create index on Bookings table for date-based queries
CREATE INDEX idx_bookings_start_date ON bookings(start_date);

-- 3.4 Create index on Properties table for joins and filtering
CREATE INDEX idx_properties_location ON properties(location);

-- 3.5 Composite index on Bookings for queries involving property_id and start_date
CREATE INDEX idx_bookings_property_date ON bookings(property_id, start_date);
