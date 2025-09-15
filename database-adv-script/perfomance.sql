-- Initial complex query (before optimization)
EXPLAIN ANALYZE
SELECT b.id AS booking_id,
       b.booking_date,
       b.start_date,
       b.end_date,
       u.id AS user_id,
       u.name AS user_name,
       u.email,
       p.id AS property_id,
       p.title AS property_title,
       p.location,
       pay.id AS payment_id,
       pay.amount,
       pay.payment_date,
       pay.status
FROM Bookings b
JOIN Users u ON b.user_id = u.id
JOIN Properties p ON b.property_id = p.id
JOIN Payments pay ON b.id = pay.booking_id
WHERE b.start_date >= '2025-01-01'
  AND b.end_date <= '2025-12-31'
  AND pay.status = 'Completed';

-- Optimized query
-- Refactored to avoid unnecessary columns and reduce join cost
EXPLAIN ANALYZE
SELECT b.id AS booking_id,
       b.booking_date,
       u.name AS user_name,
       p.title AS property_title,
       pay.amount,
       pay.status
FROM Bookings b
JOIN Users u ON b.user_id = u.id
JOIN Properties p ON b.property_id = p.id
LEFT JOIN Payments pay ON b.id = pay.booking_id
WHERE b.start_date >= '2025-01-01'
  AND b.end_date <= '2025-12-31'
  AND (pay.status = 'Completed' OR pay.status IS NULL);
