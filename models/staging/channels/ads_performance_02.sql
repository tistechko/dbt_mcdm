WITH src_ads_bing_all_data AS (
    SELECT 
        channel,
        ROUND(sum(spend) / sum(conv), 2) AS conversion_cost,
        0 AS cost_per_engage,
        0 AS total_impressions,
        ROUND(sum(spend) / sum(clicks), 2) AS cpc
    FROM `improvado-391920.dbt_nmatyu.src_ads_bing_all_data`
    GROUP BY channel
),

src_ads_creative_facebook_all_data AS (
    SELECT 
        channel,
        ROUND(sum(spend) / sum(purchase), 2) AS conversion_cost,
        ROUND(sum(spend) / sum(shares + comments_2 + clicks_2 + purchase_2 + views_2 + shares_2), 2) AS cost_per_engage,
        sum(impressions) AS total_impressions,
        ROUND(sum(spend) / sum(clicks), 2) AS cpc
    FROM `improvado-391920.dbt_nmatyu.src_ads_creative_facebook_all_data`
    GROUP BY channel
),

src_ads_tiktok_ads_all_data AS (
    SELECT 
        channel,
        ROUND(sum(spend) / sum(conversions), 2) AS conversion_cost,
        0 AS cost_per_engage,
        sum(impressions) AS total_impressions,
        ROUND(sum(spend) / sum(clicks), 2) AS cpc
    FROM `improvado-391920.dbt_nmatyu.src_ads_tiktok_ads_all_data`
    GROUP BY channel
),

src_promoted_tweets_twitter_all_data AS (
    SELECT 
        channel,
        0 AS conversion_cost,
        ROUND(sum(spend) / sum(engagements), 2) AS cost_per_engage,
        sum(impressions) AS total_impressions,
        ROUND(sum(spend) / sum(clicks), 2) AS cpc
    FROM `improvado-391920.dbt_nmatyu.src_promoted_tweets_twitter_all_data`
    GROUP BY channel
),

ads_performance AS (
    SELECT
        channel,
        conversion_cost,
        cost_per_engage,
        total_impressions,
        cpc
    FROM src_ads_bing_all_data
    UNION ALL
    SELECT
        channel,
        conversion_cost,
        cost_per_engage,
        total_impressions,
        cpc
    FROM src_ads_creative_facebook_all_data
    UNION ALL
    SELECT
        channel,
        conversion_cost,
        cost_per_engage,
        total_impressions,
        cpc
    FROM src_ads_tiktok_ads_all_data
    UNION ALL
    SELECT
        channel,
        conversion_cost,
        cost_per_engage,
        total_impressions,
        cpc
    FROM src_promoted_tweets_twitter_all_data
)
SELECT * FROM ads_performance