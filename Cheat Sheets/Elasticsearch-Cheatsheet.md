# Elasticsearch Cheatsheet

```bash
# Show all indices
$  curl -XGET https://<VPC-ENDPOINT>/_cat/indices

# Purge specific index
$ curl -XDELETE https://<VPC-ENDPOINT>/<INDEX>

# Purge all indices older than 30-90day
export PREFIX="filebeat-7.4.0-"; \
export VPC_ENDPOINT="<VPC_ENDPOINT>"
for date in $(for day in {30..90}; do date -v -${day}d +'%Y.%m.%d'; done); \
do echo -en "delete index: ${PREFIX}$date\t\t"; \
curl -XDELETE https://${VPC_ENDPOINT}/${PREFIX}${date}; \
done
```




## Links
Index Lifecycle Management (ILM)
* https://blog.nviso.eu/2019/06/17/optimizing-elasticsearch-part-2-index-lifecycle-management/
* https://www.ehealth-security.de/der-elastic-stack-in-der-praxis-teil-3-index-lifecycle-management/
* http://man.hubwiz.com/docset/ElasticSearch.docset/Contents/Resources/Documents/www.elastic.co/guide/en/elasticsearch/reference/current/getting-started-index-lifecycle-management.html
