# MATRIX \| reset password \(synapse\)

## SQLite

```
<user>@<host>:/# /usr/local/bin/hash_password
Password: 
Confirm password: 
$2a$12$q...sp3m

<user>@<host>:/# sqlite3 /<PATH-TO>/homeserver.db

sqlite> UPDATE users SET password_hash='$2a$12$q...sp3m' WHERE name='@<USER>:<MATRIX-SERVER>';
sqlite> .quit
```

## 

## postgreSQL

```
<user>@<host>:/# source bin/activate

<user>@<host>:/# ~/.synapse$ /usr/local/bin/hash_password
Password:
Confirm password:
$2a$12$q...sp3m


<user>@<host>:/# su postgres
<user>@<host>:/# psql

\connect synapse
synapse=# UPDATE users SET \
 password_hash='$2a$12$q...sp3m' WHERE name='@hsthompson:z.z6c.de';
\q
```

## Links:

* [https://www.zentonic.org/blog/125](https://www.zentonic.org/blog/125)
* [https://github.com/matrix-org/synapse\#password-reset](https://github.com/matrix-org/synapse#password-reset)



