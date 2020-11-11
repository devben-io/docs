# CLI - tar mit Progressbar


* mit Hilfe von `pv`
* mittels `du` wird die Größe des Verzeichnisses ermittelt

```
tar -cf - . - pv -s $(du -sb . - awk '{print $1}') - gzip > out.tgz
```
<!--more-->
## Weblinks

* [http://www.catonmat.net/blog/unix-utilities-pipe-viewer/](http://www.catonmat.net/blog/unix-utilities-pipe-viewer/)



