Implementing Indexes for Optimization

This task focuses on improving query performance through indexing.

## Identified High-Usage Columns
- **Users Table**
  - `email` is frequently used in login or search queries.
- **Bookings Table**
  - `user_id` is used in joins with Users.
  - `start_date` is used in date-range filters.
  - `(property_id, start_date)` often appears together in filtering and reporting.
- **Properties Table**
  - `location` is commonly used in searches.

## Indexes Created
- `idx_users_email`
- `idx_bookings_user_id`
- `idx_bookings_start_date`
- `idx_properties_location`
- `idx_bookings_property_date` (composite index)

All indexes are defined in `database_index.sql`.

## Measuring Performance
Queries were tested before and after indexing using `EXPLAIN` (or `ANALYZE`).

### Example 1: Total bookings by user
```sql
EXPLAIN SELECT u.user_id, COUNT(b.booking_id)
FROM users u
JOIN bookings b ON u.user_id = b.user_id
GROUP BY u.user_id;
