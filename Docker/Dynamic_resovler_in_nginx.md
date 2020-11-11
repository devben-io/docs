# DOCKER - Use system's resolver in dockerized NGINX
## NGINX config Template
`nginx.conf.tmpl`
```conf
http {
  server {

    resolver $NAMESERVER valid=10s;

    [...]
    }
  }
}
```


## Docker Entrypoint
Use DNS server from Dockerhost for Container.

Your startup script can then use the `envsubst` program to generate an `nginx.conf` and then start nginx. eg:

`/entry.sh`
```bash
#!/bin/bash
if [ "$NAMESERVER" == "" ]; then
	export NAMESERVER=`cat /etc/resolv.conf | grep "nameserver" | awk '{print $2}' | tr '\n' ' '`
fi

echo "Nameserver is: $NAMESERVER"

echo "Copying nginx config"
envsubst '$NAMESERVER' < /nginx.conf.tmpl > /nginx.conf

echo "Using nginx config:"
cat /nginx.conf

echo "Starting nginx"
nginx -c /nginx.conf -g "daemon off;"
```



## Links

* https://web.archive.org/web/20181006183603/https://trac.nginx.org/nginx/ticket/658

