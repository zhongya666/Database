-- 一对一
USE db3;
DESC card;
CREATE TABLE person(
	id INT PRIMARY KEY AUTO_INCREMENT,	-- 主键id
	NAME VARCHAR(20)			-- 姓名
);
INSERT INTO person VALUES (NULL,'张三'),(NULL,'李四');
CREATE TABLE card(
	id INT PRIMARY KEY AUTO_INCREMENT,	-- 主键id
	number VARCHAR(20) UNIQUE NOT NULL, 	-- 身份证号
	pid INT UNIQUE, 			-- 外键列
	CONSTRAINT cp_fk1 FOREIGN KEY (pid) REFERENCES person(id)
);
INSERT INTO card VALUES (NULL,'12345',1),(NULL,'31654',2);