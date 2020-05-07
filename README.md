# Jenkins-demo
## Introduction
This script will help you to setup jenkins and automate the the process of publishing updates received on github to a docker container 

## Installation:
First of all install jenkins from [the official website](https://www.jenkins.io/download/) for your operating system

## Configuration
Once the installation has completed successfully, goto  __localhost:8080__ in your browser and login as root. Default password can be found at **/var/lib/jenkins/secrets/initialAdminPassword** for linux based operating system and *C:\Program Files (x86)\Jenkins\secrets\initialAdminPassword* for windows. During installation select default configuration. Don't forget to install appropriate jdk and jre.

## Scripts
### 1. Fetch data from testing branch and update/deploy container with the fetched information
Testing branch is whre changes made by developer is pushed into. But the problem is developer has to push commits manually , which is not very ideal. Inorder to automate that process, following configuration can be used:
**Steps**
1. Create a new task by clicking on *New item*. > Enter name for Project and select **Free Style Project** then go.
![]()
1. Now select **configure** from left panel. In the source code managment section, select **Source Code Management** as git. Paste your repository URL and navigate to **build** section and select **Execute shell**. Here copy paste the contents of __test_env.sh__.
[]()
1. In the **post build** section, select **Build other projects** and save it

### 2. Testing and approval
