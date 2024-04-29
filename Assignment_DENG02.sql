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
VALUE 
('T0001',,,,,),
('T0002',,,,,),
('T0003',,,,,),
('T0004',,,,,),
('T0005',,,,,),
('T0006',,,,,),
('T0007',,,,,),
('T0008',,,,,),
('T0009',,,,,),
('T0010',,,,,),
('T0011',,,,,),
('T0012',,,,,),
('T0013',,,,,),
('T0014',,,,,),
('T0015',,,,,),
('T0016',,,,,),
('T0017',,,,,),
('T0018',,,,,),
('T0019',,,,,),
('T0020',,,,,),
('T0021',,,,,),
('T0022',,,,,),
('T0023',,,,,),
('T0024',,,,,),
('T0025',,,,,),
('T0026',,,,,),
('T0027',,,,,),
('T0028',,,,,),
('T0029',,,,,),
('T0030',,,,,),
('T0031',,,,,),
('T0032',,,,,),
('T0033',,,,,),
('T0034',,,,,),
('T0035',,,,,),
('T0036',,,,,),
('T0037',,,,,),
('T0038',,,,,),
('T0039',,,,,),
('T0040',,,,,),
('T0041',,,,,),
('T0042',,,,,),
('T0043',,,,,),
('T0044',,,,,),
('T0045',,,,,),
('T0046',,,,,),
('T0047',,,,,),
('T0048',,,,,),
('T0049',,,,,),
('T0050',,,,,)
;
	
INSERT INTO game()
VALUE 
('GA0001',,,,,),
('GA0002',,,,,),
('GA0003',,,,,),
('GA0004',,,,,),
('GA0005',,,,,),
('GA0006',,,,,),
('GA0007',,,,,),
('GA0008',,,,,),
('GA0009',,,,,),
('GA0010',,,,,),
('GA0011',,,,,),
('GA0012',,,,,),
('GA0013',,,,,),
('GA0014',,,,,),
('GA0015',,,,,),
('GA0016',,,,,),
('GA0017',,,,,),
('GA0018',,,,,),
('GA0019',,,,,),
('GA0020',,,,,),
('GA0021',,,,,),
('GA0022',,,,,),
('GA0023',,,,,),
('GA0024',,,,,),
('GA0025',,,,,),
('GA0026',,,,,),
('GA0027',,,,,),
('GA0028',,,,,),
('GA0029',,,,,),
('GA0030',,,,,),
('GA0031',,,,,),
('GA0032',,,,,),
('GA0033',,,,,),
('GA0034',,,,,),
('GA0035',,,,,),
('GA0036',,,,,),
('GA0037',,,,,),
('GA0038',,,,,),
('GA0039',,,,,),
('GA0040',,,,,),
('GA0041',,,,,),
('GA0042',,,,,),
('GA0043',,,,,),
('GA0044',,,,,),
('GA0045',,,,,),
('GA0046',,,,,),
('GA0047',,,,,),
('GA0048',,,,,),
('GA0049',,,,,),
('GA0050',,,,,)
;


INSERT INTO table_equipment()
VALUE 
('EQ0001',,,,,),
('EQ0002',,,,,),
('EQ0003',,,,,),
('EQ0004',,,,,),
('EQ0005',,,,,),
('EQ0006',,,,,),
('EQ0007',,,,,),
('EQ0008',,,,,),
('EQ0009',,,,,),
('EQ0010',,,,,),
('EQ0011',,,,,),
('EQ0012',,,,,),
('EQ0013',,,,,),
('EQ0014',,,,,),
('EQ0015',,,,,),
('EQ0016',,,,,),
('EQ0017',,,,,),
('EQ0018',,,,,),
('EQ0019',,,,,),
('EQ0020',,,,,),
('EQ0021',,,,,),
('EQ0022',,,,,),
('EQ0023',,,,,),
('EQ0024',,,,,),
('EQ0025',,,,,),
('EQ0026',,,,,),
('EQ0027',,,,,),
('EQ0028',,,,,),
('EQ0029',,,,,),
('EQ0030',,,,,),
('EQ0031',,,,,),
('EQ0032',,,,,),
('EQ0033',,,,,),
('EQ0034',,,,,),
('EQ0035',,,,,),
('EQ0036',,,,,),
('EQ0037',,,,,),
('EQ0038',,,,,),
('EQ0039',,,,,),
('EQ0040',,,,,),
('EQ0041',,,,,),
('EQ0042',,,,,),
('EQ0043',,,,,),
('EQ0044',,,,,),
('EQ0045',,,,,),
('EQ0046',,,,,),
('EQ0047',,,,,),
('EQ0048',,,,,),
('EQ0049',,,,,),
('EQ0050',,,,,)
;
