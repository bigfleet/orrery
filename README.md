# Orrery

This directory helps get Eagle installed and rolling.


## Backlog

* Ensure front-end and API responses have an endpoint (or UI affordance) which identifies the artifact that was responsible for their creation.
* Ensure that springboot-api builds have what they need to query API token liveness from Azure AD.
* Correct the links with which the build status links back to reference the routable dashboard.  (Webhook endpoints work.)
* Resource consumption guidelines as patches (per RNA 'type')
* Need to speed up/bypass image construction (check if images need to be built using mk3 designations)
* Need to make sure builds do not contend for filesystems
* Rotate passwords / tokens (need to get broken down one by one)

## Upcoming major initiatives

### Testing

In part because JVF is already at his household budget for these experiments, we haven't explored any testing using clusters as objects-of-test.

Essentially each of these pieces of code needs that, in one way or another.

### Development support

The concept is that we could expand the flux building to include (e.g.) VS Code develop containers that support bringing up the entire composition at "git clone" time, modulo the original container build times.  (Since ultimately they will want to mount local code volumes, this time can't really be reclaimed.)

This can also demonstrate how to use "most recent everywhere from SCM" compositions, as well as "most recent releases for supporting services from container registry" models without too much effort from eagle family.  (Long-lived feature branches work in this model as well, with different container image names)

Honestly this was chilled a bit by Endava not having Docker on machines, and the community not providing an established alternative yet.

With end-user authentication handled at a basic level, revisiting Sentry belongs in this category.

Sonarqube for code quality
JFrog Xray for vulnerability scans

### Cluster support

What would it look like to put in linkerd and some special support for canary releases?
How about Jaeger?  Maybe if you have a performance testing cluster?
Prometheus with a sink to the cloud provider service?  Grafana?
Currently there is no multi-region support-- perhaps that's permanently out of scope for the starter kit?
  * It would certainly be a lot of work, but who knows.
  * Cluster federation could be fun.

### Front-end federated deployment

How nice would it be to have an API Gateway deployment compatible with cloud CDN and authentication provider?
It could be trained to know how to comb/include identified API provider builds at particular paths to pick up on appropriate triggers, etc.
Builds for SPA types could target Cloudfront / Front door from the beginning, with appropriate management at DNS and so on.
Perhaps it would be different in staging (or development) to give a good debugging target.


## Debugging aid

This will start a pod that is appropriate to run `az login --identity` and explore what permissions the managed identity that you've selected has in a certain context.

```
kubectl apply -f manifests/debug-identity.yml
kubectl apply -f manifests/debug-sops.yml
```

```
az login --identity
az network dns record-set txt create --name tmp-record-set-2 --resource-group eagle-dns-centralus --ttl 30 --zone-name tekton.eagle.bigfleet.dev
```

```
kubectl apply -f manifests/debug-mongo.yml
```