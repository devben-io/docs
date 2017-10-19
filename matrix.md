# MATRIX \| reset password \(synapse\)

```
source bin/activate

(.synapse) <user>@abc:~/.synapse$ bin/hash_password
Password:
Confirm password:
$2a$12$UhPkkV0/vWhyBKOT7HnjzuaISYCyGXWr2JYBBU0sd2BuzlkU0fDMy

su postgres
psql
\connect synapse
synapse=# UPDATE users SET \
 password_hash='$2a$12$UhPkkV0/vWhyBKOT7HnjzuaIS \
 YCyGXWr2JYBBU0sd2BuzlkU0fDMy' WHERE name='@hsthompson:z.z6c.de';
\q
```

## Links:

* [https://www.zentonic.org/blog/125](https://www.zentonic.org/blog/125)



