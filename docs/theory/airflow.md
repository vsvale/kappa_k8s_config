### What is Airflow
- Orchestrator for Batch
- Open Source
- DAG in python
- Data pipeline
- Sensors in many operators
- scheduler of tasks
- develop and monitor workflows
- backfilling to reprocess historic data
- integrates with spark, dask

### Operators

### Trigger rules


- all_success (default): All upstream tasks have succeeded
- all_failed: All upstream tasks are in a failed or upstream_failed state
- all_done: All upstream tasks are done with their execution
- all_skipped: All upstream tasks are in a skipped state
- one_failed: At least one upstream task has failed (does not wait for all upstream tasks to be done)
- one_success: At least one upstream task has succeeded (does not wait for all upstream tasks to be done)
- none_failed: All upstream tasks have not failed or upstream_failed - that is, all upstream tasks have succeeded or been skipped
- none_failed_min_one_success: All upstream tasks have not failed or upstream_failed, and at least one upstream task has succeeded.
- none_skipped: No upstream task is in a skipped state - that is, all upstream tasks are in a success, failed, or upstream_failed state
- always: No dependencies at all, run this task at any time

### [REST API](https://airflow.apache.org/docs/apache-airflow/stable/stable-rest-api-ref.html)
- OpenAPI 3
- CRUD operation
- Interact with Airflow withour using CLI
- create apps like [this](https://github.com/marclamberti/airflow-2-demo-api.git), who gets what dag use each variable in airflow

### Task Group
- Don't use Sub-dags: it consume task limit (AIRFLOW__CORE__PARALLELISM) creating deadlocks and create a new dag
- task group: group visually task, no drawbacks
- example: [taskgroups_astronomer_demo](https://raw.githubusercontent.com/vsvale/kappa_airflow/main/dags/taskgroups_astronomer_demo.py)

### TaskFlow API
- store(process(extract()))
- return of extract is used by process and its returns is used by store
- use xcom to pull/push data

### Smart Sensors
- wait something happen before move to next task
- register sensor in metastore

### Highly Avaiable Scheduler
- if scheduler is down can't trigger any more tasks
- multiple scheduler istances, no single point of failure
- more schedulers = more connections to metastore so be careful

### PythonVirtualenvDecorator
- isolate tasks
- tasks run in a python virtual environment  so that they can have their own dependencies without altering the "host" system

### Secrets
- Connections and variables may contain sensitive values
- hide_sensitive_var_conn_fields=True
- sensitive_var_conn_names contains the keywords that will be recognised  by Airflow to indicate that there is a value to hide.
- By default, any variable with of those keywords in the key will be hidden: 'password', 'secret', 'passwd', 'authorization', 'api_key', 'apikey', 'access_token'

### BranchpythonOperator
- use it when you need a condition to decide wich task run next
- taskA >> check >> [is_true,is_false]
- after taskA run successfully run a python function with a if else statement with returns. this function must return task_id.


### Spark on Airflow

#### Sensors
- waiting for a new file to arrive, mos often data landing in a data lake folder in a general format to be consumed by the spark engine to be processed
- S3KeySensor
- DateTimeSensor
- ExternalTaskSensor
- HttpSensor
- SqlSensor
- PythonSensor

#### Compact Files
- After moving or copying files from the landing zone to the processing zone one of the best practices for spark engineers is to size the files to avoid small files problems
- file lands in a bucket usually in json or csv
- listen landing zone til has 128mb of files then compact data and send to processing zone for spark to pick up

#### End-to-end data pipeline
- Ingestion, processing and serving
- Orchestrate an end-to-end data process by scheduling a pipeline to apply complex logic to serve the data for end users
    1. Source: get files from different systems
    2. S3 Data Lake: store data in different size and formats, try to use a lakehouse format
    3. Orchestration: watch data lake using a sensor or in scheduled basis to trigger processing, after that deliver to serving
    4. Apache Spark: intelligent framework for dealing with transformation
    5. Seving: MDW