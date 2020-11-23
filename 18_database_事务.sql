/*
	事务：一条或多条sql语句组成一个执行单元，其特点是这个单元要么同时成功、要么同时失败。
		单元中的每条sql语句都是相互依赖，形成一个整体。
		如果某条sql语句执行失败或者出现错误，那么整个单元就会撤回到事务最初的状态。
		如果单元中所有的sql语句都执行成功，则事务就顺利执行。
*/
CREATE DATABASE db8;
USE db8;
CREATE TABLE account(
	id INT PRIMARY KEY AUTO_INCREMENT,
	NAME VARCHAR(20),
	money DOUBLE
);
INSERT INTO account VALUES (NULL,'张三',1000),(NULL,'李四',1000);

-- 开启事务
-- 回滚事务
-- 提交事务

/*1111111111111111111111111111
	张三给李四转账500元
	1.张三账户-500
	2.李四账户+500
	
*/


	