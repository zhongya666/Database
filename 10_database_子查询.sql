-- 子查询	查询语句中嵌套了查询语句，我们将嵌套的查询称为子查询
-- 子查询	SELECT 列名 from表名 where 列名=（selete 列名 from 表名 【where 条件】）
-- 子查询

-- 查询年龄最高的用户姓名(子查询单行单列)
SELECT `name`,age FROM `user` WHERE age=(SELECT MAX(age) FROM `user`);
-- 查询张三和李四的订单信息(子查询多行单列)
SELECT * FROM orderlist WHERE uid IN (1,2);
SELECT id FROM `user` WHERE `name` IN ('张三','李四');
SELECT * FROM orderlist WHERE uid IN (SELECT id FROM `user` WHERE `name` IN ('张三','李四'));
-- 查询订单表中ID大于4的订单信息和所属用户信息 (查询的结果是多行多列)
SELECT * FROM orderlist WHERE id>4;
SELECT
	u.`name`,
	o.number
FROM
	`user` u,
	(SELECT * FROM orderlist WHERE id>4) o
WHERE
	o.uid = u.id;
	


	
