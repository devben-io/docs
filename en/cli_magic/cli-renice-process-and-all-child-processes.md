# CLI \| Renice Process and all child processes

With this "one-liner" you can set the priority of a parent process and all it's childprocesses at one time.

```
ls /proc/$(ps aux | grep <NAME-OF-PROCESS> | grep -v grep | awk '{ print $2 }')/task | xargs renice <PRIO>
```



