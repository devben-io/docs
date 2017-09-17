# tar mit Progressbar {#tar_mit_progressbar}

* mit Hilfe von `pv`
* mittels `du` wird die Größe des Verzeichnisses ermittelt

```
tar -cf - . | pv -s $(du -sb . | awk '{print $1}') | gzip > out.tgz
```

## Weblinks {#weblinks}

* [http://www.catonmat.net/blog/unix-utilities-pipe-viewer/](http://www.catonmat.net/blog/unix-utilities-pipe-viewer/)



