# CLI \| Zufallszahlen in der Shell {#zufallszahlen_in_der_shell}

Umgebungsvariablen:`$RANDOM`

**Ausgeben:**

```
echo $RANDOM
```

**Zahlen zwischen 0 und 99**

```
echo $(($RANDOM % 100))
```

**Wertebereich von 1 bis 100**

```
echo $(($RANDOM % 100 + 1))
```

## Weblinks {#weblinks}

* [http://www.tippscout.de/linux-bash-zufallszahl\_tipp\_2915.html](http://www.tippscout.de/linux-bash-zufallszahl_tipp_2915.html)



