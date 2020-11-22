-- 1.查询用户的编号、姓名、年龄、订单编号。
/*
分析 
	编号、姓名、年龄 user表 
	订单编号	orderlist表
	条件：use.id=orderlist.uid 
*/
SELECT
	u.id,
	u.`name`,
	u.age,
	o.number
FROM
	`user` u,
	orderlist o 
WHERE
	u.id=o.uid;
	
-- 2.查询所有的用户。用户的编号、姓名、年龄、订单编号。 
/*
	编号、姓名、年龄 user表 
	订单编号	orderlist表 
	条件：use.id=orderlist.uid 
	查询所有的用户，左外连接 
*/
SELECT
	u.id,
	u.`name`,
	u.age,
	o.number
FROM
	`user` u
LEFT JOIN
	orderlist o 
ON
	u.id=o.uid;
	
-- 查询所有的订单。用户的编号、姓名、年龄、订单编号。
/*
	编号、姓名、年龄 user表 
	订单编号	orderlist表 
	条件：use.id=orderlist.uid 
	查询所有的订单，右外连接 
*/
SELECT
	u.id,
	u.`name`,
	u.age,
	o.number
FROM
	`user` u
RIGHT JOIN
	orderlist o 
ON
	u.id=o.uid;


	