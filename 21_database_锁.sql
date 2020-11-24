/*
操作分类：
	共享锁：数据可以被多个事务查询，但是不能修改。
	排他锁：加锁的数据，不能被其他事务加锁查询或修改。
力度分类：
	表级锁：
	行级锁：
使用方式分类：
	悲观锁：
	乐观锁：

*/
CREATE DATABASE db10;
USE db10;
CREATE TABLE student(
	id INT PRIMARY KEY AUTO_INCREMENT,
	NAME VARCHAR(10),
	age INT,
	score INT
);
INSERT INTO student VALUES
(NULL,'张三',23,98),
(NULL,'李四',24,95),
(NULL,'王五',25,96),
(NULL,'赵六',26,94),
(NULL,'周七',27,99);

/*
	innodb共享锁
	innodb排他锁
*/

-- 1.开启事务
START TRANSACTION;
-- 2.查询id为1数据，并加入共享锁
SELECT * FROM student WHERE id=1 LOCK IN SHARE MODE;
-- 先执行2(在另一个窗口)修改id为1数据，姓名改成张三三（修改失败，只有窗口一提交事务后才能修改成功）
UPDATE student SET NAME='张三三' WHERE id=1;
-- 先执行2(在另一个窗口)修改id为2数据，姓名改成李四四（修改成功，innodb引擎默认加的是行锁）
UPDATE student SET NAME='张三三' WHERE id=1;
-- 3.查询分数为99的数据，并加入共享锁
SELECT * FROM student WHERE score=99 LOCK IN SHARE MODE;
-- (在另一个窗口)修改id=3数据，姓名改成王五五(修改失败，innodb引擎如果不采用带索引的列来加锁的话加的是表锁)
-- *****自己试过后可以修改，加的还是行锁
UPDATE student SET NAME='王五五' WHERE id=3;
COMMIT;

-- 排他锁
-- 1.开启事务
START TRANSACTION;
-- 查询id为1数据，并加入排他锁
SELECT * FROM student WHERE id=1 FOR UPDATE;
-- （在窗口2）查询id为1数据(普通查询没有问题)
SELECT * FROM student WHERE id=1;
-- (在窗口2）查询id为1数据,并加入共享锁 (排他锁和共享锁不兼容)
SELECT * FROM student WHERE id=1 LOCK IN SHARE MODE;
-- (在窗口2）查询id为1数据，并加入排他锁(排他锁和排他锁不兼容)
SELECT * FROM student WHERE id=1 FOR UPDATE;
-- (在窗口2）修改id为1数据，将姓名改为张三（修改失败，会出现锁的情况）
SELECT * FROM student WHERE id=1 FOR UPDATE;
COMMIT;


/*
	MySAM读锁
	特点：所有连接只能查询数据，不能修改。
*/
CREATE TABLE product(
	id INT PRIMARY KEY AUTO_INCREMENT,
	NAME VARCHAR(10),
	price INT
)ENGINE = MYISAM;	-- 指定存储引擎为MyISAM
INSERT INTO product VALUES
(NULL,'华为手机',4999),
(NULL,'小米手机',2999),
(NULL,'苹果',8999),
(NULL,'中兴',1999);
-- 为product表添加读锁
LOCK TABLE product READ;
-- 查询id为1数据
SELECT * FROM product WHERE id=1;
SELECT * FROM student WHERE id=1; -- 刚才这句话失败，解锁了就可以了
-- （在窗口2）修改id为1数据，将金额改为5999(失败，只有窗口1解锁才能修改成功)
UPDATE product SET price=5999 WHERE id=1;
-- （在本窗口）修改id为1数据，将金额改为4999(失败)
UPDATE product SET price=4999 WHERE id=1;
-- 解锁
UNLOCK TABLES;


/*
	MySAM写锁
	特点：其他链接不能查询和修改数据。
*/
-- 为product表添加写锁
LOCK TABLE product WRITE;
-- 查询
SELECT * FROM product;
-- 修改
UPDATE product SET price=1999 WHERE id=2;
-- (窗口2)查询（失败）
-- (窗口2)修改（失败）
-- 解锁
UNLOCK TABLE;

/*
悲观锁
乐观锁：	
*/
CREATE TABLE city(
	id INT PRIMARY KEY AUTO_INCREMENT,
	NAME VARCHAR(20),
	VERSION INT
);
INSERT INTO city VALUES
(NULL,'北京',1),
(NULL,'上海',1),
(NULL,'广州',1),
(NULL,'深圳',1);

	
	