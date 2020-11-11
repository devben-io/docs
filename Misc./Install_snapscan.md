# HOWTO - Install SnapScan S1300 Driver on Linux

## Overview
This is a HowTo for installing the Drivers of a [Futjisu SnapScan S1300](http://www.fujitsu.com/us/products/computing/peripheral/scanners/product/eol/s1300/) document scanner on Linux (e.g. ArchLinux)

![img1](http://www.fujitsu.com/us/Images/s1300_header_tcm127-1177541.jpg)
![img2](http://www.fujitsu.com/us/Images/s1300_paper_tcm127-1194659.jpg)



## Prerequisite
* **`sane`** is installed

## HowTo

### Download the Drivers:
* [SnapScan S1300](https://web.archive.org/web/20181216071420/https://www.josharcher.uk/static/files/2016/10/1300_0C26.nal)
* [SnapScan S300](https://web.archive.org/web/20181216071420/https://www.josharcher.uk/static/files/2016/10/300_0C00.nal)
* [SnapScan S1100](https://web.archive.org/web/20181216071420/https://www.josharcher.uk/static/files/2016/10/1100_0A00.nal)
* [SnapScan S1300i](https://web.archive.org/web/20181216071420/https://www.josharcher.uk/static/files/2016/10/1300i_0D12.nal)

### find scanner
```bash
sudo sane-find-scanner
...
found USB scanner (vendor=0x04c5 [FUJITSU], product=0x11ed [ScanSnap S1300]) at libusb:003:010
```

### create relevant folders
```bash
sudo mkdir -p /usr/share/sane/epjitsu
```

### copy the drivers
```bash
sudo cp <PATH-TO>/1300_0C26.nal /usr/share/sane/epjitsu/1300_0C26.nal
```

### update configuration settings
make sure the following entry exists in **`/etc/sane.d/epjitsu.conf`**
```bash
...
# Fujitsu S1300
firmware /usr/share/sane/epjitsu/1300_0C26.nal
usb 0x04c5 0x11ed
...
```
*or equivalent for other scanner models*


### (optional) reboot you computer
```bash
sudo reboot
```

### Testing
```bash
scanimage -L
```
Nothing will happen for a few seconds, that's normal. After a short time you should hear the scanner spool up and the light will turn solid blue. Once that's happened the terminal should return something like:
```bash
device 'epjitsu:libusb:003:008' is a FUJITSU ScanSnap S1300 scanner
```


## Links
* https://www.josharcher.uk/code/install-scansnap-s1300-drivers-linux/