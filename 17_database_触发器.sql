/*
	触发器
	与表有关的数据库对象，可以在insert、update、delete之前或之后触发并执行触发器中定义的sql语句。
	确保数据库的完整性、日志记录、数据校验等操作。
	
	触发器类型：insert、update、delete
*/
-- 创建db7数据库
CREATE DATABASE db7;
USE db7;
-- 创建账户表account
CREATE TABLE account(
	id INT PRIMARY KEY AUTO_INCREMENT,	-- 账户id
	NAME VARCHAR(20),			-- 姓名
	money DOUBLE				-- 余额
);
INSERT INTO account VALUES
(NULL,'张三',1000),
(NULL,'李四',1000);
-- 创建日志表account_log
CREATE TABLE account_log(
	id INT PRIMARY KEY AUTO_INCREMENT,	-- 日志id
	operation VARCHAR(20),			-- 操作类型（insert update delete）
	operation_time DATETIME,		-- 操作时间
	operation_id INT,			-- 操作表的id
	operation_params VARCHAR(200)		-- 操作参数
);

-- 创建insert触发器。
-- 创建insert触发器。
-- 创建insert触发器。用于对account表新增数据进行日志的记录
DELIMITER $

CREATE TRIGGER account_insert
AFTER INSERT
ON account
FOR EACH ROW
BEGIN
	INSERT INTO account_log VALUES (NULL,'INSERT',NOW(),new.id,CONCAT('插入后{id=',new.id,',name=',new.name,',money=',new.money,'}'));
END$

DELIMITER ;

-- 向account表中添加一条记录
INSERT INTO account VALUES (NULL,'王五',2000);
-- 查询account表
SELECT * FROM account;
-- 查询account_log表
SELECT * FROM account_log;

-- 创建update触发器。
-- 创建update触发器。
-- 创建update触发器。用于account表修改数据进行日志的记录

DELIMITER $

CREATE TRIGGER account_update
AFTER UPDATE
ON account
FOR EACH ROW
BEGIN
	INSERT INTO account_log VALUES (NULL,'UPDATE',NOW(),new.id,CONCAT('更新前{id=',old.id,',name=',old.name,',money=',old.money,'}','更新后{id=',new.id,',name=',new.name,',money=',new.money,'}'));
END$

DELIMITER ;

-- 修改account表中的金额为2000
UPDATE account SET money=2000 WHERE id=2;
-- 查询account表
SELECT * FROM account;
-- 查询account_log表
SELECT * FROM account_log;

-- 创建delete触发器。
-- 创建delete触发器。
-- 创建delete触发器。用于account表删除数据进行日志的记录
DELIMITER $

CREATE TRIGGER account_delete
AFTER DELETE
ON account
FOR EACH ROW
BEGIN
	INSERT INTO account_log VALUES (NULL,'delete',NOW(),old.id,CONCAT('删除前{id=',old.id,',name=',old.name,',money=',old.money,'}'));
END$

DELIMITER ;
-- 删除account表王五
DELETE FROM account WHERE id=3;

-- 查询account表
SELECT * FROM account;
-- 查询account_log表
SELECT * FROM account_log;

-- 查看触发器
-- 查看触发器
-- 查看触发器
SHOW TRIGGERS;

-- 删除触发器
-- 删除触发器
-- 删除触发器
DROP TRIGGER account_delete;

	