-- Notes Organizer System - Big Data Integration
-- Apache Sqoop commands (MySQL -> HDFS) and Hive external table definitions

-- ===== SQOOP IMPORTS =====

-- Import nb_users
sqoop import \
--connect jdbc:mysql://localhost/notes \
--username root \
--table nb_users \
--warehouse-dir /user/cloudera/notes \
--as-parquetfile \
-m 1

-- Import note_shares
sqoop import \
--connect jdbc:mysql://localhost/notes \
--username root \
--table note_shares \
--warehouse-dir /user/cloudera/notes \
--as-parquetfile \
-m 1

-- Import doubts
sqoop import \
--connect jdbc:mysql://localhost/notes \
--username root \
--table doubts \
--warehouse-dir /user/cloudera/notes \
--as-parquetfile \
-m 1

-- Import note_categories
sqoop import \
--connect jdbc:mysql://localhost/notes \
--username root \
--table note_categories \
--warehouse-dir /user/cloudera/notes \
--as-parquetfile \
-m 1

-- Import notes
sqoop import \
--connect jdbc:mysql://localhost/notes \
--username root \
--table notes \
--warehouse-dir /user/cloudera/notes \
--as-parquetfile \
-m 1


-- ===== HIVE EXTERNAL TABLES =====

CREATE EXTERNAL TABLE nb_users_ext (
    user_id INT,
    name STRING,
    email STRING,
    dept STRING,
    joined_on STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/user/hive/notebook_organizer/nb_users';

CREATE EXTERNAL TABLE doubts_ext (
    doubt_id INT,
    user_id INT,
    subject STRING,
    question STRING,
    status STRING,
    asked_on STRING,
    answered_on STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/user/hive/notebook_organizer/doubts';

CREATE EXTERNAL TABLE note_shares_ext (
    share_id INT,
    note_id INT,
    shared_by INT,
    shared_with INT,
    shared_on STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/user/hive/notebook_organizer/note_shares';

CREATE EXTERNAL TABLE categories_ext (
    category_id INT,
    category_name STRING,
    description STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/user/hive/notebook_organizer/categories';
