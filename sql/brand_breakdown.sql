CREATE TABLE food_data_kaggle.brand_breakdown AS 
SELECT
  countries_en AS country,
  brands AS brands,
  COUNT(1) AS count
FROM `magnetic-lore-354023.food_data_kaggle.food_data_kaggle` 
  WHERE countries_en IS NOT NULL
  AND countries_en NOT LIKE '%,%'
  AND countries_en NOT LIKE '%World%'
  AND countries_en NOT LIKE '%fr:%'
  AND brands NOT LIKE '%,%'
  AND countries_en = 'United States'
  AND brands IS NOT NULL
  AND generic_name IS NOT NULL
GROUP BY 1,2
ORDER BY 1,3 DESC


