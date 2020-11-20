-- 多对多
-- 建表原则：需要借助第三张中间表，中间表只是包含两个列。这两个列作为中间表的外键，分别关联两张表的主键。
DROP TABLE student,course;
CREATE TABLE student(
	id INT PRIMARY KEY AUTO_INCREMENT,
	NAME VARCHAR(20) 			-- 学生姓名
);
INSERT INTO student VALUES (NULL,'张三'),(NULL,'李四');

CREATE TABLE course(
	id INT PRIMARY KEY AUTO_INCREMENT,	
	NAME VARCHAR(10) 			-- 课程名称
);
INSERT INTO course VALUES (NULL,'语文'),(NULL,'数学');

-- 创建中间表
CREATE TABLE stu_course(
	id INT PRIMARY KEY AUTO_INCREMENT,
	sid INT,	-- 用于和student表中的id进行外键关联
	cid INT,	-- 用于和course表中的id进行外键关联
	CONSTRAINT sc_fk1 FOREIGN KEY (sid) REFERENCES student(id),-- 添加外键约束
	CONSTRAINT sc_fk2 FOREIGN KEY (cid) REFERENCES course(id)  -- 添加外键约束	
);
INSERT INTO stu_course VALUES (NULL,1,1),(NULL,1,2),(NULL,2,1),(NULL,2,2);


