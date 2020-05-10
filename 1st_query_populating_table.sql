CREATE OR REPLACE TABLE
  <your project name>.bank_analysis_project.banks AS
  
SELECT

  EXTRACT (date
  FROM
    PARSE_TIMESTAMP('%Y%m%d%H%M%S',CAST(date AS string))) AS Date,
  CAST(SPLIT(V2Tone, ",") [
  OFFSET
    (0)] AS FLOAT64) AS tone,
  CAST(SPLIT(V2Tone, ",") [
  OFFSET

    (3)] AS FLOAT64) AS polarity,
  CAST(SPLIT(V2Tone, ",") [
  OFFSET
    (4)] AS FLOAT64) AS arf,
  CAST(SPLIT(V2Tone, ",") [
  OFFSET
    (5)] AS FLOAT64) AS sg_rf,
-- it is way more cheaper to use CASE statements than using WHERE at the end    
  (
    CASE
      WHEN LOWER(V2Organizations) LIKE "%abanca%" THEN "Abanca"
      WHEN LOWER(V2Organizations) LIKE "%activobank%" THEN "Activobank"
      WHEN LOWER(V2Organizations) LIKE "%bankia%" THEN "Bankia"
      WHEN LOWER(V2Organizations) LIKE "%bankinter%" THEN "Bankinter"
      WHEN LOWER(V2Organizations) LIKE "%barclays%" THEN "Barclays"
      WHEN LOWER(V2Organizations) LIKE "%bbva%" THEN "BBVA"
      WHEN LOWER(V2Organizations) LIKE "%caja rural%" THEN "Caja Rural"
      WHEN LOWER(V2Organizations) LIKE "%caixa%" THEN "Caixa"
      WHEN LOWER(V2Organizations) LIKE "%evo banco%" THEN "EVO"
      WHEN LOWER(V2Organizations) LIKE "%ibercaja%" THEN "Ibercaja"
      WHEN LOWER(V2Organizations) LIKE "%ing direct%" THEN "ING"
      WHEN LOWER(V2Organizations) LIKE "%imaginbank%" THEN "ImaginBank"
      WHEN LOWER(V2Organizations) LIKE "%kutxabank%" THEN "Kutxabank"
      WHEN LOWER(V2Organizations) LIKE "%liberbank%" THEN "Liberbank"
      WHEN LOWER(V2Organizations) LIKE "%mediolanum%" THEN "Mediolanum"
      WHEN LOWER(V2Organizations) LIKE "%n26%" THEN "N26"
      WHEN LOWER(V2Organizations) LIKE "%openbank%" THEN "Openbank"
      WHEN LOWER(V2Organizations) LIKE "%santander%" THEN "Santander"
      WHEN LOWER(V2Organizations) LIKE "%triodos%" THEN "Triodos"
      WHEN LOWER(V2Organizations) LIKE "%unicaja%" THEN "Unicaja"
      WHEN LOWER(V2Organizations) LIKE "%wizink%" THEN "Wizink"
      ELSE "Other"
  END 
    ) AS company
FROM 
  `gdelt-bq.gdeltv2.gkg_partitioned`
WHERE
  DATE(_PARTITIONTIME) >= "2015-01-01"