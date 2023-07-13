with src_ads_tiktok_ads_all_data as(

SELECT 
  channel,
  ROUND(sum(spend) / sum(conversions),2) AS conversion_cost,
  0 AS cost_per_engage,
  sum(impressions) AS total_impressions,
  ROUND(sum(spend) / sum(clicks),2) AS cpc
FROM `improvado-391920.dbt_nmatyu.src_ads_tiktok_ads_all_data`
GROUP BY channel
)
SELECT * FROM src_ads_tiktok_ads_all_data