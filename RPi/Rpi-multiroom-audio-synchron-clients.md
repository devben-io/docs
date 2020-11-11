# RPi - Multiroom Audio Client(s)


_(die Dinger, wo die Musik rauskommen tut…)_

### Voraussetzung

* raspian (Debian 8 minimal)
* optional: Filesystem vergrößern:

```
apt-get install raspi-config
raspi-config
# Filesystem vergrößern...
```

### Software nachinstallieren

```
sudo apt-get update
sudo apt-get install libboost-dev libboost-system-dev libboost-program-options-dev libasound2-dev libvorbis-dev libflac-dev alsa-utils libavahi-client-dev avahi-daemon nano git gcc g++ make
```

### snapcast ausm git installieren

Sourcen runterladen…

```
git clone https://github.com/badaix/snapcast.git
cd snapcast/externals/
git submodule update --init --recursive
cd ..
```

compilieren…

```
make all
```

**nur **Client installieren…

```
sudo make installclient
```

### Wifi einrichten

Firmware installieren:

```
apt-get update
apt-get install <FIRMWARE>
```

**&lt;FIRMWARE&gt;**-`firmware-realtek`;`firmware-atheros`;`firmware-ralink`; je nach verwendeteten WLAN-Adapter

WPA-Supplicant installieren:

```
apt-get install wpasupplicant
```

Interface anpassen (Inhalt hinzufügen):

`/etc/network/interfaces`

```
network={
ssid="<SSID>"
psk="<PASSWORT>"
}
```

rebooten

## Weblinks

* [https://volumio.org/forum/multiroom-audio-output-from-volumio-with-snapcast-t3217.html](https://volumio.org/forum/multiroom-audio-output-from-volumio-with-snapcast-t3217.html)
* [https://github.com/badaix/snapcast](https://github.com/badaix/snapcast)
* [https://minibianpi.wordpress.com/how-to/wifi/](https://minibianpi.wordpress.com/how-to/wifi/)
* [https://hackerdads.wordpress.com/2016/05/07/multi-room-audio-with-open-source-software-and-cheap-hardware/](https://hackerdads.wordpress.com/2016/05/07/multi-room-audio-with-open-source-software-and-cheap-hardware/)
* [http://powerpi.de/spotify-connect-auf-dem-raspberry-pi-2-installieren-dein-smartphone-ist-die-fernbedienung/](http://powerpi.de/spotify-connect-auf-dem-raspberry-pi-2-installieren-dein-smartphone-ist-die-fernbedienung/)
* [http://www.redsilico.com/multiroom-audio-raspberry-pi](http://www.redsilico.com/multiroom-audio-raspberry-pi)



