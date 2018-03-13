# RPI \| Multiroom-Audio \(synchron\) {#rpi_multiroom-audio_synchron}

Volumio \(mpd\) + SpotifyConnect +Snapcast\(+ Shariplay\)  
\(geht bestimmt auch mit RuneAudio\)

## Features {#features}

Multiroom-Wiedergabe \(synchrone Wiedergabe auf mehreren Lautsprechern\) von

* lokalen Medien \(mpd\)
* Streams von
  * Webradios
  * Spotify \(SpotifyConnect\)
  * Airplay \(shairplay\)

## Setup

* ein Raspi als zentraler Server für alle Dienste
* mehrere Raspis als Client - empfangen einen synchronen Stream vom Server
* verbunden per LAN/WLAN

## Übersicht

```
<INPUT>   or    <INPUT>
Spotify        NAS/Webradio/etc.
  │   ♫"lalla"♪  │
  │              │
  │              │
  │   <SERVER>   │       <NETWORK>      <CLIENT-1>
╔═▼════════════╦═▼══╗    WiFi / LAN     ╔══════════╗
║spotifyConnect║ mpd║                   ║          ║
╠═▼════╦═══════╩═▼══╣                   ╠══════════╣ 
║ │ ┌──▶ "snapfifo" ║                   ║          ║
║ │ │  ╠═══▼════════╣                   ╠══════════╣
║ │ │  ║ snapserver ▶──────────┐        ║          ║
║ │ │  ╠═══▼════════╣          │        ╠══════════╣
║ │ │  ║ snapclient ║          └──SYNC──▶snapclient║
╠═│═│══╩═══▼════════╣          │        ╠══════════╣
║ └⚙┘   ALSA        ║          │        ║   ALSA   ║
╚══════════▼════════╝          │        ╚═════▼════╝
           │                   │              │
           ▼                   │              ▼
        <OUTPUT>               │          <OUTPUT>
       ♫"lalla"♪               │          ♫"lalla"♪
                               │
                               │
                               │         <CLIENT-n>
                               │        ╔══════════╗
                               │        ║          ║
                               │        ╠══════════╣
                               │        ║          ║
                               │        ╠══════════╣
                               │        ║          ║
                               │        ╠══════════╣
                               └──SYNC──▶snapclient║
                                        ╠═════▼════╣
                                        ║   ALSA   ║
                                        ╚═════▼════╝
                                              │
                                              ▼
                                           <OUTPUT>
                                           ♫"lalla"♪
```

**„snapfifo“ **=`/tmp/snapfifo`-Pipe

**⚙**= Umwandlung des Audiostreams in eine Pipe

