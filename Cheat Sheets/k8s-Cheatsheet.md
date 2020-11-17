# K8s Cheatsheet

## Secrets
```bash
# Encrypt a string for a k8s secret
$ echo -n "s33msi4" | base64 -w0


# Apply a secret directly from heredoc
$ cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Secret
metadata:
  name: mysecret
type: Opaque
data:
  password: $(echo -n "s33msi4" | base64 -w0)
  username: $(echo -n "jane" | base64 -w0)
EOF


# Create a new secret named my-secret with key1=supersecret and key2=topsecret
# and output it as a file
$ kubectl create secret generic my-secret \
  --from-literal=key1=supersecret \
  --from-literal=key2=topsecret \
  -o yaml > file.yml

```