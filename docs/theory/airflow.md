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
- developed code to integrate, sensor

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