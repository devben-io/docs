# CLI \| GPG

## Encrypt text in a file

```
echo "<CLEAR-TEXT>" | gpg --encrypt --sign --armor -r <EMAIL/ID> > <PATH-TO-FILE>.gpg
```

## Encrypt text to STOUT

```
echo "<CLEAR-TEXT>" | gpg --encrypt --sign --armor -r <EMAIL/ID>
```

## Decrypt text from a file

```
cat <PATH-TO-FILE>.gpg | gpg -d
```

## Decrypt text direct from STDIN

```
cat << EOF | gpg -d

# paste in the GPG block

> -----BEGIN PGP MESSAGE-----
>
> hQIMA+bj+i0euKn+ARAAi5SPV1IobB1kgBSuOKqI3fJRZWhojFMb2RPq4JwqpYlF
> N/TZiow8dhmtjEI2dEXNh7spM/DR0b//IwKqtV9FKgXHGHIQB/WIhW0MeAA238a8
> Miwf0mJcgkSvJ4OLRJDZ735xMeUj5nMIOcz7WcKIrgV4I6PtbkegfUwucZcIzqZ9
[...]
> a6i+uE0drHJo3tFQ4cbswJf28gtvQ+QjO6MH8addiVmnyx0dDYP6ErbpepWoXsY0
> kXiS3VmZKkWFie1jpshPBRWvCbh2cHF/1ZebMretjx9IToRNJ4FPw5yhhoYPmdmO
> oCtgRaZlAN/yRxjtqFTzwriyymY00ShiBPo=
> =KU/Y
> -----END PGP MESSAGE-----
> EOF
```

don't forget the `EOF` at the end and hit **\[ENTER\]**.

