with 

source as(
    select * from {{ source ( 'dbt_nmatyu', 'src_ads_tiktok_ads_all_data' )}}
),

staged as (

SELECT 
  channel,
  ROUND(sum(spend) / sum(conversions),2) AS conversion_cost,
  0 AS cost_per_engage,
  sum(impressions) AS total_impressions,
  ROUND(sum(spend) / sum(clicks),2) AS cpc
FROM source
GROUP BY channel
)
SELECT * FROM staged