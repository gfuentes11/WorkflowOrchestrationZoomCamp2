
-- No data to start since the data was not copied just tables created
SELECT * from green_tripdata;

-- After running the copy to stagging table let us take a look and see if it is there. 
SELECT * FROM green_tripdata_staging;

-- Now that we have run an update on the unique id let us check the green staging table again.
SELECT * FROM green_tripdata_staging;

-- you willnotice the total increase in row counts let us go in and fix it.

-- Truncanted the table let us check the results: 
SELECT * FROM green_tripdata_staging;

-- Now let us merge the tables and check to see if we have data in the non-staging green taxi table
SELECT * FROM green_tripdata_staging;
-- Should now see data succesfully!
SELECT * FROM green_tripdata;

-- Now let us run this same data set but for Feburary 
-- SEE A DIFFERENT VALUE FOR STAGING
SELECT * FROM green_tripdata_staging;
-- DOUBLE NOW FOR NON STAGING TABLE 
SELECT * FROM green_tripdata;
