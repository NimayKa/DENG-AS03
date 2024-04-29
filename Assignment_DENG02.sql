-- Create platform table
CREATE TABLE platform (
  platform_id VARCHAR(15) PRIMARY KEY,
  platform_name VARCHAR(255) NOT NULL,
  manufacturer VARCHAR(255),
  release_date DATE
);

-- Create genre table
CREATE TABLE genre (
  genre_id VARCHAR(15) PRIMARY KEY,
  genre_name VARCHAR(255) NOT NULL
);

-- Create review table
CREATE TABLE review (
  review_id VARCHAR(15) PRIMARY KEY,
  review_rating VARCHAR(255),
  review_comment TEXT
);

-- Create store table
CREATE TABLE store (
  store_id VARCHAR(15) PRIMARY KEY,
  store_location VARCHAR(255) NOT NULL,
  store_country VARCHAR(255) NOT NULL
);

-- Create employee table
CREATE TABLE employee (
  employee_id VARCHAR(15) PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  date_of_employment DATE NOT NULL,
  date_of_birth DATE,
  store_id VARCHAR(15)
);

-- Create customer table
CREATE TABLE customer (
  customer_id VARCHAR(15) PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  date_of_birth DATE,
  address VARCHAR(255),
  phone_number VARCHAR(255),
  employee_email VARCHAR(255)
);

-- Create orders table
CREATE TABLE orders (
  order_id VARCHAR(15) PRIMARY KEY,
  customer_id VARCHAR(15), 
  order_date DATE NOT NULL,
  price_total DECIMAL(10,2) NOT NULL
);

-- Create transaction table
CREATE TABLE store_transaction (
  transaction_id VARCHAR(15) PRIMARY KEY,
  customer_id VARCHAR(15), 
  type_of_payment VARCHAR(255) NOT NULL,
  date_of_transaction DATE NOT NULL,
  employee_id VARCHAR(15), 
  order_id VARCHAR(15) 
);

-- Create game table
CREATE TABLE game (
  game_id VARCHAR(15) PRIMARY KEY,
  game_title VARCHAR(255) NOT NULL,
  genre_id VARCHAR(15), 
  release_date DATE,
  platform_id VARCHAR(15),
  rating_system INTEGER,
  review_id VARCHAR(15)
);

-- Create table_equipment table
CREATE TABLE table_equipment (
  equipment_id VARCHAR(15) PRIMARY KEY,
  equipment_name VARCHAR(255) NOT NULL,
  platform_id VARCHAR(15), 
  equipment_price DECIMAL(10,2) NOT NULL,
  quantity INTEGER NOT NULL,
  review_id VARCHAR(15) 
);

-- Dropping Table
DROP TABLE store;
DROP TABLE employee;
DROP TABLE platform;
DROP TABLE genre;
DROP TABLE review;
DROP TABLE customer;
DROP TABLE orders;
DROP TABLE store_transaction;
DROP TABLE game;
DROP TABLE table_equipment;

-- Alter table
ALTER TABLE employee ADD CONSTRAINT fk_employee_store FOREIGN KEY (store_id) REFERENCES store(store_id);
ALTER TABLE orders ADD CONSTRAINT fk_orders_customer FOREIGN KEY (customer_id) REFERENCES customer(customer_id);
ALTER TABLE store_transaction ADD CONSTRAINT fk_transaction_customer FOREIGN KEY (customer_id) REFERENCES customer(customer_id);
ALTER TABLE store_transaction ADD CONSTRAINT fk_transaction_employee FOREIGN KEY (employee_id) REFERENCES employee(employee_id);
ALTER TABLE store_transaction ADD CONSTRAINT fk_transaction_order FOREIGN KEY (order_id) REFERENCES orders(order_id);
ALTER TABLE game ADD CONSTRAINT fk_game_genre FOREIGN KEY (genre_id) REFERENCES genre(genre_id);
ALTER TABLE game ADD CONSTRAINT fk_game_platform FOREIGN KEY (platform_id) REFERENCES platform(platform_id);
ALTER TABLE game ADD CONSTRAINT fk_game_review FOREIGN KEY (review_id) REFERENCES review(review_id);
ALTER TABLE table_equipment ADD CONSTRAINT fk_equipment_platform FOREIGN KEY (platform_id) REFERENCES platform(platform_id);
ALTER TABLE table_equipment ADD CONSTRAINT fk_equipment_review FOREIGN KEY (review_id) REFERENCES review(review_id);

---------- INSERTING DATA ---------- 
INSERT INTO platform (platform_id, platform_name, manufacturer, release_date)
VALUES


INSERT INTO genre (genre_id, genre_name)
VALUES
	('GE00001', 'RPG'),
	('GE00002', 'Adventure'),
	('GE00003', 'Action'),
	('GE00004', 'Simulation'),
	('GE00005', 'Fighting'),
	('GE00006', 'Sandbox'),
	('GE00007', 'MMORPG'),
	('GE00008', 'Shooter'),
	('GE00009', 'Strategy'),
	('GE00010', 'Stealth'),
	('GE00011', 'Survival'),
	('GE00012', 'Role-Playing'),
	('GE00013', 'Casual'),
	('GE00014', 'Party'),
	('GE00015', 'Action RPG'),
	('GE00016', 'Tactical Role-playing'),
	('GE00017', 'Battle Royale'),
	('GE00018', '2D Fighting'),
	('GE00019', '3D Fighting'),
	('GE00020', 'Action-Adventure'),
	('GE00021', 'Air Combat'),
	('GE00022', 'Arena Brawler'),
	('GE00023', 'Arena Combat'),
	('GE00024', 'Arena Shooter'),
	('GE00025', 'Board Games'),
	('GE00026', 'Card Game'),
	('GE00027', 'Interactive Fiction'),
	('GE00028', 'Interactive Movie'),
	('GE00029', 'Puzzle'),
	('GE00030', 'Mini-games'),
	('GE00031', 'MMO'),
	('GE00032', 'MOBA'),
	('GE00033', 'Party'),
	('GE00034', 'Programming'),
	('GE00035', 'Racing'),
	('GE00036', 'Rhythm'),
	('GE00037', 'Sports'),
	('GE00038', 'Horror'),
	('GE00039', 'Time Management'),
	('GE00040', 'TPS'),
	('GE00041', 'FPS'),
	('GE00042', 'Narrative'),
	('GE00043', "Beat 'Em Up"),
	('GE00044', 'Battle Royale'),
	('GE00045', 'Metroidvania'),
	('GE00046', 'Visual Novels'),
	('GE00047', 'Logical'),
	('GE00048', 'Physics'),
	('GE00049', 'Exploration'),
	('GE00050', 'Construction and Management Simulation');

INSERT INTO review (review_id, review_rating, review_comment)
VALUES


INSERT INTO store (store_id, store_location, store_country)
VALUES 
	('S00001', 'Gadong', 'Brunei'),
	('S00002', 'Beribi', 'Brunei'),
	('S00003', 'Serusop', 'Brunei'),
	('S00004', 'Menglait', 'Brunei'),
	('S00005', 'Muara', 'Brunei'),
	('S00006', 'Mentiri', 'Brunei'),
	('S00007', 'Madang', 'Brunei'),
	('S00008', 'Lambak Kanan', 'Brunei'),
	('S00009', 'Salar', 'Brunei'),
	('S00010', 'Sengkurong', 'Brunei'),
	('S00011', 'Rimba', 'Brunei'),
	('S00012', 'Katok', 'Brunei'),
	('S00013', 'Tanjong Bunut', 'Brunei'),
	('S00014', 'Jerudong', 'Brunei'),
	('S00015', 'Bengkurong', 'Brunei'),
	('S00016', 'Tutong', 'Brunei'),
	('S00017', 'Seria', 'Brunei'),
	('S00018', 'Kuala Belait', 'Brunei'),
	('S00019', 'Lutong', 'Malaysia'),
	('S00020', 'Miri', 'Malaysia'),
	('S00021', 'Selangor', 'Malaysia'),
	('S00022', 'Putrajaya', 'Malaysia'),
	('S00023', 'Puchong', 'Malaysia'),
	('S00024', 'Subang Jaya', 'Malaysia'),
	('S00025', 'Petaling Jaya', 'Malaysia'),
	('S00026', 'Cyberjaya', 'Malaysia'),
	('S00027', 'Shah Alam', 'Malaysia'),
	('S00028', 'Kota Damansara', 'Malaysia'),
	('S00029', 'Ampang Jaya', 'Malaysia'),
	('S00030', 'Pandan Jaya', 'Malaysia'),
	('S00031', 'Maluri', 'Malaysia'),
	('S00032', 'Pudu', 'Malaysia'),
	('S00033', 'Bukit Bintang', 'Malaysia'),
	('S00034', 'Malacca', 'Malaysia'),
	('S00035', 'Muar', 'Malaysia'),
	('S00036', 'Johor Bahru', 'Malaysia'),
	('S00037', 'Taman Daya', 'Malaysia'),
	('S00038', 'Woodlands', 'Singapore'),
	('S00039', 'Bugis', 'Singapore'),
	('S00040', 'Orchard', 'Singapore'),
	('S00041', 'Ang Mo Kio', 'Singapore'),
	('S00042', 'Tampines', 'Singapore'),
	('S00043', 'Jurong East', 'Singapore'),
	('S00044', 'Kallang', 'Singapore'),
	('S00045', 'Jurong West', 'Singapore'),
	('S00046', 'Yishun', 'Singapore'),
	('S00047', 'Bishan', 'Singapore'),
	('S00048', 'Geylang', 'Singapore'),
	('S00049', 'Bukit Merah', 'Singapore'),
	('S00050', 'Punggol', 'Singapore');

INSERT INTO store_transaction(transaction_id, customer_id, type_of_payment, date_of_transaction, employee_id, order_id)
VALUES
('T0001', 'C001', 'Credit Card', '2024-01-01', 'E001', 'O0001'),
('T0002', 'C002', 'Cash', '2024-01-02', 'E002', 'O0002'),
('T0003', 'C003', 'Debit Card', '2024-01-03', 'E003', 'O0003'),
('T0004', 'C004', 'Credit Card', '2024-01-04', 'E004', 'O0004'),
('T0005', 'C005', 'Cash', '2024-01-05', 'E005', 'O0005'),
('T0006', 'C006', 'Debit Card', '2024-01-06', 'E006', 'O0006'),
('T0007', 'C007', 'Credit Card', '2024-01-07', 'E007', 'O0007'),
('T0008', 'C008', 'Cash', '2024-01-08', 'E008', 'O0008'),
('T0009', 'C009', 'Debit Card', '2024-01-09', 'E009', 'O0009'),
('T0010', 'C010', 'Credit Card', '2024-01-10', 'E010', 'O0010'),
('T0011', 'C011', 'Cash', '2024-01-11', 'E011', 'O0011'),
('T0012', 'C012', 'Debit Card', '2024-01-12', 'E012', 'O0012'),
('T0013', 'C013', 'Credit Card', '2024-01-13', 'E013', 'O0013'),
('T0014', 'C014', 'Cash', '2024-01-14', 'E014', 'O0014'),
('T0015', 'C015', 'Debit Card', '2024-01-15', 'E015', 'O0015'),
('T0016', 'C016', 'Credit Card', '2024-01-16', 'E016', 'O0016'),
('T0017', 'C017', 'Cash', '2024-01-17', 'E017', 'O0017'),
('T0018', 'C018', 'Debit Card', '2024-01-18', 'E018', 'O0018'),
('T0019', 'C019', 'Credit Card', '2024-01-19', 'E019', 'O0019'),
('T0020', 'C020', 'Cash', '2024-01-20', 'E020', 'O0020'),
('T0021', 'C021', 'Debit Card', '2024-01-21', 'E021', 'O0021'),
('T0022', 'C022', 'Credit Card', '2024-01-22', 'E022', 'O0022'),
('T0023', 'C023', 'Cash', '2024-01-23', 'E023', 'O0023'),
('T0024', 'C024', 'Debit Card', '2024-01-24', 'E024', 'O0024'),
('T0025', 'C025', 'Credit Card', '2024-01-25', 'E025', 'O0025'),
('T0026', 'C026', 'Cash', '2024-01-26', 'E026', 'O0026'),
('T0027', 'C027', 'Debit Card', '2024-01-27', 'E027', 'O0027'),
('T0028', 'C028', 'Credit Card', '2024-01-28', 'E028', 'O0028'),
('T0029', 'C029', 'Cash', '2024-01-29', 'E029', 'O0029'),
('T0030', 'C030', 'Debit Card', '2024-01-30', 'E030', 'O0030'),
('T0031', 'C031', 'Credit Card', '2024-01-31', 'E031', 'O0031'),
('T0032', 'C032', 'Cash', '2024-02-01', 'E032', 'O0032'),
('T0033', 'C033', 'Debit Card', '2024-02-02', 'E033', 'O0033'),
('T0034', 'C034', 'Credit Card', '2024-02-03', 'E034', 'O0034'),
('T0035', 'C035', 'Cash', '2024-02-04', 'E035', 'O0035'),
('T0036', 'C036', 'Debit Card', '2024-02-05', 'E036', 'O0036'),
('T0037', 'C037', 'Credit Card', '2024-02-06', 'E037', 'O0037'),
('T0038', 'C038', 'Cash', '2024-02-07', 'E038', 'O0038'),
('T0039', 'C039', 'Debit Card', '2024-02-08', 'E039', 'O0039'),
('T0040', 'C040', 'Credit Card', '2024-02-09', 'E040', 'O0040'),
('T0041', 'C041', 'Cash', '2024-02-10', 'E041', 'O0041'),
('T0042', 'C042', 'Debit Card', '2024-02-11', 'E042', 'O0042'),
('T0043', 'C043', 'Credit Card', '2024-02-12', 'E043', 'O0043'),
('T0044', 'C044', 'Cash', '2024-02-13', 'E044', 'O0044'),
('T0045', 'C045', 'Debit Card', '2024-02-14', 'E045', 'O0045'),
('T0046', 'C046', 'Credit Card', '2024-02-15', 'E046', 'O0046'),
('T0047', 'C047', 'Cash', '2024-02-16', 'E047', 'O0047'),
('T0048', 'C048', 'Debit Card', '2024-02-17', 'E048', 'O0048'),
('T0049', 'C049', 'Credit Card', '2024-02-18', 'E049', 'O0049'),
('T0050', 'C050', 'Cash', '2024-02-19', 'E050', 'O0050');

-- Insert 50 rows into the employee table with IDs starting from E0001
INSERT INTO employee (employee_id, first_name, last_name, date_of_employment, dob, store_id)
VALUES
  ('E0001', 'John', 'Doe', '2023-01-15', '1990-05-10', 1),
  ('E0002', 'Jane', 'Smith', '2022-12-05', '1985-09-20', 2),
  ('E0003', 'Michael', 'Johnson', '2024-02-20', '1988-07-15', 1),
  ('E0004', 'Emily', 'Brown', '2023-05-20', '1992-08-12', 2),
  ('E0005', 'David', 'Clark', '2023-11-10', '1987-04-25', 1),
  ('E0006', 'Jessica', 'Wilson', '2024-03-08', '1995-10-30', 2),
  ('E0007', 'Matthew', 'Taylor', '2022-09-17', '1983-12-05', 1),
  ('E0008', 'Sarah', 'Anderson', '2023-07-22', '1991-03-18', 1),
  ('E0009', 'Daniel', 'White', '2024-01-30', '1989-06-15', 2),
  ('E0010', 'Emma', 'Martinez', '2023-04-12', '1993-09-08', 1),
  ('E0011', 'Christopher', 'Hernandez', '2024-06-05', '1984-11-20', 2),
  ('E0012', 'Olivia', 'Garcia', '2022-08-28', '1996-02-14', 1),
  ('E0013', 'Andrew', 'Lopez', '2023-02-14', '1994-07-03', 2),
  ('E0014', 'Ava', 'Perez', '2024-04-18', '1997-01-28', 1),
  ('E0015', 'William', 'Gonzalez', '2023-10-03', '1986-05-22', 2),
  ('E0016', 'Mia', 'Rivera', '2024-08-07', '1998-08-07', 1),
  ('E0017', 'James', 'Rodriguez', '2022-12-30', '1982-03-15', 2),
  ('E0018', 'Sophia', 'Torres', '2023-06-25', '1990-10-10', 1),
  ('E0019', 'Logan', 'Sanchez', '2024-02-09', '1985-06-29', 1),
  ('E0020', 'Isabella', 'Ramirez', '2023-07-01', '1991-12-17', 2),
  ('E0021', 'Benjamin', 'Flores', '2024-05-14', '1983-04-02', 1),
  ('E0022', 'Jacob', 'Ortiz', '2022-11-18', '1995-09-23', 2),
  ('E0023', 'Amelia', 'Diaz', '2023-03-22', '1996-07-11', 1),
  ('E0024', 'Ethan', 'Nguyen', '2024-09-26', '1984-02-08', 2),
  ('E0025', 'Chloe', 'Kim', '2022-07-09', '1990-11-03', 1),
  ('E0026', 'Liam', 'Patel', '2023-01-02', '1987-08-19', 1),
  ('E0027', 'Ella', 'Chen', '2024-06-10', '1994-01-06', 2),
  ('E0028', 'Noah', 'Ng', '2023-10-15', '1988-06-25', 1),
  ('E0029', 'Grace', 'Wang', '2024-02-28', '1982-09-14', 2),
  ('E0030', 'Mason', 'Wong', '2022-12-22', '1991-04-01', 1),
  ('E0031', 'Harper', 'Singh', '2023-08-05', '1985-10-27', 2),
  ('E0032', 'Evelyn', 'Li', '2024-04-03', '1993-02-24', 1),
  ('E0033', 'Alexander', 'Lin', '2022-11-01', '1989-07-20', 2),
  ('E0034', 'Avery', 'Zhang', '2023-05-08', '1986-12-12', 1),
  ('E0035', 'Scarlett', 'Choi', '2024-01-19', '1995-05-15', 1),
  ('E0036', 'Daniel', 'Kumar', '2022-09-03', '1983-08-08', 2),
  ('E0037', 'Madison', 'Lee', '2023-03-16', '1996-03-04', 1),
  ('E0038', 'Jackson', 'Wu', '2024-07-28', '1990-09-22', 2),
  ('E0039', 'Luna', 'Gupta', '2022-08-14', '1987-01-31', 1),
  ('E0040', 'Liam', 'Huang', '2023-02-05', '1992-06-26', 2),
  ('E0041', 'Aria', 'Chung', '2024-06-20', '1984-12-18', 1),
  ('E0042', 'Lucas', 'Chen', '2022-12-13', '1993-10-11', 2),
  ('E0043', 'Zoe', 'Kim', '2023-04-17', '1997-03-09', 1),
  ('E0044', 'Aiden', 'Park', '2024-08-24', '1988-05-05', 2),
  ('E0045', 'Penelope', 'Wang', '2022-10-27', '1994-09-28', 1),
  ('E0046', 'Luke', 'Tran', '2023-06-01', '1986-04-16', 1),
  ('E0047', 'Nora', 'Chen', '2024-01-12', '1990-11-19', 2),
  ('E0048', 'Carter', 'Li', '2022-07-07', '1995-08-22', 1),
  ('E0049', 'Eleanor', 'Gupta', '2023-11-09', '1983-02-28', 2),
  ('E0050', 'Henry', 'Jiang', '2024-03-30', '1991-07-07', 1);
	
-- Insert 50 rows into the customer table with IDs starting from C0001
INSERT INTO customer (customer_id, first_name, last_name, bod, address, phone_number, email)
VALUES
  ('C0001', 'Alice', 'Williams', '1995-03-12', '123 Main St, City, Country', '+1234567890', 'alice@example.com'),
  ('C0002', 'Bob', 'Brown', '1980-08-25', '456 Elm St, City, Country', '+1987654321', 'bob@example.com'),
  ('C0003', 'Eva', 'Martinez', '1976-11-03', '789 Oak St, City, Country', '+9876543210', 'eva@example.com'),
  ('C0004', 'David', 'Jones', '1990-05-20', '234 Maple St, City, Country', '+1122334455', 'david@example.com'),
  ('C0005', 'Emma', 'Taylor', '1985-09-10', '567 Pine St, City, Country', '+9988776655', 'emma@example.com'),
  ('C0006', 'James', 'Anderson', '1978-04-15', '890 Cedar St, City, Country', '+5566778899', 'james@example.com'),
  ('C0007', 'Olivia', 'Davis', '1992-07-18', '345 Oak St, City, Country', '+4433221122', 'olivia@example.com'),
  ('C0008', 'Michael', 'Wilson', '1987-12-30', '678 Elm St, City, Country', '+7788990011', 'michael@example.com'),
  ('C0009', 'Sophia', 'Moore', '1983-03-25', '901 Birch St, City, Country', '+6677889900', 'sophia@example.com'),
  ('C0010', 'William', 'Clark', '1995-08-02', '123 Pineapple St, City, Country', '+2233445566', 'william@example.com'),
  ('C0011', 'Emily', 'Thomas', '1998-01-05', '456 Orange St, City, Country', '+8899001122', 'emily@example.com'),
  ('C0012', 'Jacob', 'Jackson', '1976-09-20', '789 Strawberry St, City, Country', '+0011223344', 'jacob@example.com'),
  ('C0013', 'Isabella', 'Harris', '1989-06-14', '234 Mango St, City, Country', '+5566778899', 'isabella@example.com'),
  ('C0014', 'Alexander', 'Allen', '1993-12-28', '567 Banana St, City, Country', '+9988776655', 'alexander@example.com'),
  ('C0015', 'Abigail', 'Lee', '1975-10-03', '890 Lemon St, City, Country', '+1122334455', 'abigail@example.com'),
  ('C0016', 'Matthew', 'Young', '1981-04-08', '123 Peach St, City, Country', '+4433221122', 'matthew@example.com'),
  ('C0017', 'Ava', 'Scott', '1990-07-13', '456 Cherry St, City, Country', '+7788990011', 'ava@example.com'),
  ('C0018', 'Ethan', 'King', '1986-11-17', '789 Grape St, City, Country', '+6677889900', 'ethan@example.com'),
  ('C0019', 'Mia', 'Wright', '1997-02-28', '901 Pear St, City, Country', '+2233445566', 'mia@example.com'),
  ('C0020', 'Charlotte', 'Lopez', '1982-05-10', '123 Kiwi St, City, Country', '+8899001122', 'charlotte@example.com'),
  ('C0021', 'Liam', 'Gonzalez', '1991-08-22', '456 Coconut St, City, Country', '+0011223344', 'liam@example.com'),
  ('C0022', 'Harper', 'Lewis', '1979-03-07', '789 Avocado St, City, Country', '+5566778899', 'harper@example.com'),
  ('C0023', 'Ella', 'Martin', '1994-12-01', '234 Guava St, City, Country', '+9988776655', 'ella@example.com'),
  ('C0024', 'Jackson', 'Lee', '1988-06-25', '567 Papaya St, City, Country', '+1122334455', 'jackson@example.com'),
  ('C0025', 'Avery', 'Hill', '1992-11-09', '890 Mango St, City, Country', '+4433221122', 'avery@example.com'),
  ('C0026', 'Scarlett', 'Cook', '1977-04-15', '123 Banana St, City, Country', '+7788990011', 'scarlett@example.com'),
  ('C0027', 'Lucas', 'Murphy', '1984-09-28', '456 Orange St, City, Country', '+6677889900', 'lucas@example.com'),
  ('C0028', 'Evelyn', 'Nelson', '1996-02-03', '789 Lemon St, City, Country', '+2233445566', 'evelyn@example.com'),
  ('C0029', 'Madison', 'Baker', '1980-07-16', '901 Peach St, City, Country', '+8899001122', 'madison@example.com'),
  ('C0030', 'Jackson', 'Cooper', '1993-10-30', '234 Cherry St, City, Country', '+0011223344', 'jackson@example.com'),
  ('C0031', 'Aria', 'Hill', '1978-05-24', '567 Mango St, City, Country', '+5566778899', 'aria@example.com'),
  ('C0032', 'Sebastian', 'Green', '1985-01-18', '890 Kiwi St, City, Country', '+9988776655', 'sebastian@example.com'),
  ('C0033', 'Lily', 'Carter', '1990-03-02', '123 Coconut St, City, Country', '+1122334455', 'lily@example.com'),
  ('C0034', 'Gabriel', 'Adams', '1995-08-17', '456 Avocado St, City, Country', '+4433221122', 'gabriel@example.com'),
  ('C0035', 'Chloe', 'Gray', '1983-11-21', '789 Papaya St, City, Country', '+7788990011', 'chloe@example.com'),
  ('C0036', 'Zoey', 'Barnes', '1998-04-04', '901 Guava St, City, Country', '+6677889900', 'zoey@example.com'),
  ('C0037', 'Carter', 'Foster', '1976-09-08', '234 Pear St, City, Country', '+2233445566', 'carter@example.com'),
  ('C0038', 'Grace', 'Perry', '1988-01-12', '567 Kiwi St, City, Country', '+8899001122', 'grace@example.com'),
  ('C0039', 'Riley', 'Bennett', '1992-04-26', '890 Coconut St, City, Country', '+0011223344', 'riley@example.com'),
  ('C0040', 'Eleanor', 'Howard', '1980-07-01', '123 Avocado St, City, Country', '+5566778899', 'eleanor@example.com'),
  ('C0041', 'Lincoln', 'Reed', '1996-10-15', '456 Papaya St, City, Country', '+9988776655', 'lincoln@example.com'),
  ('C0042', 'Natalie', 'Sanders', '1984-02-19', '789 Mango St, City, Country', '+1122334455', 'natalie@example.com'),
  ('C0043', 'Nolan', 'Flores', '1979-05-23', '901 Orange St, City, Country', '+4433221122', 'nolan@example.com'),
  ('C0044', 'Hannah', 'Ross', '1994-11-07', '234 Lemon St, City, Country', '+7788990011', 'hannah@example.com'),
  ('C0045', 'Landon', 'Butler', '1987-03-11', '567 Peach St, City, Country', '+6677889900', 'landon@example.com'),
  ('C0046', 'Layla', 'Simmons', '1990-06-25', '890 Cherry St, City, Country', '+2233445566', 'layla@example.com'),
  ('C0047', 'Isaac', 'Woods', '1997-09-12', '123 Mango St, City, Country', '+8899001122', 'isaac@example.com'),
  ('C0048', 'Nova', 'Coleman', '1977-12-04', '456 Banana St, City, Country', '+0011223344', 'nova@example.com'),
  ('C0049', 'Leah', 'Griffin', '1982-08-18', '789 Orange St, City, Country', '+5566778899', 'leah@example.com'),
  ('C0050', 'Eli', 'Ward', '1995-01-21', '901 Kiwi St, City, Country', '+9988776655', 'eli@example.com');

-- Insert 50 rows into the orders table with IDs starting from OR0001
INSERT INTO orders (order_id, customer_id, order_date, price_total)
VALUES
  ('OR0001', 'C0001', '2024-04-28', 100.50),
  ('OR0002', 'C0002', '2024-04-27', 75.25),
  ('OR0003', 'C0003', '2024-04-26', 150.75),
  ('OR0004', 'C0004', '2024-04-25', 120.00),
  ('OR0005', 'C0005', '2024-04-24', 85.50),
  ('OR0006', 'C0006', '2024-04-23', 200.25),
  ('OR0007', 'C0007', '2024-04-22', 75.00),
  ('OR0008', 'C0008', '2024-04-21', 180.75),
  ('OR0009', 'C0009', '2024-04-20', 90.25),
  ('OR0010', 'C0010', '2024-04-19', 150.00),
  ('OR0011', 'C0011', '2024-04-18', 110.50),
  ('OR0012', 'C0012', '2024-04-17', 95.75),
  ('OR0013', 'C0013', '2024-04-16', 130.25),
  ('OR0014', 'C0014', '2024-04-15', 70.00),
  ('OR0015', 'C0015', '2024-04-14', 145.50),
  ('OR0016', 'C0016', '2024-04-13', 115.25),
  ('OR0017', 'C0017', '2024-04-12', 180.00),
  ('OR0018', 'C0018', '2024-04-11', 200.75),
  ('OR0019', 'C0019', '2024-04-10', 90.25),
  ('OR0020', 'C0020', '2024-04-09', 170.00),
  ('OR0021', 'C0021', '2024-04-08', 100.50),
  ('OR0022', 'C0022', '2024-04-07', 125.75),
  ('OR0023', 'C0023', '2024-04-06', 95.25),
  ('OR0024', 'C0024', '2024-04-05', 140.00),
  ('OR0025', 'C0025', '2024-04-04', 75.50),
  ('OR0026', 'C0026', '2024-04-03', 160.25),
  ('OR0027', 'C0027', '2024-04-02', 115.00),
  ('OR0028', 'C0028', '2024-04-01', 185.75),
  ('OR0029', 'C0029', '2024-03-31', 95.25),
  ('OR0030', 'C0030', '2024-03-30', 130.00),
  ('OR0031', 'C0031', '2024-03-29', 125.50),
  ('OR0032', 'C0032', '2024-03-28', 90.25),
  ('OR0033', 'C0033', '2024-03-27', 150.00),
  ('OR0034', 'C0034', '2024-03-26', 115.75),
  ('OR0035', 'C0035', '2024-03-25', 170.00),
  ('OR0036', 'C0036', '2024-03-24', 100.50),
  ('OR0037', 'C0037', '2024-03-23', 135.75),
  ('OR0038', 'C0038', '2024-03-22', 85.25),
  ('OR0039', 'C0039', '2024-03-21', 120.00),
  ('OR0040', 'C0040', '2024-03-20', 65.50),
  ('OR0041', 'C0041', '2024-03-19', 140.25),
  ('OR0042', 'C0042', '2024-03-18', 80.00),
  ('OR0043', 'C0043', '2024-03-17', 155.75),
  ('OR0044', 'C0044', '2024-03-16', 95.25),
  ('OR0045', 'C0045', '2024-03-15', 130.00),
  ('OR0046', 'C0046', '2024-03-14', 75.50),
  ('OR0047', 'C0047', '2024-03-13', 145.25),
  ('OR0048', 'C0048', '2024-03-12', 100.00),
  ('OR0049', 'C0049', '2024-03-11', 170.75),
  ('OR0050', 'C0050', '2024-03-10', 80.25);

INSERT INTO game(game_id, game_title, genre_id, release_date, platform_id, rating_system, review_id)
VALUES
('GA0001', 'Space Adventure', 'G01', '1980-07-15', 'P01', 'E', 'R0001'),
('GA0002', 'Fantasy Quest', 'G02', '1985-11-20', 'P01', 'T', 'R0002'),
('GA0003', 'Mystery Island', 'G03', '1990-05-22', 'P02', 'M', 'R0003'),
('GA0004', 'Castle Siege', 'G01', '1992-12-09', 'P02', 'E10+', 'R0004'),
('GA0005', 'Cybernetic Wars', 'G04', '1999-08-15', 'P03', 'T', 'R0005'),
('GA0006', 'Galactic Battles', 'G05', '2001-02-26', 'P03', 'M', 'R0006'),
('GA0007', 'Ocean Explorer', 'G06', '2003-09-17', 'P04', 'E', 'R0007'),
('GA0008', 'Desert Rally', 'G02', '2004-06-30', 'P04', 'E10+', 'R0008'),
('GA0009', 'Sky High Adventure', 'G01', '2005-12-12', 'P05', 'T', 'R0009'),
('GA0010', 'Dinosaur Park', 'G03', '2007-07-21', 'P05', 'E', 'R0010'),
('GA0011', 'Ninja Warrior', 'G02', '2009-03-03', 'P06', 'T', 'R0011'),
('GA0012', 'Pirate Treasures', 'G01', '2010-10-14', 'P06', 'E10+', 'R0012'),
('GA0013', 'Robot Factory', 'G04', '2011-04-23', 'P07', 'E', 'R0013'),
('GA0014', 'Monster Zoo', 'G03', '2013-11-19', 'P07', 'E', 'R0014'),
('GA0015', 'Time Travelers', 'G05', '2015-02-27', 'P08', 'T', 'R0015'),
('GA0016', 'Arctic Expedition', 'G06', '2016-08-06', 'P08', 'E10+', 'R0016'),
('GA0017', 'Haunted Mansion', 'G02', '2017-09-29', 'P09', 'M', 'R0017'),
('GA0018', 'Jungle Journey', 'G01', '2018-03-15', 'P09', 'E', 'R0018'),
('GA0019', 'Space Odyssey', 'G05', '2019-07-22', 'P10', 'T', 'R0019'),
('GA0020', 'Lost in Time', 'G03', '2020-12-05', 'P10', 'E10+', 'R0020'),
('GA0021', 'Ice World', 'G06', '2021-05-14', 'P11', 'E', 'R0021'),
('GA0022', 'Cyberpunk City', 'G04', '2022-01-20', 'P11', 'M', 'R0022'),
('GA0023', 'Formula Rush', 'G02', '2023-04-18', 'P12', 'E', 'R0023'),
('GA0024', 'Lunar Landing', 'G05', '2024-03-03', 'P12', 'T', 'R0024'),
('GA0025', 'Medieval Lords', 'G01', '1984-08-16', 'P01', 'E10+', 'R0025'),
('GA0026', 'Virtual Detective', 'G03', '1986-11-22', 'P01', 'T', 'R0026'),
('GA0027', 'Alien Invasion', 'G04', '1987-07-17', 'P02', 'M', 'R0027'),
('GA0028', 'Racing Legends', 'G02', '1988-02-09', 'P02', 'E', 'R0028'),
('GA0029', 'Wizard Academy', 'G01', '1989-12-15', 'P03', 'E', 'R0029'),
('GA0030', 'Treasure Island', 'G03', '1991-05-24', 'P03', 'E10+', 'R0030'),
('GA0031', 'Samurai Honor', 'G02', '1993-08-30', 'P04', 'T', 'R0031'),
('GA0032', 'Future Wars', 'G05', '1994-04-12', 'P04', 'M', 'R0032'),
('GA0033', 'Deep Sea Quest', 'G06', '1996-11-28', 'P05', 'E', 'R0033'),
('GA0034', 'Sky Fighters', 'G01', '1998-03-05', 'P05', 'T', 'R0034'),
('GA0035', 'Antarctic Adventure', 'G06', '2000-07-19', 'P06', 'E', 'R0035'),
('GA0036', 'Canyon Challenge', 'G02', '2002-01-22', 'P06', 'E10+', 'R0036'),
('GA0037', 'Dragon Realm', 'G03', '2004-06-11', 'P07', 'T', 'R0037'),
('GA0038', 'Fantasy Skies', 'G01', '2006-10-17', 'P07', 'M', 'R0038'),
('GA0039', 'Mystic Forest', 'G03', '2008-03-24', 'P08', 'E', 'R0039'),
('GA0040', 'Cyber Hacker', 'G04', '2009-12-09', 'P08', 'E10+', 'R0040'),
('GA0041', 'Global Racing', 'G02', '2011-06-13', 'P09', 'T', 'R0041'),
('GA0042', 'Orbital Station', 'G05', '2012-09-22', 'P09', 'M', 'R0042'),
('GA0043', 'Ancient Ruins', 'G01', '2014-02-18', 'P10', 'E', 'R0043'),
('GA0044', 'Thunderstorm Racers', 'G02', '2016-04-30', 'P10', 'E10+', 'R0044'),
('GA0045', 'Neptune Exploration', 'G06', '2018-11-29', 'P11', 'T', 'R0045'),
('GA0046', 'Zombie City', 'G04', '2020-10-05', 'P11', 'M', 'R0046'),
('GA0047', 'Royal Knights', 'G01', '2022-01-16', 'P12', 'E', 'R0047'),
('GA0048', 'Storm Pilots', 'G05', '2023-08-23', 'P12', 'T', 'R0048'),
('GA0049', 'Quantum Break', 'G04', '2024-02-12', 'P12', 'M', 'R0049'),
('GA0050', 'Planet Explorer', 'G06', '2024-04-29', 'P12', 'E', 'R0050');


INSERT INTO table_equipment(equipment_id, equipment_name, platform_id, equipment_price, quantity, review_id)
VALUES
('EQ0001', 'Xbox One Controller', 'P01', 49.99, 150, 'RE0001'),
('EQ0002', 'PS4 Wireless Controller', 'P02', 59.99, 120, 'RE0002'),
('EQ0003', 'Nintendo Switch Pro Controller', 'P03', 69.99, 100, 'RE0003'),
('EQ0004', 'Razer Gaming Mouse', 'P04', 79.99, 90, 'RE0004'),
('EQ0005', 'Corsair Gaming Keyboard', 'P05', 129.99, 85, 'RE0005'),
('EQ0006', 'Astro Gaming Headset', 'P06', 149.99, 80, 'RE0006'),
('EQ0007', 'Samsung Gaming Monitor', 'P07', 399.99, 70, 'RE0007'),
('EQ0008', 'Logitech G Pro Wireless Mouse', 'P08', 129.99, 60, 'RE0008'),
('EQ0009', 'SteelSeries Arctis 7 Headset', 'P09', 149.99, 75, 'RE0009'),
('EQ0010', 'HyperX Alloy FPS Keyboard', 'P10', 99.99, 50, 'RE0010'),
('EQ0011', 'BenQ Zowie Gaming Monitor', 'P01', 279.99, 45, 'RE0011'),
('EQ0012', 'NVidia RTX 3080 GPU', 'P02', 699.99, 40, 'RE0012'),
('EQ0013', 'AMD Radeon RX 6800 XT', 'P03', 649.99, 50, 'RE0013'),
('EQ0014', 'Intel Core i9-11900K', 'P04', 489.99, 55, 'RE0014'),
('EQ0015', 'AMD Ryzen 9 5900X', 'P05', 549.99, 60, 'RE0015'),
('EQ0016', 'Elgato Stream Deck', 'P06', 149.99, 65, 'RE0016'),
('EQ0017', 'Oculus Rift S VR Headset', 'P07', 399.00, 70, 'RE0017'),
('EQ0018', 'HTC Vive Cosmos', 'P08', 699.00, 30, 'RE0018'),
('EQ0019', 'Sony PlayStation VR', 'P09', 299.99, 50, 'RE0019'),
('EQ0020', 'Microsoft Xbox Series X', 'P10', 499.99, 75, 'RE0020'),
('EQ0021', 'Sony PS5 Console', 'P01', 499.99, 100, 'RE0021'),
('EQ0022', 'Nintendo Switch Console', 'P02', 299.99, 150, 'RE0022'),
('EQ0023', 'Google Stadia Controller', 'P03', 69.99, 80, 'RE0023'),
('EQ0024', 'Apple Arcade Subscription Card', 'P04', 49.99, 200, 'RE0024'),
('EQ0025', 'Xbox Game Pass Ultimate 3-Month Membership', 'P05', 44.99, 250, 'RE0025'),
('EQ0026', 'PSN Gift Card $50', 'P06', 50.00, 300, 'RE0026'),
('EQ0027', 'Xbox Live Gold 12-Month Membership', 'P07', 59.99, 220, 'RE0027'),
('EQ0028', 'PS5 DualSense Wireless Controller', 'P08', 69.99, 130, 'RE0028'),
('EQ0029', 'Xbox Series X/S Wireless Controller', 'P09', 54.99, 140, 'RE0029'),
('EQ0030', 'Nintendo Switch Joy-Con Pair', 'P10', 79.99, 110, 'RE0030'),
('EQ0031', 'Logitech G923 Racing Wheel', 'P01', 399.99, 25, 'RE0031'),
('EQ0032', 'Thrustmaster T.16000M FCS Flight Pack', 'P02', 249.99, 35, 'RE0032'),
('EQ0033', 'Razer Kishi Mobile Game Controller', 'P03', 99.99, 95, 'RE0033'),
('EQ0034', 'SteelSeries Nimbus+ iOS Controller', 'P04', 69.99, 80, 'RE0034'),
('EQ0035', 'Samsung 980 PRO PCIe NVMe SSD', 'P05', 229.99, 40, 'RE0035'),
('EQ0036', 'WD_BLACK SN850 NVMe SSD', 'P06', 149.99, 55, 'RE0036'),
('EQ0037', 'Corsair MP600 CORE PCIe NVMe SSD', 'P07', 124.99, 65, 'RE0037'),
('EQ0038', 'SanDisk Extreme Portable SSD', 'P08', 159.99, 70, 'RE0038'),
('EQ0039', 'Crucial P5 Plus NVMe SSD', 'P09', 179.99, 85, 'RE0039'),
('EQ0040', 'Seagate FireCuda 520 PCIe Gen4 SSD', 'P10', 199.99, 50, 'RE0040'),
('EQ0041', 'G.SKILL TridentZ RGB Series 32GB RAM', 'P01', 159.99, 45, 'RE0041'),
('EQ0042', 'Corsair Vengeance LPX 16GB RAM', 'P02', 89.99, 55, 'RE0042'),
('EQ0043', 'HyperX Fury 8GB RAM', 'P03', 47.99, 75, 'RE0043'),
('EQ0044', 'Crucial Ballistix 3200 MHz DDR4 DRAM', 'P04', 99.99, 65, 'RE0044'),
('EQ0045', 'Toshiba Canvio Basics 1TB Portable Hard Drive', 'P05', 49.99, 90, 'RE0045'),
('EQ0046', 'Western Digital WD Blue 1TB PC Hard Drive', 'P06', 44.99, 85, 'RE0046'),
('EQ0047', 'Seagate Portable 2TB External Hard Drive', 'P07', 62.99, 80, 'RE0047'),
('EQ0048', 'Samsung T5 Portable SSD 500GB', 'P08', 109.99, 70, 'RE0048'),
('EQ0049', 'Kingston A400 SSD 480GB', 'P09', 54.99, 60, 'RE0049'),
('EQ0050', 'Crucial MX500 1TB SSD', 'P10', 99.99, 75, 'RE0050');
