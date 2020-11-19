-- DQL 表数据的查询
-- DQL 表数据的查询
-- DQL 表数据的查询

-- 创建数据库
CREATE DATABASE db1;

-- 使用db1
USE db1;

-- 创建数据表
CREATE TABLE product(
	id INT,			-- 编号
	NAME VARCHAR(20),	-- 名称
	price DOUBLE,		-- 价格
	brand VARCHAR(10),	-- 品牌
	stock INT,		-- 库存
	insert_time DATE  	-- 添加数据
);

-- 添加数据
INSERT INTO product VALUES
(1,'华为手机',1999,'华为',23,'2020-11-11'),
(2,'小米手机',2999,'小米',33,'2020-11-12'),
(3,'苹果手机',3999,'苹果',43,'2020-11-13'),
(4,'华为电脑',4999,'华为',53,'2020-11-14'),
(5,'小米电脑',5999,'小米',63,'2020-11-15'),
(6,'苹果电脑',6999,'苹果',73,'2020-11-16'),
(7,'联想电脑',7999,'联想',NULL,'2020-11-17');


-- 查询全部
-- 查询全部
-- 查询全部

-- DQL表数据查询
-- select字段列表
-- from表名列表
-- where条件列表
-- group by分组字段
-- having分组后的过滤条件
-- order by排序
-- limit分页 

-- 查询全部的表数据
SELECT * FROM product;	
-- 查询指定字段的表数据
SELECT NAME,price,brand FROM product;
-- 去除重复查询
SELECT brand FROM product;
SELECT DISTINCT brand FROM product;
-- 计算列的值
SELECT NAME,stock+10 FROM product;
SELECT NAME,IFNULL(stock,0)+10 FROM product;
-- 起别名查询
SELECT NAME,IFNULL(stock,0)+10 AS getSum FROM product;

-- 条件查询
-- 条件查询
-- 条件查询
-- select 列名表名 from 表名 where 条件
SELECT * FROM product WHERE stock > 20;
SELECT * FROM product WHERE brand='华为';
SELECT * FROM product WHERE price >=4000 AND price <= 6000;
SELECT * FROM product WHERE price BETWEEN 4000 AND 6000;-- 或
SELECT * FROM product WHERE stock=23 OR stock=33 OR stock=43;
SELECT * FROM product WHERE stock IN (13,23,33); -- 或
SELECT * FROM product WHERE stock IS NULL;
SELECT * FROM product WHERE stock IS NOT NULL;
SELECT * FROM product WHERE NAME LIKE '小米%'; -- 查询名称以小米为开头的商品信息
SELECT * FROM product WHERE NAME LIKE '_为%';  -- 查询名称第二个字是为的商品信息
SELECT * FROM product WHERE NAME LIKE '____';	-- 查询商品名称为四个字符的商品信息
SELECT * FROM product WHERE NAME LIKE '%电脑%';	-- 查询名称中包含电脑的商品信息

-- DQL 聚合函数查询
-- DQL 聚合函数查询
-- DQL 聚合函数查询

SELECT COUNT(*) FROM product;	-- 计算product表中总记录条数
SELECT MAX(price) FROM product;	-- 获取最高价格
SELECT MIN(stock) FROM product;	-- 获取最低价格
SELECT SUM(stock) FROM product;	 -- 获取总库存数量
SELECT SUM(stock) FROM product WHERE brand='苹果';	-- 获取品牌为苹果的总库存数量
SELECT AVG(price) FROM product WHERE brand='小米';	-- 获取品牌为小米的平均商品价格

-- DQL排序查询
-- DQL排序查询
-- DQL排序查询
SELECT * FROM product ORDER BY stock ASC;	-- 按照库存的升序做一个排序
SELECT * FROM product WHERE NAME LIKE "%手机%" ORDER BY price DESC;	-- 查询名称中包含手机的商品信息。按照金额降序排序
SELECT * FROM product ORDER BY price ASC,stock DESC;-- 按照金额升序排序，如果金额相同，按照库存降序排序

-- DQL 分组查询
-- DQL 分组查询
-- DQL 分组查询
SELECT brand,SUM(price) FROM product GROUP BY brand;	-- 按照品牌分组，获取每组商品的总金额
SELECT brand,SUM(price) FROM product WHERE price>4000 GROUP BY brand;-- 对于金额大于4000的商品，按照品牌分组，获取每组商品的总金额
-- 对金额大于4000元的商品，按照品牌分组，获取每组商品的总金额，只显示总金额大于7000元的
SELECT brand,SUM(price) getSum FROM product WHERE price>4000 GROUP BY brand HAVING getSum > 7000;
-- 对金额大于4000元的商品，按照品牌分组，获取每组商品的总金额，只显示总金额大于7000元的，并按照总金额降序进行排序
SELECT brand,SUM(price) getSum FROM product 
WHERE price>4000 
GROUP BY brand 
HAVING getSum > 7000 
ORDER BY getSum DESC;

-- DQL 分页查询
-- DQL 分页查询
-- DQL 分页查询

-- limit 当前页数，每页显示的条数
-- 当前页数=（当前页数-1）* 每页显示的条数

-- 第一页 当前页数=(1-1)*3
SELECT * FROM product LIMIT 0,3;
-- 第二页 当前页数=(2-1)*3
SELECT * FROM product LIMIT 3,3;
-- 第三页 当前页数=(3-1)*3
SELECT * FROM product LIMIT 6,3;








