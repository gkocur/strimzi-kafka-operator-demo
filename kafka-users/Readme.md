# Managing users

SASL SCRAM and TLS authenticated users are managed by kafka user operator. Each user is described by k8s manifest:

## SASL SCRAM

```yaml
apiVersion: kafka.strimzi.io/v1alpha1
kind: KafkaUser
metadata:
  name: my-user
  labels:
    strimzi.io/cluster: my-cluster
spec:
  authentication:
    type: scram-sha-512
```
After applying such manifest a random password id generatoed and the secret with name corresponding to username is created.
Te get user password:
```bash
kubectl get secrets my-user -o jsonpath='{.data.password}' | base64 --decode
``` 

To change the password edit the secret and put the new password as a value of `password` key (base64 encoded).

## TLS
```yaml
apiVersion: kafka.strimzi.io/v1alpha1
kind: KafkaUser
metadata:
  name: my-tls-user
  labels:
    strimzi.io/cluster: my-cluster
spec:
  authentication:
    type: tls
```

When the user is created by the User Operator, it will create a new secret with the same name as the KafkaUser resource. The secret will contain a public and private key which should be used for the TLS Client Authentication. Bundled with them will be the public key of the client certification authority which was used to sign the user certificate. All keys will be in X509 format.

# Adding/Editing Users

To add or change the user(s) add or edit yaml file in `users` folder and run:
```bash
bash update-users.sh
```

# Deleting users

The user has to be deleted manually:
```bash
kubectl delete kafkauser _username_
```