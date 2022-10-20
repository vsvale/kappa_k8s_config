### Why Airflow
- Recover automatically from errors
- Monitor tasks
- Warn task fail and why
- create, monitor and manage data pipelines


### What is Airflow
- Orchestrator for creating dynamic data pipelines
- Open Source platform to programmatically author, schedule and monitor workflows
- Not a streaming or a data processing framework
- Best orchestrator for bash

### Benefits
- DAG in python: Data pipeline are dynamic
- highly scalable: k8s and celery
- Interactive: api, cli and UI
- Extensible: customize ui, operators and plugins 
- Sensors in many operators
- scheduler of tasks
- backfilling to reprocess historic data
- integrates with spark, dask

### Core componenetes
- Webserver: UI
- Scheduler: schedule and trigger tasks
- Metadata database: metadata from users, jobs, variables and connections. Anydatabase compatible with SQLAlchemy can be used
- Executor: how tasks will be executed. Kuberbetes, Celery, Sequential, Local
- Worker: where tasks are executed

### Executor
- defines the way tasks are going to be executed in aiflow instance
- in any executor has a queue where tasks going to be pushed and pulled by workes. Queue define order of execution of tasks. 
- Local: multiple tasks in the same machine
- Kubernetes: mutiple tasks in k8s
- Celery: distribute task in pultiple machines, need a queue in redis and install airflow and dependencies in each worker
- default: Sequential executor, no paralalism cause sqlite don't allow multiple writes at same time
- grep executor airflow.cfg

### Architecture
- Single node: all componentes run in the same machine
    - Web server presents all data from metastore
    - Scheduler verify if task is ready to run, change status of task in metastore, create task task instance and send to queque of executor to be fetched by worker and executed
    - Executor update the task stages in metastore
- Multi Nodes (Celery): Node with componentes
    - Webserver, Scheduler, executor in one node
    - Metastore and queue (redis) in another node
    - multiple worker nodes pull from queue

### DAG
- data pipeline
- direct acyclic graph: graph with nodes and edges, but edges are directed and the is no loop
 
### Operators
- node in a DAG
- task in a DAG
- Action Operators: execute Python
- Transfer Operator: from mysql to Presto
- Sensor: file watch

### Task
- instance of an Operator

### Task Instance
- when a task is ready to be schedule
- represents a specific run of a task: DAG + TASK + Point in time

### Dependencies
- >>
- edges in a DAG
- relantionship between tasks

### Workflow
- DAG with operators and dependencies

#### Task Actions
- if using kubernetes and celery executor can run task
- clear restart the task (retry)
- Mark failed and mark success

### Task lifecicle
1. Create a py file in dag folder
2. Web Server (30s) and Scheduler (5 min) parse dags
3. if dag is ready to be triggered, scheduler create a Dagrun (instance of dag) in metastore with status running, at beginning tasks in Dagrun object have no status
4. if task is ready to be triggered, scheduler create a taskinstance in metastore with status scheduled
5. Scheduler send the taskinstance into the executor and chage the status in metastore to queued
6. Executor take that task and execute in a worker (status running), updating the status in metastore (sucess or failed)
7. Web server updates the UI

### Tasks status

- none: The Task has not yet been queued for execution (its dependencies are not yet met)
- scheduled: The scheduler has determined the Task’s dependencies are met and it should run
- queued: The task has been assigned to an Executor and is awaiting a worker
- running: The task is running on a worker (or on a local/synchronous executor)
- success: The task finished running without errors
- shutdown: The task was externally requested to shut down when it was running
- restarting: The task was externally requested to restart when it was running
- failed: The task had an error during execution and failed to run
- skipped: The task was skipped due to branching, LatestOnly, or similar.
- upstream_failed: An upstream task failed and the Trigger Rule says we needed it
- up_for_retry: The task failed, but has retry attempts left and will be rescheduled.
- up_for_reschedule: The task is a Sensor that is in reschedule mode
- deferred: The task has been deferred to a trigger
- removed: The task has vanished from the DAG since the run started

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

### Provider
- Extend functionalities to airflow core 
- Entirely separated can be updated withput waiting for airflow

### Extras
- Allows install set of dependencies needed for a feature
- Kubernetes extra, Celery extra

### The 3 ways
- UI: manage and monitor, check logs of tasks, history of dag runs
- CLI: test tasks, update and initialize Airflow
- Rest API: build app in top of airflow

### UI delete DAG
- Only delete metadata not dag file

#### Toggle
- Unpause dag, now it can be scheduled

#### Tree view
- First view when open dag
- History, status of tasks boxes and status of DAG run (circle)

#### Graph View
- check dependencies
- status of the tasks for the latest DAG run

#### Gant View
- Durantion of tasks
- identify bottlenecks
- identify parallelism

#### Task instance
- click in task in any view
- get logs
- get details
- get rendered data in templates
- Filter upstream show from trask to start

#### CLI import commands
- airflow db init: init database and generate the files and folders needed by airflow
- airflow db upgrade: upgrade airflow instance
- airflow db reset: reset default factory
- airflow webserver: start UI
- airflow scheduler: start scheduler
- airflow celery worker: start celery worker in each machine
- airflow dags pause/unpause: toggle dag to be scheduled or not
- airflow dags trigger: trigger a dag
- airflow dags list: list dags
- airflow tasks list dag_id: list task of a dag
- airflow tasks test dag_id 2022-12-31: test if tasks works
- airflow dags backfill -s startdate -e enddate --reset_dagruns dag_id: run all from paused date

### Stable Rest API
- production ready
- endpoint with crud to each component of ariflow

### DAG
- dag_id is the only thing obrigatory in a DAG

- start_date time a dag can be scheduled
- if start_date is not defined the default value is none. 
- If a task is created without start_date DAG is invalid.
- start_date can be in future or in the past
- you can define start_date in operator, but is not recommended
- always use dates in UTC, but you can use TZ
- schedule_interval interval need to wait to run dag
- every 24 hours is the default schedule_interval
- first run = start_date + schedule_interval
- execution_date is the scheduled period
- end_date: when dag stop scheduling

### Schedule
- scheduler_interval or schedule
    - None: manual
    - @daily, @weekly, @monthly
    - cronjob: '* * * * * ' minute, hour, day, month, day of week
    - conjob is a string that represents a interval of time
    - timedelta is relative from the last execution_Date

### Backfilling
- run or rerun past non triggered or triggered DAG run
- after pause for many days
- catchup=True/False in dag
- max_active_runs limits catchup

### Operator
- operator = task
- 1 operator 1 task, more efficient
- operator must be indepotent: same input same output
- unique task id
- default_args apply to all tasks
- in Pythonoperator you can access dag context by passing **kwargs as parameter of function
- ds is execution date in pythonoperator
- op_kwargs = {'my_param':42} and put my_param as parameter
- on_failure_callback= run a command when task failed

### Sensor
- special operator
- wait for a file 

### X-com
- Cross-communications: push and pull of metadata
- return in pythonoperator or pass ti as parameter and ti.xcom_push(key='return_value',value=42)
- it is save in metadatabase, max 2gb
- key:value
- to use xcom value in python operator use ti as parameter and ti.xcom_pull(key='return_value',task_id['name_of_returned_task'])
- can be used task_pull(task_push())

### Concurrency
- Parallelism: maximum number of tasks can be execute at same time in airflow (default 32)
- dag_concurrency: defines the number of tasks for a given dag that can be executed in parallel across all of the DAG runs (default 16)
- max_active_runs_per_dag: defines the number of dag runs that can run at the same time for a given DAG (defaul 16)
- max_active_runs: defines the number of dag runs that can run at same time for a specific dag
- concurrency: defines the number of task runs that can run at same time for a specific dag

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

    free-retry-exam-airflow-fundamentals