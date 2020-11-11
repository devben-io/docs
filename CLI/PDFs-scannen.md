# CLI - PDFs scannen

### PDF-Bearbeitung

Mit convert können bspw. gescannte Dokumente als PDF gespeichert werden. Die Befehls-Syntax zum einfachen Speichern einer PNG-Datei im PDF-Format lautet:

```
convert quelle.png ziel.pdf
```
<!--more-->
Mit folgendem Befehl kann man Bilder aus PDF-Dateien extrahieren:

```
pdfimages -j quelle.pdf zielverzeichnis
```

Praktisch ist auch die Verwendung von Wildcards, um mehrere Bilder in ein PDF umzuwandeln. Folgender Befehl wandelt bspw. alle im momentanen Arbeitsordner befindlichen .jpg-Dateien in ein mehrseitiges PDF um:

```
convert *.jpg ziel.pdf
```

Will man mehrere Bilder in einem Ordner zu einem druckfertigen PDF Dokument mit gleichmäßiger DINA4-Anpassung zusammenfügen, hilft folgender Befehl:

```
convert *.* -compress jpeg -resize 1240x1753 -units PixelsPerInch -density 150x150 -page a4 multipage.pdf
```

## Links

* [http://wiki.ubuntuusers.de/ImageMagick\#convert](http://wiki.ubuntuusers.de/ImageMagick#convert)



