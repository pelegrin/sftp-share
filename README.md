# pelegrin/sftp-share Dockerfile


## Base Docker Image

- [ubuntu](https://registry.hub.docker.com/_/ubuntu/)

## Installation

## Usage

You can start test sftp server via docker. For installation docker on your machine look in other instructions somewhere.

in terminal put the following:
```
docker-compose up -d
```

Started machine will be avaliable to get sftp requests on port 2022. To connect, using any sftp client.
On Linux, connection url will be sftp://service@localhost:2022
On Mac, connection url will be sftp://service@<docker_vm_ip>:2022 where <docker_vm_ip> take from command:
```
docker-machine env default
```
All connections to SFTP server will we from service user. For authentication you can use any private key if you put corresponding public key in folder keys
By default, project contains test pair of keys already set up. Private key is sft.key in root folder of project.
For using it from command line for example (Mac),
```
sftp -i ./sftp.key -P 2022 service@192.168.99.100
```
where 192.168.99.100 - ip address of Docker VM.

Test files and folder structure for sftp put in sftp-share/data folder.