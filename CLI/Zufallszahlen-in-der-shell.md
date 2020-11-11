# CLI - Zufallszahlen in der Shell


Umgebungsvariablen:`$RANDOM`

**Ausgeben:**

```
echo $RANDOM
```

**Zahlen zwischen 0 und 99**
<!--more-->
```
echo $(($RANDOM % 100))
```

**Wertebereich von 1 bis 100**

```
echo $(($RANDOM % 100 + 1))
```

## Weblinks

* [http://www.tippscout.de/linux-bash-zufallszahl\_tipp\_2915.html](http://www.tippscout.de/linux-bash-zufallszahl_tipp_2915.html)



