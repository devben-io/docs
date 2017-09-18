# SALT \| Cheatsheet {#salt_cheatsheet}



## Jobs

```
salt <MINION> saltutil.running                    # aktive Jobs finden, die auf<MINION>laufen
salt <MINION> saltutil.kill_job <JID>             # Job mit<JID>auf<MINION>abbrechen
```

## Pillars

```
salt '<MINION>' pillar.ls                         # Pillars auflisten, die für<MINION>gültig sind
salt '<MINION>' pillar.items                      # Inhalt der Pillars anzeigen, die für<MINION>gültig sind
```


## Weblinks {#weblinks}

* [https://cheatsheets.ciscodude.net/saltstack-sysadmin.html](https://cheatsheets.ciscodude.net/saltstack-sysadmin.html)



