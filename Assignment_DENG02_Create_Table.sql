-- Create table_equipment table
CREATE TABLE table_equipment (
  equipment_id VARCHAR(15) PRIMARY KEY,
  equipment_name VARCHAR(255) NOT NULL,
  platform_id VARCHAR(15), 
  equipment_price DECIMAL(10,2) NOT NULL,
  quantity INTEGER NOT NULL,
  review_id VARCHAR(15),
  category_id VARCHAR(15)NOT NULL
);

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

-- Create game table
CREATE TABLE game (
  game_id VARCHAR(15) PRIMARY KEY,
  game_title VARCHAR(255) NOT NULL,
  genre_id VARCHAR(15), 
  release_date DATE,
  platform_id VARCHAR(15),
  rating_id VARCHAR(15),
  review_id VARCHAR(15)
);

-- Create customer table
CREATE TABLE customer (
  customer_id VARCHAR(15) PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  date_of_birth DATE,
  address VARCHAR(255),
  phone_number VARCHAR(255),
  customer_email VARCHAR(255),
  review_id VARCHAR(15)
);

-- Create orders table
CREATE TABLE orders (
  order_id VARCHAR(15)NOT NULL,
  customer_id VARCHAR(15), 
  order_date DATE NOT NULL,
  game_id VARCHAR(15),
  equipment_id VARCHAR(15) 
);

-- Create transaction table
CREATE TABLE store_transaction (
  transaction_id VARCHAR(15) PRIMARY KEY,
  type_of_payment VARCHAR(255) NOT NULL,
  date_of_transaction DATE NOT NULL,
  employee_id VARCHAR(15), 
  order_id VARCHAR(15) 
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

-- Create store table
CREATE TABLE store (
  store_id VARCHAR(15) PRIMARY KEY,
  store_location VARCHAR(255) NOT NULL,
  store_country VARCHAR(255) NOT NULL
);

-- Create review table
CREATE TABLE review (
  review_id VARCHAR(15) PRIMARY KEY,
  review_rating VARCHAR(255),
  review_comment VARCHAR (255)
);

-- Create equipment_category table
CREATE TABLE equipment_category (
	category_id VARCHAR(15) PRIMARY KEY,
	category_name VARCHAR(255) NOT NULL
);

-- Create rating system
CREATE TABLE rating (
	rating_id VARCHAR(15) PRIMARY KEY,
	rating_name VARCHAR(255) NOT NULL,
	rating_description VARCHAR(255) NOT NULL
);

-- Alter table
ALTER TABLE employee ADD CONSTRAINT fk_employee_store FOREIGN KEY (store_id) REFERENCES store(store_id);
ALTER TABLE orders ADD CONSTRAINT fk_orders_customer FOREIGN KEY (customer_id) REFERENCES customer(customer_id);
ALTER TABLE orders ADD CONSTRAINT fk_orders_game FOREIGN KEY (game_id) REFERENCES game(game_id);
ALTER TABLE orders ADD CONSTRAINT fk_orders_equipment FOREIGN KEY (equipment_id) REFERENCES table_equipment(equipment_id);
ALTER TABLE store_transaction ADD CONSTRAINT fk_transaction_employee FOREIGN KEY (employee_id) REFERENCES employee(employee_id);
ALTER TABLE game ADD CONSTRAINT fk_game_genre FOREIGN KEY (genre_id) REFERENCES genre(genre_id);
ALTER TABLE game ADD CONSTRAINT fk_game_platform FOREIGN KEY (platform_id) REFERENCES platform(platform_id);
ALTER TABLE game ADD CONSTRAINT fk_game_review FOREIGN KEY (review_id) REFERENCES review(review_id);
ALTER TABLE game ADD CONSTRAINT fk_game_rating FOREIGN KEY (rating_id) REFERENCES rating(rating_id);
ALTER TABLE table_equipment ADD CONSTRAINT fk_equipment_platform FOREIGN KEY (platform_id) REFERENCES platform(platform_id);
ALTER TABLE table_equipment ADD CONSTRAINT fk_equipment_review FOREIGN KEY (review_id) REFERENCES review(review_id);
ALTER TABLE table_equipment ADD CONSTRAINT fk_equipment_category FOREIGN KEY (category_id) REFERENCES equipment_category(category_id);
ALTER TABLE customer ADD CONSTRAINT fk_customer_review FOREIGN KEY (review_id) REFERENCES review(review_id);

-- Dropping Table
DROP TABLE table_equipment;
DROP TABLE game;
DROP TABLE store_transaction;
DROP TABLE orders;
DROP TABLE customer;
DROP TABLE review;
DROP TABLE genre;
DROP TABLE platform;
DROP TABLE employee;
DROP TABLE store;
DROP TABLE rating;
DROP TABLE equipment_category;

---------- INSERTING DATA ---------- 
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
	('GE00043', 'Beat Em Up'),
	('GE00044', 'Battle Royale'),
	('GE00045', 'Metroidvania'),
	('GE00046', 'Visual Novels'),
	('GE00047', 'Logical'),
	('GE00048', 'Physics'),
	('GE00049', 'Exploration'),
	('GE00050', 'Construction and Management Simulation');


INSERT INTO platform (platform_id, platform_name, manufacturer, release_date)
VALUES
    ('P00001', 'PlayStation 4', 'Sony', '2013-11-15'),
    ('P00002', 'Xbox One', 'Microsoft', '2013-11-22'),
    ('P00003', 'Nintendo Switch', 'Nintendo', '2017-03-03'),
    ('P00004', 'PC (Windows)', 'Microsoft', '1985-11-20'),
    ('P00005', 'PlayStation 5', 'Sony', '2020-11-12'),
    ('P00006', 'Xbox Series X', 'Microsoft', '2020-11-10'),
    ('P00007', 'Google Stadia', 'Google', '2019-11-19'),
    ('P00008', 'Mobile (iOS)', 'Apple', '2007-06-29'), 
    ('P00009', 'Mobile (Android)', 'Google', '2008-09-23'), 
    ('P00010', 'PC (Mac)', 'Apple', '1984-01-24'),
    ('P00011', 'Virtual Reality (VR) Platforms', 'Various', '2016-03-28'),
    ('P00012', 'PC (Linux)', 'Community', '1991-08-25'); 


INSERT INTO review (review_id, review_rating, review_comment)
VALUES
  ('R00001', 5, 'Excellent product! Highly recommend.'),
  ('R00002', 4, 'Great quality, but a bit pricey.'),
  ('R00003', 3, 'Average experience, nothing special.'),
  ('R00004', 2, 'Below expectations in terms of performance.'),
  ('R00005', 1, 'Not satisfied at all, product failed within a month.'),
  ('R00006', 5, 'Outstanding service and product quality!'),
  ('R00007', 4, 'Good, but the customer service could be better.'),
  ('R00008', 3, 'Mediocre, was expecting more based on the reviews.'),
  ('R00009', 2, 'Had some issues with the delivery.'),
  ('R00010', 1, 'The product arrived damaged and late.'),
  ('R00011', 5, 'Absolutely perfect, will buy again!'),
  ('R00012', 4, 'Really good, but I had expected it to be bigger.'),
  ('R00013', 3, 'Decent value for the money.'),
  ('R00014', 2, 'Could use some improvements.'),
  ('R00015', 1, 'The worst experience I’ve ever had.'),
  ('R00016', 4, 'Very good, though it took a while to get used to.'),
  ('R00017', 5, 'Perfect! Works exactly as described.'),
  ('R00018', 3, 'It’s okay, not bad but not great either.'),
  ('R00019', 2, 'Not as described, very disappointed.'),
  ('R00020', 4, 'Good product overall, but the setup was complicated.');


INSERT INTO rating (rating_id, rating_name, rating_description)
VALUES
    ('RI00001', 'Everyone', 'Content is generally suitable for all ages. May contain minimal cartoon, fantasy or mild violence and/or infrequent use of mild language.'),
    ('RI00002', 'Teen', 'Content is generally suitable for ages 13 and up. May contain violence, suggestive themes, crude humor, minimal blood, simulated gambling, and/or infrequent use of strong language.'),
    ('RI00003', 'Mature', 'Content is generally suitable for ages 17 and up. May contain intense violence, blood and gore, sexual content and/or strong language.'),
    ('RI00004', 'Everyone 10 and older', 'Content is generally suitable for ages 10 and up. May contain more cartoon, fantasy or mild violence, mild language, and/or minimal suggestive themes.');

	 
INSERT INTO equipment_category (category_id, category_name)
VALUES
    ('C00001', 'Gaming Controllers and Accessories'),
    ('C00002', 'Gaming Mice and Keyboards'),
    ('C00003', 'Headsets and Audio Equipment'),
    ('C00004', 'Monitors and Displays'),
    ('C00005', 'Gaming Consoles'),
    ('C00006', 'PC Components'),
    ('C00007', 'Gaming Subscriptions and Gift Cards'),
    ('C00008', 'Specialty Gaming Equipment');
	 

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


-- Insert 50 rows into the customer table with IDs starting from C0001
INSERT INTO customer (customer_id, first_name, last_name, date_of_birth, address, phone_number, customer_email, review_id)
VALUES
  ('C00001', 'Alice', 'Williams', '1995-03-12', '123 Main St, City, Country', '+1234567890', 'alice@example.com', 'R00001'),
  ('C00002', 'Bob', 'Brown', '1980-08-25', '456 Elm St, City, Country', '+1987654321', 'bob@example.com', 'R00002'),
  ('C00003', 'Eva', 'Martinez', '1976-11-03', '789 Oak St, City, Country', '+9876543210', 'eva@example.com', 'R00003'),
  ('C00004', 'David', 'Jones', '1990-05-20', '234 Maple St, City, Country', '+1122334455', 'david@example.com', 'R00004'),
  ('C00005', 'Emma', 'Taylor', '1985-09-10', '567 Pine St, City, Country', '+9988776655', 'emma@example.com', 'R00005'),
  ('C00006', 'James', 'Anderson', '1978-04-15', '890 Cedar St, City, Country', '+5566778899', 'james@example.com', 'R00006'),
  ('C00007', 'Olivia', 'Davis', '1992-07-18', '345 Oak St, City, Country', '+4433221122', 'olivia@example.com', 'R00007'),
  ('C00008', 'Michael', 'Wilson', '1987-12-30', '678 Elm St, City, Country', '+7788990011', 'michael@example.com', 'R00008'),
  ('C00009', 'Sophia', 'Moore', '1983-03-25', '901 Birch St, City, Country', '+6677889900', 'sophia@example.com', 'R00009'),
  ('C00010', 'William', 'Clark', '1995-08-02', '123 Pineapple St, City, Country', '+2233445566', 'william@example.com', 'R00010'),
  ('C00011', 'Emily', 'Thomas', '1998-01-05', '456 Orange St, City, Country', '+8899001122', 'emily@example.com', 'R00011'),
  ('C00012', 'Jacob', 'Jackson', '1976-09-20', '789 Strawberry St, City, Country', '+0011223344', 'jacob@example.com', 'R00012'),
  ('C00013', 'Isabella', 'Harris', '1989-06-14', '234 Mango St, City, Country', '+5566778899', 'isabella@example.com', 'R00013'),
  ('C00014', 'Alexander', 'Allen', '1993-12-28', '567 Banana St, City, Country', '+9988776655', 'alexander@example.com', 'R00014'),
  ('C00015', 'Abigail', 'Lee', '1975-10-03', '890 Lemon St, City, Country', '+1122334455', 'abigail@example.com', 'R00015'),
  ('C00016', 'Matthew', 'Young', '1981-04-08', '123 Peach St, City, Country', '+4433221122', 'matthew@example.com', 'R00016'),
  ('C00017', 'Ava', 'Scott', '1990-07-13', '456 Cherry St, City, Country', '+7788990011', 'ava@example.com', 'R00017'),
  ('C00018', 'Ethan', 'King', '1986-11-17', '789 Grape St, City, Country', '+6677889900', 'ethan@example.com', 'R00018'),
  ('C00019', 'Mia', 'Wright', '1997-02-28', '901 Pear St, City, Country', '+2233445566', 'mia@example.com', 'R00019'),
  ('C00020', 'Charlotte', 'Lopez', '1982-05-10', '123 Kiwi St, City, Country', '+8899001122', 'charlotte@example.com', 'R00020'),
  ('C00021', 'Liam', 'Gonzalez', '1991-08-22', '456 Coconut St, City, Country', '+0011223344', 'liam@example.com', NULL),
  ('C00022', 'Harper', 'Lewis', '1979-03-07', '789 Avocado St, City, Country', '+5566778899', 'harper@example.com', NULL),
  ('C00023', 'Ella', 'Martin', '1994-12-01', '234 Guava St, City, Country', '+9988776655', 'ella@example.com', NULL),
  ('C00024', 'Jackson', 'Lee', '1988-06-25', '567 Papaya St, City, Country', '+1122334455', 'jackson@example.com', NULL),
  ('C00025', 'Avery', 'Hill', '1992-11-09', '890 Mango St, City, Country', '+4433221122', 'avery@example.com', NULL),
  ('C00026', 'Scarlett', 'Cook', '1977-04-15', '123 Banana St, City, Country', '+7788990011', 'scarlett@example.com', NULL),
  ('C00027', 'Lucas', 'Murphy', '1984-09-28', '456 Orange St, City, Country', '+6677889900', 'lucas@example.com', NULL),
  ('C00028', 'Evelyn', 'Nelson', '1996-02-03', '789 Lemon St, City, Country', '+2233445566', 'evelyn@example.com', NULL),
  ('C00029', 'Madison', 'Baker', '1980-07-16', '901 Peach St, City, Country', '+8899001122', 'madison@example.com', NULL),
  ('C00030', 'Jackson', 'Cooper', '1993-10-30', '234 Cherry St, City, Country', '+0011223344', 'jackson@example.com', NULL),
  ('C00031', 'Aria', 'Hill', '1978-05-24', '567 Mango St, City, Country', '+5566778899', 'aria@example.com', NULL),
  ('C00032', 'Sebastian', 'Green', '1985-01-18', '890 Kiwi St, City, Country', '+9988776655', 'sebastian@example.com', NULL),
  ('C00033', 'Lily', 'Carter', '1990-03-02', '123 Coconut St, City, Country', '+1122334455', 'lily@example.com', NULL),
  ('C00034', 'Gabriel', 'Adams', '1995-08-17', '456 Avocado St, City, Country', '+4433221122', 'gabriel@example.com', NULL),
  ('C00035', 'Chloe', 'Gray', '1983-11-21', '789 Papaya St, City, Country', '+7788990011', 'chloe@example.com', NULL),
  ('C00036', 'Zoey', 'Barnes', '1998-04-04', '901 Guava St, City, Country', '+6677889900', 'zoey@example.com', NULL),
  ('C00037', 'Carter', 'Foster', '1976-09-08', '234 Pear St, City, Country', '+2233445566', 'carter@example.com', NULL),
  ('C00038', 'Grace', 'Perry', '1988-01-12', '567 Kiwi St, City, Country', '+8899001122', 'grace@example.com', NULL),
  ('C00039', 'Riley', 'Bennett', '1992-04-26', '890 Coconut St, City, Country', '+0011223344', 'riley@example.com', NULL),
  ('C00040', 'Eleanor', 'Howard', '1980-07-01', '123 Avocado St, City, Country', '+5566778899', 'eleanor@example.com', NULL),
  ('C00041', 'Lincoln', 'Reed', '1996-10-15', '456 Papaya St, City, Country', '+9988776655', 'lincoln@example.com', NULL),
  ('C00042', 'Natalie', 'Sanders', '1984-02-19', '789 Mango St, City, Country', '+1122334455', 'natalie@example.com', NULL),
  ('C00043', 'Nolan', 'Flores', '1979-05-23', '901 Orange St, City, Country', '+4433221122', 'nolan@example.com', NULL),
  ('C00044', 'Hannah', 'Ross', '1994-11-07', '234 Lemon St, City, Country', '+7788990011', 'hannah@example.com', NULL),
  ('C00045', 'Landon', 'Butler', '1987-03-11', '567 Peach St, City, Country', '+6677889900', 'landon@example.com', NULL),
  ('C00046', 'Layla', 'Simmons', '1990-06-25', '890 Cherry St, City, Country', '+2233445566', 'layla@example.com', NULL),
  ('C00047', 'Isaac', 'Woods', '1997-09-12', '123 Mango St, City, Country', '+8899001122', 'isaac@example.com', NULL),
  ('C00048', 'Nova', 'Coleman', '1977-12-04', '456 Banana St, City, Country', '+0011223344', 'nova@example.com', NULL),
  ('C00049', 'Leah', 'Griffin', '1982-08-18', '789 Orange St, City, Country', '+5566778899', 'leah@example.com', NULL),
  ('C00050', 'Eli', 'Ward', '1995-01-21', '901 Kiwi St, City, Country', '+9988776655', 'eli@example.com', NULL);


-- Insert 50 rows into the employee table with IDs starting from E0001
INSERT INTO employee (employee_id, first_name, last_name, date_of_employment, date_of_birth, store_id)
VALUES
  ('E00001', 'John', 'Doe', '2023-01-15', '1990-05-10', 'S00001'),
  ('E00002', 'Jane', 'Smith', '2022-12-05', '1985-09-20', 'S00002'),
  ('E00003', 'Michael', 'Johnson', '2024-02-20', '1988-07-15', 'S00003'),
  ('E00004', 'Emily', 'Brown', '2023-05-20', '1992-08-12', 'S00004'),
  ('E00005', 'David', 'Clark', '2023-11-10', '1987-04-25', 'S00005'),
  ('E00006', 'Jessica', 'Wilson', '2024-03-08', '1995-10-30', 'S00006'),
  ('E00007', 'Matthew', 'Taylor', '2022-09-17', '1983-12-05', 'S00007'),
  ('E00008', 'Sarah', 'Anderson', '2023-07-22', '1991-03-18', 'S00008'),
  ('E00009', 'Daniel', 'White', '2024-01-30', '1989-06-15', 'S00009'),
  ('E00010', 'Emma', 'Martinez', '2023-04-12', '1993-09-08', 'S00010'),
  ('E00011', 'Christopher', 'Hernandez', '2024-06-05', '1984-11-20', 'S00011'),
  ('E00012', 'Olivia', 'Garcia', '2022-08-28', '1996-02-14', 'S00012'),
  ('E00013', 'Andrew', 'Lopez', '2023-02-14', '1994-07-03', 'S00013'),
  ('E00014', 'Ava', 'Perez', '2024-04-18', '1997-01-28', 'S00014'),
  ('E00015', 'William', 'Gonzalez', '2023-10-03', '1986-05-22', 'S00015'),
  ('E00016', 'Mia', 'Rivera', '2024-08-07', '1998-08-07', 'S00016'),
  ('E00017', 'James', 'Rodriguez', '2022-12-30', '1982-03-15', 'S00017'),
  ('E00018', 'Sophia', 'Torres', '2023-06-25', '1990-10-10', 'S00018'),
  ('E00019', 'Logan', 'Sanchez', '2024-02-09', '1985-06-29', 'S00019'),
  ('E00020', 'Isabella', 'Ramirez', '2023-07-01', '1991-12-17', 'S00020'),
  ('E00021', 'Benjamin', 'Flores', '2024-05-14', '1983-04-02', 'S00021'),
  ('E00022', 'Jacob', 'Ortiz', '2022-11-18', '1995-09-23', 'S00022'),
  ('E00023', 'Amelia', 'Diaz', '2023-03-22', '1996-07-11', 'S00023'),
  ('E00024', 'Ethan', 'Nguyen', '2024-09-26', '1984-02-08', 'S00024'),
  ('E00025', 'Chloe', 'Kim', '2022-07-09', '1990-11-03', 'S00025'),
  ('E00026', 'Liam', 'Patel', '2023-01-02', '1987-08-19', 'S00026'),
  ('E00027', 'Ella', 'Chen', '2024-06-10', '1994-01-06', 'S00027'),
  ('E00028', 'Noah', 'Ng', '2023-10-15', '1988-06-25', 'S00028'),
  ('E00029', 'Grace', 'Wang', '2024-02-28', '1982-09-14', 'S00029'),
  ('E00030', 'Mason', 'Wong', '2022-12-22', '1991-04-01', 'S00030'),
  ('E00031', 'Harper', 'Singh', '2023-08-05', '1985-10-27', 'S00031'),
  ('E00032', 'Evelyn', 'Li', '2024-04-03', '1993-02-24', 'S00032'),
  ('E00033', 'Alexander', 'Lin', '2022-11-01', '1989-07-20', 'S00033'),
  ('E00034', 'Avery', 'Zhang', '2023-05-08', '1986-12-12', 'S00034'),
  ('E00035', 'Scarlett', 'Choi', '2024-01-19', '1995-05-15', 'S00035'),
  ('E00036', 'Daniel', 'Kumar', '2022-09-03', '1983-08-08', 'S00036'),
  ('E00037', 'Madison', 'Lee', '2023-03-16', '1996-03-04', 'S00037'),
  ('E00038', 'Jackson', 'Wu', '2024-07-28', '1990-09-22', 'S00038'),
  ('E00039', 'Luna', 'Gupta', '2022-08-14', '1987-01-31', 'S00039'),
  ('E00040', 'Liam', 'Huang', '2023-02-05', '1992-06-26', 'S00040'),
  ('E00041', 'Aria', 'Chung', '2024-06-20', '1984-12-18', 'S00041'),
  ('E00042', 'Lucas', 'Chen', '2022-12-13', '1993-10-11', 'S00042'),
  ('E00043', 'Zoe', 'Kim', '2023-04-17', '1997-03-09', 'S00043'),
  ('E00044', 'Aiden', 'Park', '2024-08-24', '1988-05-05', 'S00044'),
  ('E00045', 'Penelope', 'Wang', '2022-10-27', '1994-09-28', 'S00045'),
  ('E00046', 'Luke', 'Tran', '2023-06-01', '1986-04-16', 'S00046'),
  ('E00047', 'Nora', 'Chen', '2024-01-12', '1990-11-19', 'S00047'),
  ('E00048', 'Carter', 'Li', '2022-07-07', '1995-08-22', 'S00048'),
  ('E00049', 'Eleanor', 'Gupta', '2023-11-09', '1983-02-28', 'S00049'),
  ('E00050', 'Henry', 'Jiang', '2024-03-30', '1991-07-07', 'S00050');

INSERT INTO game(game_id, game_title, game_price, genre_id, release_date, platform_id, rating_id, review_id)
VALUES
('GA00001', 'Space Adventure', 49.99, 'GE00001', '1980-07-15', 'P00001', 'RI00001', 'R00001'),
('GA00002', 'Fantasy Quest', 39.99, 'GE00002', '1985-11-20', 'P00001', 'RI00002', 'R00002'),
('GA00003', 'Mystery Island', 29.99, 'GE00003', '1990-05-22', 'P00002', 'RI00003', 'R00003'),
('GA00004', 'Castle Siege', 19.99, 'GE00001', '1992-12-09', 'P00002', 'RI00004', 'R00004'),
('GA00005', 'Cybernetic Wars', 59.99, 'GE00004', '1999-08-15', 'P00003', 'RI00002', 'R00005'),
('GA00006', 'Galactic Battles', 49.99, 'GE00005', '2001-02-26', 'P00003', 'RI00003', 'R00006'),
('GA00007', 'Ocean Explorer', 34.99, 'GE00006', '2003-09-17', 'P00004', 'RI00001', 'R00007'),
('GA00008', 'Desert Rally', 44.99, 'GE00002', '2004-06-30', 'P00004', 'RI00004', 'R00008'),
('GA00009', 'Sky High Adventure', 19.99, 'GE00001', '2005-12-12', 'P00005', 'RI00002', 'R00009'),
('GA00010', 'Dinosaur Park', 29.99, 'GE00003', '2007-07-21', 'P00005', 'RI00001', 'R00010'),
('GA00011', 'Ninja Warrior', 39.99, 'GE00002', '2009-03-03', 'P00006', 'RI00002', 'R00011'),
('GA00012', 'Pirate Treasures', 49.99, 'GE00001', '2010-10-14', 'P00006', 'RI00004', 'R00012'),
('GA00013', 'Robot Factory', 24.99, 'GE00004', '2011-04-23', 'P00007', 'RI00001', 'R00013'),
('GA00014', 'Monster Zoo', 34.99, 'GE00003', '2013-11-19', 'P00007', 'RI00001', 'R00014'),
('GA00015', 'Time Travelers', 54.99, 'GE00005', '2015-02-27', 'P00008', 'RI00002', 'R00015'),
('GA00016', 'Arctic Expedition', 39.99, 'GE00006', '2016-08-06', 'P00008', 'RI00004', 'R00016'),
('GA00017', 'Haunted Mansion', 29.99, 'GE00002', '2017-09-29', 'P00009', 'RI00003', 'R00017'),
('GA00018', 'Jungle Journey', 19.99, 'GE00001', '2018-03-15', 'P00009', 'RI00001', 'R00018'),
('GA00019', 'Space Odyssey', 49.99, 'GE00005', '2019-07-22', 'P00010', 'RI00002', 'R00019'),
('GA00020', 'Lost in Time', 39.99, 'GE00003', '2020-12-05', 'P00010', 'RI00004', 'R00020'),
('GA00021', 'Ice World', 24.99, 'GE00006', '2021-05-14', 'P00011', 'RI00001', 'R00001'),
('GA00022', 'Cyberpunk City', 34.99, 'GE00004', '2022-01-20', 'P00011', 'RI00003', 'R00002'),
('GA00023', 'Formula Rush', 54.99, 'GE00002', '2023-04-18', 'P00012', 'RI00001', 'R00003'),
('GA00024', 'Lunar Landing', 39.99, 'GE00005', '2024-03-03', 'P00012', 'RI00002', 'R00004'),
('GA00025', 'Medieval Lords', 29.99, 'GE00001', '1984-08-16', 'P00001', 'RI00004', 'R00005'),
('GA00026', 'Virtual Detective', 49.99, 'GE00003', '1986-11-22', 'P00001', 'RI00002', 'R00006'),
('GA00027', 'Alien Invasion', 59.99, 'GE00004', '1987-07-17', 'P00002', 'RI00003', 'R00007'),
('GA00028', 'Racing Legends', 34.99, 'GE00002', '1988-02-09', 'P00002', 'RI00001', 'R00008'),
('GA00029', 'Wizard Academy', 24.99, 'GE00001', '1989-12-15', 'P00003', 'RI00001', 'R00009'),
('GA00030', 'Treasure Island', 19.99, 'GE00003', '1991-05-24', 'P00003', 'RI00004', 'R00010'),
('GA00031', 'Samurai Honor', 39.99, 'GE00002', '1993-08-30', 'P00004', 'RI00002', 'R00011'),
('GA00032', 'Future Wars', 49.99, 'GE00005', '1994-04-12', 'P00004', 'RI00003', 'R00012'),
('GA00033', 'Deep Sea Quest', 29.99, 'GE00006', '1996-11-28', 'P00005', 'RI00001', 'R00013'),
('GA00034', 'Sky Fighters', 34.99, 'GE00001', '1998-03-05', 'P00005', 'RI00002', 'R00014'),
('GA00035', 'Antarctic Adventure', 19.99, 'GE00006', '2000-07-19', 'P00006', 'RI00001', 'R00015'),
('GA00036', 'Canyon Challenge', 54.99, 'GE00002', '2002-01-22', 'P00006', 'RI00004', 'R00016'),
('GA00037', 'Dragon Realm', 44.99, 'GE00003', '2004-06-11', 'P00007', 'RI00002', 'R00017'),
('GA00038', 'Fantasy Skies', 39.99, 'GE00001', '2006-10-17', 'P00007', 'RI00003', 'R00018'),
('GA00039', 'Mystic Forest', 24.99, 'GE00003', '2008-03-24', 'P00008', 'RI00001', 'R00019'),
('GA00040', 'Cyber Hacker', 19.99, 'GE00004', '2009-12-09', 'P00008', 'RI00004', 'R00020'),
('GA00041', 'Global Racing', 49.99, 'GE00002', '2011-06-13', 'P00009', 'RI00002', 'R00001'),
('GA00042', 'Orbital Station', 39.99, 'GE00005', '2012-09-22', 'P00009', 'RI00003', 'R00002'),
('GA00043', 'Ancient Ruins', 29.99, 'GE00001', '2014-02-18', 'P00010', 'RI00001', 'R00003'),
('GA00044', 'Thunderstorm Racers', 54.99, 'GE00002', '2016-04-30', 'P000010', 'RI0004', 'R00004'),
('GA00045', 'Neptune Exploration', 19.99, 'GE00006', '2018-11-29', 'P000011', 'RI0002', 'R00005'),
('GA00046', 'Zombie City', 24.99, 'GE00004', '2020-10-05', 'P00011', 'RI00003', 'R00006'),
('GA00047', 'Royal Knights', 34.99, 'GE00001', '2022-01-16', 'P00012', 'RI00001', 'R00007'),
('GA00048', 'Storm Pilots', 39.99, 'GE00005', '2023-08-23', 'P00012', 'RI00002', 'R00008'),
('GA00049', 'Quantum Break', 49.99, 'GE00004', '2024-02-12', 'P00012', 'RI00003', 'R00009'),
('GA00050', 'Planet Explorer', 59.99, 'GE00006', '2024-04-29', 'P00012', 'RI00001', 'R00010');


INSERT INTO table_equipment(equipment_id, equipment_name, platform_id, equipment_price, quantity, review_id, category_id)
VALUES
('EQ00001', 'Xbox One Controller', 'P00001', 49.99, 150, 'R00001', 'C00001'),
('EQ00002', 'PS4 Wireless Controller', 'P00002', 59.99, 120, 'R00002', 'C00001'),
('EQ00003', 'Nintendo Switch Pro Controller', 'P00003', 69.99, 100, 'R00003', 'C00001'),
('EQ00004', 'Razer Gaming Mouse', 'P00004', 79.99, 90, 'R00004', 'C00002'),
('EQ00005', 'Corsair Gaming Keyboard', 'P00005', 129.99, 85, 'R00005', 'C00002'),
('EQ00006', 'Astro Gaming Headset', 'P00006', 149.99, 80, 'R00006', 'C00003'),
('EQ00007', 'Samsung Gaming Monitor', 'P00007', 399.99, 70, 'R00007', 'C00004'),
('EQ00008', 'Logitech G Pro Wireless Mouse', 'P00008', 129.99, 60, 'R00008', 'C00002'),
('EQ00009', 'SteelSeries Arctis 7 Headset', 'P00009', 149.99, 75, 'R00009', 'C00003'),
('EQ00010', 'HyperX Alloy FPS Keyboard', 'P00010', 99.99, 50, 'R00010', 'C00002'),
('EQ00011', 'BenQ Zowie Gaming Monitor', 'P00001', 279.99, 45, 'R00011', 'C00004'),
('EQ00012', 'NVidia RTX 3080 GPU', 'P00002', 699.99, 40, 'R00012', 'C00006'),
('EQ00013', 'AMD Radeon RX 6800 XT', 'P00003', 649.99, 50, 'R00013', 'C00006'),
('EQ00014', 'Intel Core i9-11900K', 'P00004', 489.99, 55, 'R00014', 'C00006'),
('EQ00015', 'AMD Ryzen 9 5900X', 'P00005', 549.99, 60, 'R00015', 'C00006'),
('EQ00016', 'Elgato Stream Deck', 'P00006', 149.99, 65, 'R00016', 'C00008'),
('EQ00017', 'Oculus Rift S VR Headset', 'P00007', 399.00, 70, 'R00017', 'C00005'),
('EQ00018', 'HTC Vive Cosmos', 'P00008', 699.00, 30, 'R00018', 'C00005'),
('EQ00019', 'Sony PlayStation VR', 'P00009', 299.99, 50, 'R00019', 'C00005'),
('EQ00020', 'Microsoft Xbox Series X', 'P00010', 499.99, 75, 'R00020', 'C00005'),
('EQ00021', 'Sony PS5 Console', 'P00001', 499.99, 100, 'R00001', 'C00005'),
('EQ00022', 'Nintendo Switch Console', 'P00002', 299.99, 150, 'R00002', 'C00005'),
('EQ00023', 'Google Stadia Controller', 'P00003', 69.99, 80, 'R00003', 'C00001'),
('EQ00024', 'Apple Arcade Subscription Card', 'P00004', 49.99, 200, 'R00004', 'C00007'),
('EQ00025', 'Xbox Game Pass Ultimate 3-Month Membership', 'P00005', 44.99, 250, 'R00005', 'C00007'),
('EQ00026', 'PSN Gift Card $50', 'P00006', 50.00, 300, 'R00006', 'C00007'),
('EQ00027', 'Xbox Live Gold 12-Month Membership', 'P00007', 59.99, 220, 'R00007', 'C00007'),
('EQ00028', 'PS5 DualSense Wireless Controller', 'P00008', 69.99, 130, 'R00008', 'C00001'),
('EQ00029', 'Xbox Series X/S Wireless Controller', 'P00009', 54.99, 140, 'R00009', 'C00001'),
('EQ00030', 'Nintendo Switch Joy-Con Pair', 'P00010', 79.99, 110, 'R00010', 'C00001'),
('EQ00031', 'Logitech G923 Racing Wheel', 'P00001', 399.99, 25, 'R00011', 'C00008'),
('EQ00032', 'Thrustmaster T.16000M FCS Flight Pack', 'P00002', 249.99, 35, 'R00012', 'C00008'),
('EQ00033', 'Razer Kishi Mobile Game Controller', 'P00003', 99.99, 95, 'R00013', 'C00001'),
('EQ00034', 'SteelSeries Nimbus+ iOS Controller', 'P00004', 69.99, 80, 'R00014', 'C00001'),
('EQ00035', 'Samsung 980 PRO PCIe NVMe SSD', 'P00005', 229.99, 40, 'R00015', 'C00006'),
('EQ00036', 'WD_BLACK SN850 NVMe SSD', 'P00006', 149.99, 55, 'R00016', 'C00006'),
('EQ00037', 'Corsair MP600 CORE PCIe NVMe SSD', 'P00007', 124.99, 65, 'R00017', 'C00006'),
('EQ00038', 'SanDisk Extreme Portable SSD', 'P00008', 159.99, 70, 'R00018', 'C00006'),
('EQ00039', 'Crucial P5 Plus NVMe SSD', 'P00009', 179.99, 85, 'R00019', 'C00006'),
('EQ00040', 'Seagate FireCuda 520 PCIe Gen4 SSD', 'P00010', 199.99, 50, 'R00020', 'C00006'),
('EQ00041', 'G.SKILL TridentZ RGB Series 32GB RAM', 'P00001', 159.99, 45, 'R00001', 'C00006'),
('EQ00042', 'Corsair Vengeance LPX 16GB RAM', 'P00002', 89.99, 55, 'R00002', 'C00006'),
('EQ00043', 'HyperX Fury 8GB RAM', 'P00003', 47.99, 75, 'R00003', 'C00006'),
('EQ00044', 'Crucial Ballistix 3200 MHz DDR4 DRAM', 'P00004', 99.99, 65, 'R00004', 'C00006'),
('EQ00045', 'Toshiba Canvio Basics 1TB Portable Hard Drive', 'P00005', 49.99, 90, 'R00005', 'C00006'),
('EQ00046', 'Western Digital WD Blue 1TB PC Hard Drive', 'P00006', 44.99, 85, 'R00006', 'C00006'),
('EQ00047', 'Seagate Portable 2TB External Hard Drive', 'P00007', 62.99, 80, 'R00007', 'C00006'),
('EQ00048', 'Samsung T5 Portable SSD 500GB', 'P00008', 109.99, 70, 'R00008', 'C00006'),
('EQ00049', 'Kingston A400 SSD 480GB', 'P00009', 54.99, 60, 'R00009', 'C00006'),
('EQ00050', 'Crucial MX500 1TB SSD', 'P00010', 99.99, 75, 'R00010', 'C00006');

INSERT INTO orders (order_id, customer_id, order_date, game_id, equipment_id)
VALUES
  ('OR00001', 'C00001', '2024-03-12', 'GA00001', 'EQ00001'),
  ('OR00002', 'C00002', '2024-02-25', 'GA00002', 'EQ00002'),
  ('OR00003', 'C00003', '2024-01-19', 'GA00003', 'EQ00003'),
  ('OR00004', 'C00004', '2024-04-05', 'GA00004', 'EQ00004'),
  ('OR00005', 'C00005', '2024-03-10', 'GA00005', 'EQ00005'),
  ('OR00006', 'C00006', '2024-02-15', 'GA00006', 'EQ00006'),
  ('OR00007', 'C00007', '2024-05-01', 'GA00007', 'EQ00007'),
  ('OR00008', 'C00008', '2024-04-18', 'GA00008', 'EQ00008'),
  ('OR00009', 'C00009', '2024-01-28', 'GA00009', 'EQ00009'),
  ('OR00010', 'C00010', '2024-02-10', 'GA00010', 'EQ00010'),
  ('OR00011', 'C00011', '2024-04-03', 'GA00011', 'EQ00011'),
  ('OR00012', 'C00012', '2024-03-21', 'GA00012', 'EQ00012'),
  ('OR00013', 'C00013', '2024-01-14', 'GA00013', 'EQ00013'),
  ('OR00014', 'C00014', '2024-02-08', 'GA00014', 'EQ00014'),
  ('OR00015', 'C00015', '2024-05-07', 'GA00015', 'EQ00015'),
  ('OR00016', 'C00016', '2024-04-11', 'GA00016', 'EQ00016'),
  ('OR00017', 'C00017', '2024-01-23', 'GA00017', 'EQ00017'),
  ('OR00018', 'C00018', '2024-02-29', 'GA00018', 'EQ00018'),
  ('OR00019', 'C00019', '2024-03-05', 'GA00019', 'EQ00019'),
  ('OR00020', 'C00020', '2024-04-26', 'GA00020', 'EQ00020'),
  ('OR00021', 'C00021', '2024-05-09', 'GA00021', 'EQ00021'),
  ('OR00022', 'C00022', '2024-02-02', 'GA00022', 'EQ00022'),
  ('OR00023', 'C00023', '2024-03-27', 'GA00023', 'EQ00023'),
  ('OR00024', 'C00024', '2024-04-14', 'GA00024', 'EQ00024'),
  ('OR00025', 'C00025', '2024-01-31', 'GA00025', 'EQ00025'),
  ('OR00026', 'C00026', '2024-05-04', 'GA00026', 'EQ00026'),
  ('OR00027', 'C00027', '2024-02-18', 'GA00027', 'EQ00027'),
  ('OR00028', 'C00028', '2024-03-12', 'GA00028', 'EQ00028'),
  ('OR00029', 'C00029', '2024-04-05', 'GA00029', 'EQ00029'),
  ('OR00030', 'C00030', '2024-01-08', 'GA00030', 'EQ00030'),
  ('OR00031', 'C00031', '2024-05-01', 'GA00031', 'EQ00031'),
  ('OR00032', 'C00032', '2024-02-23', 'GA00032', 'EQ00032'),
  ('OR00033', 'C00033', '2024-04-18', 'GA00033', 'EQ00033'),
  ('OR00034', 'C00034', '2024-01-15', 'GA00034', 'EQ00034'),
  ('OR00035', 'C00035', '2024-03-09', 'GA00035', 'EQ00035'),
  ('OR00036', 'C00036', '2024-04-02', 'GA00036', 'EQ00036'),
  ('OR00037', 'C00037', '2024-01-25', 'GA00037', 'EQ00037'),
  ('OR00038', 'C00038', '2024-02-19', 'GA00038', 'EQ00038'),
  ('OR00039', 'C00039', '2024-03-14', 'GA00039', 'EQ00039'),
  ('OR00040', 'C00040', '2024-05-07', 'GA00040', 'EQ00040'),
  ('OR00041', 'C00041', '2024-02-10', 'GA00041', 'EQ00041'),
  ('OR00042', 'C00042', '2024-03-03', 'GA00042', 'EQ00042'),
  ('OR00043', 'C00043', '2024-04-27', 'GA00043', 'EQ00043'),
  ('OR00044', 'C00044', '2024-01-21', 'GA00044', 'EQ00044'),
  ('OR00045', 'C00045', '2024-05-14', 'GA00045', 'EQ00045'),
  ('OR00046', 'C00046', '2024-02-12', 'GA00046', 'EQ00046'),
  ('OR00047', 'C00047', '2024-03-06', 'GA00047', 'EQ00047'),
  ('OR00048', 'C00048', '2024-04-30', 'GA00048', 'EQ00048'),
  ('OR00049', 'C00049', '2024-01-17', 'GA00049', 'EQ00049'),
  ('OR00050', 'C00050', '2024-02-20', 'GA00050', 'EQ00050'),
  ('OR00001', 'C00001', '2024-03-12', 'GA00001', NULL),
  ('OR00002', 'C00002', '2024-02-25', 'GA00002', 'EQ00002'),
  ('OR00003', 'C00003', '2024-01-19', NULL, 'EQ00003'),
  ('OR00004', 'C00004', '2024-04-05', 'GA00004', NULL),
  ('OR00005', 'C00005', '2024-03-10', 'GA00005', 'EQ00005'),
  ('OR00006', 'C00006', '2024-02-15', NULL, 'EQ00006'),
  ('OR00007', 'C00007', '2024-05-01', 'GA00007', NULL),
  ('OR00008', 'C00008', '2024-04-18', 'GA00008', 'EQ00008'),
  ('OR00009', 'C00009', '2024-01-28', NULL, 'EQ00009'),
  ('OR00010', 'C00010', '2024-02-10', 'GA00010', NULL),
  ('OR00011', 'C00011', '2024-04-03', NULL, 'EQ00011'),
  ('OR00012', 'C00012', '2024-03-21', 'GA00012', 'EQ00012'),
  ('OR00013', 'C00013', '2024-01-14', 'GA00013', NULL),
  ('OR00014', 'C00014', '2024-02-08', NULL, 'EQ00014'),
  ('OR00015', 'C00015', '2024-05-07', 'GA00015', NULL),
  ('OR00016', 'C00016', '2024-04-11', 'GA00016', 'EQ00016'),
  ('OR00017', 'C00017', '2024-01-23', 'GA00017', NULL),
  ('OR00018', 'C00018', '2024-02-29', NULL, 'EQ00018'),
  ('OR00019', 'C00019', '2024-03-05', 'GA00019', NULL),
  ('OR00020', 'C00020', '2024-04-26', NULL, 'EQ00020'),
  ('OR00021', 'C00021', '2024-05-09', 'GA00021', NULL),
  ('OR00022', 'C00022', '2024-02-02', 'GA00022', 'EQ00022'),
  ('OR00023', 'C00023', '2024-03-27', NULL, 'EQ00023'),
  ('OR00024', 'C00024', '2024-04-14', 'GA00024', NULL),
  ('OR00025', 'C00025', '2024-01-31', 'GA00025', 'EQ00025'),
  ('OR00026', 'C00026', '2024-05-04', NULL, 'EQ00026'),
  ('OR00027', 'C00027', '2024-02-18', 'GA00027', NULL),
  ('OR00028', 'C00028', '2024-03-12', NULL, 'EQ00028'),
  ('OR00029', 'C00029', '2024-04-05', 'GA00029', NULL),
  ('OR00030', 'C00030', '2024-01-08', NULL, 'EQ00030'),
  ('OR00031', 'C00031', '2024-05-01', 'GA00031', NULL),
  ('OR00032', 'C00032', '2024-02-23', 'GA00032', 'EQ00032'),
  ('OR00033', 'C00033', '2024-04-18', NULL, 'EQ00033'),
  ('OR00034', 'C00034', '2024-01-15', 'GA00034', NULL),
  ('OR00035', 'C00035', '2024-03-09', NULL, 'EQ00035'),
  ('OR00036', 'C00036', '2024-04-02', 'GA00036', NULL),
  ('OR00037', 'C00037', '2024-01-25', 'GA00037', 'EQ00037'),
  ('OR00038', 'C00038', '2024-02-19', NULL, 'EQ00038'),
  ('OR00039', 'C00039', '2024-03-14', 'GA00039', NULL),
  ('OR00040', 'C00040', '2024-05-07', NULL, 'EQ00040'),
  ('OR00041', 'C00041', '2024-02-10', 'GA00041', NULL),
  ('OR00042', 'C00042', '2024-03-03', NULL, 'EQ00042'),
  ('OR00043', 'C00043', '2024-04-27', 'GA00043', NULL),
  ('OR00044', 'C00044', '2024-01-21', 'GA00044', 'EQ00044'),
  ('OR00045', 'C00045', '2024-05-14', NULL, 'EQ00045'),
  ('OR00046', 'C00046', '2024-02-12', 'GA00046', NULL),
  ('OR00047', 'C00047', '2024-03-06', NULL, 'EQ00047'),
  ('OR00048', 'C00048', '2024-04-30', 'GA00048', NULL),
  ('OR00049', 'C00049', '2024-01-17', NULL, 'EQ00049'),
  ('OR00050', 'C00050', '2024-02-20', 'GA00050', NULL);

INSERT INTO store_transaction(transaction_id, type_of_payment, date_of_transaction, employee_id, order_id)
VALUES
('T00001', 'Credit Card', '2024-01-01', 'E00001', 'OR00001'),
('T00002', 'Cash', '2024-01-02', 'E00002', 'OR00002'),
('T00003', 'Debit Card', '2024-01-03', 'E00003', 'OR00003'),
('T00004', 'Credit Card', '2024-01-04', 'E00004', 'OR00004'),
('T00005', 'Cash', '2024-01-05', 'E00005', 'OR00005'),
('T00006', 'Debit Card', '2024-01-06', 'E00006', 'OR00006'),
('T00007', 'Credit Card', '2024-01-07', 'E00007', 'OR00007'),
('T00008', 'Cash', '2024-01-08', 'E00008', 'OR00008'),
('T00009', 'Debit Card', '2024-01-09', 'E00009', 'OR00009'),
('T00010', 'Credit Card', '2024-01-10', 'E00010', 'OR00010'),
('T00011', 'Cash', '2024-01-11', 'E00011', 'OR00011'),
('T00012', 'Debit Card', '2024-01-12', 'E00012', 'OR00012'),
('T00013', 'Credit Card', '2024-01-13', 'E00013', 'OR00013'),
('T00014', 'Cash', '2024-01-14', 'E00014', 'OR00014'),
('T00015', 'Debit Card', '2024-01-15', 'E00015', 'OR00015'),
('T00016', 'Credit Card', '2024-01-16', 'E00016', 'OR00016'),
('T00017', 'Cash', '2024-01-17', 'E00017', 'OR00017'),
('T00018', 'Debit Card', '2024-01-18', 'E00018', 'OR00018'),
('T00019', 'Credit Card', '2024-01-19', 'E00019', 'OR00019'),
('T00020', 'Cash', '2024-01-20', 'E00020', 'OR00020'),
('T00021', 'Debit Card', '2024-01-21', 'E00021', 'OR00021'),
('T00022', 'Credit Card', '2024-01-22', 'E00022', 'OR00022'),
('T00023', 'Cash', '2024-01-23', 'E00023', 'OR00023'),
('T00024', 'Debit Card', '2024-01-24', 'E00024', 'OR00024'),
('T00025', 'Credit Card', '2024-01-25', 'E00025', 'OR00025'),
('T00026', 'Cash', '2024-01-26', 'E00026', 'OR00026'),
('T00027', 'Debit Card', '2024-01-27', 'E00027', 'OR00027'),
('T00028', 'Credit Card', '2024-01-28', 'E00028', 'OR00028'),
('T00029', 'Cash', '2024-01-29', 'E00029', 'OR00029'),
('T00030', 'Debit Card', '2024-01-30', 'E00030', 'OR00030'),
('T00031', 'Credit Card', '2024-01-31', 'E00031', 'OR00031'),
('T00032', 'Cash', '2024-02-01', 'E00032', 'OR00032'),
('T00033', 'Debit Card', '2024-02-02', 'E00033', 'OR00033'),
('T00034', 'Credit Card', '2024-02-03', 'E00034', 'OR00034'),
('T00035', 'Cash', '2024-02-04', 'E00035', 'OR00035'),
('T00036', 'Debit Card', '2024-02-05', 'E00036', 'OR00036'),
('T00037', 'Credit Card', '2024-02-06', 'E00037', 'OR00037'),
('T00038', 'Cash', '2024-02-07', 'E00038', 'OR00038'),
('T00039', 'Debit Card', '2024-02-08', 'E00039', 'OR00039'),
('T00040', 'Credit Card', '2024-02-09', 'E00040', 'OR00040'),
('T00041', 'Cash', '2024-02-10', 'E00041', 'OR00041'),
('T00042', 'Debit Card', '2024-02-11', 'E00042', 'OR00042'),
('T00043', 'Credit Card', '2024-02-12', 'E00043', 'OR00043'),
('T00044', 'Cash', '2024-02-13', 'E00044', 'OR00044'),
('T00045', 'Debit Card', '2024-02-14', 'E00045', 'OR00045'),
('T00046', 'Credit Card', '2024-02-15', 'E00046', 'OR00046'),
('T00047', 'Cash', '2024-02-16', 'E00047', 'OR00047'),
('T00048', 'Debit Card', '2024-02-17', 'E00048', 'OR00048'),
('T00049', 'Credit Card', '2024-02-18', 'E00049', 'OR00049'),
('T00050', 'Cash', '2024-02-19', 'E00050', 'OR00050');

SELECT * FROM store;
SELECT * FROM employee;
SELECT * FROM platform;
SELECT * FROM genre;
SELECT * FROM review;
SELECT * FROM customer;
SELECT * FROM orders;
SELECT * FROM store_transaction;
SELECT * FROM game;
SELECT * FROM table_equipment;
SELECT * FROM rating;
SELECT * FROM equipment_category;
