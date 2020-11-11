# Cassandra Operations

## Installation
* w/ tf OR ansible -> good
* JVM8 !!!
* Clocks must be synced via NTP
* Disable `zone_reclaim_mode` on NUMA Systems
* tune / increase open file handlers
* TCP Buffer Settings
* disable swap

## AWS ressources
* better many smaller nodes, than less bigger nodes
  * C5 is good
  * 8 cores 8GB Ram, guaranteed 10GB network
  * Disk -> LAAAAAARGE :)

## Nodetool Operations
* `nodetool flush`
  * flushes from memtables to SSTables
* `nodetool drain`
  * gracefull shutdown
  * flushes all memtables to SSTables & rejecting connections afterwards
* `nodetool cleanup`
  * after compaction
  * scans all the data
  * `-j 0` -> speed up
* `nodetool repair`
  * better use `cassandra reaper`

### Monitoring Repair
  * `nodetool netstats`
  * beside that no way to monitor repairs


## SSTables Utilities
* `sstableutil <KEYSAPCE> <TABLE>`
* `sstabledump <SSTABLE_FILE>`
* `sstableverify <SSTABLE_FILE`
* `sstablescrup <KEYSPACE> <TABLE>`
* `sstablerepairdset -really-set <TABLES>`
* `sstableexpiredblockers`


## Common Tasks
TIP
* use seperate EBS volumes for OS, Logs, Datastore

### add a node
* cassandra version must match
* cluster must consistent
* use the same seed nodes
* add nodes to all AZ at a time
* can be automated

### Failed node
* Recover the AWS way: reuse the EBS (Backup) + ENI (same IP like before)

### Replace running node
* `nodetool drain`

### Remove a node
* `nodetool decommission` (on the node itself)
* `nodetool removenode <HOSTID>` (on another node)
* if all else fails: `nodetool assissinate <IP>` (aggressive, needs maybe a repair)

### Backup
* full backup (snapshots)
  * `nodetool snapshot`
  * hardlinks in FS
  * on a per node level -> so do it on every node !!! (e.g. `pssh`)
* incremental backup
  * SSTables + commitlogs since full-backup (snapshot)
* normally: user defined activity :(
* Tools
  * Medusa
  * Tablesnap

### Restoring
* ensure schema is in place
* `truncate` to ensure problematic changes are removed
* `nodetool refresh`
* changes since backup? -> `sstableloader` (inserts SSTable into the node)


### Backup w/ AWS
* Backup EBS disks -> Amazon Data Lifecycle Manager to automate backups
* `nodetool flush` before backup
* S3 Bucket lifecycle policy


## Upgrade
* **TEST** before upgrade -> give releases some time before upgrade
* maybe config changes -> change ansible
