# Student Management Java Web App – CI/CD Deployment using Jenkins, Maven & Tomcat (AWS EC2)

A Java-based **web application** for managing student records, built with **Maven** and deployed automatically to a remote **Tomcat server** using **Jenkins CI/CD**.

![Java](https://img.shields.io/badge/Java-17-orange)
![Maven](https://img.shields.io/badge/Maven-3.9.5-blue)
![Tomcat](https://img.shields.io/badge/Tomcat-10-red)
![Jenkins](https://img.shields.io/badge/Jenkins-CI/CD-green)
![AWS](https://img.shields.io/badge/AWS-EC2-orange)
![Webhook](https://img.shields.io/badge/Webhook-GitHub-blueviolet)


## 📋 Table of Contents

- [✨ Features](#-features)
- [🏗️ Architecture](#-architecture)
- [🛠️ Tech Stack](#-tech-stack)
- [⚙️ CI/CD Pipeline Overview](#️-cicd-pipeline-overview)
- [🔔 Webhook Integration](#-webhook-integration)
- [🧱 Jenkinsfile Explanation](#-jenkinsfile-explanation)
- [🧩 Jenkins Configuration](#-jenkins-configuration)
- [🧰 Manual Setup (Optional)](#-manual-setup-optional)
- [👨‍💻 Author](#-author)

## ✨ Features

- ✅ Add, edit, delete student records
- ✅ Search and filter students
- ✅ Responsive web interface
- ✅ RESTful API endpoints
- ✅ Automated CI/CD pipeline
- ✅ GitHub Webhook-triggered builds  
- ✅ Database integration
- ✅ User authentication
- 📊 Reports and analytics


## 🏗️ Architecture



![](/img/1.png)

 
## 🛠️ Tech Stack

| Component | Technology |
|------------|-------------|
| **Language** | Java (JDK 17) |
| **Build Tool** | Apache Maven |
| **Server** | Apache Tomcat 10 |
| **CI/CD** | Jenkins Pipeline |
| **Version Control** | Git + GitHub |
| **Hosting** | AWS EC2 (Ubuntu 24.04 LTS) |

---

## ⚙️ CI/CD Pipeline Overview

This project uses a **Jenkins Declarative Pipeline** to automate deployment.  
Each Git commit triggers a Jenkins job that:

1. **Checks out** code from the GitHub repo  
2. **Builds** the project using Maven (`mvn clean package`)  
3. **Generates** the WAR file  
4. **Deploys** the WAR to the remote Tomcat server using SSH  
5. **Restarts** the Tomcat service  

---

## 🔔 Webhook Integration

This project uses a GitHub → Jenkins Webhook for seamless automation.

⚙️ How It Works

1. Developer pushes code to GitHub

2. GitHub Webhook automatically triggers the Jenkins pipeline

3. Jenkins fetches, builds, and deploys the latest code to the Tomcat server

4. The latest version is live immediately

🔗 Setup Steps

1. Go to your GitHub Repository → Settings → Webhooks → Add Webhook

2. In the Payload URL, enter your Jenkins endpoint:
```
 http://<jenkins-server>:8080/github-webhook/
```

3. Select application/json as the content type

4. Choose Just the push event

5. Save webhook 


---
## 🧱 Jenkinsfile Explanation

The `Jenkinsfile` defines all pipeline stages:

```groovy
pipeline {
    agent any

    environment {
        SERVER_IP    = 'your-ec2-ip'
        SSH_CRED_ID  = 'your-ssh-credential-id'
        TOMCAT_PATH  = '/var/lib/tomcat10/webapps'
        TOMCAT_SVC   = 'tomcat10'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/sksaurabh99/student-app.git'
            }
        }

        stage('Build WAR') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Deploy to Tomcat') {
            steps {
                sshagent([SSH_CRED_ID]) {
                    sh '''
                        WAR_FILE=$(ls target/*.war | head -n 1)
                        scp -o StrictHostKeyChecking=no $WAR_FILE ubuntu@$SERVER_IP:/tmp/
                        ssh -o StrictHostKeyChecking=no ubuntu@$SERVER_IP '
                            sudo rm -rf $TOMCAT_PATH/*
                            sudo mv /tmp/*.war $TOMCAT_PATH/ROOT.war
                            sudo chown tomcat:tomcat $TOMCAT_PATH/ROOT.war
                            sudo systemctl restart $TOMCAT_SVC
                        '
                    '''
                }
            }
        }
    }

    post {
        success {
            echo " Deployment successful! Visit: http://${SERVER_IP}:8080/"
        }
        failure {
            echo " Deployment failed."
        }
    }
}

```

## 🧩 Jenkins Configuration

🔌 Plugins Required:

1. Pipeline

2. SSH Agent Plugin

3. Git Plugin

4. Pipeline: Stage View (for visualization)

## ⚙️ Environment Setup:

- Add SSH credentials in
Jenkins → Manage Jenkins → Credentials → System → Global credentials

- Create a new Pipeline job and connect your GitHub repository

- Jenkins automatically executes the pipeline using the Jenkinsfile from your repo


## 🧰 Manual Setup (Optional)

If you want to build and deploy manually without Jenkins:
```
git clone https://github.com/sksaurabh99/student-app.git
cd student-app
mvn clean package
sudo cp target/studentapp-*.war /var/lib/tomcat10/webapps/ROOT.war
sudo systemctl restart tomcat10

```
 - Access your app at:
👉 http://server-ip:8080/

---

## 👨‍💻 Author

**Saurabh Korde**  
📧 [kordesaurabh0@gmail.com]  
🌐 [www.linkedin.com/in/saurabh-korde-21b422281]



---

![](/img/2.png)

![](/img/3.png)

![](/img/4.png)

![](/img/5.png)

![](/img/6.png)
