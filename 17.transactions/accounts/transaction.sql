BEGIN; -- початок транзакції

-- зменшуємо баланс Alice
UPDATE accounts
SET balance = balance - 200.00
WHERE name = 'Alice';

-- перевірка, що в Alice вистачає коштів (можна додати перевірку в коді)
-- збільшуємо баланс Bob
UPDATE accounts
SET balance = balance + 200.00
WHERE name = 'Bob';

COMMIT; -- підтвердження транзакції


--ROLLBACK -- скасовує всі зміни в межах транзакції



----- Дефолтний приклад помилки ( non executable)

UPDATE accounts SET balance = balance - 200.00 WHERE name = 'Alice';
-- раптом тут сталася помилка, і другий запит не виконався
UPDATE accounts SET balance = balance + 200.00 WHERE name = 'Bob';
