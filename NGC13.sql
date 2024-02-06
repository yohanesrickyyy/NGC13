--! Release 0 : Design Schema Polling
CREATE DATABASE NGC_13;

--! Buat tabel user dan id 
CREATE TABLE type_user (
	user_id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(10) NOT NULL,
  password VARCHAR(10) NOT NULL,
  tipe_user VARCHAR(10) NOT NULL
);

INSERT INTO type_user (username, password, tipe_user)
  VALUES
    ('admin', '123', 'admin'),
    ('customer', '' , 'customer');

--! Buat table tas item
CREATE TABLE items (
  items_id INT NOT NULL PRIMARY KEY,
  nama VARCHAR(50) NOT NULL,
  harga_asli INT NOT NULL
);

INSERT INTO items (items_id, nama)
VALUES
	('10','tas selempang','100000'),
	('11','tas handbag','110000'),
	('12','tas ransel','120000');

--! Buat table jenis item
CREATE TABLE type_item (
	jenis_id INT NOT NULL PRIMARY KEY,
  jenis VARCHAR(50) NOT NULL,
  jenis_addon INT NOT NULL
);

INSERT INTO type_item (jenis_id, jenis, jenis_addon)
VALUES
	('21','kulit','50000'),
	('22','suede','20000'),
	('23','satin','30000');

--! Buat table size item
CREATE TABLE size_item (
	size_id INT NOT NULL PRIMARY KEY,
  size VARCHAR(50) NOT NULL,
  size_addon INT NOT NULL
);

INSERT INTO size_item (size_id, size, size_addon)
VALUES
	('31','small','5000'),
	('32','medium','20000'),
	('33','large','40000');

--! ORDER items_id (SELEMPANG) + jenis_id(kulit) + size_id(small)
CREATE TABLE order (
  items_id INT NOT NULL, 
  jenis_id INT NOT NULL,
  size_id INT NOT NULL,
    FOREIGN KEY (items_id) REFERENCES items(items_id)
    FOREIGN KEY (jenis_id) REFERENCES type_item(jenis_id)
    FOREIGN KEY (size_id) REFERENCES size_item (size_id)

)

--! TOTAL HARGA TAS
SELECT * FROM order;
SELECT SUM(order) AS total from order;

--* logic
--* user login
--* memilih tipe tas (selempang,ransel,handbag)
--* memilih  addon jenis tas (kulit, suede, satin)
--* memilih addon size (small, medium, large)
--* Dapat totalan harga(tipe tas + jenis tas + size)