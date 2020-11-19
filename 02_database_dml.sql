-- DML 表数据的增删改
-- DML 表数据的增删改
-- DML 表数据的增删改
DESC product2;

-- DML新增表数据

-- 给指定列添加数据
INSERT INTO product2 (id,NAME,price,stock,insert_name) VALUES (1,'手机',1999.99,25,'2020-11-11');
INSERT INTO product2 (id,NAME,price) VALUES (2,'电脑',3999.1);
-- 给全部列添加数据
INSERT INTO product2 VALUES (3,'冰箱',1995,25,'2020-12-21');
-- 批量添加数据
INSERT INTO product2 VALUES (3,'洗衣机',1952,52,'2020-12-22'),(3,'微波炉',562,21,'2020-05-22');

-- DML修改和删除表数据

-- 修改表中的数据
UPDATE product2 SET price=3999 WHERE NAME='手机';
UPDATE product2 SET price=1800,stock=99 WHERE NAME='电脑';
-- 删除表中的数据
DELETE FROM product2 WHERE NAME='微波炉';
DELETE FROM product2 WHERE price=10;




