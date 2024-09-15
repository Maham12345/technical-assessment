import pandas as pd
from google.cloud import storage
import os

def read_csv(file_path):
    """Read CSV file."""
    try:
        df = pd.read_csv(file_path)
        return df
    except Exception as e:
        print(f"Error reading CSV file: {e}")
        return None
    
def transform_data(df):

    # Remove duplicates based on all columns except order id
    df = df.drop_duplicates(subset=['CustomerID', 'OrderRegion', 'OrderDate', 'OrderAmount', 'ProductID', 'Quantity'])

    # Handle invalid timestamps (convert to standard format or replace invalid dates with NaT)
    df['OrderDate'] = pd.to_datetime(df['OrderDate'], errors='coerce')

    # Forward fill missing OrderDate values
    df['OrderDate'] = df['OrderDate'].fillna(method='ffill')
    
    # Replace missing OrderAmount with median of available values
    df['OrderAmount'] = pd.to_numeric(df['OrderAmount'], errors='coerce')
    df['OrderAmount'].fillna(df['OrderAmount'].median(), inplace=True)

    # Convert Quantity to numeric, replace non-numeric with NaN, and then fill missing Quantity as mean of available values
    df['Quantity'] = pd.to_numeric(df['Quantity'], errors='coerce')
    df['Quantity'].fillna(df['Quantity'].mean(), inplace=True)

    # Fill missing ProductID with a placeholder (-1 or a unique identifier)
    df['ProductID'].fillna(-1, inplace=True)

    # Compute 'TotalOrderValue' column
    df['TotalOrderValue'] = df['OrderAmount'] * df['Quantity']
    

    return (df)


def save_to_gcs(df, bucket_name, destination_blob_name):
    """Save the cleaned dataframe to Google Cloud Storage."""
    client = storage.Client()
    bucket = client.get_bucket(bucket_name)
    blob = bucket.blob(destination_blob_name)

    # Save the dataframe to a CSV file locally
    temp_file = 'cleaned_data.csv'
    df.to_csv(temp_file, index=False)

    # Upload the CSV file to GCS
    blob.upload_from_filename(temp_file)

    # Clean up the local file
    os.remove(temp_file)
    print(f"File successfully saved to GCS: gs://{bucket_name}/{destination_blob_name}")




if __name__ == "__main__":

        input_file_path = 'data.csv'  # input CSV file
        bucket_name = 'cleaned_customer_info'     # bucket name on gcp
        destination_blob_name = 'cleaned_customer_orders.csv'  # cleaned data on gcp

        # Read the CSV file
        df = read_csv(input_file_path)
        if df is not None:
          
          # Clean the dataset
          transformed_df = transform_data(df)
          
          # Save the cleaned and transformed dataset to GCS
          save_to_gcs(transformed_df, bucket_name, destination_blob_name)
