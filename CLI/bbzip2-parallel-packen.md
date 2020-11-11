# CLI - pbzip2 - parallel packen

* geht schneller
* verbraucht weniger Platz

#### Einpacken:

```
tar vcf myfile.tbz2 --use-compress-prog=pbzip2 dir_to_compress/
```

ODER
<!--more-->
```
tar -vc directory_to_compress/ - pbzip2 -vc > myfile.tar.bz2
```

#### Auspacken:

(muss ge„pipe“t werden)

```
pbzip2pbzip2 -dck <bz2file> - tar xvf -
```

## Links

* [http://compression.ca/pbzip2/](http://compression.ca/pbzip2/)



