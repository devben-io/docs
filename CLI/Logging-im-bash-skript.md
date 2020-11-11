# CLI - Logging im bash skript

folgendes Codeschnipsel am Anfang vom Skript bewirkt, dass die komplette Bildschirmausgabe (auch remote-Sessions) ins Logfile geschrieben wird.


```bash
[...]
# Logging
LOG="/var/log/$(basename $0.log)"
exec > >(tee -a $LOG ) 2>&1

# Kosmetik / Header fürs Log
echo -e "\n---------------------------------------------------------------------------------------------\n
$(date) \n
---------------------------------------------------------------------------------------------" > $LOG
[...]
```



