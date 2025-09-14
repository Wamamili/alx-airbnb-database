-- ======================================================
-- Airbnb Database Sample Data Seed
-- Author: Your Name
-- Project: ALX - DataScape Airbnb Database
-- ======================================================

-- Users
INSERT INTO users (first_name, last_name, email, password_hash, phone_number, role)
VALUES
('Alice', 'Johnson', 'alice@example.com', 'hashed_pw1', '123-456-7890', 'guest'),
('Bob', 'Smith', 'bob@example.com', 'hashed_pw2', '123-555-7890', 'host'),
('Clara', 'Davis', 'clara@example.com', 'hashed_pw3', NULL, 'guest'),
('David', 'Lee', 'david@example.com', 'hashed_pw4', '987-654-3210', 'host'),
('Eve', 'Williams', 'eve@example.com', 'hashed_pw5', '555-555-5555', 'admin');

-- Properties
INSERT INTO properties (host_id, name, description, location, price_per_night)
VALUES
((SELECT user_id FROM users WHERE email='bob@example.com'), 'Cozy Apartment', 'A small but cozy city apartment.', 'New York, USA', 120.00),
((SELECT user_id FROM users WHERE email='david@example.com'), 'Beach House', 'Beautiful seaside house with ocean view.', 'Miami, USA', 250.00),
((SELECT user_id FROM users WHERE email='bob@example.com'), 'Mountain Cabin', 'Rustic cabin perfect for hiking lovers.', 'Denver, USA', 180.00);

-- Bookings
INSERT INTO bookings (property_id, user_id, start_date, end_date, total_price, status)
VALUES
((SELECT property_id FROM properties WHERE name='Cozy Apartment'),
 (SELECT user_id FROM users WHERE email='alice@example.com'),
 '2025-09-15', '2025-09-18', 360.00, 'confirmed'),

((SELECT property_id FROM properties WHERE name='Beach House'),
 (SELECT user_id FROM users WHERE email='clara@example.com'),
 '2025-10-01', '2025-10-05', 1000.00, 'pending');

-- Payments
INSERT INTO payments (booking_id, amount, payment_method)
VALUES
((SELECT booking_id FROM bookings WHERE total_price=360.00), 360.00, 'credit_card'),
((SELECT booking_id FROM bookings WHERE total_price=1000.00), 500.00, 'paypal');

-- Reviews
INSERT INTO reviews (property_id, user_id, rating, comment)
VALUES
((SELECT property_id FROM properties WHERE name='Cozy Apartment'),
 (SELECT user_id FROM users WHERE email='alice@example.com'),
 5, 'Loved my stay, very comfortable!'),

((SELECT property_id FROM properties WHERE name='Beach House'),
 (SELECT user_id FROM users WHERE email='clara@example.com'),
 4, 'Great view, but could use some maintenance.');

-- Messages
INSERT INTO messages (sender_id, recipient_id, message_body)
VALUES
((SELECT user_id FROM users WHERE email='alice@example.com'),
 (SELECT user_id FROM users WHERE email='bob@example.com'),
 'Hi Bob, is the apartment available for early check-in?'),

((SELECT user_id FROM users WHERE email='bob@example.com'),
 (SELECT user_id FROM users WHERE email='alice@example.com'),
 'Hi Alice, yes, you can check in at 1 PM.');
