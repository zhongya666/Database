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
-- 1.开启事务 
START TRANSACTION;
 -- 转钱
UPDATE account SET money=money-500 WHERE `name`='张三';
UPDATE account SET money=money+500 WHERE `name`='李四';
-- 回滚事务 
ROLLBACK;
-- 提交事务 
COMMIT;

/*222222222222222222222222222
	事务的提交方式：手动0 自动1
	查看事务提交方式	SELECT @@autocommit;
	修改事务提交方式 set @@qutocommit=数字；
*/
SELECT @@autocommit;
SET @@autocommit = 1;
UPDATE account SET money=2500 WHERE `name`='张三';
COMMIT;

/*33333333333333333333333333333
	事务的四大特征 acid 
	1.原子性：要么成功、要么全部失败回滚
	2.一致性：从一个一致性状态换到另一个一致性状态 
	3.隔离性：多个并发事务之间要相互隔离 
	4.持久性：事务一旦被提交，那么对数据库中的数据的改变就是永久性的。
	
	隔离级别分类：
	1.read uncommitted 	读未提交 			脏读、不可重复读、幻读 
	2.read commit 			读已提交			不可重复读、幻读 
	3.repeatable read 	可重复读 			幻读 
	4.serializable 			串行化 			无 
	*脏读：在一个事务处理过程中读取到了另一个未提交事务中的数据 
	*不可重复读：在一个事务处理过程中读取到了另一个事务中修改并已提交的数据 
	*幻读：查询某个数据不存在，准备插入此记录，但执行插入时发现此记录已存在，无法插入。
				查询某个数据不存在，准备删除此记录，却删除成功。
	查询数据库的隔离级别 		select @@ tx_isolation 
	修改数据库隔离级别 		set GLOBAL TRANSACTION ISOLATION LEVEL 级别字符串 
*/
-- 查询数据库的隔离级别(mysql8已更新)
SELECT @@transaction_isolation;
-- 修改数据库隔离级别(mysql8已更新)
SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;
	