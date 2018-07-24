# CLI \| Bash cheatsheet

Assign multi-line string to a shell variable or file

```
# to var
$ sql=$(cat <<EOF
SELECT foo, bar FROM db
WHERE foo='baz'
EOF
)

# file
$ cat <<EOF >> greetings.txt
line 1
line 2
EOF

```

switch to last directory / between directories

```
cd -
```

run last command

```
!!
```

\(in a bash script\) force the script to fail, if any sub-command causes a non-zero exit code

```
set -e
```



