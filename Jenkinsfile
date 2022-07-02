pipeline{
    agent any
    triggers {
        pollSCM '* * * * *'
        }
    stages{
        stage("build jar package"){
            steps{
                sh "mvn package"
            }
        }
        stage("build image"){
            steps{
                withCredentials([usernamePassword(credentialsId: 'docker-hub', passwordVariable: 'password', usernameVariable: 'username')]) {
                    sh "docker build -t uz31r/$JOB_NAME:$BUILD_NUMBER ."
                    sh "docker login -u $username -p $password"
                    sh "docker push uz31r/$JOB_NAME:$BUILD_NUMBER"
                }
            }
        }
        stage("deploy container"){
            steps{
                sh "docker run -d --name web$BUILD_NUMBER -p 80$BUILD_NUMBER:8080 uz31r/$JOB_NAME:$BUILD_NUMBER"
            }
        }
    }
}
