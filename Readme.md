# Car Rental Management System (SQL Server Project)

![1759689510233](image/Readme/1759689510233.png)

## Overview

This project implements a **Car Rental Management System** using  **Microsoft SQL Server** , based on an  **Entity-Relationship Diagram (ERD)** .

It demonstrates database design, table creation, and the execution of **CRUD (Create, Read, Update, Delete)** operations for managing a car rental business.

---

## ER Diagram

The system is designed around the following key entities:

* **Car**
* **Customer**
* **Booking**
* **Payment**
* **Reservation**
* **Insurance**
* **Maintenance**
* **Location**

Each table is linked using **Primary Keys** and **Foreign Keys** to maintain  **referential integrity** .

---

## Database Schema

**Relationships Summary:**

* Each **Car** can have multiple  **Bookings** ,  **Reservations** ,  **Insurances** ,  **Maintenance records** , and a  **Location** .
* Each **Customer** can have multiple **Bookings** and  **Reservations** .
* Each **Booking** is linked to one  **Payment** .

---

## Table Creation

The database consists of eight tables:

| Table Name      | Description                                            |
| --------------- | ------------------------------------------------------ |
| `Car`         | Stores vehicle details, availability, and rental rates |
| `Customer`    | Stores customer personal details                       |
| `Booking`     | Records car booking information                        |
| `Payment`     | Tracks payments for bookings                           |
| `Reservation` | Manages car reservation details                        |
| `Insurance`   | Contains car insurance details                         |
| `Maintenance` | Stores maintenance and service records                 |
| `Location`    | Tracks car storage and pickup locations                |

All tables were created using SQL `CREATE TABLE` statements with appropriate data types, constraints, and foreign keys.

---

## CRUD Operations

### Create

Each table is populated with **five rows** of dummy data using `INSERT INTO` statements.

Example:

<pre class="overflow-visible!" data-start="1973" data-end="2115"><div class="contain-inline-size rounded-2xl relative bg-token-sidebar-surface-primary"><div class="sticky top-9"><div class="absolute end-0 bottom-0 flex h-9 items-center pe-2"><div class="bg-token-bg-elevated-secondary text-token-text-secondary flex items-center gap-4 rounded-sm px-2 font-sans text-xs"></div></div></div><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre! language-sql"><span><span>INSERT</span><span></span><span>INTO</span><span> Car </span><span>VALUES</span><span>
(</span><span>'C001'</span><span>, </span><span>'Corolla'</span><span>, </span><span>'Toyota'</span><span>, </span><span>2020</span><span>, </span><span>'White'</span><span>, </span><span>55.00</span><span>, </span><span>1</span><span>),
(</span><span>'C002'</span><span>, </span><span>'Civic'</span><span>, </span><span>'Honda'</span><span>, </span><span>2021</span><span>, </span><span>'Black'</span><span>, </span><span>60.00</span><span>, </span><span>1</span><span>);
</span></span></code></div></div></pre>

---

### Read

Various `SELECT` queries are used to retrieve and join data from multiple tables.

Examples:

<pre class="overflow-visible!" data-start="2227" data-end="2513"><div class="contain-inline-size rounded-2xl relative bg-token-sidebar-surface-primary"><div class="sticky top-9"><div class="absolute end-0 bottom-0 flex h-9 items-center pe-2"><div class="bg-token-bg-elevated-secondary text-token-text-secondary flex items-center gap-4 rounded-sm px-2 font-sans text-xs"></div></div></div><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre! language-sql"><span><span>-- Get all available cars</span><span>
</span><span>SELECT</span><span></span><span>*</span><span></span><span>FROM</span><span> Car </span><span>WHERE</span><span> Availability </span><span>=</span><span></span><span>1</span><span>;

</span><span>-- View all bookings with customer names</span><span>
</span><span>SELECT</span><span> B.Booking_id, C.First_name, C.Last_name, B.Rental_Start_Date, B.Rent_End_Date, B.Total_Amount
</span><span>FROM</span><span> Booking B
</span><span>JOIN</span><span> Customer C </span><span>ON</span><span> B.Customer_id </span><span>=</span><span> C.Customer_id;
</span></span></code></div></div></pre>

---

### Update

Records can be modified using `UPDATE` queries.

Example:

<pre class="overflow-visible!" data-start="2592" data-end="2660"><div class="contain-inline-size rounded-2xl relative bg-token-sidebar-surface-primary"><div class="sticky top-9"><div class="absolute end-0 bottom-0 flex h-9 items-center pe-2"><div class="bg-token-bg-elevated-secondary text-token-text-secondary flex items-center gap-4 rounded-sm px-2 font-sans text-xs"></div></div></div><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre! language-sql"><span><span>UPDATE</span><span> Car </span><span>SET</span><span> Rental_rate </span><span>=</span><span></span><span>65.00</span><span></span><span>WHERE</span><span> Car_id </span><span>=</span><span></span><span>'C002'</span><span>;
</span></span></code></div></div></pre>

---

### Delete

Specific records can be removed using `DELETE` queries.

Example:

<pre class="overflow-visible!" data-start="2746" data-end="2811"><div class="contain-inline-size rounded-2xl relative bg-token-sidebar-surface-primary"><div class="sticky top-9"><div class="absolute end-0 bottom-0 flex h-9 items-center pe-2"><div class="bg-token-bg-elevated-secondary text-token-text-secondary flex items-center gap-4 rounded-sm px-2 font-sans text-xs"></div></div></div><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre! language-sql"><span><span>DELETE</span><span></span><span>FROM</span><span> Reservation </span><span>WHERE</span><span> Reservation_id </span><span>=</span><span></span><span>'R005'</span><span>;
</span></span></code></div></div></pre>

---

## Key Features

✅ Relational database with well-defined constraints

✅ Normalized structure to prevent data redundancy

✅ Demonstration of all CRUD operations

✅ Includes relationships between multiple entities

✅ Easy to extend (e.g., adding employee or fleet management tables)

---

## Tools & Technologies

| Tool                                          | Purpose                           |
| --------------------------------------------- | --------------------------------- |
| **Microsoft SQL Server**                | Database engine                   |
| **SQL Server Management Studio (SSMS)** | Query execution & database design |
| **ChartDB**                             | ER Diagram design                 |
| **T-SQL**                               | Database query language           |

---

## How to Run the Project

1. Open  **SQL Server Management Studio (SSMS)** .
2. Create a new database:
   <pre class="overflow-visible!" data-start="3495" data-end="3560"><div class="contain-inline-size rounded-2xl relative bg-token-sidebar-surface-primary"><div class="sticky top-9"><div class="absolute end-0 bottom-0 flex h-9 items-center pe-2"><div class="bg-token-bg-elevated-secondary text-token-text-secondary flex items-center gap-4 rounded-sm px-2 font-sans text-xs"></div></div></div><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre! language-sql"><span><span>CREATE</span><span> DATABASE CarRentalDB;
   USE CarRentalDB;
   </span></span></code></div></div></pre>
3. Copy and execute the `CREATE TABLE` statements.
4. Insert the sample data using `INSERT` queries.
5. Run the `SELECT`, `UPDATE`, and `DELETE` queries to test functionality.

---

## Project Structure

<pre class="overflow-visible!" data-start="3771" data-end="4075"><div class="contain-inline-size rounded-2xl relative bg-token-sidebar-surface-primary"><div class="sticky top-9"><div class="absolute end-0 bottom-0 flex h-9 items-center pe-2"><div class="bg-token-bg-elevated-secondary text-token-text-secondary flex items-center gap-4 rounded-sm px-2 font-sans text-xs"></div></div></div><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre!"><span><span>CarRentalManagement/
│
├── ER_Diagram.jpeg               </span><span># Visual representation of the database</span><span>
├── CarRentalDB.sql               </span><span># SQL script with all queries</span><span>
├── README.md                     </span><span># Project documentation (this file)</span><span>
└── /data                         </span><span># (Optional) CSV or backup data</span><span>
</span></span></code></div></div></pre>

---

## Example Use Case

A customer visits a rental branch to book a car.

1. The **Customer** record is stored.
2. A **Reservation** is created for the desired  **Car** .
3. Once confirmed, a **Booking** and **Payment** are recorded.
4. The  **Car** 's **Availability** updates automatically to unavailable.
5. Any **Maintenance** or **Insurance** data can also be tracked for that vehicle.

---

## Author

Follow me 

[![GitHub followers](https://img.shields.io/github/followers/CharlesOdari?label=Follow&style=social)](https://github.com/ODARI-CHARLES1)
[![Portfolio](https://img.shields.io/badge/Portfolio-View-blue?logo=google-chrome)](https://charles.k.odari.portfolio.thegtm.or.ke/)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-blue?logo=linkedin)](https://ke.linkedin.com/in/odari-kibisi-charles-329b19331)
[![Email](https://img.shields.io/badge/Email-Contact-red?logo=gmail)](mailto:daymondodari68@gmail.com)
