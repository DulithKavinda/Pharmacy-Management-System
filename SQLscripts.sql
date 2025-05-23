
-- Medicine
CREATE TABLE MEDICINE (
  medicine_id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  name VARCHAR2(100) NOT NULL,
  category VARCHAR2(50),
  price NUMBER(6,2) NOT NULL,
  stock_qty NUMBER(5) NOT NULL
);

-- Customer
CREATE TABLE CUSTOMER (
  customer_id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  name VARCHAR2(100) NOT NULL,
  phone VARCHAR2(15),
  email VARCHAR2(100)
);

-- Sale
CREATE TABLE SALES (
  sale_id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  medicine_id NUMBER,
  customer_id NUMBER,
  quantity NUMBER(4) NOT NULL,
  total_price NUMBER(8,2),
  sale_date DATE DEFAULT SYSDATE,
  CONSTRAINT fk_medicine FOREIGN KEY (medicine_id) REFERENCES MEDICINE(medicine_id),
  CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES CUSTOMER(customer_id)
);


-- Insert record

INSERT INTO MEDICINE (name, category, price, stock_qty) VALUES ('Paracetamol', 'Painkiller', 10.00, 100);
INSERT INTO MEDICINE (name, category, price, stock_qty) VALUES ('Amoxicilin', 'Antibiotic', 12.00, 50);
INSERT INTO MEDICINE (name, category, price, stock_qty) VALUES ('Cetirisine', 'Allergy', 5.00, 80);
INSERT INTO MEDICINE (name, category, price, stock_qty) VALUES ('Vitamin C', 'Supplement', 3.00, 200);
INSERT INTO MEDICINE (name, category, price, stock_qty) VALUES ('panadol', 'Painkiller', 8.00, 70);


INSERT INTO CUSTOMER (name, phone, email) VALUES ('Amal', '0712345678', 'amal@gmail.com');
INSERT INTO CUSTOMER (name, phone, email) VALUES ('Malith', '0723456789', 'malith@gmail.com');
INSERT INTO CUSTOMER (name, phone, email) VALUES ('Damitha', '0734567890', 'damitha@gmail.com');
INSERT INTO CUSTOMER (name, phone, email) VALUES ('Nihal', '0745678901', 'nihal@gmail.com');
INSERT INTO CUSTOMER (name, phone, email) VALUES ('Rani', '0756789012', 'rani@gmail.com');


INSERT INTO SALES (medicine_id, customer_id, quantity, total_price) VALUES (1, 1, 2, 20.00);
INSERT INTO SALES (medicine_id, customer_id, quantity, total_price) VALUES (2, 2, 10, 120.00);
INSERT INTO SALES (medicine_id, customer_id, quantity, total_price) VALUES (3, 3, 3, 15.00);
INSERT INTO SALES (medicine_id, customer_id, quantity, total_price) VALUES (4, 4, 15, 45.00);
INSERT INTO SALES (medicine_id, customer_id, quantity, total_price) VALUES (5, 5, 10, 80.00);

COMMIT;

