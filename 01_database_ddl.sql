-- 编写sql语句

-- DDL数据库的查询和创建
-- DDL数据库的查询和创建
-- DDL数据库的查询和创建
-- 查询所有数据库
SHOW DATABASES;

-- 查询mysql数据库的创建语句
SHOW CREATE DATABASE mysql;

-- 创建数据库
CREATE DATABASE db1;

-- 创建数据库db2 
CREATE DATABASE IF NOT EXISTS db2;

-- 创建数据库db3 指定字符集utf8
CREATE DATABASE db3 CHARACTER SET utf8;

-- 查看数据库字符集
SHOW CREATE DATABASE db3;

-- 练习：创建db4，如果不存在则创建，指定字符集为gbk
CREATE DATABASE IF NOT EXISTS db4 CHARACTER SET gbk;

-- 查看数据库字符集
SHOW CREATE DATABASE db4;

-- DDL 操作数据库
-- DDL 操作数据库
-- DDL 操作数据库

-- 修改数据库字符集
ALTER DATABASE db4 CHARACTER SET utf8;

-- 删除数据库
DROP DATABASE db1;

-- 删除数据库（判空）
DROP DATABASE IF EXISTS db1;

-- 使用数据库
USE db3;

-- 查看当前数据库
SELECT DATABASE();

-- DDL 数据表
-- DDL 数据表
-- DDL 数据表
-- 数据表的查询

-- 查询所有数据表
USE mysql;
SHOW TABLES;

-- 查询表结构
DESC USER;

-- 查询表字符集
SHOW TABLE STATUS FROM mysql LIKE 'user';

-- 创建数据表
-- 创建一个product商品表（商品编号，商品名称，价格，库存，上架时间）

CREATE TABLE product(
	id INT,
	NAME VARCHAR(20),
	price DOUBLE,
	stock INT,
	insert_name DATE
);

DESC product;

-- 修改数据表

-- 修改表名
ALTER TABLE product RENAME TO product2;
-- 修改表的字符集
SHOW TABLE STATUS FROM	db3 LIKE 'product2';
ALTER TABLE product2 CHARACTER SET utf8;
-- 单独加一列
ALTER TABLE product2 ADD color VARCHAR(10);
DESC product2;
-- 修改某一列的数据类型
ALTER TABLE product2 MODIFY color INT;
-- 修改列名和数据类型
ALTER TABLE product2 CHANGE color address VARCHAR(200);
-- 删除某一列
ALTER TABLE product2 DROP address;

-- 删除数据表
DROP TABLE db1;
-- 删除数据表（判空）
DROP TABLE IF EXISTS db1;


