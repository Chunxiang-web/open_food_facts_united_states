CREATE TABLE food_data_kaggle.carbohydrates_100g AS 
SELECT
  countries_en AS country,
  generic_name,
  carbohydrates_100g
FROM `magnetic-lore-354023.food_data_kaggle.food_data_kaggle` 
WHERE countries_en IS NOT NULL
  AND countries_en NOT LIKE '%,%'
  AND countries_en NOT LIKE '%World%'
  AND countries_en NOT LIKE '%fr:%'
  AND stores IS NOT NULL
  AND stores NOT LIKE '%,%'
  AND carbohydrates_100g IS NOT NULL
  AND countries_en = 'United States'
GROUP BY 1,2,3
ORDER BY 1,4 DESC