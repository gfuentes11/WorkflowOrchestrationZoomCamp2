# Workflow Orchestration with Kestra: Data Engineering Zoomcamp

This repository contains demo and homework files from the Data Engineering Zoomcamp, focusing on **workflow orchestration** using [Kestra](https://kestra.io/). The workflows are designed to ingest NYC Taxi data and load it into both **Postgres** and **BigQuery**, illustrating how Kestra can coordinate data tasks across multiple services.

## Repository Structure

```
.
├── flows/
│   ├── zoomcamp_06_gcp_taxi_scheduled.yml
│   ├── zoomcamp_07_gcp_dbt.yml
│   ├── zoomcamp_gcp_setup.yml
│   ├── zoomcamp_gcp_taxi.yml
│   ├── zoomcamp_postgres_dbt.yml
│   ├── zoomcamp_postgres_taxi_scheduled.yml
│   ├── zoomcamp_postgres_taxi.yml
│   ├── zoomcamphw_02_gcp_setup.yml
│   └── zoomcamphw_03_gcp_taxi_scheduled.yml
├── gcpCreds/
│   └── zoomcamp2-kestra.json        # GCP service account key (DO NOT COMMIT PUBLICLY)
├── hw/
│   └── hw_flow/
│       ├── zoomcamphw_02_gcp_setup.yml
│       └── zoomcamphw_03_gcp_taxi_scheduled.yml
├── queries/
│   ├── checkGreentaxi.sql
│   ├── checkYellowTaxi.sql
│   └── postDBTrun.sql
├── .gitignore
├── docker-compose.yml
└── README.md  (this file)
```

### Key Folders and Files

1. **`docker-compose.yml`**  
   - Spins up the Kestra instance (including a UI on port 8080 by default)  
   - Also spins up a local Postgres container in the same docker-compose file (so there is no need for a separate container).

2. **`flows/`**  
   - Contains all the Kestra workflow definitions in YAML format. Each file represents a distinct workflow, for example:
     - `zoomcamp_postgres_taxi.yml` loads NYC Taxi data into Postgres.
     - `zoomcamp_gcp_setup.yml` creates GCP resources (bucket, dataset) via Kestra tasks.
     - `zoomcamp_gcp_taxi.yml` stores CSV files in a GCP bucket and loads them into BigQuery.
     - `zoomcamphw_02_gcp_setup.yml` and `zoomcamphw_03_gcp_taxi_scheduled.yml` are homework versions of the GCP flows.

3. **`gcpCreds/zoomcamp2-kestra.json`**  
   - Your GCP service account key used by Kestra tasks that interact with Google Cloud.

4. **`hw/hw_flow/`**  
   - Additional homework flows that follow a similar structure to the main demos.

5. **`queries/`**  
   - A few SQL scripts used by the workflows to verify or perform data operations, e.g. checking if green or yellow taxi data loaded successfully.

---

## Getting Started

### Prerequisites

1. [Docker](https://www.docker.com/get-started) and [Docker Compose](https://docs.docker.com/compose/) installed locally.
2. A valid **Google Cloud** project (if you plan on using GCP flows).
3. A **service account JSON file** placed in `gcpCreds/zoomcamp2-kestra.json`.

### Installation & Setup

1. **Clone the repository**:

   ```bash
   git clone https://github.com/your-username/workflowOrchestrationZoomcamp2.git
   cd workflowOrchestrationZoomcamp2
   ```

2. **Start up Docker Compose**:

   ```bash
   docker-compose up -d
   ```

   This command will:
   - Spin up a Kestra instance (with web UI typically on [http://localhost:8080](http://localhost:8080)).
   - Spin up a Postgres database (on port 5432 by default).

3. **Access the Kestra UI**  
   Open your browser and navigate to [http://localhost:8080](http://localhost:8080).  
   From here, you can view, run, and monitor your workflows.

### Using Kestra

1. **Importing Flows**  
   By default, Kestra will watch the local file system for `.yml` flows in certain directories (you can configure this). You can also manually upload flows through the Kestra UI.

2. **Running a Flow**  
   In the Kestra UI, choose a flow (e.g., `zoomcamp_postgres_taxi`) and click **Run** to trigger it.  
   - This flow might ingest NYC Taxi data from a given source (CSV or other) and load it into your **local Postgres** instance.

3. **Scheduling a Flow**  
   Some flows (e.g. `*_scheduled.yml`) have scheduling configurations. If you’d like these to run automatically, ensure the `cron` or schedule is active in the flow definition and that Kestra's scheduler is running.

### Workflows Overview

- **`zoomcamp_postgres_taxi.yml` / `zoomcamp_postgres_taxi_scheduled.yml`**  
  These demonstrate how to ingest NYC Taxi CSV data into the **Postgres** DB that’s included in the Docker Compose setup.

- **`zoomcamp_gcp_setup.yml`**  
  Configures resources in Google Cloud (such as creating a GCS bucket and a BigQuery dataset).

- **`zoomcamp_gcp_taxi.yml` / `zoomcamp_06_gcp_taxi_scheduled.yml`**  
  Uploads the taxi CSV files to the GCS bucket and loads the data into BigQuery.

- **Homework Flows**  
  - **`zoomcamphw_02_gcp_setup.yml`**: Similar to `zoomcamp_gcp_setup.yml`, sets up GCP resources for homework tasks.  
  - **`zoomcamphw_03_gcp_taxi_scheduled.yml`**: Ingests different (homework-assigned) data into GCS and loads into BigQuery on a schedule.

### Checking the Data

- **Postgres**  
  Connect to the local Postgres instance using a client or via Docker. For example:
  ```bash
  docker exec -it <container_name> psql -U postgres
  ```
  Then run queries from `queries/checkGreentaxi.sql` or `queries/checkYellowTaxi.sql`.

- **BigQuery**  
  Use the GCP Console or `bq` CLI to run queries on your dataset (created by the GCP flows).

---

## Resources

- **Kestra Documentation**: [kestra.io/docs](https://kestra.io/docs)
- **Data Engineering Zoomcamp**: [Course Homepage](https://github.com/DataTalksClub/data-engineering-zoomcamp)
- **NYC Taxi & Limousine Commission Data**: [NYC TLC Data](https://www1.nyc.gov/site/tlc/about/tlc-trip-record-data.page)

---

### Author

- [Gabriel Fuentes](https://github.com/gfuentes11)  
- Inspired by the [DataTalksClub/data-engineering-zoomcamp](https://github.com/DataTalksClub/data-engineering-zoomcamp) materials.

