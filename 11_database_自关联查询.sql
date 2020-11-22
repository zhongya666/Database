-- 自关联查询
-- 自关联查询
-- 自关联查询

-- 创建员工表 
CREATE TABLE employee(
	id INT PRIMARY KEY AUTO_INCREMENT,	-- 员工编号
	name VARCHAR(20),										-- 员工姓名
	mgr INT, 														-- 上级编号 
	salary DOUBLE 											-- 员工工资 
);
INSERT INTO employee VALUES 
(1001,'孙悟空',1005,9000.00),
(1002,'猪八戒',1005,8000.00),
(1003,'沙和尚',1005,8500.00),
(1004,'小白龙',1005,7900.00),
(1005,'唐僧',NULL,15000.00),
(1006,'武松',1009,7600.00),
(1007,'李逵',1009,7400.00),
(1008,'林冲',1009,8100.00),
(1009,'宋江',NULL,16000.00);

-- 查询所有员工的姓名及其直接上级的姓名，没有上级的员工也需要查询 
/*
分析 
	员工信息 employee 表 
	条件：employee.mgr=employee.id 
	查询左表的全部数据，和左右两张表有交集部分数据，左外连接 
*/
SELECT
	e1.id,
	e1.`name`,
	e1.mgr,
	e2.id,
	e2.`name`
FROM
	employee e1 
LEFT OUTER JOIN
	employee e2 
ON
	e1.mgr=e2.id;
