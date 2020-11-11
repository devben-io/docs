# Cassandra - Operational Concepts

* Bloomfilter (Readpath)
  * on Nodelevel
  * Performance/Size depends on RAM & Diskspeed

## Gossip
* Protocoll for P2P state sync
* runs every sec.
* on OSI Layer 4/5
* randomly pics a seed node
* Gossiper:
  * Endpoint Statemap
  * IP+Port
* HeartbeatState
  * is incremented each time
  * latest version of the state
* ApplicationState
  * KV-Pairs
* Messaging
* Failure Detection
  * suspicion level is increased on "node down"
  * phi_conict_threashold > 8 (default threashold) 

## Vnodes
* tokenrange
* default 256 vnodes per node
* avoiding hotspots -> more balance across the cluster
* why
  * no manual rebalance
  * faster repair
  * parallize
* Problem w/ vnodes
  * Latency in token-range scans
  * large numbers of SSTables
  * difficult changing VNodes after Cluster is established \<< Cluster must rebalanced
* Unbalanced Cluster 
  * by Hotspots
  * by Wide rows
* balanced cluster
  * seed nodes in each rack w/ manual token range
  * create keyspace
  * start nodes one at a time
  * 

## Compaction 
* as memtables grow -> lots SSTables -> increases Read latency
* sticks SSTables together -> assembles to on row
* **heavy diskload & diskspace (up to 2x diskspace while compacting)**
* 3 compaction strategies
  * LevelCompactionStrategy
    * non-overlapping data
    * temp. 10x size increase 
    * write intense
    * more for read oriented clusters
    * 
  * TimeWindowCompactionStrategy
    * for timeseries data
    * works best when TTL is applied to data

## Snitch
* snitch tells you about the infra
* snitch determines which data centers, racks nodes belong to
* datacenter -> racks -> nodes
* racks -> failure domains
* EC2Snitch -> single Region
* EC2MultiRegionSnitch -> multi reagion

---

# Dynamic Snitching & Repair in Cassandra
* ensure consistancy

## Intro to Coordinator Reads
* sends request to fastest replica
* if data is not consistent -> read repair

### dynamic snitch
* dynamic snitch tells you...
* "badness threashold" scores latency
  * if below threashold -> switch to other node
* fetches read latency
* receiving updates -> cheap
* calculating scores -> expensive
* every 10min. all scores are wiped

### Hinted Handoff
* is a write operation
* if a replica is down, but the quorum is met
* coordinator replays delayed write if the failed replica is back up

### Read Repair
* if consistent -> Return data to client
* if not consistent -> read repair -> blocking read -> full request
* 

### Anti-Entropy Repair
* manually triggered
* compares datasets for common token ranges between nodes
1. Builds a merkle tree for each replica
2. compare the merkle tree to discover diffs

* Merkle tree creation -> validation compaction w/o saving it as a SSTable
* Full repair
  * repairs all partitions
  * significant latency -> days!!!
  * degraded performance during full repair
### Incremental repair
  * only a part of partitions
  * merkle tree for unrepaired partitions
    
### Anticompaction
* splits tables (instead combining it)
* creates a VNode & repairs VNode

### Incremental repair Issue
* SSTable can be compacted away between validation compaction and anticompaction by standard compaction procress -> overstreaming
* inconsistency between nodes
* Overstreaming can create many tables

### Subrange Repair
* small range of the Tokenring
* not compatible w/ incremental repair
* 

### Do we need to repair?
1. Short TTls
2. Immutable data
3. Single Datacenter
4. Highly consistent read & writes
5. High read repair chance

* by using immutable data, we can reduce the need to repair


### Recommandations
* use trageted repair (table w/ deletes)
* use subrange repair
* use a tool to manage repair (cassandra reaper)
* ensure repair is run once per `gc_grace_seconds` cycle


