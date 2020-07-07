データの取得
SELECT name
FROM purchaes;

データの複数取得
SELECT name,price
FROM purchases;

データの全取得
SELECT *
FROM purchases;

特定のデータの検索

#WHERE
SELECT *
FROM purchases
WHERE category = "食事";

SELECT *
FROM purchases
WHERE price = 1000;

SELECT *
FROM purchases
WHERE created_at = '2017-01-01';

SELECT *
FROM purchases
WHERE price >= 1000;

SELECT *
FROM purshases
WHERE created_at <= "2017-08-01";

#LIKEを使った検索

SELECT *
FROM purchases
WHERE name LIKE "%プリン%";

SELECT *
FROM purchases
WHERE name LIKE "プリン%";

SELECT *
FROM purchases
WHERE name LIKE "%プリン";

#NOTを使った「特定条件ではない情報」の抽出

SELECT *
FROM purchases
WHERE NOT character_name = "にんじゃわんこ";

SELECT
FROM purchases
WHERE NOT name LIKE "%プリン%";

#NUllの抽出

SELECT *
FROM purchases
WHERE price IS null;

SELECT *
FROM purchases
WHERE price IS NOT null;

#AND OR演算子を使った検索
SELECT *
FROM purchases
WHERE category = "食費"
AND character_name = "にんじゃわんこ";

zSELECT *
FROM purchases
WHERE category = "食費"
OR character_name = "にんじゃわんこ";

#データの並び替え ORDER BY
降順
SELECT *
FROM purchases
ORDER BY price DESC;

昇順
SELECT *
FROM purchases
WHERE character_name = "にんじゃわんこ"
ORDER BY price ASC;

#上限をつけて検索する

SELECT *
FROM purchases
LIMIT 5;

SELECT *
FROM purchases
WHERE name = "にんじゃわんこ"
LIMIT 10;

#重複したデータを加工
#DISTINCT

SELECT DISTINCT(name)
FROM purchases;

#四則演算

SELECT name, price, (price * 1.08)
FROM purchases;

SELECT SUM(price)
FROM purchases
WHERE character_name = "にんじゃわんこ"
;

SELECT AVG(price)
FROM purchases
WHERE character_name ="にんじゃわんこ"
;

SELECT COUNT(*)
FROM purchases
WHERE character_name = "にんじゃわんこ"
;

#最大と最小を検索する

SELECT MAX(price)
FROM purchases
WHERE character_name = "にんじゃわんこ"
;

SELECT MIN(price)
FROM purchases;

#データをグループ分けする

SELECT SUM(price),purchased_at
FROM purchases
GROUP BY purchsed_at
;

SELECT COUNT(*),purchased_at
FROM purchases
GROUP BY purchsed_at
;


