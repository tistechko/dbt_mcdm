with 

source as(
    select * from {{ source ( 'dbt_nmatyu', 'src_promoted_tweets_twitter_all_data' )}}
),

staged as (

SELECT 
  channel,
  0 AS conversion_cost,
  ROUND(sum(spend) / sum(engagements),2) AS cost_per_engage,
  sum(impressions) AS total_impressions,
  ROUND(sum(spend) / sum(clicks),2) AS cpc
FROM source 
GROUP BY channel
)
SELECT * FROM staged 