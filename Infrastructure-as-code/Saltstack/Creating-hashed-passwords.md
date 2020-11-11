# SALT - Creating hashed passwords




```
salt '*' shadow.gen_password 'I_am_password'
```

```
salt '*' shadow.gen_password 'I_am_password' crypt_salt='I_am_salt' algorithm=sha256
```

* [https://docs.saltstack.com/en/latest/ref/modules/all/salt.modules.shadow.html](https://docs.saltstack.com/en/latest/ref/modules/all/salt.modules.shadow.html)



