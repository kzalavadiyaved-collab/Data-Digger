# 🛠️ Data Digger

**"Quality is our Motto."**
*Shaping "skills" for "scaling" higher...!!!*

---

## 📌 Project

**Data Digger**

## 🎯 Objective

"Data Digger" is a practical SQL project that provides hands-on experience in managing a MySQL database using CRUD operations, clauses, operators, aggregate functions, primary keys, and foreign keys. Students will design and manipulate a structured relational database for an **E-Commerce Store** to gain deeper insights into SQL query execution.

---

## 🗂️ Project Scope

The project works with four relational tables: **Customers**, **Orders**, **Products**, and **OrderDetails**.

### 1️⃣ Customers Table

| Field | Description |
|---|---|
| CustomerID | Primary Key |
| Name | Customer's full name |
| Email | Customer's email address |
| Address | Customer's address |

**Queries to Perform**
- [x] Insert at least 5 sample customers into the Customers table.
- [x] Retrieve all customer details.
- [x] Update a customer's address.
- [x] Delete a customer using their CustomerID.
- [x] Display all customers whose name is 'Alice'.

---

### 2️⃣ Orders Table

| Field | Description |
|---|---|
| OrderID | Primary Key |
| CustomerID | Foreign Key → Customers.CustomerID |
| OrderDate | Date the order was placed |
| TotalAmount | Total value of the order |

**Queries to Perform**
- [x] Insert at least 5 sample orders into the Orders table.
- [x] Retrieve all orders made by a specific customer.
- [x] Update an order's total amount.
- [x] Delete an order using its OrderID.
- [x] Retrieve orders placed in the last 30 days.
- [x] Retrieve the highest, lowest, and average order amount using aggregate functions.

---

### 3️⃣ Products Table

| Field | Description |
|---|---|
| ProductID | Primary Key |
| ProductName | Name of the product |
| Price | Product price |
| Stock | Quantity available in stock |

**Queries to Perform**
- [x] Insert at least 5 sample products into the Products table.
- [x] Retrieve all products sorted by price in descending order.
- [x] Update the price of a specific product.
- [x] Delete a product if it's out of stock.
- [x] Retrieve products whose price is between ₹500 and ₹2000.
- [x] Retrieve the most expensive and cheapest product using MAX() and MIN().

---

### 4️⃣ OrderDetails Table

| Field | Description |
|---|---|
| OrderDetailID | Primary Key |
| OrderID | Foreign Key → Orders.OrderID |
| ProductID | Foreign Key → Products.ProductID |
| Quantity | Quantity of product ordered |
| SubTotal | Line-item total (Quantity × Price) |

**Queries to Perform**
- [x] Insert at least 5 sample records into the OrderDetails table.
- [x] Retrieve all order details for a specific order.
- [x] Calculate the total revenue generated from all orders using SUM().
- [x] Retrieve the top 3 most ordered products.
- [x] Count how many times a specific product has been sold using COUNT().

---

## 🧩 Entity Relationship Overview

```
Customers (1) ───< Orders (M)
Orders (1) ───< OrderDetails (M) >─── (1) Products
```

- One **Customer** can place many **Orders**.
- One **Order** can contain many **OrderDetails** (line items).
- One **Product** can appear in many **OrderDetails**.

---

## 📁 Repository Structure

```
data-digger/
│
├── README.md                  # Project documentation (this file)
├── schema.sql                 # Table creation scripts (DDL)
├── sample_data.sql            # INSERT statements for sample records
├── queries/
│   ├── customers_queries.sql
│   ├── orders_queries.sql
│   ├── products_queries.sql
│   └── orderdetails_queries.sql
└── assumptions.md             # Documented assumptions (if any)
```

---

## ⚙️ How to Run

1. Install MySQL (or use a MySQL-compatible client such as MySQL Workbench / DBeaver).
2. Create the database:
   ```sql
   CREATE DATABASE data_digger;
   USE data_digger;
   ```
3. Run `schema.sql` to create the four tables with primary and foreign keys.
4. Run `sample_data.sql` to populate the tables with sample records.
5. Execute the queries in the `queries/` folder (or the master script) to test each requirement.

---

## 📝 Instructions Recap

- **Task Completion:** Attempt all assigned tasks to the best of your ability, following the instructions provided.
- **Assumptions:** Make suitable assumptions wherever necessary and document them in this README or `assumptions.md`.
- **GitHub Repository:** Host the project here, including source code and documentation, with a clear and descriptive README.
- **No Copying:** All code and content must be original. Plagiarism is strictly prohibited and may result in academic penalties.
- **Submission:** Once complete, submit the GitHub repository link to your instructor, ensuring the repo is properly organized with all required files.

---

## ✅ Status

| Table | Schema | Sample Data | Queries |
|---|---|---|---|
| Customers | ⬜ | ⬜ | ⬜ |
| Orders | ⬜ | ⬜ | ⬜ |
| Products | ⬜ | ⬜ | ⬜ |
| OrderDetails | ⬜ | ⬜ | ⬜ |

*(Update the checkboxes above as you complete each part.)*

---

**Data Digger — SQL**
*Bring on your coding attitude!*
