# Adding Data from New Ad Platforms to MCDM with dbt and BigQuery

## Prerequisites

Before adding data from new ad platforms, ensure that the following prerequisites are met:

- Access to the ad platform's API and credentials.
- Availability of the required data sources from the ad platform.
- A configured dbt project connected to BigQuery.

## Data Mapping

To map the data fields from the new ad platforms to the MCDM system using dbt and BigQuery, follow these steps:

1. Identify the relevant metrics, dimensions, and attributes that need to be captured from each ad platform's data.
2. Determine how each field from the ad platforms aligns with the corresponding fields in the MCDM system.

## Data Extraction

To extract data from each new ad platform using dbt and BigQuery, use the following approach:

1. Create source models in dbt for each ad platform, such as `src_ads_bing_all_data`, `src_ads_creative_facebook_all_data`, `src_ads_tiktok_ads_all_data`, and `src_promoted_tweets_twitter_all_data`.
2. Configure the SQL queries in the respective source models to extract the desired data from each ad platform's tables in BigQuery.
3. Utilize dbt's built-in BigQuery adapter to execute the SQL queries and retrieve the data from each ad platform.

## Data Transformation

Once the data is extracted, it needs to be transformed into a format compatible with the MCDM system using dbt. Perform the following steps:

1. Create transformation models in dbt, such as `dim_ads_performance`, to perform necessary calculations, aggregations, and data transformations on the extracted data.
2. Write the SQL queries in the transformation models to clean, normalize, and aggregate the data as required by the MCDM system.
3. Leverage dbt's powerful features and transformations to standardize the data fields from each ad platform and align them with the MCDM system's structure.

## Data Loading

To load the transformed data into the MCDM system in BigQuery using dbt, follow these steps:

1. Configure the target model in dbt, such as `mcdm_ads_performance`, as the destination table in BigQuery to store the transformed data.
2. Write the SQL query in the target model to define the schema and structure of the table in BigQuery.
3. Use dbt's `--full-refresh` flag or incremental loading strategies to load the transformed data into the target table in BigQuery.

## Testing and Validation

After loading the data, perform testing and validation using dbt and BigQuery to ensure its accuracy and reliability within the MCDM system:

1. Develop test cases in dbt to validate the integration of the data from each ad platform.
2. Compare the expected results with the actual data loaded into the MCDM system using dbt's assertions and testing features.
3. Verify that the transformed data aligns with the mapped fields and meets the required standards using SQL queries and data exploration in BigQuery.

## Monitoring and Maintenance

To ensure the ongoing integrity of the integrated data, follow these best practices:

1. Set up monitoring mechanisms to track the data integration process and identify any issues or discrepancies using dbt Cloud or other monitoring tools.
2. Implement regular maintenance routines to handle updates, changes, and any evolving requirements from the ad platforms, leveraging dbt's modular and version-controlled approach.
3. Document the data integration process in your dbt project's documentation and update the instructions as needed to reflect any modifications or improvements.

By following these instructions, you can successfully add data from new ad platforms to your MCDM system using dbt and BigQuery.



