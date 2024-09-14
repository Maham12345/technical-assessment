# Customer Orders Data Cleaning and Upload Script


## Features

The script performs the following tasks:
- **Remove Duplicates**: Automatically detects and removes duplicate records.
- **Fill Missing Values**: Handles missing values in several fields by filling with appropriate defaults (mean for `Quantity`, median for `OrderAmount`, etc.).
- **Data Transformation**:
  - Convert non-numeric entries (e.g., "Three", "One Hundred Pounds") to numeric values.
  - Compute additional columns like `TotalOrderValue` (OrderAmount * Quantity).
- **Timestamp Normalization**: Converts invalid or inconsistent timestamps to a standard format, filling missing dates using forward fill.
- **Upload to Google Cloud Storage (GCS)**: The cleaned dataset is saved locally and uploaded to a specified GCS bucket.

## Prerequisites

### Tools and Libraries:
- Python 3.x
- [Google Cloud SDK](https://cloud.google.com/sdk/docs/install)
- Python libraries:
  - `pandas`
  - `google-cloud-storage`
  
### Google Cloud Setup:
1. **Create a GCS Bucket**: Create a bucket in Google Cloud Storage to store the cleaned data.
2. **Generate a Service Account Key**:
   - Create a service account in the Google Cloud Console and download the JSON key.
   - Ensure the service account has the necessary permissions to upload files to the bucket.
3. **Set Google Cloud Credentials**:
   - Set the environment variable `GOOGLE_APPLICATION_CREDENTIALS` to the path of the service account key:
     ```bash
     export GOOGLE_APPLICATION_CREDENTIALS="path/to/your/credentials.json"
     ```

## Setup

1. Clone this repository and navigate to the project directory.
2. Install the required Python libraries:
   ```bash
   pip install pandas google-cloud-storage
