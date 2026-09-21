# Notes Organizer & Analyzer System (DBMS + Big Data Project)

A database-driven system that helps students store, organize, and analyze their study notes and doubts. Built as a DBMS mini-project combining **MySQL** for structured storage with the **Hadoop ecosystem** (HDFS, Sqoop, Hive, Hue) for distributed data processing and analytics.

## 📌 What it does
- Stores user accounts, notes, doubts, categories, and note-sharing activity in a relational database
- Lets users tag and categorize notes for easy retrieval
- Tracks doubts raised by students and whether they were resolved
- Tracks note-sharing between users
- Migrates data from MySQL into Hadoop (HDFS) using Sqoop for large-scale analysis
- Runs analytical queries (via Hive/HiveQL) to find popular notes, active contributors, doubt-resolution rates, and tag trends

## 🛠️ Tech Stack
- **MySQL** – primary relational database
- **Apache Hadoop (HDFS)** – distributed storage for large datasets
- **Apache Sqoop** – transfers data between MySQL and HDFS
- **Apache Hive** – SQL-like querying over HDFS data
- **Hue** – web interface for running Hive queries
- **Cloudera QuickStart VM** (on VirtualBox) – hosts the Hadoop ecosystem

## 🗂️ Database Design
Core entities: `NB_USERS`, `NOTES`, `DOUBTS`, `NOTE_SHARES`, `CATEGORIES`, `NOTE_CATEGORIES`

- A user can create many notes (1:M)
- A user can raise many doubts (1:M)
- A note can be shared many times, with many users (M:N via `NOTE_SHARES`)
- A note can belong to many categories, and a category can hold many notes (M:N via `NOTE_CATEGORIES`)

## 📁 Files in this repo
| File | Description |
|---|---|
| `schema.sql` | Database creation + all table definitions with keys and constraints |
| `queries.sql` | Analytical SQL queries (popular notes, doubt resolution rate, active users, tag trends) |
| `hadoop_integration.sql` | Sqoop import commands + Hive external table definitions |

## 📊 Sample Analytical Insights
- Most viewed/shared notes by subject and tag
- Subject-wise doubt resolution percentage and average response time
- Most active note creators by department
- Tag popularity and average views per tag

## 🚀 How it would run
1. Create the database and tables using `schema.sql` in MySQL
2. Insert sample data (users, notes, doubts, etc.)
3. Run `queries.sql` directly in MySQL for analytics
4. For big-data scale analysis: import tables into HDFS using the Sqoop commands in `hadoop_integration.sql`, then query them through Hive/Hue

## 🎯 Future Scope
- NLP-based automatic summarization and question generation from notes
- Support for PDF/image-based notes
- Real-time (rather than batch) analysis

---
*Academic DBMS mini-project.*
