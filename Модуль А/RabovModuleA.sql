SELECT * FROM oil_and_gas_summary_production_data oagspd -- Вывод всей таблицы для дальнейшего анализа 

ALTER TABLE oil_and_gas_summary_production_data 
DROP COLUMN "Production Year"; -- Удаление столбца

ALTER TABLE oil_and_gas_summary_production_data 
DROP COLUMN "Self-use Well"; -- Удаление столбца

ALTER TABLE oil_and_gas_summary_production_data 
DROP COLUMN "Purchaser Codes"; -- Удаление столбца

ALTER TABLE oil_and_gas_summary_production_data 
DROP COLUMN "Location"; -- Удаление столбца

UPDATE oil_and_gas_summary_production_data SET "Operator" = lower("Operator") -- Приведение столбца к нижнему регистру

UPDATE oil_and_gas_summary_production_data SET "County" = lower("County") -- Приведение столбца к нижнему регистру

UPDATE oil_and_gas_summary_production_data SET "Town" = lower("Town") -- Приведение столбца к нижнему регистру

UPDATE oil_and_gas_summary_production_data SET "Field" = lower("Field") -- Приведение столбца к нижнему регистру

UPDATE oil_and_gas_summary_production_data SET "Producing Formation" = lower("Producing Formation") -- Приведение столбца к нижнему регистру

UPDATE oil_and_gas_summary_production_data SET "Production Date Entered" =  to_char(to_date("Production Date Entered", 'MM/DD/YYYY'), 'MM-YYYY') -- Изминение формата даты в столбце

SELECT count("Production Date Entered") 
FROM oil_and_gas_summary_production_data 
WHERE "Production Date Entered" = ''; -- Подсчет пустых значений в столбце 

SELECT count("Operator") 
FROM oil_and_gas_summary_production_data 
WHERE "Operator" = ''; -- Подсчет пустых значений в столбце 
 
SELECT count("County") 
FROM oil_and_gas_summary_production_data 
WHERE "County" = ''; -- Подсчет пустых значений в столбце 

SELECT count("Town") 
FROM oil_and_gas_summary_production_data 
WHERE "Town" = ''; -- Подсчет пустых значений в столбце 

SELECT count("Field") 
FROM oil_and_gas_summary_production_data 
WHERE "Field" = ''; -- Подсчет пустых значений в столбце 

SELECT count("Producing Formation") 
FROM oil_and_gas_summary_production_data 
WHERE "Producing Formation" = ''; -- Подсчет пустых значений в столбце 

SELECT count("Active Oil Wells") 
FROM oil_and_gas_summary_production_data 
WHERE "Active Oil Wells" = NULL; -- Подсчет пустых значений в столбце 

SELECT count("Inactive Oil Wells") 
FROM oil_and_gas_summary_production_data 
WHERE "Inactive Oil Wells" = NULL; -- Подсчет пустых значений в столбце 

SELECT count("Active Gas Wells") 
FROM oil_and_gas_summary_production_data 
WHERE "Active Gas Wells" = NULL; -- Подсчет пустых значений в столбце 

SELECT count("Inactive Gas Wells") 
FROM oil_and_gas_summary_production_data 
WHERE "Inactive Gas Wells" = NULL; -- Подсчет пустых значений в столбце 

SELECT count("Injection Wells") 
FROM oil_and_gas_summary_production_data 
WHERE "Injection Wells" = NULL; -- Подсчет пустых значений в столбце 

SELECT count("Disposal Wells") 
FROM oil_and_gas_summary_production_data 
WHERE "Disposal Wells" = NULL; -- Подсчет пустых значений в столбце 

SELECT count("Oil Produced, bbl") 
FROM oil_and_gas_summary_production_data 
WHERE "Oil Produced, bbl" = NULL; -- Подсчет пустых значений в столбце 

SELECT count("Gas Produced, Mcf") 
FROM oil_and_gas_summary_production_data 
WHERE "Gas Produced, Mcf" = NULL; -- Подсчет пустых значений в столбце 

SELECT count("Water produced, bbl") 
FROM oil_and_gas_summary_production_data 
WHERE "Water produced, bbl" = NULL; -- Подсчет пустых значений в столбце 

SELECT count("Taxable Gas, Mcf") 
FROM oil_and_gas_summary_production_data 
WHERE "Taxable Gas, Mcf" = NULL; -- Подсчет пустых значений в столбце 

DELETE FROM oil_and_gas_summary_production_data WHERE "County" = ''; -- Удаление пропусков

DELETE FROM oil_and_gas_summary_production_data WHERE "Town" = ''; -- Удаление пропусков

DELETE FROM oil_and_gas_summary_production_data WHERE "Field" = ''; -- Удаление пропусков

DELETE FROM oil_and_gas_summary_production_data WHERE "Producing Formation" = ''; -- Удаление пропусков

SELECT "Taxable Gas, Mcf", "Gas Produced, Mcf" FROM oil_and_gas_summary_production_data oagspd  WHERE "Taxable Gas, Mcf" > "Gas Produced, Mcf"  -- Вывод аномальных значений

SELECT count(*)
FROM oil_and_gas_summary_production_data
WHERE "Active Oil Wells" = 0 AND "Inactive Oil Wells" = 0 AND "Active Gas Wells" = 0 AND "Inactive Gas Wells" = 0 AND "Disposal Wells" = 0 AND "Injection Wells" = 0 AND "Oil Produced, bbl" > 1; -- Подсчет аномальных значений

SELECT count(*)
FROM oil_and_gas_summary_production_data
WHERE "Active Gas Wells" = 0 AND "Inactive Gas Wells" = 0 AND "Active Oil Wells" = 0 AND "Inactive Oil Wells" = 0 AND "Disposal Wells" = 0 AND "Injection Wells" = 0 AND "Gas Produced, Mcf" > 1; -- Подсчет аномальных значений

SELECT * FROM oil_and_gas_summary_production_data oagspd WHERE "Oil Produced, bbl" > 10000000 or "Gas Produced, Mcf" > 10000000 -- Просмотр аномальных значений

DELETE FROM oil_and_gas_summary_production_data WHERE "Active Oil Wells" = 0 AND "Inactive Oil Wells" = 0 AND "Active Gas Wells" = 0 AND "Inactive Gas Wells" = 0 AND "Disposal Wells" = 0 AND "Injection Wells" = 0 AND "Oil Produced, bbl" > 1; -- Удаление аномальных значений

DELETE FROM oil_and_gas_summary_production_data WHERE "Active Gas Wells" = 0 AND "Inactive Gas Wells" = 0 AND "Active Oil Wells" = 0 AND "Inactive Oil Wells" = 0 AND "Disposal Wells" = 0 AND "Injection Wells" = 0 AND "Gas Produced, Mcf" > 1; -- Удаление аномальных значений

SELECT * FROM oil_and_gas_summary_production_data oagspd -- Вывод всей базы