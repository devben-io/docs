# HOWTO \|  Gitbook - build static page

## Voraussetzungen

...

## Build

Hierbei wird eine Statische Seite im Unterordner `docs` erzeugt.

```bash
cd <PATH-TO-GITBOOK>/        # Wechsel ins Verzeichnis
gitbook install              # installiert Plugins & Co, die in book.json definiert sind
gitbook build ./ docs/       # baut die statische Seite nach docs/
```



