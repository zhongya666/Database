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
	
-- 3.查询所有的订单。用户的编号、姓名、年龄、订单编号。
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

-- 4.查询用户年龄大于23岁的信息。显示用户的编号、姓名、年龄、订单编号。
/*
	编号、姓名、年龄 user表 
	订单编号	orderlist表 
	条件：use.id=orderlist.uid and user.age>23
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
	u.id = o.uid
	AND
	u.age > 23;

-- 5.查询张三和李四用户的信息。显示用户的编号、姓名、年龄、订单编号。
/*
	编号、姓名、年龄 user表 
	订单编号	orderlist表 
	条件：use.id=orderlist.uid and user.name in ('张三','李四')
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
	u.id = o.uid
	AND
	u.`name` IN ('张三','李四');
	
-- 6.查询商品分类的编号、分类的名称、分类下的商品名称。
/*
	商品分类编号、分类名称	category
	商品名称	product表
	条件：category.id=product.cid
*/
SELECT
	c.`id`,
	c.`name`,
	p.`name`
FROM
	category c,
	product	p
WHERE
	c.`id`=p.`cid`;
	
-- 7.查询所有的商品分类。商品分类的编号、分类名称、分类下的商品名称。
/*
	商品分类编号、分类名称	category
	商品名称	product表
	条件：category.id=product.cid
	查询所有的商品分类，左外连接
*/
SELECT
	c.`id`,
	c.`name`,
	p.`name`
FROM
	category c
LEFT JOIN
	product	p
ON
	c.`id`=p.`cid`;
	
-- 8.查询所有的商品信息。商品分类的编号、分类名称、分类下的商品名称。
/*
	商品分类编号、分类名称	category
	商品名称	product表
	条件：category.id=product.cid
	查询所有的商品信息，右外连接
*/
SELECT
	c.`id`,
	c.`name`,
	p.`name`
FROM
	category c
RIGHT JOIN
	product	p
ON
	c.`id`=p.`cid`;
	
-- 9.查询所有的用户和该用户能查看的所有的商品。显示用户的编号、姓名、年龄、商品名称。
/*
	用户的编号、姓名、年龄	user表
	商品名称	product表
	中间表	us_pro
	条件：us_pro.uid=user.id and us_pro.pid=product.id
*/
SELECT
	u.`id`,
	u.`name`,
	u.`age`,
	p.`name`
FROM
	`user` u,
	product p,
	us_pro up
WHERE
	up.`uid`=u.`id`
	AND
	up.`pid`=p.`id`;
	
-- 10.查询张三和李四这两个用户可以看到的商品。显示用户的编号、姓名、年龄、商品名称。
/*
	用户的编号、姓名、年龄	user表
	商品名称	product表
	中间表	us_pro
	条件：us_pro.uid=user.id and us_pro.pid=product.id and user.name in ('张三','李四')
*/
SELECT
	u.`id`,
	u.`name`,
	u.`age`,
	p.`name`
FROM
	`user` u,
	product p,
	us_pro up
WHERE
	up.`uid`=u.`id`
	AND
	up.`pid`=p.`id`
	AND
	u.`name`IN ('张三','李四');
		
	



	