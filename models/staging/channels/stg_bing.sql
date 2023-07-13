with 

source as(
    select * from {{source ('dbt_nmatyu','src_ads_bing_all_data') }}
),

staged as (
    
SELECT 
  channel,
  ROUND(sum(spend) / sum(conv),2) AS conversion_cost,
  0 AS cost_per_engage,
  0 AS total_impressions,
  ROUND(sum(spend) / sum(clicks),2) AS cpc
FROM source
GROUP BY channel
)
SELECT * FROM staged
