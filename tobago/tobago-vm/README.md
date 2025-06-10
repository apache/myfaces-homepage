# Run the different Tobago versions on tobago-demo.apache.org 

The demo on https://tobago-demo.apache.org/ works with docker. 
The name of the system user to manage the containers is "tobago".

## Setup

The setup of the vm is managed by Puppet by the Apache Infra Team in
https://github.com/apache/infrastructure-p6/ (private).

## Administration

How to obtain root access (OTP) is described on the
[Apache site](https://reference.apache.org/committer/opie).
For OTP you may use: https://selfserve.apache.org/otp-calculator.html

## Updates of the demo applications

There is a crontab entry for the user to deploy the application regularly.

The job executes the script ../tobago-vm/setup.sh to recreate and start 
all docker containers.
