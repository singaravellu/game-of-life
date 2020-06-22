pipeline {
    agent any
    options{  timestamps()  }
    stages{
        stage('checkout'){
            steps{
            git 'https://github.com/singaravellu/game-of-life.git'
            }
        }
        stage('Package'){
            steps{
                sh 'mvn package'
            }
        }
    }
}