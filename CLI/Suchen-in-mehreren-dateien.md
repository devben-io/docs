# CLI - Suchen in mehreren Dateien


### mit grep:

```
grep -r "<SUCHBEGRIFF-IN-DEN-DATEIEN>" /<PFAD-DER-DURCHSUCHT-WERDEN-SOLL>
```

`-r` - recursive

### mit find:
<!--more-->
```
find /<PFAD-DER-DURCHSUCHT-WERDEN-SOLL> -type f -exec grep -l '<SUCHBEGRIFF-IN-DEN-DATEIEN>' {} \;
```

## Links

* [https://forums.opensuse.org/showthread.php/471286-mit-grep-alle-nachfolgenden-verzeichnisse-durchsuchen](https://forums.opensuse.org/showthread.php/471286-mit-grep-alle-nachfolgenden-verzeichnisse-durchsuchen)



