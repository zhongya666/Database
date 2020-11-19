-- 主键约束
-- 主键约束
-- 主键约束
DROP TABLE student;
CREATE TABLE student(
	id INT PRIMARY KEY, -- -- 建表时添加主键约束
	NAME VARCHAR(30),
	age INT
);
DESC student;
INSERT INTO student VALUES (1,'张三',23);	-- 主键不能有null
INSERT INTO student VALUES (2,'李四',24);

ALTER TABLE student DROP PRIMARY KEY;	-- 删除主键约束
ALTER TABLE student MODIFY id INT PRIMARY KEY; -- 建表后单独添加主键约束

-- 主键自增约束
-- 主键自增约束
-- 主键自增约束
CREATE TABLE student(
	id INT PRIMARY KEY AUTO_INCREMENT, -- 建表时添加主键自增约束
	NAME VARCHAR(30),
	age INT
);
DESC student;
INSERT INTO student VALUES (NULL,'张三',23);
INSERT INTO student VALUES (NULL,'李四',24);

ALTER TABLE student MODIFY id INT;	-- 删除自增约束
ALTER TABLE student MODIFY id INT AUTO_INCREMENT;	-- 建表后单独添加主键自增约束


-- 唯一约束
-- 唯一约束
-- 唯一约束

CREATE TABLE student(
	id INT PRIMARY KEY AUTO_INCREMENT,
	NAME VARCHAR(30),
	age INT UNIQUE    -- 建表时添加唯一约束
);
DESC student;
INSERT INTO student VALUES (NULL,'张三',23);
INSERT INTO student VALUES (NULL,'李四',23);
ALTER TABLE student DROP INDEX age;	-- 删除唯一约束
ALTER TABLE student MODIFY age INT UNIQUE;	-- 建表后添加唯一约束

-- 非空约束
-- 非空约束
-- 非空约束

CREATE TABLE student(
	id INT PRIMARY KEY AUTO_INCREMENT, 
	NAME VARCHAR(30) NOT NULL, -- 建表时添加非空约束
	age INT
);
DESC student;
INSERT INTO student VALUES (NULL,NULL,23);	
INSERT INTO student VALUES (NULL,'李四',23);
ALTER TABLE student MODIFY NAME VARCHAR(30);	-- 删除非空约束
ALTER TABLE student MODIFY NAME VARCHAR(30) NOT NULL;	-- 建表后单独添加非空约束



-- 外键约束
-- 外键约束
-- 外键约束

CREATE DATABASE db2;	
USE db2;
CREATE TABLE USER(	-- 创建用户表
	id INT PRIMARY KEY AUTO_INCREMENT,	-- id
	NAME VARCHAR(20) NOT NULL 		-- name
);
INSERT INTO USER VALUES (NULL,'张三'),(NULL,'李四');

CREATE TABLE orderlist(
	id INT PRIMARY KEY AUTO_INCREMENT, 	-- id
	number VARCHAR(20) NOT NULL, 		-- 订单编号
	uid INT,				-- 外键列
	CONSTRAINT order_user FOREIGN KEY (uid) REFERENCES USER(id)	-- 建表时添加外键约束	
);
INSERT INTO orderlist VALUES (NULL,'a001',1),(NULL,'a002',1),(NULL,'a003',2),(NULL,'a004',2);

-- 测试   添加一个订单，但是没有真实用户。添加失败
INSERT INTO orderlist VALUES (NULL,'a001',3);
-- 测试   删除李四用户。删除失败
DELETE FROM USER WHERE NAME='李四';
-- 删除外键约束
ALTER TABLE orderlist DROP FOREIGN KEY order_user;
-- 建表后单独添加外键约束
ALTER TABLE orderlist ADD CONSTRAINT order_user FOREIGN KEY (uid) REFERENCES USER(id);

-- 外键的级联更新和级联删除
-- 外键的级联更新和级联删除
-- 外键的级联更新和级联删除

-- 先删除外键约束
-- 添加外键约束，同时添加级联更新和级联删除
ALTER TABLE orderlist ADD CONSTRAINT order_user FOREIGN KEY (uid) REFERENCES USER(id) 
ON UPDATE CASCADE ON DELETE CASCADE;
-- 将李四这个用户的id修改为3,订单表中的uid也自动修改
UPDATE USER SET id=3 WHERE id=2;
-- 将李四这个用户删除,订单表中的该用户所属的订单也自动删除
DELETE	FROM USER WHERE id=3;




