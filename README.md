# Jenkins-demo
## Introduction
This script will help you to setup jenkins and automate the the process of publishing updates received on github to a docker container 

## Installation:
First of all install jenkins from [the official website](https://www.jenkins.io/download/) for your operating system

## Configuration
Once the installation has completed successfully, goto  __localhost:8080__ in your browser and login as root. Default password can be found at **/var/lib/jenkins/secrets/initialAdminPassword** for linux based operating system and *C:\Program Files (x86)\Jenkins\secrets\initialAdminPassword* for windows. During installation select default configuration. Don't forget to install appropriate jdk and jre.

## Scripts
### 1. Fetch data from testing branch and update/deploy it in testing server  
Testing branch is whre changes made by developer is pushed into. But the problem is developer has to push commits manually , which is not very ideal. After commit, these changes are cloned by jenkins and deployed on an new/exeisting container. Inorder to automate that process, following configuration can be used:
**Steps**
1. Create a new task by clicking on *New item*. > Enter name for Project and select ***Free Style Project*** then go.
![]()
1. Now select ***configure*** from left panel. In the source code managment section, select ***Source Code Management*** as git. Paste your repository URL and select ***Branch*** as **test**.Select poll scm in ***Build trigger*** section. Now navigate to ***build*** section and select ***Execute shell***. Here copy paste the contents of __test_env.sh__.
[]()
1. In the ***post build*** section, select ***Build other projects*** and save it
[]()

### 2. Quality Assurance and approval
This task is initiated when any changes is commited to **test** branch. The commits from test branch is reviewed by Quality Assurance team and then the build procedure is initiated by Quality Assurance team using a key. After initiating the build, the script merges both the branches.
1. Create task as explained earlier. Go to ***Source Code Management*** and select git and enter your repository url.
1. In ***credential*** field, select ***Add*** > ***Jenkins*** and enter your github username and password.
1. Now in the ***Add behavior*** field, select **merge before build***. Here set name of repository as **origin** and branch to merge as **master** or whatever branch you want to merge with.
1. In ***build trigger*** section, select ***Trigger builds remotely***. Set some authentication token. In ***Post-build Actions*** section, select ***Build other project***. In ***project to build*** field add **publish**. Save and close it.

### 3. Publishing data to production sever
This task is initiated sfter the merge has been completed. This task will clone master branch and deployed on an new/exeisting container on production server.
1. Create task as explained earlier. Go to ***Source Code Management*** and select git and enter your repository url.
1. Select ***Branch*** as **master**.Select poll scm in ***Build trigger*** section. Now navigate to ***build*** section and select ***Execute shell***. Here copy paste the contents of __production_env.sh__.
[]()


