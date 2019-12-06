# Metwork investigation
**Objective**:
Help the MFI software team evaluate metwork by providing ready to use docker images.


# Usage

_Following instructions need to be executed on a **Linux** system, with regular Linux user (not `root`) part of **`docker`** user group._

**Pre-requisites**:
At least Docker CE should be installed on your machine, as well as Docker Compose tool.
> I worked with following versions:
> Docker CE version 19.03.5, build 633a0ea838
> docker-compose version 1.25.0, build 0a186604

1. Clone this [GitHub](https://github.com/picebor951/MFI-project.git) repository:
```console
$ cd
$ mkdir workspaces
$ git clone https://github.com/picebor951/MFI-project.git
```
2. Go to **`MFI-project`** repository
```console
$ cd ~/workspaces/MFI-project
```
3. Create Jenkins and Docker registry instances
```console
$ docker-compose up
```
4. Wait until previous command is complete and connect to Jenkins instance at following link:
http://127.0.0.1:8080/
> Note that a pipeline job called **`MFI-project-pipeline`** is already created and is running a first build.

5. Once the first build is complete (and hopefully successful), check the private Docker registry content:
To get the registry name -> **`mfi-project`**:
```console
$ curl -X GET http://127.0.0.1:5000/v2/_catalog 
 {"repositories":["mfi-project"]}
```
To get the list of tags in this registry -> 1 image listed as **`jenkins-MFI-project-pipeline-1`**:
```console
$ curl -X GET http://127.0.0.1:5000/v2/mfi-project/tags/list
 {"name":"mfi-project","tags":["jenkins-MFI-project-pipeline-1"]}
```
6. Modify the **MFI-project `Dockerfile`** and push your changes
> Note: You can use the user **`picebor951`** and the password I gave you in my mail.  
> Once the push done, the **`MFI-project-pipeline`** should start shortly.  

7. Now check the Docker registry content again:
```console
$ curl -X GET http://127.0.0.1:5000/v2/mfi-project/tags/list
 {"name":"mfi-project","tags":["jenkins-MFI-project-pipeline-2","jenkins-MFI-project-pipeline-1"]}
```
> Two tags are listed: **`jenkins-MFI-project-pipeline-1`** and **`jenkins-MFI-project-pipeline-2`**.  

8. You can run one of these images by executing the following command
```console
$ docker run -it mfi-project:jenkins-MFI-project-pipeline-<buildId> 
```
> I could not manage to launch the **`metwork`** services with CentOS 7 and the `systemctl` command replacing `service` ...
> But you can check rpm are installed -> `rpm -qa | grep met`


#
_I don't feel I did miracles on this, but at least I spent some good time to learn and implement Docker technology which is quite new for me._ :+1:
_I hope I did it clearly_ :thinking: _and that we will have the occasion to meet each other to have feedbacks on this.
Thanks and regards,
Sophie P._


