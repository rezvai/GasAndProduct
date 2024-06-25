SELECT * FROM name; -- Выводим всю базу

ALTER TABLE name 
DROP COLUMN "Production Year"; -- Удаление столбца

ALTER TABLE name 
DROP COLUMN "Self-use Well"; -- Удаление столбца

ALTER TABLE name 
DROP COLUMN "Purchaser Codes"; -- Удаление столбца

ALTER TABLE name 
DROP COLUMN "Location"; -- Удаление столбца

UPDATE name SET "Operator" = lower("Operator"); -- Приведение столбца к нижнему регистру

UPDATE name SET "County" = lower("County"); -- Приведение столбца к нижнему регистру

UPDATE name SET "Town" = lower("Town"); -- Приведение столбца к нижнему регистру

UPDATE name SET "Field" = lower("Field"); -- Приведение столбца к нижнему регистру

UPDATE name SET "Producing Formation" = lower("Producing Formation"); -- Приведение столбца к нижнему регистру

UPDATE name SET "Production Date Entered" = to_char(to_date("Production Date Entered", 'MM/DD/YYYY'), 'MM-YYYY'); -- Приведение столбца к нижнему регистру

SELECT count("Production Date Entered")
FROM name
WHERE "Production Date Entered" = ''; -- Подсчет пустых значений

SELECT count("Operator")
FROM name
WHERE "Operator" = ''; -- Подсчет пустых значений

SELECT count("County")
FROM name
WHERE "County" = ''; -- Подсчет пустых значений

SELECT count("Town")
FROM name
WHERE "Town" = ''; -- Подсчет пустых значений

SELECT count("Field")
FROM name
WHERE "Field" = ''; -- Подсчет пустых значений

SELECT count("Producing Formation")
FROM name
WHERE "Producing Formation" = ''; -- Подсчет пустых значений

SELECT count("Active Oil Wells")
FROM name
WHERE "Active Oil Wells" = NULL; -- Подсчет пустых значений

SELECT count("Inactive Oil Wells")
FROM name
WHERE "Inactive Oil Wells" = NULL; -- Подсчет пустых значений

SELECT count("Active Gas Wells")
FROM name
WHERE "Active Gas Wells" = NULL; -- Подсчет пустых значений

SELECT count("Inactive Gas Wells")
FROM name
WHERE "Inactive Gas Wells" = NULL; -- Подсчет пустых значений

SELECT count("Disposal Wells")
FROM name
WHERE "Disposal Wells" = NULL; -- Подсчет пустых значений

SELECT count("Injection Wells")
FROM name
WHERE "Injection Wells" = NULL; -- Подсчет пустых значений

SELECT count("Gas Produced, Mcf")
FROM name
WHERE "Gas Produced, Mcf" = NULL; -- Подсчет пустых значений

SELECT count("Oil Produced, bbl")
FROM name
WHERE "Oil Produced, bbl" = NULL; -- Подсчет пустых значений

SELECT count("Water produced, bbl")
FROM name
WHERE "Water produced, bbl" = NULL; -- Подсчет пустых значений

SELECT count("Taxable Gas, Mcf")
FROM name
WHERE "Taxable Gas, Mcf" = NULL; -- Подсчет пустых значений

DELETE FROM name
WHERE "County" = ''; -- Удаление пустых значений

DELETE FROM name
WHERE "Town" = ''; -- Удаление пустых значений

DELETE FROM name
WHERE "Field" = ''; -- Удаление пустых значений

DELETE FROM name
WHERE "Porducing Formation" = ''; -- Удаление пустых значений

SELECT "Taxable Gas, Mcf", "Gas Produced, Mcf" FROM name WHERE "Taxable Gas, Mcf" > "Gas Produced, Mcf"; -- Вывод аномальных значений

SELECT count(*)
FROM name
WHERE "Active Gas Wells" = 0 AND "Inactive Gas Wells" = 0 AND "Active Oil Wells" = 0 AND "Inactive Oil Wells" = 0 AND "Disposal Wells" = 0 AND "Injection Wells" = 0 AND "Gas Produced, Mcf" > 0; -- Вывод аномальных значений

SELECT count(*)
FROM name
WHERE "Active Gas Wells" = 0 AND "Inactive Gas Wells" = 0 AND "Active Oil Wells" = 0 AND "Inactive Oil Wells" = 0 AND "Disposal Wells" = 0 AND "Injection Wells" = 0 AND "Oil Produced, bbl" > 0; -- Вывод аномальных значений

DELETE FROM name
WHERE "Active Gas Wells" = 0 AND "Inactive Gas Wells" = 0 AND "Active Oil Wells" = 0 AND "Inactive Oil Wells" = 0 AND "Disposal Wells" = 0 AND "Injection Wells" = 0 AND "Gas Produced, Mcf" > 0; -- Удаление аномальных значений

DELETE FROM name
WHERE "Active Gas Wells" = 0 AND "Inactive Gas Wells" = 0 AND "Active Oil Wells" = 0 AND "Inactive Oil Wells" = 0 AND "Disposal Wells" = 0 AND "Injection Wells" = 0 AND "Oil Produced, bbl" > 0; -- Удаление аномальных значений

SELECT * FROM name; -- Выводим всю базу

