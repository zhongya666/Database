/*
	索引的本质是数据结构
	功能分类：
		普通索引
		唯一索引
		主键索引
		联合索引
		外键索引
		全文索引
	结构分类：
		BTree索引
		Hash索引
	索引的原理：
		磁盘存储：系统从磁盘读取数据到内存时是以磁盘块为基本单位的。
		BTree：	每个节点不仅包含key值，还有数据。会增加查询数据时磁盘的IO次数。
		B+Tree:	
			非叶子节点只会保存键值。
			所有数据存储在叶子节点。
			所有叶子节点之间都有连接指针。	
			
			好处：提高查询速度、减少磁盘的IO次数、树型结构较小。	
	索引的设计原则：
		1.对查询频次较高，且数据量比较大的表建立索引。
		2.使用唯一索引，区分度越高，使用索引的效率越高。
		3.索引字段的选择，最佳候选列应当从where字句的条件中提取。
		4.索引虽然可以有效的提升查询数据库的效率，但并不是多多益善。
*/
CREATE DATABASE db9;
USE db9;
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

-- 创建索引
-- 创建索引
-- 创建索引
-- 为student表中的name列创建一个普通索引
CREATE INDEX idx_name ON student(NAME);
-- 为student表中的age列创建一个唯一索引
CREATE UNIQUE INDEX idx_age ON student(age);

-- 查看索引
-- 查看索引
-- 查看索引
-- 查询student表中的索引（主键列自带主键索引）
SHOW INDEX FROM student;
-- 查询db4数据库中的porduct表中的索引（外键列自带外键索引）
SHOW INDEX FROM product;

-- 添加索引
-- 添加索引
-- 添加索引
-- 为student表中score列添加唯一索引
ALTER TABLE student ADD UNIQUE idx_score(score);

-- 删除索引
-- 删除索引
-- 删除索引
DROP INDEX idx_score ON student;






















	
	