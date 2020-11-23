-- 视图的创建和查询
-- 视图的创建和查询
-- 视图的创建和查询

-- 创建city_country视图，保存城市和国家的信息（使用指定列名）
CREATE VIEW city_country(city_id,city_name,country_name) AS 
SELECT
	c1.`id`,
	c1.`name`,
	c2.`name`
FROM
	city c1,
	country c2
WHERE
	c1.`cid`=c2.id;
-- 查询视图
SELECT 
	*
FROM
	city_country;
	
-- 视图的修改和删除
-- 视图的修改和删除
-- 视图的修改和删除

-- 修改视图中的数据，将北京改为深圳。(注意：修改视图数据后，源表中的数据也会随之修改)
UPDATE city_country SET city_name='深圳' WHERE city_name='北京';
-- 将视图中的country_name修改为name
ALTER VIEW city_country (city_id,city_name,NAME) AS 
SELECT
	c1.`id`,
	c1.`name`,
	c2.`name`
FROM
	city c1,
	country c2
WHERE
	c1.`cid`=c2.id;
-- 删除视图
DROP VIEW IF EXISTS city_country;






	