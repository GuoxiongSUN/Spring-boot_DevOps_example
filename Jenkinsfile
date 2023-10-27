pipeline {
        agent any

    stages {

        stage('Build'){
            steps {
                script {
                    sh 'mvn clean install'
                }
            }
        }

        stage('Docker Build') {
            agent any
                steps {
                    sh 'docker build -t sylvainsun/spring-boot-example:latest .'
                }
        }
        
        stage('Docker Push') {
            steps {
            withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
            sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
            sh 'docker push sylvainsun/spring-boot-example:latest'
               }
            }
        }

        stage('Deployment'){
            steps {
                script {
                            
                    sh 'kubectl apply -f deploy/deployment-users.yaml'
                    sh 'kubectl apply -f deploy/service-users.yaml'

                }
            }
        }

    }   
    
}