# CLI - nur Dateinamen ausgeben

Folgende CLI Magic ermöglicht es aus einem`<OUTPUT>`/ einem Dateipfad mit variabler Verzeichnistiefe (z.B.`/irgend/ein/Pfad/zu/einer/<DATEI>.<ENDUNG>`) , nur die`<DATEI>.<ENDUNG>`herauszufiltern. (z.B wenn `basename` nicht zur Verfügung steht)

## Möglichkeit 1

```
<OUTPUT> - rev - cut -d'/' -f1 - rev
```
<!--more-->
von der Ausgabe wird die Zeichenfolge mit`rev`umgedreht. Dadurch ist das letzte`/`das Erste. Danach wird mit`cut`auf das erste`/`gefiltert und die Reihenfolge wieder umgekehrt.

## Möglichkeit 2

(wenn nur`cut`zur Verfügung steht)

kleiner Trick auf aus einer Ausgabe (z.B. find) sich nur die Dateinamen + Endung ausgeben zu lassen.  
Bei unbekannter Verzeichnistiefe.

```
<OUTPUT> - cut -d'/' -f2- - cut -d'/' -f2- - cut -d'/' -f2- - cut -d'/' -f2- - ...
```

`…`- ensprechend weiter fortsetzen

## Weblinks

* [http://stackoverflow.com/questions/22727107/how-to-find-the-last-field-using-cut-linux](http://stackoverflow.com/questions/22727107/how-to-find-the-last-field-using-cut-linux)



