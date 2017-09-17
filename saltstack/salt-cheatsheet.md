# SALT \| Cheatsheet {#salt_cheatsheet}

| JOBS |  |
| :--- | :--- |
| `salt <MINION> saltutil.running` | aktive Jobs finden, die auf`<MINION>`laufen |
| `salt <MINION> saltutil.kill_job <JID>` | Job mit`<JID>`auf`<MINION>`abbrechen |
| PILLARS |  |
| `salt '<MINION>' pillar.ls` | Pillars auflisten, die für`<MINION>`gültig sind |
| `salt '<MINION>' pillar.items` | Inhalt der Pillars anzeigen, die für`<MINION>`gültig sind |



