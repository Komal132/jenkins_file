pipeline{
    agent {label "vasudev"}
    stages{
        stage("clone"){
            steps{
                git branch: 'main', url: 'https://github.com/Komal132/jenkins_file.git'
            }
        }
        stage("terraform init"){
            steps{
               sh 'terraform init'
            }
        }
        stage("terraform apply"){
            steps{
                sh "terraform apply -auto-approve"
            }
        }
       
    }
}
