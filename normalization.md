# Normalization Process – Airbnb Database

## 📌 Objective
The goal of normalization is to organize the database into well-structured tables that minimize redundancy, prevent anomalies, and maintain data integrity. For this project, we normalized the database up to the **Third Normal Form (3NF)**.

---

## 1. First Normal Form (1NF)
**Rule:** 
- Each column must contain atomic (indivisible) values.
- Each row must be unique.
- No repeating groups.

✅ Applied:
- All attributes are atomic (e.g., `first_name`, `last_name`, `price_per_night` are single values).  
- Each table has a **primary key** (`user_id`, `property_id`, `booking_id`, etc.), ensuring row uniqueness.  
- No repeating groups or multivalued attributes.  

**Example:**  
- Instead of storing multiple phone numbers in one field, we allow only one per `User`.  

---

## 2. Second Normal Form (2NF)
**Rule:**  
- Must be in 1NF.  
- All non-key attributes must be **fully functionally dependent** on the entire primary key (no partial dependency).  

✅ Applied:
- No composite keys are used. Each table uses a single-column **UUID primary key**.  
- All non-key attributes depend on their table’s primary key.  

**Example:**  
- In the `Booking` table, `start_date`, `end_date`, `total_price`, and `status` all depend fully on `booking_id`.  
- In the `Payment` table, `amount`, `payment_date`, and `payment_method` depend fully on `payment_id`.  

Thus, the schema satisfies **2NF**.  

---

## 3. Third Normal Form (3NF)
**Rule:**  
- Must be in 2NF.  
- No **transitive dependencies** (non-key attributes must depend only on the primary key, not on other non-key attributes).  

✅ Applied:
- In the `User` table, `role` is not derived from another non-key attribute, it depends only on `user_id`.  
- In the `Booking` table, `total_price` depends directly on `booking_id`, not indirectly via `Property.price_per_night` (even though it is calculated at booking time).  
- In the `Review` table, `rating` and `comment` depend only on `review_id`.  

No attribute depends on another non-key attribute. Therefore, the schema satisfies **3NF**.  

---

## 🔎 Summary of Normalization
- **1NF:** Achieved — atomic values, unique rows, no repeating groups.  
- **2NF:** Achieved — all attributes depend fully on primary keys.  
- **3NF:** Achieved — no transitive dependencies.  

✅ Final schema is in **Third Normal Form (3NF)**.  

---

## 🏗 Why This Matters
- Prevents **data redundancy** (e.g., property info stored only once in the `Property` table).  
- Avoids **update anomalies** (e.g., updating a property’s price only in one place).  
- Ensures **data consistency and integrity** across all tables.  
