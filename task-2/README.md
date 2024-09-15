# Overview (TASK 2 - PART 1)

This script is designed to read, clean, transform, and upload customer order data to Google Cloud Storage (GCS). Below is an explanation of the decisions made at each step:



## Design Justification

1. **CSV File Reading**:
   
   The script uses pandas to read the CSV because pandas.read_csv() is a highly efficient method for loading data 
   into a DataFrame, which facilitates further transformations.

2. **Removing Duplicates**: 

   Duplicates are removed based on all columns except OrderID.

3. **Handling Invalid Timestamps**:

   Invalid dates are handled using pd.to_datetime with errors='coerce', which converts any invalid date format into 
   NaT (Not a Time).

4. **Filling Missing Timestamps**:

   Missing values in OrderDate are filled using forward fill (method='ffill').Forward fill propagates the last valid 
   observation forward, which is a reasonable strategy for filling missing date values in sequential data like orders.

5. **Handling Missing or Invalid Order Amounts**:

   Invalid or non-numeric values in OrderAmount are coerced to NaN. Missing values are then replaced with the median 
   value of the non-missing OrderAmount.
   
   Rationale: The median is used instead of the mean to avoid the influence of outliers on the central tendency, 
   ensuring that extreme order amounts don’t skew the results.

6. **Handling Missing or Invalid Quantity**:

   Similar to OrderAmount, non-numeric values in Quantity are replaced with NaN, and missing values are filled with 
   the mean of valid quantities.
   
   Rationale: Since Quantity  doesn't have outliers like OrderAmount, the mean is an appropriate 
   measure to replace missing values.

7. **Handling Missing ProductID**:

   Missing values in ProductID are filled with -1, a placeholder indicating a missing or unidentifiable product.
   
   Rationale: This ensures no missing values are left for ProductID and -1 placeholder is easily 
   recognizable for filtering.

8. **Calculating Total Order Value**:

   A new column TotalOrderValue is computed as the product of OrderAmount and Quantity.

9. **Saving Data to Google Cloud Storage (GCS)**:

   The cleaned DataFrame is saved to GCS, using the google-cloud-storage library to interact with Google Cloud.



## Google Cloud Setup:

1. **Create a GCS Bucket**: Create a bucket in Google Cloud Storage to store the cleaned data.
2. **Generate a Service Account Key**:
   - Create a service account in the Google Cloud Console and download the JSON key.
   - Ensure the service account has the necessary permissions to upload files to the bucket.
3. **Set Google Cloud Credentials**:
   - Set the environment variable `GOOGLE_APPLICATION_CREDENTIALS` to the path of the service account key:
     ```bash
     export GOOGLE_APPLICATION_CREDENTIALS="path/to/your/credentials.json"
     ```
## RESULT:
<img width="1214" alt="image" src="https://github.com/user-attachments/assets/45aff08c-303f-4c28-9f72-0f5ea5c9452f">

## TRANSFORMED DATA SET:

<img width="554" alt="image" src="https://github.com/user-attachments/assets/97958a86-93d9-4586-9fb5-381764f6124c">



# Overview (TASK 2 - PART 2)

## 30 days rolling average query

1. **Window Function (AVG() with OVER()):**:
   
   This window function calculates the rolling average of the TotalOrderValue for each customer over a 30-day period 
   (29 preceding rows plus the current row)

2. **Partitioning by CustomerID:**:
   
   Ensures that the rolling average is computed individually for each customer

3. **Ordering by OrderDate:**:
   
   Ensures that the rolling average is computed in chronological order over a window of 30 days

## RESULT:

<img width="768" alt="image" src="https://github.com/user-attachments/assets/f5eafe6b-6ca8-47ad-9efc-e3027ea2e836">

<img width="1221" alt="image" src="https://github.com/user-attachments/assets/e36311de-d5a7-4350-bbfd-415d2244c21d">

## highest average spending aggregrated by region query

1. **Window Function (AVG() with OVER()):**:
   
   This window function calculates the rolling average of the TotalOrderValue for each customer over a 30-day period 
   (29 preceding rows plus the current row)

2. **Partitioning by CustomerID:**:
   
   Ensures that the rolling average is computed individually for each customer

3. **Ordering by OrderDate:**:
   
   Ensures that the rolling average is computed in chronological order over a window of 30 days

## RESULT:

   
