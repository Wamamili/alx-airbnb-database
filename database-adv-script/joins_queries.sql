-- 0.1 INNER JOIN: Retrieve all bookings and the respective users who made those bookings
SELECT 
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email
FROM bookings b
INNER JOIN users u ON b.user_id = u.user_id;


-- 0.2 LEFT JOIN: Retrieve all properties and their reviews, including properties without reviews
SELECT 
    p.property_id,
    p.property_name,
    r.review_id,
    r.rating,
    r.comment
FROM properties p
LEFT JOIN reviews r ON p.property_id = r.property_id;


-- 0.3 FULL OUTER JOIN: Retrieve all users and all bookings, 
-- even if the user has no booking or a booking is not linked to a user
-- Note: Some databases (like MySQL) do not support FULL OUTER JOIN directly.
-- In such cases, use a UNION of LEFT JOIN and RIGHT JOIN.

-- If FULL OUTER JOIN is supported (e.g., in PostgreSQL):
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date
FROM users u
FULL OUTER JOIN bookings b ON u.user_id = b.user_id;

-- If FULL OUTER JOIN is NOT supported (MySQL workaround):
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date
FROM users u
LEFT JOIN bookings b ON u.user_id = b.user_id

UNION

SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date
FROM users u
RIGHT JOIN bookings b ON u.user_id = b.user_id;
