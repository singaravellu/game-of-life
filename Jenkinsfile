/* groovylint-disable LineLength */
pipeline {
    agent any
    options{  timestamps()  }
    stages{
        stage('checkout'){
            steps{
                 cleanWs()
                checkout([$class: 'GitSCM', branches: [[name: '*/master' ]],gitTool: 'jgit',extensions:  [[$class: 'CleanBeforeCheckout']],userRemoteConfigs: [[url: 'https://github.com/singaravellu/game-of-life.git']]])
              /*  git 'https://github.com/singaravellu/game-of-life.git' */
            }
        }
        stage('Package'){
            steps{
                sh 'mvn package'
            }
        }
    }
}