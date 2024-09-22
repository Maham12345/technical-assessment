# Overview (TASK 1)

Scenario:

Your company is building a real-time analytics platform for e-commerce data. The platform will ingest data from multiple sources (transactional databases, clickstream data, CRM data), process it in real time, store it, and make it available for business analysts and machine learning models.

## High Level Diagram

<img width="689" alt="image" src="https://github.com/user-attachments/assets/f4d48be4-589e-4d6a-bf29-505cbeedaeac">

# Design Justification:

## Data ingestion Layer:

1. **Cloud Pub/Sub:**

   Best tool to use for streaming data ingestion as highly scalable and latency is minimal.

1. **Cloud Storage:**

   Best tool to use for batch data ingestion as it is low-cost and it supports high-throughput data uploads and 
   downloads.

## Data Processing Layer:

1. **Cloud Dataflow:**

   - It supports both batch and stream processing, making it a versatile choice for handling data in either mode.
   - Automatically scales with data size, ensuring that processing performance is optimized while controlling costs.
   - seamless integration with all other GCP services.
     
## Data Storage Layer:

1. **BigQuery:**

   - highly scalable data warehouse
   - pay-per-query pricing makes it cost-efficient for sporadic querying, especially when handling large volumes of data.
   - Integration with Data Studio allows for seamless data visualizations.

2. **Cloud Storage:**

   - If analytics or querying is not needed, most efficient decision is to archive data in Cloud Storage, where it can be kept long-term.
   - Offers a low-cost storage solution for data that doesn’t need to be queried immediately.
   - It provides durability and flexibility for accessing historical data at a low cost.
  
## Orchestration Layer:

   - Built on Apache Airflow, Cloud Composer allows for complex dependency management and task scheduling, which is crucial when managing a hybrid batch-streaming pipeline.
   - Cloud Composer can automate the triggering of Dataflow jobs based on new data arrival in Cloud Storage or Cloud Pub/Sub.

## Visualization Layer:

- tool for real-time or batch data visualization.
- integrates easily with BigQuery, enabling to create interactive dashboards and reports.
- zero cost as it is a free service.

# Scalability Considerations:
- **Cloud Pub/Sub** and **Dataflow** are both designed to handle dynamic, high-volume data loads. These services automatically scale based on the volume of data, ensuring no performance degradation under high loads.
- **BigQuery** supports petabyte-scale data warehouses, and **Cloud Storage** offers infinite scalability.
- The overall design minimizes operational overhead by leveraging fully managed services that handle scaling natively.

# Cost-Efficiency:
- **Cloud Pub/Sub**: Pricing is based on the number of messages and total data volume
- **BigQuery**: The pay-per-query model ensures that costs are tied directly to usage, making it efficient for on-demand analytical queries.
- **Cloud Storage**: Lifecycle management policies allow for the automatic transition of infrequently accessed data to cold storage, minimizing long-term archival costs.

# Security Considerations:
- **Cloud IAM (Identity and Access Management)** provides fine-grained access control to GCP resources, ensuring secure handling of data across the pipeline.
- **VPC Service Controls** create security perimeters that prevent unauthorized access to resources and sensitive data, adding an extra layer of protection.
- All data in **BigQuery** and **Cloud Storage** is encrypted at rest and in transit, ensuring compliance with industry-standard data protection requirements.

# Trade-offs and Challenges:
- **Latency**: There is a trade-off between real-time processing and cost. Running continuous real-time analytics with **Dataflow** and **BigQuery** can result in higher operational costs. Tuning jobs to achieve ultra-low latency may further impact cost and complexity.
- **Data Quality**: In streaming pipelines, ensuring data quality (e.g., handling out-of-order events, late-arriving data) is crucial. **Pub/Sub** and **Dataflow** require careful configuration of windowing and watermark strategies to address these issues.
- **Performance Bottlenecks**: High-velocity streaming data in **Dataflow** can cause bottlenecks if the parallelism is not properly managed. Auto-scaling must be fine-tuned for continuous processing jobs to avoid performance degradation.




     






