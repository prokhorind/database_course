CREATE TABLE accounts (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    balance NUMERIC(12, 2) NOT NULL CHECK (balance >= 0)
);


INSERT INTO accounts (name, balance) VALUES
('Alice', 1000.00),
('Bob', 500.00);


