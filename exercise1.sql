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

#複数の条件でグループ分けする
SELECT SUM(price), purchsed_at, character_name
FROM purchases
GROUP BY purchsed_at,character_name
;

SELECT COUNT(*)
FROM purchases
GROUP BY purchsed_at, character_name
;

#WHEREとGROUPを組み合わせる

SELECT SUM(price),character_name
FROM purchases
WHERE character_name = "にんじゃわんこ"
GROUP BY character_name
;

SELECT SUM(price),category,purchsed_at
FROM purchases
WHERE category = "食費"
GROUP BY categiry, purchsed_at
;

#グループ化したデータをさらに絞り込み
#GROUP BY直下にはHAVINGを用いる
SELECT SUM(price),purchsed_at
FROM purchases
GROUP BY purchsed_at
HAVING SUM(price) > 2000
;

SELECT SUM(price),purchsed_at,character_name
FROM purchases
GROUP BY purchsed_at,character_name
HAVING SUM(price) > 3000
;

SELECT goals
FROM players
WHERE name = "ウィル";

SELECT *
FROM players
WHERE goals > 14;


2つのクエリを使ってみる
SELECT name
FROM players
WHERE goals > (
  -- この下にウィルの得点数を取得するクエリを書いてください
  SELECT goals
  FROM players
  WHERE name = "ウィル"
)
;


SELECT name,goals
FROM players
WHERE goals > (
  SELECT AVG(goals)
  FROM players
)
;

--ASを使って、取得したカラム名を"身長180cm以上の選手"としてください
SELECT name AS "身長180cm以上の選手"
FROM players
WHERE height > 180 
;

--ASを使って、取得したカラム名を"チームの合計得点"としてください
SELECT SUM(goals) AS "チームの合計得点"
FROM players
;

SELECT *
FROM countries
WHERE rank < (
  SELECT rank
  FROM countries
  WHERE name = "日本"
)
;

SELECT SUM(goals),country_id
FROM players
GROUP BY country_id
;

テーブルの結合

SELECT *
FROM players
--結合するテーブル名を追加してください
JOIN countries 
--結合条件を追加してください
ON players.country_id = countries.id
;

"複数テーブルでカラムの名前が重なっている場合はテーブル名.カラム名で指定する"

SELECT players.name,countries.name
FROM players
JOIN countries
ON countries.id = players.country_id
;


SELECT players.name,countries.name
FROM players
JOIN countries
ON countries.id = players.country_id
;

SELECT countries.name, SUM(goals)
FROM players
JOIN countries
ON players.country_id = countries.id 
GROUP BY countries.name
;

SELECT *
FROM players
JOIN teams
ON players.previous_team_id = teams.id 
;


SELECT players.name AS "選手名", teams.name AS "前年所属していたチーム"
FROM players
JOIN teams
ON players.previous_team_id = teams.id
;

-- LEFT JOIN
LEFT JOINはNULLのカラムも含めてテーブル全ての情報を抽出する

SELECT *
FROM players
LEFT JOIN teams
ON players.previous_team_id = teams.id
;

SELECT players.name AS "選手名", teams.name AS "前年所属していたチ
ーム"
FROM players
LEFT JOIN teams
ON players.previous_team_id = teams.id
;

複数テーブルのJOIN
SELECT *
FROM players
JOIN countries
ON players.country_id = countries.id
LEFT JOIN teams
ON players.previous_team_id = teams.id
;

演習問題


SELECT name, height
FROM players
WHERE height > (
SELECT AVG(height)
FROM players
);

SELECT *
FROM players
JOIN countries
ON players.country_id = countries.id
WHERE countries.name = "日本"
AND height > (
SELECT AVG(height)
FROM players
)
;

演習問題
-- ユーザー全体の平均年齢を取得してください
SELECT AVG(age)
FROM users
;

-- 20歳未満の男性ユーザーの、全てのカラムの値を取得してください。
SELECT *
FROM users
WHERE age < 20
;

-- ユーザーの年齢ごとの人数と、その年齢を取得してください
SELECT age, COUNT(*)
FROM users
GROUP BY age
;

-- 全商品の名前を重複無く取得してください
SELECT DISTINCT(name)
FROM items
;

-- 全商品の名前と値段を、値段が高い順に並べてください
SELECT name, price
FROM items
ORDER BY price DESC
;

-- 名前の一部に「シャツ」を含む商品の、全てのカラムの値を取得してください
SELECT *
FROM items
WHERE name LIKE "%シャツ%"
;

-- 全商品の名前、値段、利益を取得してください
SELECT name,price,price - cost
FROM items
;

-- 全商品の利益の平均を取得してください
SELECT AVG(price - cost)
FROM items
;

-- 「グレーパーカー」より値段が高い商品の名前と値段を取得してください
SELECT name,price
FROM items
WHERE price > (
 SELECT price
 FROM items
 WHERE name = "グレーパーカー")
;

-- 各商品あたりの利益が上位5件の商品の名前と利益を取得してください
SELECT name, price - cost
FROM items
ORDER BY price - cost DESC-- 7000円以下で「グレーパーカー」より利益が高い商品を取得してください
SELECT name, price - cost
FROM items
WHERE price < 7000
AND price - cost > (
  SELECT price - cost
  FROM items
  WHERE name = "グレーパーカー")
  ;
LIMIT 5
;


-- 7000円以下で「グレーパーカー」より利益が高い商品を取得してください
SELECT name, price - cost
FROM items
WHERE price < 7000
AND price - cost > (
  SELECT price - cost
  FROM items
  WHERE name = "グレーパーカー")
  ;

-- 売れた数が多い上位5商品のidと個数を取得してください
SELECT item_id, COUNT(*)
FROM sales_records
GROUP BY item_id
ORDER BY COUNT(*) DESC
LIMIT 5
;

-- 売れた数が多い上位5商品のIDと名前、個数を取得してください
SELECT item_id,items.name,COUNT(*)
FROM sales_records
JOIN items
ON sales_records.item_id = items.id
GROUP BY item_id
ORDER BY COUNT(*) DESC
LIMIT 5
;

-- 日ごとの販売個数とその日付を取得してください
SELECT purchased_at, COUNT(*)
FROM sales_records
GROUP BY purchased_at
ORDER BY purchased_at ASC
;

-- 10個以上購入したユーザーIDとユーザー名、購入した商品の数を取得してください
SELECT users.id, users.name,COUNT(*) AS "購入数"
FROM sales_records
JOIN users
ON sales_records.user_id = users.id
GROUP BY users.id
HAVING COUNT(*) >= 10
;

-- 日ごとの売上額とその日付を取得してください
SELECT purchased_at,SUM(price) AS "売上額"
FROM sales_records
JOIN items
ON sales_records.item_id = items.id
GROUP BY purchased_at
;

-- このサイトの総売上と総利益を取得してください
SELECT SUM(price) AS "総売上", SUM(price - cost) AS "総利益"
FROM sales_records
JOIN items
ON sales_records.item_id = items.id
;
  -- 売れた数が多い上位5商品のidと個数を取得してください
SELECT item_id, COUNT(*)
FROM sales_records
GROUP BY item_id
ORDER BY COUNT(*) DESC
LIMIT 5
;

-- 10個以上購入したユーザーIDとユーザー名、購入した商品の数を取得してください
SELECT users.id, users.name,COUNT(*) AS "購入数"
FROM sales_records
JOIN users
ON sales_records.user_id = users.id
GROUP BY users.id,users.name
HAVING COUNT(*) >= 10
;

-- 「サンダル」を購入したユーザーのidと名前を取得してください
SELECT users.id, users.name
FROM sales_records
JOIN users
ON sales_records.user_id = users.id

WHERE sales_records.item_id = (
  SELECT id
  FROM items
  WHERE name = "サンダル"
)
GROUP BY users.id
;

別解-- 「サンダル」を購入したユーザーのidと名前を取得してください
SELECT users.id, users.name
FROM sales_records
JOIN users
ON sales_records.user_id = users.id
JOIN items
ON sales_records.item_id = items.id
WHERE items.name = "サンダル"
;

-- 男性向け、女性向け、男女兼用商品ごとに指定されたデータを取得してください
SELECT gender, sum(price) AS "売上高"
FROM sales_records
JOIN items
ON sales_records.item_id = items.id
GROUP BY items.gender
;

-- 売上額が上位5位の商品の指定されたデータを取得してください
SELECT items.id, items.name, sum(price) AS "売上額"
FROM sales_records
JOIN items
ON sales_records.item_id = items.id
GROUP BY sales_records.item_id
ORDER BY sum(price) DESC
LIMIT 5
;

-- グレーパーカーより売上額が高い商品の指定されたデータを取得してください
SELECT items.id, items.name, sum(price) AS "売上額"
FROM sales_records
JOIN items
ON sales_records.item_id = items.id
GROUP BY items.id, items.name, items.price
HAVING sum(price) > (
  SELECT sum(price)
  FROM sales_records
  JOIN items
  ON sales_records.item_id = items.id
  WHERE items.name = "グレーパーカー"
)
;

-- studentsテーブルにデータを追加してください。
INSERT INTO students (name, course) VALUES ('Kate', 'Java');

-- 下記のクエリは消さないでください。
select * from students;


UPDATE students
SET name = "Jordan", course = "HTML"
WHERE id = 6;

-- 下記のクエリは消さないでください。
SELECT * FROM students WHERE id=6;

DELETE FROM students
WHERE id = 7;

SELECT * FROM students;

-- studentsテーブルにnameをKaty、courseをHTMLとしたレコードを追加してください。
INSERT INTO students(name, course)
VALUES('Katy', 'HTML');

-- studentsテーブルのidカラムの値が6のレコードのnameをJuliet、courseをRubyに更新してください。
UPDATE students
SET name = "Juliet", course = "Ruby"
WHERE id = 6;

-- studentsテーブルのidカラムの値が2のレコードを削除してください。
DELETE FROM students
WHERE id = 2;

-- 下記のクエリは消さないでください。
SELECT * FROM students;


MYSQLコマンド

データベースの確認
SHOW database;

データベースの作成
CREATE DATABASE progate;

テーブルの作成
データベースの作成
USE progate

テーブルの作成
CREATE TABLE users (id INT AUTO_INCREMENT, name TEXT, PRIMARY KEY (id));

テーブル構造の確認
DESCRIBE users;


