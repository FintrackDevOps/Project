CREATE DATABASE finboardpern;

CREATE TABLE finboard(
  transaction_id SERIAL PRIMARY KEY,
  stock_abreviation VARCHAR(10),
  amount VARCHAR(255),
  buy_value VARCHAR(255),
  description VARCHAR(255)
);
