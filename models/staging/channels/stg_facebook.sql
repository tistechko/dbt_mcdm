with src_ads_creative_facebook_all_data as(
    
SELECT 
  channel,
  ROUND(sum(spend) / sum(purchase),2) AS conversion_cost,
  ROUND(sum(spend) / sum(shares + comments_2 + clicks_2 + purchase_2 + views_2 + shares_2),2) AS cost_per_engage,
  sum(impressions) AS total_impressions,
  ROUND(sum(spend) / sum(clicks),2) AS cpc
 FROM `improvado-391920.dbt_nmatyu.src_ads_creative_facebook_all_data`
GROUP BY channel
)
SELECT * FROM src_ads_creative_facebook_all_data