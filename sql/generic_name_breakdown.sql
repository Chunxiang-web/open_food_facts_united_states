CREATE TABLE food_data_kaggle.generic_name_breakdown AS 
SELECT
  countries_en AS country,
  generic_name,
  COUNT(1) AS count  
FROM `magnetic-lore-354023.food_data_kaggle.food_data_kaggle` 
WHERE countries_en IS NOT NULL
  AND countries_en NOT LIKE '%,%'
  AND countries_en NOT LIKE '%World%'
  AND countries_en NOT LIKE '%fr:%'
  AND stores IS NOT NULL
  AND stores NOT LIKE '%,%'
  AND countries_en = 'United States'
  AND generic_name IS NOT NULL
GROUP BY 1,2
ORDER BY 1,3 DESC

