--CREATE DATABASE
CREATE DATABASE transaction;

--CREATE TABLE product_types
CREATE TABLE product_types (
    id SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(255),
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

--CREATE TABLE operators
CREATE TABLE operators (
    id SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(255),
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

--CREATE TABLE product_descriptions
CREATE TABLE product_descriptions (
    id SERIAL PRIMARY KEY NOT NULL,
    description TEXT,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

--CREATE TABLE products
CREATE TABLE products (
    id SERIAL PRIMARY KEY NOT NULL,
    product_type_id INTEGER,
    operator_id INTEGER,
    code VARCHAR(50),
    name VARCHAR(100),
    status SMALLINT,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    FOREIGN KEY (product_type_id) REFERENCES product_types(id),
    FOREIGN KEY (operator_id) REFERENCES operators(id)
);

--CREATE TABLE payment_methods
CREATE TABLE payment_methods (
    id SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(255),
    status SMALLINT,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

--CREATE TABLE users
CREATE TABLE users (
    id SERIAL PRIMARY KEY NOT NULL,
    status SMALLINT,
    dob DATE,
    gender CHAR(1),
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

--CREATE TABLE transactions
CREATE TABLE transactions (
    id SERIAL PRIMARY KEY NOT NULL,
    user_id INTEGER,
    payment_method_id INTEGER,
    status VARCHAR(10),
    total_qty INTEGER,
    total_price NUMERIC(25, 2),
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (payment_method_id) REFERENCES payment_methods(id)
);

--CREATE TABLE transaction_details
CREATE TABLE transaction_details (
    transaction_id INTEGER REFERENCES transactions(id),
    product_id INTEGER REFERENCES products(id),
    status VARCHAR(10),
    qty INTEGER,
    price NUMERIC(25, 2),
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    PRIMARY KEY (transaction_id, product_id)
);

--INSERT
--Insert 5 operators pada table operators
INSERT INTO operators(name, created_at, updated_at)
VALUES
    ('Viryal', current_timestamp, NULL),
    ('Zahra', current_timestamp, NULL),
    ('Nada', current_timestamp, NULL),
    ('Islamia', current_timestamp, NULL),
    ('Alfiah', current_timestamp, NULL);

--Insert 3 product type
INSERT INTO product_types(name, created_at, updated_at)
VALUES
    ('Self Improvement', current_timestamp, NULL),
    ('Psychology', current_timestamp, NULL),
    ('Romance', current_timestamp, NULL);

--Insert 2 product dengan product type id = 1, dan operators id = 3
INSERT INTO products(product_type_id, operator_id, code, name, status, created_at, updated_at)
VALUES
    (1, 3, 'SI1', 'How to Win Friends & Influence People', 11, current_timestamp, NULL),
    (1, 3, 'SI2', 'Atomic Habits', 12, current_timestamp, NULL);

--Insert 3 product dengan product type id = 2, dan operators id = 1
INSERT INTO products(product_type_id, operator_id, code, name, status, created_at, updated_at)
VALUES
    (2, 1, 'P1', 'The Psychology of Money', 21, current_timestamp, NULL),
    (2, 1, 'P2', 'Peak Mind', 22, current_timestamp, NULL),
    (2, 1, 'P3', 'Getting to Zero', 23, current_timestamp, NULL);

--Insert 3 product dengan product type id = 3, dan operators id = 4
INSERT INTO products(product_type_id, operator_id, code, name, status, created_at, updated_at)
VALUES
    (3, 4, 'R1', 'Creating Destiny', 31, current_timestamp, NULL),
    (3, 4, 'R2', 'Perfect Romance', 32, current_timestamp, NULL),
    (3, 4, 'R3', 'You Told Me So', 33, current_timestamp, NULL);

--Insert product description pada setiap product
INSERT INTO product_descriptions(description, created_at, updated_at)
VALUES
    ('Buku Self Improvement dengan judul How to Win Friends & Influence People', current_timestamp, NULL),
    ('Buku Self Improvement dengan judul Atomic Habits', current_timestamp, NULL),
    ('Buku Psychology dengan judul The Psychology of Money', current_timestamp, NULL),
    ('Buku Psychology dengan judul Peak Mind', current_timestamp, NULL),
    ('Buku Psychology dengan judul Getting to Zero', current_timestamp, NULL),
    ('Buku Romance dengan judul Creating Destiny', current_timestamp, NULL),
    ('Buku Romance dengan judul Perfect Romance', current_timestamp, NULL),
    ('Buku Romance dengan judul You Told Me So', current_timestamp, NULL);

--Insert 3 payment methods
INSERT INTO payment_methods(name, status, created_at, updated_at)
VALUES
    ('Cash', 1, current_timestamp, NULL),
    ('Credit Card', 1, current_timestamp, NULL),
    ('Debit Card', 1, current_timestamp,NULL);

--Insert 5 user pada tabel user
INSERT INTO users(status, dob, gender, created_at, updated_at)
VALUES
    (1, '2001-01-23', 'P', current_timestamp, NULL),
    (1, '2000-11-13', 'L', current_timestamp, NULL),
    (1, '2001-12-08', 'P', current_timestamp, NULL),
    (1, '2001-04-02', 'L', current_timestamp, NULL),
    (1, '2001-05-20', 'P', current_timestamp, NULL);

--Insert 3 transaksi di masing-masing user
INSERT INTO transactions(user_id, payment_method_id, status, total_qty, total_price, created_at, updated_at)
VALUES
    (1, 1, 1, 3, 210550, current_timestamp, NULL),
    (1, 2, 1, 3, 173010, current_timestamp, NULL),
    (1, 3, 1, 3, 193450, current_timestamp, NULL),
    (2, 1, 1, 3, 524700, current_timestamp, NULL),
    (2, 2, 1, 3, 183810, current_timestamp, NULL),
    (2, 3, 1, 3, 482010, current_timestamp, NULL),
    (3, 1, 1, 3, 188960, current_timestamp, NULL),
    (3, 2, 1, 3, 528350, current_timestamp, NULL),
    (3, 3, 1, 3, 183810, current_timestamp, NULL),
    (4, 1, 1, 3, 503850, current_timestamp, NULL),
    (4, 2, 1, 3, 173010, current_timestamp, NULL),
    (4, 3, 1, 3, 524700, current_timestamp, NULL),
    (5, 1, 1, 3, 528100, current_timestamp, NULL),
    (5, 2, 1, 3, 184350, current_timestamp, NULL),
    (5, 3, 1, 3, 528350, current_timestamp, NULL);

--Insert 3 product di masing-masing transaksi
INSERT INTO transaction_details(transaction_id, product_id, status, qty, price, created_at, updated_at)
VALUES
    (1, 1, 1, 1, 61600, current_timestamp, NULL),
    (1, 4, 1, 1, 82450, current_timestamp, NULL),
    (1, 6, 1, 1, 66500, current_timestamp, NULL),
    (2, 8, 1, 1, 66750, current_timestamp, NULL),
    (2, 7, 1, 1, 39760, current_timestamp, NULL),
    (2, 6, 1, 1, 66500, current_timestamp, NULL),
    (3, 1, 1, 1, 61600, current_timestamp, NULL),
    (3, 2, 1, 1, 75600, current_timestamp, NULL),
    (3, 3, 1, 1, 56250, current_timestamp, NULL),
    (4, 5, 1, 1, 386000, current_timestamp, NULL),
    (4, 4, 1, 1, 82450, current_timestamp, NULL),
    (4, 3, 1, 1, 56250, current_timestamp, NULL),
    (5, 4, 1, 1, 82450, current_timestamp, NULL),
    (5, 1, 1, 1, 61600, current_timestamp, NULL),
    (5, 7, 1, 1, 39760, current_timestamp, NULL),
    (6, 7, 1, 1, 39760, current_timestamp, NULL),
    (6, 3, 1, 1, 56250, current_timestamp, NULL),
    (6, 5, 1, 1, 386000, current_timestamp, NULL),
    (7, 7, 1, 1, 39760, current_timestamp, NULL),
    (7, 8, 1, 1, 66750, current_timestamp, NULL),
    (7, 4, 1, 1, 82450, current_timestamp, NULL),
    (8, 5, 1, 1, 386000, current_timestamp, NULL), 
    (8, 2, 1, 1, 75600, current_timestamp, NULL),
    (8, 8, 1, 1, 66750, current_timestamp, NULL),
    (9, 1, 1, 1, 61600, current_timestamp, NULL),
    (9, 7, 1, 1, 39760, current_timestamp, NULL),
    (9, 4, 1, 1, 82450, current_timestamp, NULL),
    (10, 5, 1, 1, 386000, current_timestamp, NULL),
    (10, 1, 1, 1, 61600, current_timestamp, NULL),
    (10, 3, 1, 1, 56250, current_timestamp, NULL),
    (11, 6, 1, 1, 66500, current_timestamp, NULL),
    (11, 7, 1, 1, 39760, current_timestamp, NULL),
    (11, 8, 1, 1, 66750, current_timestamp, NULL),
    (12, 3, 1, 1, 56250, current_timestamp, NULL),
    (12, 4, 1, 1, 82450, current_timestamp, NULL),
    (12, 5, 1, 1, 386000, current_timestamp, NULL),
    (13, 5, 1, 1, 386000, current_timestamp, NULL),
    (13, 6, 1, 1, 66500, current_timestamp, NULL),
    (13, 2, 1, 1, 75600, current_timestamp, NULL),
    (14, 1, 1, 1, 61600, current_timestamp, NULL),
    (14, 3, 1, 1, 56250, current_timestamp, NULL),
    (14, 6, 1, 1, 66500, current_timestamp, NULL),
    (15, 8, 1, 1, 66750, current_timestamp, NULL),
    (15, 5, 1, 1, 386000, current_timestamp, NULL),
    (15, 2, 1, 1, 75600, current_timestamp, NULL);