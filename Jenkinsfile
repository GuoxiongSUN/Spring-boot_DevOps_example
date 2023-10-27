pipeline {
        agent any

    environment {
        KUBECONFIG = '/home/sun/.kube/config'
    }    

    stages {
        
        stage('Prepare'){
            steps {
                
                sh 'kubectl get service'
                
            }
        }

        stage('Build'){
            steps {
                script {
                    sh 'mvn clean install'
                }
            }
        }

        stage('Docker Login') {
            steps {
                    withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
                    sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"                }
            }
        }

        stage('Docker Build') {
                steps {
                    sh 'docker build -t sylvainsun/spring-boot-example:latest .'
                }
        }
        
        stage('Docker Push') {
            steps {
            
            sh 'docker push sylvainsun/spring-boot-example:latest'
               
            }
        }

        stage('Deployment'){
            steps {
                                
                    sh 'kubectl apply -f ./deploy/deployment-users.yaml'
                    sh 'kubectl apply -f ./deploy/service-users.yaml'

             }
            
        }

    }   
    
}