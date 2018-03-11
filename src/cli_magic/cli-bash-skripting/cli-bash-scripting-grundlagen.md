# CLI \| Bash Scripting Grundlagen

**Skriptbeispiele.**

Hier findet Ihr einige Skriptbeispiele aus unseren Trainings und Projekterfahrungen.

Mit Bash-Skripten kann man fast alles realisieren, was ein Netzwerkadministrator für den Hausgebrauch benötigt, sei es das automatische Setzen von Berechtigungen für Samba-Freigaben oder das Prüfen einer eingebundene Netzwerkressource.



## Skript mit Parametern aufrufen und auswerten

```bash
#! /bin/bash
  # Skriptname: parameter.sh


  # lese 1. Parameter
  PARA1=$1
  # lese 2. Parameter
  PARA2=$2

  # Ausgabe der Parameter
  echo $PARA1 $PARA2
```

Wird ein Skript mit Parameter aufgerufen, so können diese Parameter mit den Variablen `$1`,`$2`,`$3`usw. weiterverarbeitet werden. Ruft man also das Skript parameter.sh folgendermaßen auf:

`# parameter.sh wert1 wert2`  
so erhält man die Ausgabe:

`wert1` `wert2`



## IP-Adresse, default Gateway und DNS-Server manuell ändern

```bash
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



## IF-Beispiel mit Eingabe einer Zahl

```bash
#! /bin/bash

  read -p "Gib eine Zahl ein: " antwort

  # prüfe ob antwort 1 ist
  if [ $antwort = 1 ] ; then

      echo "Die Antwort ist 1"

  else

      echo "falsch!!! looser"

  fi
```

In diesem Beispiel wird die Variable `$antwort`** **abgefragt und mit der Testanweisung überprüft.



## IF-Beispiel! Überprüfung, ob ein Verzeichnis vorhanden ist

```bash
#! /bin/bash

  CHECKDIR="/mnt/sicherung"

  # prüfe ob /mnt/sicherung vorhanden ist
  if [ -d $CHECKDIR ]; then

      echo "Ja das Verzeichnis ist da"

  else

      echo "Verzeinis nicht gefunden lege an..."
      mkdir $CHECKDIR
  fi
```

Eine weitere Variante ist das Überprüfen von Dateien und Verzeichnissen.

Im vorliegenden Fall wird geprüft, ob das Verzeichnis `/mnt/sicherung`** **existiert, im Nein-Fall wird das Verzeichnis angelegt.



## Mehrfachselektion

```bash
#! /bin/bash

  read -p "Soll ich weitermachen? (j/n) " antwort

  case $antwort in
      j|J)
          echo "Weiter "
          ;;
      n|N)
          echo "ich stoppe "
          ;;
      *)
          echo "falsch Eingabe"
  esac
```

Mehrfachselektionen können mit case abgehandelt werden. Die Besonderheit ist das doppelte Semikolon welches die break-Anweisung sendet. Hier wird eine Variable `$antwort`** **eingelesen und auf die Buchstaben **"**`j`**, **`J`**" **oder **"**`n`**, **`N`**" **hin geprüft.



## Einfache While-Wiederholung \(Schleife\)

```
#! /bin/bash

  weiter="j"

  while [ $weiter = "j" ] ; do

      echo "Die schleife läuft"
      read -p "Nochmal? (j/n) " weiter

  done
```

Im gezeigten Beispiel läuft eine Schleife solange die Variable `$weiter` den Wert "`j`" besitzt. Pro Schleifendurchlauf wird die Variable `$weiter` mit dem read Kommando wieder neu eingelesen!



## Dateien zeilenweise durchlaufen

Die Beispieldatei liste1.txt enthält folgende  Werte:

`liste1.txt`

```
apfel
birne
banane
alles obst
ende gelände
```

Mit dem nachfolgenden Shellskript wird diese Datei zeilenweise durchlaufen. Jeder Wert steht somit in der Variable `$daten` und kann entsprechend weiterverarbeitet werden.

```bash
#! /bin/bash

  for daten in $(cat liste1.txt); do

      echo "$daten"

  done
```



## Zählerschleifen

Zählerschleifen wie man sie von anderen Programmiersprachen kennt, sind bei Bash Scripting natürlich auch möglich

```bash
#! /bin/bash
 
for (( i=10; i > 0; i-- )) ; do
 
      echo $i;
 
done
```



## Lustiges Beispiel mit akustischem Signal

Bei diesem Beispiel muss das Paket **`beep` **installiert sein! 

```bash
#! /bin/bash
  
  echo "A C H T U N G ..."
  
  for (( i=10; i > 0; i-- )) ; do
  
      let sound=($i*250)
      echo "Frequenz: $sound"
      beep -f $sound
  
      sleep 0.3
  
  done
  
  beep -f 100 -l 800 
  echo "E N D E !!!"
```



## Jedes Zeichen einer Zeichenkette abarbeiten

```bash
#! /bin/bash
 
#
# Diese Schleife durchläuft den String
# Zeichenweise. n = Zähler
#
  
S="abcdefg123456789";
n=0;
 
while [ $n -lt ${#S} ]; do
  
    echo ${S:n:1}
    n=$(( $n + 1 ))
  
done;
```

Zeile 8: Ein String wird in der Variable `$S` angelegt.

Zeile 11: Mit der Anweisung `${#S}` wird die Anzahl Zeichen von `$S` ermittelt. Die Schleife läuft solange `$n` kleiner als die Anzahl Zeichen in `$S`.

Zeile 13: Mit der Anweisung `${S:n:1}` wird an Stelle n ein Zeichen mit Länge 1 ausgelesen.

Zeile 14: Erhöht den Zähler n pro Schleifendurchlauf um 1.



## Arrays in einem Bash Skript

Dieses Beispiel zeigt, wie man indexbasierte Arrays abarbeitet.

```
#! /bin/bash
 
# Array Variable mit Werten füllen
arrayVariable[0]="birne"
arrayVariable[1]="apfel"
arrayVariable[2]="banane"
 
 
# Array durchlaufen
for werte in "${arrayVariable[@]}"; do
 
        echo $werte;
 
done
```



## Funktionen verwenden

Das nachfolgende Beispiel zeigt wie ein Skript mit genau 2 Parameter aufgerufen wurde.

```
#! /bin/sh
 printUsage () {
     echo "Usage file <infile> <outfile>"
    exit 1
}
 
if [ $# -ne 2 ]; then
     printUsage
fi
```



## Links

* [https://die-efi.de/tutorials-a-howtos/88-linux/81-bash-scripting](https://die-efi.de/tutorials-a-howtos/88-linux/81-bash-scripting)



