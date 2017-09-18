# pfSense \| LACP & Jumbo Frames {#pfsense_lacp_jumbo_frames_fix}

#### Problem {#problem}

* will man die MTU bei einem LAGG-Interface z.b. auf`9000`setzen, hat man das Problem, dass die MTU bei den LAGG-Mitgliedern \(physiche Interfaces\) nicht auch automatisch geändert werden.
* man kann dies händisch z.B. mit`ifconfig re1 mtu 9000 up`machen → bekommt aber Fehlermeldungen bzw. die Änderungen sind nach dem Neustart _weg_. \(nicht peristent\)

#### Lösung {#loesung}

* `Shellcmd`Paket nachinstallieren und danach folgende Kommandos in der WebGUI eintragen:

| AAAAAAA |
| :--- |


| Command | Type |
| :--- | :--- |
| `ifconfig re1 mtu 9000 up; echo "re1: mtu 1500 -> 9000"` | earlyshellcmd |
| `ifconfig re2 mtu 9000 up; echo "re2: mtu 1500 -> 9000"` | earlyshellcmd |



#### Erklärung {#erklaerung}

* jetzt werden die MTU-Änderungen in einem sehr frühen Boot-Stadium vorgenommen und sind nach dem Neutstart auch wieder verfügbar

## Weblinks {#weblinks}

* [https://redmine.pfsense.org/issues/3922](https://redmine.pfsense.org/issues/3922)
* [https://redmine.pfsense.org/issues/2786](https://redmine.pfsense.org/issues/2786)
* [http://rx-support.net/article/printer/lacp.html](http://rx-support.net/article/printer/lacp.html)
* [http://www.cyberciti.biz/faq/howto-configure-freebsd-vlans-with-ifconfig-command/](http://www.cyberciti.biz/faq/howto-configure-freebsd-vlans-with-ifconfig-command/)



