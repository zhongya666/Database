CREATE DATABASE db6;
USE db6;
CREATE TABLE student(
	id INT PRIMARY KEY AUTO_INCREMENT,
	NAME VARCHAR(20),
	age INT,
	gender VARCHAR(5),
	score INT
);
INSERT INTO student VALUES
(NULL,'张三',23,'男',95),
(NULL,'李四',24,'男',98),
(NULL,'王五',25,'女',95),
(NULL,'赵六',26,'女',90);

-- 按照性别进行分组，查询每组学生的总成绩。按照总成绩的升序排列
SELECT
	gender,
	SUM(score) getSum
FROM
	student
GROUP BY
	gender
ORDER BY
	getSum ASC;






	