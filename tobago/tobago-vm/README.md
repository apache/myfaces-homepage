# Run the different Tobago versions on tobago-demo.apache.org 

The demo on https://tobago-demo.apache.org/ works with docker. 
The system user to run manage the containers is "tobago".

## Setup

The setup of the vm is managed by Puppet by the Apache Infra Team in
https://github.com/apache/infrastructure-p6/ (private).

## Administration

How to become root access is described on the
[Apache site](https://reference.apache.org/committer/opie).

## Updates of the demo applications

There is a crontab entry for the user to deploy the deploy
application regualy.

The job executes the script ../tobago-vm.sh to recreate and start 
all docker containers.
