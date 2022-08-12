
### What is distributed SQL?
- The defining characteristic of a distributed SQL database is that the entire database cluster (irrespective of the number of nodes in it) looks to applications as a single logical SQL database.
- Distributed SQL databases have a three layer architecture:
    - SQL API: or applications to model relational data and also perform queries involving those relations. Typical data modeling constructs that are unique to these databases are indexes, foreign key constraints, JOIN queries, and multi-row ACID transactions.
    - Distributed query execution: Queries should be automatically distributed across multiple nodes of the cluster so that no single node becomes a bottleneck for query processing.
    - Distributed data storage: Data including indexes should be automatically distributed (aka sharded) across multiple nodes of the cluster so that no single node becomes a bottleneck for ensuring high performance and high availability. Additionally, the database cluster should support strongly consistent replication and multi-row (aka distributed) ACID transactions in order to ensure the single logical database concept.
- Replication: Supporting a powerful SQL API layer inherently requires the underlying storage layer to be built on strongly consistent replication across the nodes of the database cluster. This means writes to the database would be synchronously committed at multiple nodes in order to guarantee availability during failures. Reads should either serve the last committed write or an error.
- Linearizability: Reads should either serve the last committed write or an error. Distributed SQL databases are classified as Consistent and Partition-tolerant (CP).
- Distributed ACID Transactions:  where transaction coordination across multiple rows located on multiple nodes is required. Usually this requires the use of a 2 Phase Commit (2PC) protocol.
- Auto heal: Infrastructure failures always affect only a subset of data (only those shards whose leaders get partitioned away) and never the entire cluster. And, given the ability of the remaining shard replicas to automatically elect a new leader in seconds, the cluster repairs itself thereby exhibiting self-healing characteristics when subjected to failures.
- Hash sharding: shards remain automatically balanced across all available nodes as new nodes are added or existing nodes are removed
`CREATE TABLE t1(
        id integer NOT NULL,
        col1 character varying(5),
        col2 character varying(5),
        PRIMARY KEY (id HASH)
)`
- Low User Latency with Geographic Data Distribution: distributed SQL databases can offer a wide array of techniques to build geo-distributed applications that not only help in tolerating region failures automatically but also lower latency for end users by bringing data closer to their local region.
- Examples: Amazon Aurora, Google Cloud Spanner, TiDB, CockroachDB, YugabyteDB
### Hash sharding



