## Adding Data from New Ad Platforms to MCDM

### Steps

1. **Identify the New Ad Platform:**
   - Determine the new ad platform from which you want to import data into your MCDM. Ensure you have the necessary credentials and permissions to access the data from that platform.

2. **Create a New BigQuery Table for the Ad Platform Data:**
   - In your connected BigQuery project, create a new table within the existing source dataset to store the data from the new ad platform. This will help keep your data organized and allow for easy integration with your existing dbt models.

3. **Set Up the Connection in dbt Cloud:** 
   - Open your dbt project in dbt Cloud.
   - Go to the "Sources" tab and select the existing source to which you want to add the new ad platform data.
   - In the source configuration, update the schema to include the new ad platform table.
   - If required, provide any additional authentication or access details specific to the new ad platform.
   - Test the connection to ensure it is successful.

4. **Create a New Model for the Ad Platform Data:**
   - In your dbt project, navigate to the `models` directory.
   - Create a new SQL file (e.g., `ad_platform_data.sql`) to define the transformations for the new ad platform data.
   - Write SQL queries to extract, transform, and load the data from the new ad platform table into your existing MCDM tables.
   - Leverage the existing dbt models and transformations to integrate the new ad platform data seamlessly.

5. **Configure the dbt `src_channels.yml` File:**
   - Open the `crs_channels.yml` file in your dbt project.
   - Update the existing source configuration to include the new ad platform table under the appropriate schema.
   - Ensure that the `source` and `target` attributes align with the newly added BigQuery table.

6. **Run dbt**
   - To transfer data to BigQuery use the dbt run command after properly configuring your dbt models to transform and load the data from your data sources into BigQuery tables. 




