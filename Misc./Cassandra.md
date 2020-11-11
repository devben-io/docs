# Cassandra

* Query Lang. -> CQL
* High Throughput
* High Diskspace
* KV Store -> flexible Datamodel
* Repairs -> Operational Overhead

## Connection
* Distribut. System
* can be connected to any node
* 

## Data Partioning
* Primary Key -> hashed
* 

## Write Path
* Inmemory ordering
  * sync
* SSTable:
  * immutable
  * async
* No data is read when writing

## Read Path
* Bloom Filter
  * Partition get hashed
  * Reduces Addressspace for in-memory
