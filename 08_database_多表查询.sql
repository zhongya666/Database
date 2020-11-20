-- 多表查询

-- 创建表user表
SELECT * FROM orderlist;
CREATE TABLE USER(
	id INT PRIMARY KEY AUTO_INCREMENT,
	NAME VARCHAR(20),
	age INT
);
INSERT INTO USER VALUES (NULL,'张三',23);
INSERT INTO USER VALUES (NULL,'李四',24);
INSERT INTO USER VALUES (NULL,'王五',25);
INSERT INTO USER VALUES (NULL,'赵六',26);
-- 创建订单表
CREATE TABLE orderlist(
	id INT PRIMARY KEY AUTO_INCREMENT, 	-- 订单id
	number VARCHAR(30),			-- 订单编号
	uid INT,				-- 外键字段
	CONSTRAINT ou_fk1 FOREIGN KEY (uid) REFERENCES USER(id)
);
INSERT INTO orderlist VALUES (1,'a001',1);
INSERT INTO orderlist VALUES (2,'a002',1);
INSERT INTO orderlist VALUES (3,'a003',2);
INSERT INTO orderlist VALUES (4,'a004',2);
INSERT INTO orderlist VALUES (5,'a005',3);
INSERT INTO orderlist VALUES (6,'a006',3);
INSERT INTO orderlist VALUES (7,'a007',NULL);
-- 商品分类表
CREATE TABLE category(
	id INT PRIMARY KEY AUTO_INCREMENT,	-- 商品分类id
	NAME VARCHAR(10) 			-- 商品分类名称
);
INSERT INTO category VALUES (1,'手机数码');
INSERT INTO category VALUES (2,'电脑办公');
INSERT INTO category VALUES (3,'烟酒茶糖');
INSERT INTO category VALUES (4,'鞋靴箱包');
-- 商品表
CREATE TABLE product(
	id INT PRIMARY KEY AUTO_INCREMENT,
	NAME VARCHAR(30),			-- 商品名称
	cid INT, 				-- 外键字段
	CONSTRAINT cp_fk1 FOREIGN KEY (cid) REFERENCES category(id)	-- 外键约束
);
INSERT INTO product VALUES (NULL,'华为手机',1);
INSERT INTO product VALUES (NULL,'小米手机',1);
INSERT INTO product VALUES (NULL,'联想电脑',2);
INSERT INTO product VALUES (NULL,'苹果电脑',2);
INSERT INTO product VALUES (NULL,'中华香烟',3);
INSERT INTO product VALUES (NULL,'玉溪香烟',3);
INSERT INTO product VALUES (NULL,'计生用品',NULL);
-- 中间表
CREATE TABLE us_pro(
	id INT PRIMARY KEY AUTO_INCREMENT,	-- 中间表id
	uid INT,				-- 外键字段。需要和用户表的主键产生关联
	pid INT,				-- 外键字段。需要和商品表的主键产生关联
	CONSTRAINT up_fk1 FOREIGN KEY (uid) REFERENCES USER(id),
	CONSTRAINT up_fk2 FOREIGN KEY (pid) REFERENCES product(id)
);
INSERT INTO us_pro VALUES (NULL,1,1); 
INSERT INTO us_pro VALUES (NULL,1,2); 
INSERT INTO us_pro VALUES (NULL,1,3); 
INSERT INTO us_pro VALUES (NULL,1,4); 
INSERT INTO us_pro VALUES (NULL,1,5); 
INSERT INTO us_pro VALUES (NULL,1,6); 
INSERT INTO us_pro VALUES (NULL,1,7); 
INSERT INTO us_pro VALUES (NULL,2,1); 
INSERT INTO us_pro VALUES (NULL,2,2); 
INSERT INTO us_pro VALUES (NULL,2,3); 
INSERT INTO us_pro VALUES (NULL,2,4); 
INSERT INTO us_pro VALUES (NULL,2,5); 
INSERT INTO us_pro VALUES (NULL,2,6); 
INSERT INTO us_pro VALUES (NULL,2,7); 
INSERT INTO us_pro VALUES (NULL,3,1); 
INSERT INTO us_pro VALUES (NULL,3,2); 
INSERT INTO us_pro VALUES (NULL,3,3); 
INSERT INTO us_pro VALUES (NULL,3,4); 
INSERT INTO us_pro VALUES (NULL,3,5); 
INSERT INTO us_pro VALUES (NULL,3,6); 
INSERT INTO us_pro VALUES (NULL,3,7); 
INSERT INTO us_pro VALUES (NULL,4,1); 
INSERT INTO us_pro VALUES (NULL,4,2); 
INSERT INTO us_pro VALUES (NULL,4,3); 
INSERT INTO us_pro VALUES (NULL,4,4); 
INSERT INTO us_pro VALUES (NULL,4,5); 
INSERT INTO us_pro VALUES (NULL,4,6); 
INSERT INTO us_pro VALUES (NULL,4,7); 

