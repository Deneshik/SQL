1) Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол. Вывести: model, speed и hd

SELECT model, speed, hd
FROM pc
WHERE price < 500

===============================================================================================================

2) Найдите производителей принтеров. Вывести: maker

SELECT DISTINCT maker FROM product
WHERE type = 'printer'

===============================================================================================================

3) Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов, цена которых превышает 1000 дол.

SELECT model, ram, screen
FROM laptop
WHERE price > 1000

===============================================================================================================

4) Найдите все записи таблицы Printer для цветных принтеров.

SELECT *
FROM printer
WHERE color = 'y'

===============================================================================================================

5) Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол.

SELECT model, speed, hd
FROM pc
WHERE (cd = '12x' OR cd = '24x') AND price < 600

===============================================================================================================

6) Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт, найти скорости таких ПК-блокнотов. Вывод: производитель, скорость.

SELECT DISTINCT maker, speed 
FROM Product INNER JOIN 
Laptop on Product.model = Laptop.model 
WHERE hd >= 10

===============================================================================================================

7) Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква).

SELECT DISTINCT pc.model, price
FROM pc JOIN product on pc.model = product.model
WHERE maker = 'B'
UNION
SELECT DISTINCT laptop.model, price
FROM laptop JOIN product on laptop.model = product.model
WHERE maker = 'B'
UNION
SELECT DISTINCT printer.model, price
FROM printer JOIN product on printer.model = product.model
WHERE maker = 'B'

===============================================================================================================

8) Найдите производителя, выпускающего ПК, но не ПК-блокноты.

SELECT maker
FROM product
WHERE type = 'pc'
EXCEPT
SELECT maker
FROM product
WHERE type = 'laptop'

===============================================================================================================

9) Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker

SELECT maker
FROM pc JOIN product ON pc.model = product.model
WHERE type = 'pc' AND speed >= 450
GROUP BY maker

===============================================================================================================

10) Найдите модели принтеров, имеющих самую высокую цену. Вывести: model, price

SELECT model, price
FROM printer
WHERE price = (SELECT MAX(price) FROM printer)

===============================================================================================================

11) Найдите среднюю скорость ПК.

SELECT AVG(speed)
FROM pc

===============================================================================================================

12) Найдите среднюю скорость ПК-блокнотов, цена которых превышает 1000 дол.

SELECT AVG(speed) Avg_speed
FROM laptop
WHERE price > 1000

===============================================================================================================

13) Найдите среднюю скорость ПК, выпущенных производителем A.

SELECT AVG(speed) avg_speed
FROM pc JOIN product ON product.model = pc.model
WHERE maker = 'A'

===============================================================================================================

14) Найдите класс, имя и страну для кораблей из таблицы Ships, имеющих не менее 10 орудий.

SELECT ships.class, ships.name, country
FROM ships JOIN classes ON classes.class = ships.class
WHERE numguns >= 10

===============================================================================================================

15) Найдите размеры жестких дисков, совпадающих у двух и более PC. Вывести: HD

SELECT hd
FROM pc
GROUP BY hd
HAVING COUNT (*) >= 2

===============================================================================================================

16) Найдите пары моделей PC, имеющих одинаковые скорость и RAM. В результате каждая пара указывается только один раз, т.е. (i,j), но не (j,i), Порядок вывода: модель с большим номером, модель с меньшим номером, скорость и RAM.

SELECT DISTINCT pc_1.model, pc_2.model, pc_1.speed, pc_1.ram
FROM pc pc_1, pc pc_2
WHERE pc_1.speed = pc_2.speed AND pc_1.ram = pc_2.ram AND pc_1.model > pc_2.model

===============================================================================================================

17) Найдите модели ПК-блокнотов, скорость которых меньше скорости каждого из ПК.
Вывести: type, model, speed

SELECT DISTINCT type, laptop.model, speed
FROM laptop JOIN product ON product.model = laptop.model
WHERE speed < ALL (SELECT speed FROM pc)

===============================================================================================================

18) Найдите производителей самых дешевых цветных принтеров. Вывести: maker, price

SELECT maker, price
FROM printer JOIN product ON product.model = printer.model
WHERE price = (SELECT MIN(price) FROM printer WHERE color = 'y') AND color = 'y'
GROUP BY maker, price

===============================================================================================================

19) Для каждого производителя, имеющего модели в таблице Laptop, найдите средний размер экрана выпускаемых им ПК-блокнотов. Вывести: maker, средний размер экрана.

SELECT maker, AVG(screen) avg_screen
FROM laptop JOIN product ON product.model = laptop.model
GROUP BY maker

===============================================================================================================

20) Найдите производителей, выпускающих по меньшей мере три различных модели ПК. Вывести: Maker, число моделей ПК.

SELECT maker, COUNT(model)
FROM product
WHERE type = 'pc'
GROUP BY maker
HAVING COUNT(model) >= 3

===============================================================================================================

21) Найдите максимальную цену ПК, выпускаемых каждым производителем, у которого есть модели в таблице PC.
Вывести: maker, максимальная цена.

SELECT maker, MAX(price)
FROM pc JOIN product ON product.model = pc.model
GROUP BY maker

===============================================================================================================

22) Для каждого значения скорости ПК, превышающего 600 МГц, определите среднюю цену ПК с такой же скоростью. Вывести: speed, средняя цена.

SELECT speed, AVG(price)
FROM pc
WHERE speed > 600
GROUP BY speed

===============================================================================================================

23) Найдите производителей, которые производили бы как ПК со скоростью не менее 750 МГц, так и ПК-блокноты со скоростью не менее 750 МГц. Вывести: Maker

SELECT maker
FROM pc JOIN product ON product.model = pc.model
WHERE speed >= 750 
INTERSECT 
SELECT maker
FROM laptop JOIN product ON product.model = laptop.model
WHERE speed >= 750

===============================================================================================================

24) Перечислите номера моделей любых типов, имеющих самую высокую цену по всей имеющейся в базе данных продукции.

SELECT model FROM (
SELECT model, price FROM pc
UNION
SELECT model, price FROM laptop
UNION
SELECT model, price FROM printer
) this_table WHERE price = (
SELECT MAX(price) FROM (
SELECT model, price FROM pc
UNION
SELECT model, price FROM laptop
UNION
SELECT model, price FROM printer
) this_table_2
)

===============================================================================================================

25) Найдите производителей принтеров, которые производят ПК с наименьшим объемом RAM и с самым быстрым процессором среди всех ПК, имеющих наименьший объем RAM. Вывести: Maker

SELECT DISTINCT maker
FROM pc JOIN product ON product.model = pc.model
WHERE maker IN (
SELECT DISTINCT maker
FROM product
WHERE type = 'printer'
)
AND speed = (SELECT MAX(speed) FROM pc WHERE ram = (SELECT MIN(ram) FROM pc))
AND ram = (SELECT MIN(ram) FROM pc)

===============================================================================================================

26) Найдите среднюю цену ПК и ПК-блокнотов, выпущенных производителем A (латинская буква). Вывести: одна общая средняя цена.

SELECT SUM(prices) / SUM(models) avg_price 
FROM(
SELECT COUNT(pc.model) models, SUM(price) prices FROM pc JOIN product ON product.model = pc.model WHERE maker = 'A'
UNION
SELECT COUNT(laptop.model), SUM(price) FROM laptop JOIN product ON product.model = laptop.model WHERE maker = 'A'
) this_table

===============================================================================================================

27) Найдите средний размер диска ПК каждого из тех производителей, которые выпускают и принтеры. Вывести: maker, средний размер HD.

SELECT maker, AVG(hd) avg_hd
FROM pc JOIN product ON product.model = pc.model
WHERE maker IN(
SELECT DISTINCT maker FROM product WHERE type = 'printer'
) GROUP BY maker

===============================================================================================================

28) Используя таблицу Product, определить количество производителей, выпускающих по одной модели.

SELECT COUNT(maker) qty FROM(
SELECT maker FROM product
GROUP BY maker HAVING COUNT(*) = 1
) this_table

===============================================================================================================

29) В предположении, что приход и расход денег на каждом пункте приема фиксируется не чаще одного раза в день [т.е. первичный ключ (пункт, дата)], написать запрос с выходными данными (пункт, дата, приход, расход). Использовать таблицы Income_o и Outcome_o.

SELECT income_o.point, income_o.[date], inc, out FROM income_o
LEFT JOIN outcome_o ON outcome_o.point = income_o.point AND outcome_o.[date] = income_o.[date]
UNION
SELECT outcome_o.point, outcome_o.[date], inc, out FROM income_o
RIGHT JOIN outcome_o ON outcome_o.point = income_o.point AND outcome_o.[date] = income_o.[date]

===============================================================================================================

30) В предположении, что приход и расход денег на каждом пункте приема фиксируется произвольное число раз (первичным ключом в таблицах является столбец code), требуется получить таблицу, в которой каждому пункту за каждую дату выполнения операций будет соответствовать одна строка.
Вывод: point, date, суммарный расход пункта за день (out), суммарный приход пункта за день (inc). Отсутствующие значения считать неопределенными (NULL).

SELECT point, [date], SUM(outs), SUM(incs) FROM(
SELECT point, [date], SUM(out) outs, null incs FROM outcome GROUP BY point, [date]
UNION
SELECT point, [date], null, SUM(inc) FROM income GROUP BY point, [date]
) this_table GROUP BY point, [date]

===============================================================================================================











