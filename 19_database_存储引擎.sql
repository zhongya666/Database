/*
	存储引擎的查询、创建、修改
	存储引擎的查询、创建、修改
	存储引擎的查询、创建、修改
	
	MylSAM	不支持事务和外键操作。读取速度快，节约资源
	InnoDB	MySQL的默认存储引擎，支持事务和外键操作
	MEMORY	将所有数据保存在内存中
*/
-- 查询数据库支持的存储引擎
SHOW ENGINES;

-- 查询某个数据库中所有数据表的存储引擎
SHOW TABLE STATUS FROM db4;

-- 查询某个数据库中某个数据表的存储引擎 
SHOW TABLE STATUS FROM db4 WHERE NAME = 'category';

-- 创建数据表，指定存储引擎
CREATE TABLE engine_test(
	id INT PRIMARY KEY AUTO_INCREMENT,
	NAME VARCHAR(10)
)ENGINE = MYISAM;

-- 修改数据表的存储引擎
ALTER TABLE engine_test ENGINE = INNODB;


	
	