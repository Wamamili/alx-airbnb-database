This task focuses on mastering SQL joins by writing queries that combine multiple tables from the Airbnb schema.

## Queries Implemented

1. **INNER JOIN**
   - Retrieves all bookings with the respective users who made those bookings.

2. **LEFT JOIN**
   - Retrieves all properties and their reviews, including properties without reviews.

3. **FULL OUTER JOIN**
   - Retrieves all users and all bookings, even if:
     - A user has no booking.
     - A booking is not linked to a user.
   - Note: Since MySQL does not support `FULL OUTER JOIN` directly, a workaround using `UNION` of `LEFT JOIN` and `RIGHT JOIN` is provided.

## Files
- `joins_queries.sql`: Contains the SQL scripts for INNER JOIN, LEFT JOIN, and FULL OUTER JOIN queries.
- `README.md`: Documentation for Task 0.

## Repository
[alx-airbnb-database](https://github.com/your-username/alx-airbnb-database)

Directory: `database-adv-script`
