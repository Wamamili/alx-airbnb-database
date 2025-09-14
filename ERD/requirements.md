# Requirements

## 📌 Project: DataScape - Mastering Database Design

This project is part of the **ALX Airbnb Database Module**, focusing on **Entity-Relationship (ER) modeling, normalization, schema creation, and seeding** for a relational database.

---

## 1. Learning Objectives
By completing this project, you should be able to:

- Apply **advanced database design principles** to model complex real-world systems.
- Master **normalization** (up to 3NF) to ensure data integrity and minimize redundancy.
- Use **SQL DDL** to define schema with proper keys, constraints, and indexing.
- Write and execute **SQL DML** scripts to seed databases with realistic sample data.
- Collaborate effectively using **GitHub repositories** for submission and documentation.

---

## 2. Tools & Technologies

- **Database**: PostgreSQL ≥ 12
- **Diagramming**: [Draw.io (diagrams.net)](https://app.diagrams.net/), ERDPlus, or Lucidchart
- **SQL Editor**: psql CLI, DBeaver, PgAdmin, or VS Code with SQL plugin
- **Version Control**: Git and GitHub
- **Optional Seeding Scripts**: Python + [Faker](https://faker.readthedocs.io/) library

---

## 3. Prerequisites

You must have:

- Strong foundation in **Relational Databases and SQL**
- Familiarity with **Entity-Relationship Diagrams**
- Knowledge of **Normalization** (1NF, 2NF, 3NF)
- Experience with **GitHub workflows**
- Ability to work with **Postgres extensions** (`pgcrypto` or `uuid-ossp` for UUIDs)

---

## 4. Database Specification (Entities & Attributes)

### **User**
- `user_id` (UUID, PK)  
- `first_name`, `last_name`  
- `email` (Unique, Indexed)  
- `password_hash`  
- `phone_number` (nullable)  
- `role` (ENUM: guest, host, admin)  
- `created_at` (timestamp)  

### **Property**
- `property_id` (UUID, PK)  
- `host_id` (FK → User.user_id)  
- `name`, `description`, `location`, `price_per_night`  
- `created_at`, `updated_at`  

### **Booking**
- `booking_id` (UUID, PK)  
- `property_id` (FK → Property.property_id)  
- `user_id` (FK → User.user_id)  
- `start_date`, `end_date`, `total_price`, `status` (ENUM: pending, confirmed, canceled)  
- `created_at`  

### **Payment**
- `payment_id` (UUID, PK)  
- `booking_id` (FK → Booking.booking_id)  
- `amount`, `payment_date`, `payment_method` (ENUM: credit_card, paypal, stripe)  

### **Review**
- `review_id` (UUID, PK)  
- `property_id` (FK → Property.property_id)  
- `user_id` (FK → User.user_id)  
- `rating` (CHECK 1–5)  
- `comment`, `created_at`  

### **Message**
- `message_id` (UUID, PK)  
- `sender_id` (FK → User.user_id)  
- `recipient_id` (FK → User.user_id)  
- `message_body`, `sent_at`  

---

## 5. Relationships

- User (1) → (M) Property (host relationship)  
- User (1) → (M) Booking (guest relationship)  
- Property (1) → (M) Booking  
- Booking (1) → (M) Payment  
- User (1) → (M) Review  
- Property (1) → (M) Review  
- User (M) ↔ (M) User via Message  

---

## 6. Deliverables

- **`erd.png`** – Visual ER Diagram (from Draw.io/ERD tool)
- **`schema.sql`** – Database schema (DDL: CREATE TABLE, constraints, indexes)
- **`seed_data.sql`** – Sample data insertions (DML)
- **`requirements.md`** – This requirements document
- **`qa-checklist.md`** – QA checklist for manual review
- **`README.md`** – Project overview and usage instructions

---

## 7. Evaluation Criteria

- ✅ Correctness of ER Diagram  
- ✅ Proper use of **Normalization (3NF)**  
- ✅ Well-structured **schema.sql** with constraints & indexing  
- ✅ Seed data that simulates real-world Airbnb usage  
- ✅ Documentation clarity (README, requirements, QA checklist)  

---

## 8. Submission Guidelines

- Push all project files to a **public GitHub repository**.  
- Ensure the repo includes ER diagram, schema, seeds, requirements, and documentation.  
- Request **Manual QA review** once ready.  
- Auto QA will validate DDL & DML scripts.  

---

## 9. ER Diagram![ER Diagram](image-alx-airbnb-database/ERD/erd.png)


