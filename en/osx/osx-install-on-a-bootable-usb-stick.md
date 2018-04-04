# OSX \| install on a bootable USB Stick

* Download "**Install macOS High Sierra.app**" from Appstore.
  * it's Stub File that must download the install data during the install process
* Start Installation process - choose a drive with enough space for the install data \(~5GB\)

* **don't** restart the Computer after the download has finished

* move the downloaded data into the "**Install macOS High Sierra.app**" Folder

```
sudo mkdir -p "/Applications/Install macOS High Sierra.app/Contents/SharedSupport/"
sudo rsync -harP "/Volumes/<ABC>/macOS Install Data/" "/Applications/Install macOS High Sierra.app/Contents/SharedSupport/"
```

* Create Boot Medium:

```
sudo /Applications/Install\ macOS\ High\ Sierra.app/Contents/Resources/createinstallmedia
```

* \(if needed\) confirm questions with `y` \(yes\)

## Links:

* [https://support.apple.com/de-de/HT201372](https://support.apple.com/de-de/HT201372)
* [https://apple.stackexchange.com/questions/299731/macos-high-sierra-media-installer](https://apple.stackexchange.com/questions/299731/macos-high-sierra-media-installer)



