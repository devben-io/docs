# CLI \| GPG

## Encrypt Text in a file

```
echo "<CLEAR-TEXT>" | gpg --encrypt --sign --armor -r <EMAIL/ID> > <PATH-TO-FILE>.gpg
```



## Decrypt Text from a file

```
cat <PATH-TO-FILE>.gpg | gpg -d
```





