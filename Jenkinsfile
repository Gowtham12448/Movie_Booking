cat << 'EOF' > Jenkinsfile
pipeline {
    agent any

    tools {
        maven 'Maven-3.9.6'
        jdk 'JDK-17'
    }

    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Build WAR') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Deploy to Tomcat') {
            steps {
                sh 'cp target/movie-booking-app.war /opt/tomcat/webapps/'
            }
        }
    }

    post {
        success {
            echo 'Deployment complete! Access at http://<TOMCAT-IP>:8080/movie-booking-app/'
        }
    }
}
EOF