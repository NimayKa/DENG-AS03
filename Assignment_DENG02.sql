-- Create platform table
CREATE TABLE platform (
  platform_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  manufacturer VARCHAR(255),
  release_date DATE
);

-- Create genre table
CREATE TABLE genre (
  genre_id SERIAL PRIMARY KEY,
  genre_name VARCHAR(255) NOT NULL
);

-- Create review table
CREATE TABLE review (
  review_id SERIAL PRIMARY KEY,
  review_rating VARCHAR(255),
  review_comment TEXT
);

-- Create store table
CREATE TABLE store (
  store_id SERIAL PRIMARY KEY,
  location VARCHAR(255) NOT NULL
);

-- Create employee table
CREATE TABLE employee (
  employee_id SERIAL PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  date_of_employment DATE NOT NULL,
  dob DATE,
  store_id INTEGER 
);

-- Create customer table
CREATE TABLE customer (
  customer_id SERIAL PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  bod DATE,
  address VARCHAR(255),
  phone_number VARCHAR(255),
  email VARCHAR(255)
);

-- Create orders table
CREATE TABLE orders (
  order_id SERIAL PRIMARY KEY,
  customer_id INTEGER, 
  order_date DATE NOT NULL,
  price_total DECIMAL(10,2) NOT NULL
);

-- Create transaction table
CREATE TABLE transaction (
  transaction_id SERIAL PRIMARY KEY,
  customer_id INTEGER, 
  type_of_payment VARCHAR(255) NOT NULL,
  date DATE NOT NULL,
  employee_id INTEGER, 
  order_id INTEGER 
);

-- Create game table
CREATE TABLE game (
  game_id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  genre_id INTEGER, 
  release_date DATE,
  platform_id INTEGER,
  rating_system INTEGER,
  review_id INT
);

-- Create table_equipment table
CREATE TABLE table_equipment (
  equipment_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  platform_id INTEGER, 
  price DECIMAL(10,2) NOT NULL,
  quantity INTEGER NOT NULL,
  review_id INTEGER 
);


ALTER TABLE employee ADD CONSTRAINT fk_employee_store FOREIGN KEY (store_id) REFERENCES store(store_id);
ALTER TABLE orders ADD CONSTRAINT fk_orders_customer FOREIGN KEY (customer_id) REFERENCES customer(customer_id);
ALTER TABLE transaction ADD CONSTRAINT fk_transaction_customer FOREIGN KEY (customer_id) REFERENCES customer(customer_id);
ALTER TABLE transaction ADD CONSTRAINT fk_transaction_employee FOREIGN KEY (employee_id) REFERENCES employee(employee_id);
ALTER TABLE transaction ADD CONSTRAINT fk_transaction_order FOREIGN KEY (order_id) REFERENCES orders(order_id);
ALTER TABLE game ADD CONSTRAINT fk_game_genre FOREIGN KEY (genre_id) REFERENCES genre(genre_id);
ALTER TABLE game ADD CONSTRAINT fk_game_platform FOREIGN KEY (platform_id) REFERENCES platform(platform_id);
ALTER TABLE game ADD CONSTRAINT fk_game_review FOREIGN KEY (review_id) REFERENCES review(review_id);
ALTER TABLE table_equipment ADD CONSTRAINT fk_equipment_platform FOREIGN KEY (platform_id) REFERENCES platform(platform_id);
ALTER TABLE table_equipment ADD CONSTRAINT fk_equipment_review FOREIGN KEY (review_id) REFERENCES review(review_id);
