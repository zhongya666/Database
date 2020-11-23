-- 存储过程的创建和调用
-- 存储过程的创建和调用
-- 存储过程的创建和调用

-- 创建 stu_group()存储过程，封装分组查询总成绩，并按照总成绩升序排序的功能
DELIMITER $

CREATE PROCEDURE stu_group()
BEGIN
	SELECT gender,SUM(score) getSum FROM student GROUP BY gender ORDER BY getSum ASC;
END$

DELIMITER ;

-- 调用存储过程
-- 调用stu_group()存储过程
CALL stu_group();

-- 存储过程的查看和删除
-- 存储过程的查看和删除
-- 存储过程的查看和删除

-- 查看db6数据库中所有的存储过程
SELECT * FROM mysql.proc WHERE db='db6'; -- 该方法不可用

-- 自己查的方法
#查询数据库中的存储过程
SHOW PROCEDURE STATUS WHERE db='db6';
#查询数据库中的函数
SHOW FUNCTION STATUS;
#查看存储过程或函数的创建代码
SHOW CREATE PROCEDURE girls.myP1;
SHOW CREATE FUNCTION girls.fun1;

-- 删除存储过程
DROP PROCEDURE IF EXISTS stu_group;

-- 存储过程语法-变量
-- 存储过程语法-变量
-- 存储过程语法-变量

-- 定义一个int类型变量，并赋默认值为10
DELIMITER $

CREATE PROCEDURE pro_test1()
BEGIN
	-- 定义变量
	DECLARE num INT DEFAULT 10;
	-- 使用变量
	SELECT num;
END$

DELIMITER ;
-- 调用pro_test1存储过程
CALL pro_test1();

-- 定义一个varchar类型变量并赋值 方式一
DELIMITER $

CREATE PROCEDURE pro_test2()
BEGIN 
	-- 定义变量
	DECLARE NAME VARCHAR(10);
	-- 为变量赋值
	SET NAME = '存储过程';
	-- 使用变量
	SELECT NAME;
END$

DELIMITER ;
CALL pro_test2();

-- 定义一个varchar类型变量并赋值 方式二
DELIMITER $

CREATE PROCEDURE pro_test3()
BEGIN 
	-- 定义两个变量
	DECLARE men,women INT;
	-- 查询男同学的总分数，为men赋值
	SELECT SUM(score) INTO men FROM student WHERE gender='男';
	SELECT SUM(score) INTO women FROM student WHERE gender='女';
	-- 使用变量
	SELECT men,women;
END$

DELIMITER ;
CALL pro_test3();

-- 存储过程语法-if语句
-- 存储过程语法-if语句
-- 存储过程语法-if语句

/*
	定义一个int变量，用于存储班级总成绩
	定义一个varchar变量，用于存储分数描述
	根据总成绩判断：
		380分及其以上	学习优秀
		320-380		学习不错
		320以下		学习一般
*/
DELIMITER $

CREATE PROCEDURE pro_test4()
BEGIN
	-- 定义变量
	DECLARE total INT;
	DECLARE info VARCHAR(10);
	-- 查询班级总成绩，为total赋值
	SELECT SUM(score) INTO total FROM student;
	-- 对总成绩判断
	IF total > 380 THEN
		SET info = '学习优秀';
	ELSEIF total >= 320 AND total <= 380 THEN
		SET info = '学习不错';
	ELSE
		SET info = '学习一般';
	END IF;
	-- 查询总成绩和分数的描述信息
	SELECT total,info;
END$

DELIMITER ;
CALL pro_test4();

-- 存储过程语法-参数传递
-- 存储过程语法-参数传递
-- 存储过程语法-参数传递

/*
	输入总成绩变量，代表学生总成绩
	输出分数描述变量，代表学生总成绩的描述信息
	根据总成绩判断：
		380分及其以上	学习优秀
		320-380		学习不错
		320以下		学习一般
*/
DELIMITER $

CREATE PROCEDURE pro_test5(IN total INT,OUT info VARCHAR(10))
BEGIN
	-- 对总成绩判断
	IF total > 380 THEN
		SET info = '学习优秀';
	ELSEIF total >= 320 AND total <= 380 THEN
		SET info = '学习不错';
	ELSE
		SET info = '学习一般';
	END IF;
	-- 查询总成绩和分数的描述信息
	SELECT total,info;
END$

DELIMITER ;
CALL pro_test5(353,@info);
CALL pro_test5((SELECT SUM(score) FROM student),@info);
SELECT @info;

-- 存储过程语法-while循环
-- 存储过程语法-while循环
-- 存储过程语法-while循环

-- 计算1~100之间的偶数和
DELIMITER $

CREATE PROCEDURE pro_test6()
BEGIN
	-- 定义求和变量
	DECLARE result INT DEFAULT 0;
	-- 定义初始化变量
	DECLARE num INT DEFAULT 1;
	-- while循环
	WHILE num <= 100 DO
		IF num % 2 = 0 THEN
			SET result = result + num;
		END IF;
		SET num = num + 1;
	END WHILE;
	-- 查询求和结果
	SELECT result;
END$

DELIMITER ;
CALL pro_test6();

-- 存储函数
-- 存储函数
-- 存储函数
-- 存储函数和存储过程非常相似，区别在于存储函数必须要有返回值

-- 创建存储函数
-- 定义存储函数，获取学生表中成绩大于95分的学生数量
DELIMITER $

CREATE FUNCTION fun_test1()
RETURNS INT
BEGIN
	-- 定义变量
	DECLARE s_count INT;
	-- 查询成绩大于95分的数量，为s_count赋值
	SELECT COUNT(*) INTO s_count FROM student WHERE score > 95;
	-- 返回统计结果
	RETURN s_count;
END$

DELIMITER ;

/*
怎么解决执行MySQL函数时缺少权限:错误代码1418
https://jingyan.baidu.com/article/59a015e30e83b1f795886567.html
*/
SHOW VARIABLES LIKE 'log_bin_trust_function_creators';
SET @@global.log_bin_trust_function_creators='ON';

-- 调用存储函数
SELECT fun_test1();
-- 删除存储函数
DROP FUNCTION fun_test1;


	