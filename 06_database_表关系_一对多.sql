-- 一对多
-- 建表原则：在多的一方，建立外键约束，来关联一的一方主键
DROP TABLE category,product;
USE db3;
CREATE TABLE USER(
	id INT PRIMARY KEY AUTO_INCREMENT,	-- 主键id
	NAME VARCHAR(20)			-- 姓名
);
INSERT INTO USER VALUES (NULL,'张三'),(NULL,'李四');
CREATE TABLE orderlist(
	id INT PRIMARY KEY AUTO_INCREMENT,	-- 主键id
	number VARCHAR(20), 			-- 订单编号
	uid INT,				-- 外键列
	CONSTRAINT ou_fk1 FOREIGN KEY (uid) REFERENCES USER(id)
);
INSERT INTO orderlist VALUES (NULL,'a001',1),(NULL,'a002',1),(NULL,'a003',2),(NULL,'a004',2);

-- 商品分类和商品
CREATE TABLE category(
	id INT PRIMARY KEY AUTO_INCREMENT,	-- 主键id
	NAME VARCHAR(20)			-- 分类名称
);
INSERT INTO category VALUES (NULL,'手机数码'),(NULL,'电脑办公');
CREATE TABLE product(
	id INT PRIMARY KEY AUTO_INCREMENT,	-- 主键id
	number VARCHAR(20), 			-- 商品名称
	cid INT,				-- 外键列
	CONSTRAINT pc_fk1 FOREIGN KEY (cid) REFERENCES category(id)
);
INSERT INTO product VALUES (NULL,'华为p30',1),(NULL,'小米note3',1),(NULL,'联想电脑',2),(NULL,'苹果电脑',2);
