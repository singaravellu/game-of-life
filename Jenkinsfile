pipeline{
    agent { label 'redhat' }
    stages{
        stage('scm'){
            steps {
                   checkout([$class: 'GitSCM', branches: [[name: '*/master']],userRemoteConfigs: [[url: 'https://github.com/singaravellu/game-of-life.git']]])
            }
        }
        /*stage('Package'){
            steps {
                sh 'mvn package'
            }
        }*/

    }
}