# k8s - HowTo - RBACs (WIP)


# Definition
**RBAC** - Role Based Access Control

**`<SUBJECT>`** - *"who wants access"*
* Users 
  * are global
  * humans
  * processes that live outside of the cluster
  * normally limited to certain namespace
  * new user(groups) have no rights by default
* Admin-Users 
  * like Users, but with access to all cluster ressources
* Group
  * set of users
* processes (service users)
  * are namespaced
  * running in pods
  * intra-cluster process

**`<API-RESSOURCE>`** - Cluster ressources
* pods, namespaces, deploymentes, configmaps, PV, secrets, etc.

**`<OPERATION>`** - so called: verbs
* list, get, delete, create, watch, etc


## Authentications Types
**Certificate based  (X509)** - For real Users (humans)

**Token based (Service Accounts)** - For Service Users (processes)

**Basic Authentication** - Username + Password

**OAuth2** - ...



## Role Types
**Role** - 

**RoleBinding** - 

**ClusterRole** - 

**ClusterRoleBinding** - 



# HowTo
## Grant Access
### Certificate based Authentication
#### 1. User 
1. Creates openssl cert & csr

  ```
  # Create a private key
  openssl genrsa -out johndoe.crt 4096

  # Create certificate signing request (CSR)
  openssl req -key johndoe.crt -out johndoe.csr -subj "/CN=johndoe/O=devs"
  ```
  * Common Name (`CN`) -> `user` in kubernetes
  * Organization (`O`) -> `group`s in kubernetes

2. Send CSR to admin


#### 2. Admin 
1. Creates certificate from CSR using CA from the k8s cluster

  ```bash
  openssl x509 -req -in johndoe.csr -CA <CA_LOCATION>/ca.crt -CAkey <CA_LOCATION>/ca.key -CAcreateserial -out johndoe.crt -days 500
  ``` 
2. send back to user

#### 3. User
1. Create kubectl configuration
  ```bash
  kubectl config set-cluster kluster --cerificate-authority=ca.pem --embed-certs=true --server=https://<PUBLIC_ADRESS_OF_YOUR_KLUSTER>:6443
  ```

2. Add new credentials to kubectl
  ```bash
  kubectl config set-credentials johndoe --client-certificate=johndoe.crt --client-key=johndoe.key --embed-certs=true
  ```
3. Add new context to kubectl
  ```bash
  kubectl config set-context kluster-johndoe --cluster=kluster --user=johndoe
  ```


## Defining RBACs

### Roles & RoleBindings
#### Basics
* `<SUBJECT>` has access to `<API-RESSOURCE>` and can do `<OPERATION>` with it
* RBACS connects the 3 **in a Namespace**:

#### 1. Role - Create a role
Create a Role: pod-access
```yaml
kind: Role
apiVersion: rbac.authorization.k8s.io/v1beta1
metadata:
  name: r-pod-access
  namespace: test-ns
rules:
  # which ressources -> API reference
  - apiGroups: ["core"]
    ressources: ["pods"]
  # which operation
    verbs: ["get", "list"]
``` 

#### 2. RoleBinding - Connect a role with a `<SUBJECT>`
Bind pod access to a Group
```yaml
kind: RoleBinding
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: rb-dev-read-pods
  namespace: test-ns
subjects:
# Which subject?
- kind: Group
  name: devs
  apiGroup: rbac.authorization.k8s.io
roleRef:
# Which Role? - only 1 per binding
- kind: Role
  name: r-pod-access
  apiGroup: rbac.authorization.k8s.io
```

Bind namespace admin to an User
```yaml
kind: RoleBinding
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: rb-ns-admin
  namespace: test-ns
subjects:
# Which subject?
- kind: User
  name: johndoe   # Name is case sensitive
  apiGroup: rbac.authorization.k8s.io
roleRef:
# Which Role? - only 1 per binding
- kind: Role
  name: r-ns-admin
  apiGroup: rbac.authorization.k8s.io
```


### ClusterRoles & ClusterRolesBindings
* The same like normal roles, but not limited to a namespace

#### 1. Role - Create a role
Create a ClusterRole: pod-access
```yaml
kind: ClusterRole             # <- is different
apiVersion: rbac.authorization.k8s.io/v1beta1
metadata:
  name: r-pod-access
                              # <- is different: line deleted
rules:
  # which ressources -> API reference
  - apiGroups: ["core"]
    ressources: ["pods"]
  # which operation
    verbs: ["get", "list"]
```

#### 2. ClusterRoleBinding - Connect a role with a `<SUBJECT>`
Bind pod access to a Group
```yaml
kind: ClusterRoleBinding             # <- is different
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: rb-dev-read-pods
                                     # <- is different: line deleted
subjects:
# Which subject?
- kind: Group
  name: devs
  apiGroup: rbac.authorization.k8s.io
roleRef:
# Which Role? - only 1 per binding
- kind: ClusterRole                  # <- is different
  name: r-pod-access
  apiGroup: rbac.authorization.k8s.io
```



#### Default ClusterRoleBindings
Already includes in k8s: \
\
**`system:basic-user`**
* For unauthenticated users (group: `system:unauthenticated`)
* No operations allowed

**`cluster-admin`**
* For members of the `system:masters` group
* Can do any operation on the cluster (using `cluster-admin` ClusterRole)
* Create a new User w/ in this group:
  ```bash
  openssl req [...] -subj "CN=adminUser/O=system:masters"
  ```



----
## Links
* https://www.cncf.io/blog/2018/08/01/demystifying-rbac-in-kubernetes/
* https://docs.bitnami.com/tutorials/configure-rbac-in-your-kubernetes-cluster/
* https://kubernetes.io/docs/reference/access-authn-authz/rbac/