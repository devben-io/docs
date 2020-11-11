# Cassandra Observability

* Observability = clear inidicator about the health of the system

* `nodetool status`
  * basic overview

Stage Architechture
* `nodetool tpstats`
  * show stages
  * per node health - independend for each node
  * look for not too much tast pending/blocked
  * Dropped messages -> sth. is really wrong

## Troubleshooting
look for
* Client logs
* dropped messages
* latency

### Client logs
look for
* `SyntaxError`
  * Coding issues
* `UnavailbleException`
  * Insufficient replica nodes / multiple nodes down
* `OperationTimedOutException`
  * Client timeout
* `ReadTimeoutException` / `WriteTimeoutException`
  * serious server side issues

### Dropped Messages
* cross node ./. internal
* 

### Latency
* coordinator ./. node
* look for  99th percentile metrics -> early indicator
* Coordinator lat. -> high -> 1-2 slow replica?
  * happens when clients are not token aware
* Coordinator & local lat. -> high -> cluster capacity issues? 


## Investigating w/ nodetool
* `nodetool info`
  * mem & disk usage
  * is gossip active? etc.
  * low hit rate -> a lot disk writes
* `nodetool ring`
  * state of the ring
  * show all the tokens
  * high load ?
* `nodetool gossipinof`
  * EndpointStateMap
  * versioned infos
* `nodetool failuredetector`
  * Phi values for each node
  * High phi factors? -> node marked as down?
* `nodetool tablestats <TABLE>`
  * read/write latency
  * total r/w
  * internal structure (memtables; SStables)
* `nodetool tablehistograms`
  * min/max values
  * "SSTables"-Column -> avg. No. of SSTable being read / query
  * look for massive Partitions
* `nodetool proxyhistorgrams`
  * coordinator`s history
  * latency
* `nodetool compactionstats`
  * backlog of pending compactions
* `nodetool netstats`
  * node & stream network traffic
  * background read repair should be blocking
  * message rate & success

## Nodetool Checks
* nodetool metrics -> exposed over JMX -> Prometheus -> Grafana

## Building Dashboards
* Notifications/Alerts -> something is wrong
* Dashboard -> System Health
  * more information, trending

### Notifications
* significant client r/w failures / lat.

### System Health
* Node status
* Dropped messages
* TP messages (pending/blocked)

### Table investigation


## Continious Improvement
* Incident -> PostMortems -> Retro -> Improve


## Cassandra Logs
* ship Log to ELK / Kibana -> review
* `system.log`
  * `INFO` or greater
* `debug.log`
  * noisy
* `Gc.log`
  * JVM's garbage collection

### Managing Logging
* set with `nodetool`
  * `nodetool getlogginlevels`
  * `nodetool setlogginglevel`
* some WARNings are configurbale in `cassandra.yml`
* Cassandra 4.0 -> Full Query Logging -> compliance issue
* 

## System Metrics
* CPU
  * queries -> normal prio user thread
  * compaction, streaming -> low prio user thread
* Network
  * throughput
  * "incast": small request -> large response
  * outgoing bandwidth is crucial
  * latency
* Disk
  * read lat. -> SSTable scans
  * write throughput -> write SSTables
  * disk space -> compaction
  * burst balance
    * gp2 SSD
    * maybe move to provisioned IOPS
* RAM
  * JAVA Heap
    * Memtables
  * OS Disk cache
    * page cache
  * 
