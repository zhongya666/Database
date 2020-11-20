-- 内连接查询
-- 内连接查询
-- 内连接查询
-- 查询的是两张表有交集的部分数据（有主外键关联的数据）

-- 显式内连接 select 列名 from 表名1 [inner] join 表名2 on 条件
-- 显式内连接 select 列名 from 表名1 [inner] join 表名2 on 条件
-- 显式内连接 select 列名 from 表名1 [inner] join 表名2 on 条件

-- 查询用户信息和对应的订单信息
SELECT * FROM USER INNER JOIN orderlist ON orderlist.`uid` = user.`id`;
-- 查询用户信息和对应的订单信息，起别名
SELECT * FROM USER u INNER JOIN orderlist o ON o.`uid` = u.`id`;
-- 查询用户姓名，年龄,订单编号
SELECT
	u.`name`,	-- 用户姓名
	u.`age`,	-- 用户年龄
	o.`number`	-- 订单编号
FROM
	USER u 		-- 用户表
INNER JOIN
	orderlist o 	-- 订单表
ON
	o.`uid`=u.`id`;
-- 隐式内连接 select 列名 from 表名1,表名2 where 条件
-- 隐式内连接 select 列名 from 表名1,表名2 where 条件
-- 隐式内连接 select 列名 from 表名1,表名2 where 条件

-- 查询用户姓名，年龄,订单编号
SELECT
	u.`name`,	-- 用户姓名
	u.`age`,	-- 用户年龄
	o.`number`	-- 订单编号
FROM
	USER u,
	orderlist o
WHERE
	o.`uid`=u.`id`;

-- 外连接查询
-- 外连接查询
-- 外连接查询

-- 左外连接：查询左表的全部数据，和左右两张表有交集部分的数据。
-- select 列名 from 表名1 left [outer] join 表名2 on 条件

-- 查询所有用户信息，以及用户对应的订单信息
SELECT
	u.*,
	o.`number`
FROM
	USER u
LEFT OUTER JOIN
	orderlist o
ON
	o.`uid`=u.`id`;


-- 右外连接：查询右表的全部数据，和左右两张表有交集部分的数据。
-- select 列名 from 表名1 right [outer] join 表名2 on 条件

-- 查询所有订单信息，以及订单所属的用户信息
SELECT
	o.*,
	u.`name`
FROM
	USER u
RIGHT OUTER JOIN
	orderlist o
ON
	o.`uid`=u.`id`;
