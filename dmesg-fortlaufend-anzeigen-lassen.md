# dmesg fortlaufend anzeigen lassen {#dmesg_fortlaufend_anzeigen_lassen}

als user:

```bash
watch -n 1 'dmesg|tail -n 20'
```

als root:

```bash
while sleep 0.1; do dmesg -c; done
```

Bearbeiten

## Weblinks {#weblinks}

* [http://mitschang.net/software/](http://mitschang.net/software/)



