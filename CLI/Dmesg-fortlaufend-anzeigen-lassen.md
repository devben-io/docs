# CLI - dmesg fortlaufend anzeigen lassen


als user:

```bash
watch -n 1 'dmesg|tail -n 20'
```
<!--more-->
als root:

```bash
while sleep 0.1; do dmesg -c; done
```

## Weblinks

* [http://mitschang.net/software/](http://mitschang.net/software/)



