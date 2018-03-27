# AEM - Adobe Experience Manager \(6.3\)

Collection of curl commands.

### 

### User Management

#### Change \(Admin-\)Password:

you'll need `jq` for this...

```
#!/bin/sh

# get USER_PATH from specific user - this different on every System
USER_PATH=$(/usr/bin/curl --connect-timeout 10 -s -u admin:<OLD-PW> -X GET "http://<AUTHOR>:<PORT>/bin/querybuilder.json?path=/home/users&1_property=rep:authorizableId&1_property.value=admin&p.limit=-1" | jq . | cat | grep path | cut -d'"' -f4)


# change PW
/usr/bin/curl --connect-timeout 10 -s -u admin:<OLD-PW> -Fplain=<NEW-PW> -Fverify=<NEW-PW>  -Fold=<OLD-PW> -FPath="${USER_PATH}" http://<AUTHOR>:<PORT>/crx/explorer/ui/setpassword.jsp
```

### 

### Agents

#### Replication Agents:

configures the Replication Agent on the `<AUTHOR>` to publish the content to the `<PUBLISHER>`

```
/usr/bin/curl --connect-timeout 10 -u admin:<ADMIN-PW> -FtransportUri="http://<PUBLISHER>:<PORT>/bin/receive?sling:authRequestLogin=1" "http://<AUTHOR>:<PORT>/etc/replication/agents.author/publish/jcr:content"
```

### Backup

...

### Package Management

#### Download Package

```
curl -u admin:<PASSWORD> https://<SERVER>:<PORT>/etc/packages/<PKG-GROUP>/<PACKAGENAME>.zip > <LOCAL-PATH>/<PACKAGENAME>.zip
```

#### Upload Package \(w/o install\)

```
curl -u admin:<PASSWORD> -F file=@"<PKG-GROUP>/<PACKAGENAME>.zip" -F name="<PACKAGENAME>" -F force=true -F install=false http://<SERVER>:<PORT>/crx/packmgr/service.jsp
```

#### \(Re\)Build existing package

```
curl -u admin:<PASSWORD> -X POST http://<SERVER>:<PORT>/crx/packmgr/service/.json/etc/packages/<PKG-GROUP>/<PACKAGENAME>.zip?cmd=build
```

## Links:

* [https://web.archive.org/web/20170719150428/http://www.aemcq5tutorials.com/tutorials/adobe-cq5-aem-curl-commands/](https://web.archive.org/web/20170719150428/http://www.aemcq5tutorials.com/tutorials/adobe-cq5-aem-curl-commands/)
* [https://gist.github.com/joemaffia/dd55e4c43a24c4948e8d](https://gist.github.com/joemaffia/dd55e4c43a24c4948e8d)
* [https://scriptcrunch.com/check-application-status-using-ansible/](https://scriptcrunch.com/check-application-status-using-ansible/)
* [https://github.com/sebastienveluz/cq-tasks-automation](https://github.com/sebastienveluz/cq-tasks-automation)
* [https://de.slideshare.net/AshokkumarTA/aem-dispatcher-tips-tricks](https://de.slideshare.net/AshokkumarTA/aem-dispatcher-tips-tricks)
* [https://hashimkhan.in/aem-adobecq5-code-templates/curl-aem-commands/](https://hashimkhan.in/aem-adobecq5-code-templates/curl-aem-commands/)
* [http://www.jetteroheller.com/changing-the-cq5-aem-admin-password-via-curl/](http://www.jetteroheller.com/changing-the-cq5-aem-admin-password-via-curl/)
* [https://alan-mushi.github.io/asap/2015/08/29/AEM-curl-list.html](https://alan-mushi.github.io/asap/2015/08/29/AEM-curl-list.html)
* [**http://www.6dglobal.com/blog/changing-user-passwords-aem-61-curl-2015-06-03**](http://www.6dglobal.com/blog/changing-user-passwords-aem-61-curl-2015-06-03)



