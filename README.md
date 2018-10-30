# PCF on GCP

![Concourse Pipeline](embed.png)

This pipeline is to automate deploying of PASW

## Prerequisites

- [install a Concourse server](https://concourse-ci.org/installing.html)
- download the [Fly CLI](https://concourse-ci.org/fly-cli.html) to interact with the Concourse server
- depending on where you've installed Concourse, you may need to set up
[additional firewall rules](FIREWALL.md "Firewall") to allow Concourse to reach
third-party sources of pipeline dependencies
- ensure you have a deployed OpsMan 2.1+ and PAS 2.1+

## Usage

This pipeline downloads PASW, injects the winfs root image, and then uploads the PASW tile to OpsMan.

This pipeline downloads artifacts from DockerHub (pcfnorm/rootfs and custom
docker-image resources) and as such the Concourse instance must have access
to those.

1. [Set the pipeline](http://concourse-ci.org/single-page.html#fly-set-pipeline), using your updated params.yml:
  ```
  fly -t lite set-pipeline -p deploy-pasw -c pipeline.yml -l params.yml
  ```

2. Unpause the pipeline
