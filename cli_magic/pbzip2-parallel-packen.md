# pbzip2 - parallel packen

* geht schneller
* verbraucht weniger Platz

#### Einpacken: {#einpacken}

```
tar vcf myfile.tbz2 --use-compress-prog=pbzip2 dir_to_compress/
```

ODER

```
tar -vc directory_to_compress/ | pbzip2 -vc > myfile.tar.bz2
```

#### Auspacken: {#auspacken}

\(muss ge„pipe“t werden\)

```
pbzip2pbzip2 -dck <bz2file> | tar xvf -
```

## Links {#links}

* [http://compression.ca/pbzip2/](http://compression.ca/pbzip2/)



