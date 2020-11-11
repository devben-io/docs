# HowTo - Convert Audible Files (aax) to mp3



## Prerequisites
- [audible-activator](https://web.archive.org/web/20191002121449/https://github.com/inAudible-NG/audible-activator)
- [AAXtoMP3](https://web.archive.org/web/20191011051529/https://github.com/KrumpetPirate/AAXtoMP3)

install the programms from above in the prefered way for you system.


## Let's get started

### Get "AUTHCODE" from audible
For decrypting your `*.aax` files, you need your personal "activation_bytes" (authcode) from audible.
```
$ audible-activator -l <LANGUAGE>
``` 
``` 
$ audible-activator -l de

Username: <USER>@<EMAIL>.com
Password: <PASSWORD>
[*] Player ID is 2jmj7l1234567kK/YBwk=
activation_bytes: d8cf12345
``` 


### Transcoding your Files
The `activation_bytes` from `audible-activator` is the `<AUTHCODE>` in `AAXtoMP3`
```
$ AAXtoMP3 <AUTHCODE> <AAX-FILE>
```
```
$ AAXtoMP3 d8cf12345 awesome_audiobook.aax
```

### done

## Links
* [https://code-bude.net/2017/02/12/audible-aax-dateien-in-mp3-umwandeln-unter-linux/](https://web.archive.org/web/20191209084026/https://code-bude.net/2017/02/12/audible-aax-dateien-in-mp3-umwandeln-unter-linux/)