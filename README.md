# jenkins-resources

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

A helm chart for additional resources for your Jenkins server if you are using the [Jenkins chart](https://github.com/jenkinsci/helm-charts) with [Jenkins X](https://jenkins-x.io/v3/about/) and want to reuse the pipeline git token and maven/nexus settings from Vault or your cloud secret store.
 
## Usage

If you are using [Jenkins X](https://jenkins-x.io/v3/about/) then follow the [instructions on using Jenkins X with Jenkinsfiles](https://jenkins-x.io/v3/develop/create-project/jenkinsfile/) which will automatically set up a Jenkins server using this chart.

If you want to manually add this chart then add the following to your `helmfiles/$namespace/helmfile.yaml`:

```yaml 
...
releases:
- chart: jx3/jenkins-resources
  name: jenkins-resources
...
```

### Using Helm directly

[Helm](https://helm.sh) must be installed to use the charts.
Please refer to Helm's [documentation](https://helm.sh/docs/) to get started.

Once Helm is set up properly, add the repo as follows:

```bash 
helm repo add jx3 https://storage.googleapis.com/jenkinsxio/charts
```

you can then do

```bash
helm search repo jenkins-resources
```

The chart installs resources into the `jenkins-resources` namespace

