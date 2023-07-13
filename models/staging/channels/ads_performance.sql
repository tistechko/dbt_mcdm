WITH src_ads_bing_all_data AS (
    SELECT * FROM {{ ref ('stg_bing') }}
),

src_ads_creative_facebook_all_data AS (
    SELECT * FROM {{ ref ('stg_facebook') }}
),

src_ads_tiktok_ads_all_data AS (
    SELECT * FROM {{ ref ('stg_tiktok') }}
),

src_promoted_tweets_twitter_all_data AS (
    SELECT * FROM {{ ref ('stg_twitter') }}
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