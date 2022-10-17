# Structured Streaming
- Structures Streaming treats a live data stream as a table that is being continuously appended

## Micro-batch processing
- default stream processing mode in Spark
- data stream processed as a series of batch jobs
- end-to-end latencies of 100ms
- Exactly-once fault-tolerance guarantees

## Driver
- Separate process (JVM)
- The master node
- Launches tasks
- host SarkContext
- group services: SparkEnv, DAGScheduler, Task Scheduler, SparkUI

## Spark Application
- Uses SparkContext as entry point, SparkContext is wrappend in SparkSession
- Create RDD DAG
- DataFrames run on top of RDDs, throght Stages (physical execution plan)
- each stage is split into tasks (operation on RDD partitions)

## Cluster Manager
- orchestrate execution of spark tasks
- allocating resources and spinning up jobs on workers
- Yarn
- Apache Mesos
- Kubernetes
- Spark Standalone

## Worker
- Compute nodes in cluster
- run the Spark application code
- can have multiple executors, who can run multiple tasks

## Executor
- distributed agents that execute tasks

## Data source
- File source (prd)
- Kafka source (prd)
- Socket source (dev)
- Rate source (dev)

## Data sink
- File sink
- Kafka sink
- Foreach sink
- console sink (dev)
- memory sink (dev)
- Processes incrementally, updates result and discart source

## Trigger
- Events thar determine when transformation on accumulated input data need to be re-performed. Each trigger event emits new data into the Result Table
    - Default (micro-batch)
    - Fixed interval micro-batch: user-specified intervals
    - one-time micro-batch: process all avaiable data and stop
    - continuous with fixed checkpoint interval

## Result Table
- intermediate buffer that holds the final result of the transformations applied on the input data before write on external data sink

## Output Modes
- Determines what Result Table rows get sent to storage
    - Update mode: only result table rows updated since last trigger. Even previous results will be updated in case of aggregations. Selection, projection and aggregation
    - Append mode: only result table rows appended since last trigger. Previous (existing) output rows cannor change. Selection and projection
    - Complete mode: entire updated result table is sent across. Storage connector must decide how to use all that data. Selection, projection, aggregation and ordering