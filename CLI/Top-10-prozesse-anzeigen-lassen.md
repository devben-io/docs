# CLI - Top 10 Prozesse anzeigen lassen




die 10 Prozesse mit der meisten CPU-Load anzeigen lassen (sortiert)

```
ps -Ao user,uid,comm,pid,pcpu,tty --sort=-pcpu | head -n 10
```


