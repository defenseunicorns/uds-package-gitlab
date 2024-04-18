# Networking

Gitlab is configured by default to assume the internal dependencies that are used for testing (see minio, redis and postgres in the [bundle](bundle/uds-bundle.yaml)). Intentionally, permissive network policies are not created as a default. For example, there is not a default setup of egress anywhere for pods that may need to connect to external storage. 

> [!IMPORTANT]
> If you are using different internal services, cloud services or a mix you will have to configure values in the config chart accordingly via bundle overrides. A couple of example are provided below:

Configure gitlab for all external services:

```yaml
# charts/config/values.yaml
storage:
  internal: false
redis:
  internal: false
postgres:
  internal: false
```

Configure gitlab for External postgres and s3, but in-cluster redis that is not the dev-redis currently used for testing:

```yaml
# charts/config/values.yaml
storage:
  internal: false
postgres:
  internal: false
redis:
  internal: true
  selector:
    app.kubernetes.io/name: redis
  namespace: redis
  port: 6379
```

Configure gitlab all external services and a non-default gitlab runner:

```yaml
# charts/config/values.yaml
storage:
  internal: false
postgres:
  internal: false
redis:
  internal: false
  internal: true
  selector:
    app: gitlab-runner
  namespace: my-other-gitlab-runner
```

> [!TIP] 
> There may be a need to integrate with other in-cluster services that are not a part of the standard connectivity needed by gitlab (for example a Jira integration). As such, there is the ability to add custom rules to allow additional internal network connectivity.

Add custom rule:

```yaml
# charts/config/values.yaml
custom:
   # Notice no `remoteGenerated` field here on custom internal rule
  - direction: Ingress
    selector:
      app: webservice
    remoteNamespace: jira
    remoteSelector:
      app: jira
    port: 8180
    description: "Ingress from Jira"
  # No `remoteNamespace`, `remoteSelector`, or `port` fields on rule to `remoteGenerated`
  - direction: Egress
    selector:
      app: webservice
    remoteGenerated: Anywhere
    description: "Egress from Webservice"
```

> [!NOTE]
> The above is just an example of what can be done with the custom key and not representative what any specific integration would need to look like.