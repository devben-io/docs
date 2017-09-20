# CLI \| Bash Scripting Grundlagen

**Skriptbeispiele.**

Hier findet Ihr einige Skriptbeispiele aus unseren Trainings und Projekterfahrungen.

Mit Bash-Skripten kann man fast alles realisieren, was ein Netzwerkadministrator für den Hausgebrauch benötigt, sei es das automatische Setzen von Berechtigungen für Samba-Freigaben oder das Prüfen einer eingebundene Netzwerkressource.

## Skript mit Parametern aufrufen und auswerten

```
#! /bin/bash
  # Skriptname: parameter.sh
 
  
  # lese 1. Parameter
  PARA1=$1
  # lese 2. Parameter
  PARA2=$2
  
  # Ausgabe der Parameter
  echo $PARA1 $PARA2
```

Wird ein Skript mit Parameter aufgerufen, so können diese Parameter mit den Variablen **`$1`**,**`$2`**,**`$3 `**usw. weiterverarbeitet werden. Ruft man also das Skript parameter.sh folgendermaßen auf:

**`# parameter.sh wert1 wert2`**  
so erhält man die Ausgabe:

`wert1` `wert2`



## IP-Adresse, default Gateway und DNS-Server manuell ändern

```
#! /bin/bash
  
  netzkarte=eth0
  ip=192.168.1.99
  nm=255.255.255.0
  gw=192.168.1.1
  
  # ip adresse einstellen
  ifconfig $netzkarte $ip netmask $nm         # Hier wird das Netzwerkgerät (eth0) manuell auf eine andere IP-Adresse eingestellt.
  
  # route einstellen
  route del default
  route add default gw $gw                    # Das Standardgateway wird gelöscht und anschließend auf den neuen Wert der Variablen $gw gesetzt.
  
  # dns eintragen
  echo "nameserver $gw" > /etc/resolv.conf    # Schreibt den DNS-Server (in diesem Fall gleich dem Standardgateway) in die Datei /etc/resolv.conf
```



## Links

* [https://die-efi.de/tutorials-a-howtos/88-linux/81-bash-scripting](https://die-efi.de/tutorials-a-howtos/88-linux/81-bash-scripting)



