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
  store_location VARCHAR(255) NOT NULL
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
	('GE00001', 'Gadong'),
	('GE00002', 'Gadong'),
	('GE00003', 'Gadong'),
	('GE00004', 'Gadong'),
	('GE00005', 'Gadong'),
	('GE00006', 'Gadong'),
	('GE00007', 'Gadong'),
	('GE00008', 'Gadong'),
	('GE00009', 'Gadong'),
	('GE00010', 'Gadong'),
	('GE00011', 'Gadong'),
	('GE00012', 'Gadong'),
	('GE00013', 'Gadong'),
	('GE00014', 'Gadong'),
	('GE00015', 'Gadong'),
	('GE00016', 'Gadong'),
	('GE00017', 'Gadong'),
	('GE00018', 'Gadong'),
	('GE00019', 'Gadong'),
	('GE00020', 'Gadong'),
	('GE00021', 'Gadong'),
	('GE00022', 'Gadong'),
	('GE00023', 'Gadong'),
	('GE00024', 'Gadong'),
	('GE00025', 'Gadong'),
	('GE00026', 'Gadong'),
	('GE00027', 'Gadong'),
	('GE00028', 'Gadong'),
	('GE00029', 'Gadong'),
	('GE00030', 'Gadong'),
	('GE00031', 'Gadong'),
	('GE00032', 'Gadong'),
	('GE00033', 'Gadong'),
	('GE00034', 'Gadong'),
	('GE00035', 'Gadong'),
	('GE00036', 'Gadong'),
	('GE00037', 'Gadong'),
	('GE00038', 'Gadong'),
	('GE00039', 'Gadong'),
	('GE00040', 'Gadong'),
	('GE00041', 'Gadong'),
	('GE00042', 'Gadong'),
	('GE00043', 'Gadong'),
	('GE00044', 'Gadong'),
	('GE00045', 'Gadong'),
	('GE00046', 'Gadong'),
	('GE00047', 'Gadong'),
	('GE00048', 'Gadong'),
	('GE00049', 'Gadong'),
	('GE00050', 'Gadong');

INSERT INTO review (review_id, review_rating, review_comment)
VALUES


INSERT INTO store (store_id, store_location)
VALUES 
	('S00001', 'Gadong'),
	('S00002', 'Gadong'),
	('S00003', 'Gadong'),
	('S00004', 'Gadong'),
	('S00005', 'Gadong'),
	('S00006', 'Gadong'),
	('S00007', 'Gadong'),
	('S00008', 'Gadong'),
	('S00009', 'Gadong'),
	('S00010', 'Gadong'),
	('S00011', 'Gadong'),
	('S00012', 'Gadong'),
	('S00013', 'Gadong'),
	('S00014', 'Gadong'),
	('S00015', 'Gadong'),
	('S00016', 'Gadong'),
	('S00017', 'Gadong'),
	('S00018', 'Gadong'),
	('S00019', 'Gadong'),
	('S00020', 'Gadong'),
	('S00021', 'Gadong'),
	('S00022', 'Gadong'),
	('S00023', 'Gadong'),
	('S00024', 'Gadong'),
	('S00025', 'Gadong'),
	('S00026', 'Gadong'),
	('S00027', 'Gadong'),
	('S00028', 'Gadong'),
	('S00029', 'Gadong'),
	('S00030', 'Gadong'),
	('S00031', 'Gadong'),
	('S00032', 'Gadong'),
	('S00033', 'Gadong'),
	('S00034', 'Gadong'),
	('S00035', 'Gadong'),
	('S00036', 'Gadong'),
	('S00037', 'Gadong'),
	('S00038', 'Gadong'),
	('S00039', 'Gadong'),
	('S00040', 'Gadong'),
	('S00041', 'Gadong'),
	('S00042', 'Gadong'),
	('S00043', 'Gadong'),
	('S00044', 'Gadong'),
	('S00045', 'Gadong'),
	('S00046', 'Gadong'),
	('S00047', 'Gadong'),
	('S00048', 'Gadong'),
	('S00049', 'Gadong'),
	('S00050', 'Gadong');

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
