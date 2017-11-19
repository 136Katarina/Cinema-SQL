DROP TABLE IF EXISTS screenings;
DROP TABLE IF EXISTS tickets;
DROP TABLE IF EXISTS films;
DROP TABLE IF EXISTS customers;




CREATE TABLE customers (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  funds INT2
);


CREATE TABLE films (
  id SERIAL8 PRIMARY KEY,
  title VARCHAR(255),
  price INT2
);

CREATE TABLE tickets (
  id SERIAL8 PRIMARY KEY,
  customer_id INT8 REFERENCES customers(id),
  film_id INT8 REFERENCES films(id)
);

CREATE TABLE screenings (
  id SERIAL8 PRIMARY KEY,
  film_id INT8 REFERENCES films(id) ON DELETE CASCADE,
  show_time VARCHAR(255)
);
