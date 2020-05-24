pipeline {
    agent any
    triggers {
	   upstream(upstreamProjects: 'whoami', threshold: hudson.model.Result.SUCCESS)
	    //pollSCM('* * * * *') 
    }
    // parameters{
    //      choice(name: 'branch', choices: ['master', 'feature-history', 'Three'] ,description: 'Which branch you want to build?')
    //}
    stages{
        stage('scm'){
            steps {
                echo "${params.branch}"
                echo "${env.BUILD_URL}"
                echo "${env.BUILD_ID}"
                echo "${env.BUILD_NUMBER}"
                
                //input 'want to continue to build?'
                checkout([$class: 'GitSCM', branches: [[name: '*/master' ]],gitTool: 'jgit',extensions:  [[$class: 'CleanBeforeCheckout']],userRemoteConfigs: [[url: 'https://github.com/singaravellu/game-of-life.git']]])
                }
        }
        stage('Package'){
            steps {
                sh 'mvn package'
            }
        }
        stage('Sonar') {
            steps{
        withSonarQubeEnv('SONAR-6.7.0') {
             sh 'mvn org.sonarsource.scanner.maven:sonar-maven-plugin:3.6.0.1398:sonar'
        }
            }
       }
        

    }
}
