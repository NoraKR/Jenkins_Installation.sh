#!/bin/bash

#Author: Nora Rwatangabo
#date: jan 2023

##Jenkins installation script
## Description: Jenkins is an open-source, Java-based automation server that offers an easy way to set up a continuous integration and continuous delivery (CI/CD) pipeline.

#Continuous integration (CI) is a DevOps practice in which team members regularly commit their code changes to the version control repository, after which automated builds and tests are run. 

#Continuous delivery (CD) is a series of practices where code changes are automatically built, tested and deployed to production.

echo "installing Java"
sudo yum install java-11-openjdk-devel -y
sleep 3

echo "enabling the jenkins repository"
curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo
sleep 3

sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
sleep 3

echo "installing the latest stable version of jenkins"
sudo yum install jenkins -y
sleep 3

echo "starting the service"
sudo systemctl start jenkins
sleep 3

echo "Checking the status"
sudo systemctl status jenkins
sleep 3

echo "enabling the Jenkins service to start on system boot"
sudo systemctl enable jenkins

echo "adjusting the firewall"
sudo yum install firewalld
sudo systemctl start firewalld
sudo firewall-cmd --permanent --zone=public --add-port=8080/tcp
sudo firewall-cmd --reload


#Next step: Setting up Jenkins in the browser
#To setup Jenkins on our server, let’s follow the steps

#Step 1: Open the jenkins page from the browser
#Launch your google chrome browser an type your IP address followed by the port number 8080

#http://your_ip_or_domain:8080 
#Your screen shows "unlock jenkins"

##Step 2: Copy and paste the administrator password
#In your terminal, use the following command to print the Administrator password that was generated during jenkins installation.

#You should see a 32-character long alphanumeric password. Copy the password and paste it into the Administrator password field in the page you have in the browser. Then click on Continue 

#Note: use this command to copy the initial password:
#sudo cat /var/lib/jenkins/secrets/initialAdminPassword

##Step 3: Install suggested plugins
#On the screen Customize Jenkins, you will be asked to either Install suggested plugins or Select plugins to install. Click on the Install suggested plugins box and the installation process will start immediately  

##Step 4: Create first admin user
#When the installation will be completed, you will get a form to create the First Admin User. Fill out the form an validate on Save and Continue

#Username: utrains

#Password: school1

#E-mail address: use your own email address

##Step 5: Instance Configuration
#On the next page you will need to set the URL for the Jenkins instance. The Jenkins URL field will come with a default  value (automatically generated). Just click on Save and Finish 
#Jenkins is now ready for use! Click on Start using Jenkins button and you will be automatically be redirected to the Jenkins dashboard

#Here you are logged in as the First Admin user you created in a previous step 
