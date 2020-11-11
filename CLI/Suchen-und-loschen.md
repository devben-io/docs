# CLI - Suchen und Löschen in der Konsole

Dieses Vorgehen benutzt man, um bestimmte Dateien zu suchen und gleichzeitig auch zu löschen.

Allgemeine Syntax:

```
find <dir-name> <criteria> <action>
```
<!--more-->
* `dir-name`: - Defines the working directory such as look into /tmp/
* `criteria`: Use to select files such as „\*.sh“
* `action`: The find action (what-to-do on file) such as delete the file.

jetzt genauer:  
löscht Dateien\_und\_Ordner:

```
find . -name "FILE-TO-FIND" -exec rm -rf {} \;
```

löscht nur Dateien:

```
find . -type f -name "FILE-TO-FIND" -exec rm -f {} \;
```

* `-name „FILE-TO-FIND“`: File pattern.
* `-exec rm -rf {} \;`: Delete all files matched by file pattern.
* `-type f`: Only match files and do not include directory names.

Mit`-iname`anstatt`-name`kann man auch Wildcards wie`?`oder`*`benutzen.

##### Bsp.:

`fo*`und`F??`→```Foo``,```FOO```,``foo`,`fOo\`, etc

> Die Befehle mit Bedacht einsetzen, sonst werden ungewollt Dateien gelöscht
>
> Vorher besser mit`find . -name „FILE-TO-FIND“`_ohne_`-exec rm -rf {} \;`überprüfen, ob die Syntax stimmt.

## Links

* [http://www.cyberciti.biz/faq/linux-unix-how-to-find-and-remove-files/](http://www.cyberciti.biz/faq/linux-unix-how-to-find-and-remove-files/)



