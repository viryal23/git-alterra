--CREATE DATABASE
CREATE DATABASE transactions;

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
    name VARCHAR(255),
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
    (1, 3, 'SI1', 'How to Win Friends & Influence People', 1, current_timestamp, NULL),
    (1, 3, 'SI2', 'Atomic Habits', 1, current_timestamp, NULL);

--Insert 3 product dengan product type id = 2, dan operators id = 1
INSERT INTO products(product_type_id, operator_id, code, name, status, created_at, updated_at)
VALUES
    (2, 1, 'P1', 'The Psychology of Money', 1, current_timestamp, NULL),
    (2, 1, 'P2', 'Peak Mind', 1, current_timestamp, NULL),
    (2, 1, 'P3', 'Getting to Zero', 1, current_timestamp, NULL);

--Insert 3 product dengan product type id = 3, dan operators id = 4
INSERT INTO products(product_type_id, operator_id, code, name, status, created_at, updated_at)
VALUES
    (3, 4, 'R1', 'Creating Destiny', 1, current_timestamp, NULL),
    (3, 4, 'R2', 'Perfect Romance', 1, current_timestamp, NULL),
    (3, 4, 'R3', 'You Told Me So', 1, current_timestamp, NULL);

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
INSERT INTO users(status, name, dob, gender, created_at, updated_at)
VALUES
    (1, 'Virana', '2001-01-23', 'P', current_timestamp, NULL),
    (1, 'Dhani', '2000-11-13', 'L', current_timestamp, NULL),
    (1, 'Hasna', '2001-12-08', 'P', current_timestamp, NULL),
    (1, 'Raditya', '2001-04-02', 'L', current_timestamp, NULL),
    (1, 'Cahya', '2001-05-20', 'P', current_timestamp, NULL);

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

--SELECT
--Tampilkan nama user/pelanggan dengan gender laki-laki/M
SELECT name FROM users WHERE gender = 'L';

--Tampilkan product dengan id = 3
SELECT * FROM products WHERE id = 3;

--Tampilkan data pelanggan yang created_at dalam range 7 hari ke belakang dan mempunyai nama mengandung kata 'a'
SELECT * FROM users WHERE created_at > current_date - 7 and name like '%a%';

--Hitung jumlah user/pelanggan dengan status gender perempuan
SELECT COUNT(*) FROM users WHERE gender = 'P';

--Tampilkan data pelanggan dengan urutan sesuai nama abjad
SELECT * FROM users ORDER BY name;

--Tampilkan 5 data pada data product
SELECT * FROM products LIMIT 5;

--UPDATE
--Ubah data product id 1 dengan nama 'product dummy'
UPDATE products SET name = 'Product Dummy', updated_at = current_timestamp WHERE id = 1;

--Update qty = 3 pada transaction detail dengan product id 1
UPDATE transaction_details SET qty = 3, updated_at = current_timestamp WHERE product_id = 1;

--DELETE
--Delete data pada tabel product dengan id 1
DELETE FROM products WHERE id = 1;

--Delete data pada tabel product dengan product type id 1
DELETE FROM products WHERE product_type_id = 1;

--JOIN, UNION, SUB-QUERY, FUNCTION
--Gabungkan data transaksi dari user id 1 dan user id 2;
SELECT * FROM users u INNER JOIN transactions t ON u.id = t.user_id WHERE u.id = 1 or u.id = 2;

--Tampilkan jumlah harga transaksi user id 1
SELECT SUM(total_price) AS total_price FROM transactions WHERE user_id = 1;

--Tampilkan total transaksi dengan product type 2
SELECT COUNT(transaction_id) AS total_transactions FROM transaction_details td INNER JOIN products p ON p.id = td.product_id WHERE p.product_type_id = 2;

--Tampilkan semua field table product dan field name table product type yang saling berhubungan
SELECT p.*, pt.name FROM products p INNER JOIN product_types pt ON p.product_type_id = pt.id;

--Tampilkan semua field table transaction, field name table product dan field name table user
SELECT t.*, p.name AS product_name, u.name AS user_name FROM users u INNER JOIN transactions t ON u.id = t.user_id
INNER JOIN transaction_details td ON t.id = td.transaction_id
INNER JOIN products p ON p.id = td.product_id;

--Buat function setelah data transaksi dihapus maka transaction detail terhapus juga dengan transaction id yang dimaksud
CREATE FUNCTION delete_transaction()
    RETURNS TRIGGER AS
$$
BEGIN
    DELETE FROM transaction_details WHERE transaction_id = old.id;
    RETURN old;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER delete_transaction
BEFORE DELETE ON transactions
FOR EACH ROW
EXECUTE PROCEDURE delete_transaction();

--Buat function setelah data transaksi detail dihapus maka data total_qty terupdate berdasarkan qty data transaction id yang dihapus
CREATE FUNCTION update_total_qty()
RETURNS TRIGGER AS 
$$
BEGIN
    UPDATE transactions SET total_qty = total_qty - old.qty WHERE id = old.transaction_id;
    RETURN old;
END;
$$ 
LANGUAGE plpgsql;

CREATE TRIGGER update_total_qty
BEFORE DELETE ON transaction_details 
FOR EACH ROW 
EXECUTE PROCEDURE update_total_qty();

--Tampilkan data products yang tidak pernah ada di table transaction_details dengan sub-query
SELECT * FROM products WHERE id NOT IN (SELECT product_id FROM transaction_details GROUP BY product_id);