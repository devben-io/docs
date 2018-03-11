# CLI \| Suchen und Ersetzen in mehreren Dateien {#suchen_und_ersetzen_in_mehreren_dateien}

```
find /<Pfad>/<Dateien> -type f -exec sed -i '' -e 's/<alter Begriff>/<neuer Begriff>/g' {} \;
```

* Änderungen werden rekursiv auf alle Dateien in`/<Pfad>/<Dateien>` angewandt
* damit Zeichen \(wie z.B. das`/`oder ein`:`\) nicht als Steuerzeichen erkannt werden, muss diesem dann explizit ein`\`vorangestellt werden

## Links {#links}

* [http://www.tecchannel.de/storage/tipps/2033812/suchen\_und\_ersetzen\_in\_dateien\_unter\_linux/](http://www.tecchannel.de/storage/tipps/2033812/suchen_und_ersetzen_in_dateien_unter_linux/)



