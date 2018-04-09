# Minishift

## Cheat-Sheet

```
minishift addons enable anyuid            # Changes the default security context constraints to allow pods to run with arbitrary UID.
minishift addons enable admin-user        # Creates a user named 'admin' and assigns the 'cluster-admin' role to it.
minishift addons list --verbose=true      # show available addons
minishift [start|stop]
```





## Links

* https://docs.openshift.org/latest/minishift/using/addons.html



