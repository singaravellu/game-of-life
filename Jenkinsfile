pipeline {
    agent any
    triggers {
	   //upstream(upstreamProjects: 'whoami', threshold: hudson.model.Result.SUCCESS)
	    pollSCM('* * * * *') 
    }
    parameters{
         choice(name: 'branch', choices: ['master', 'feature-history', 'Three'] ,description: 'Which branch you want to build?')
    }
    stages{
        stage('scm'){
            steps {
                echo "${params.branch}"
                echo "${env.BUILD_URL}"
                echo "${env.BUILD_ID}"
                echo "${env.BUILD_NUMBER}"
                   checkout([$class: 'GitSCM', branches: [[name: "${params.branch}"]],gitTool: 'jgit',extensions:  [[$class: 'CleanBeforeCheckout']],extensions:  [[$class: 'RelativeTargetDirectory', relativeTargetDir: 'hi']],userRemoteConfigs: [[url: 'https://github.com/singaravellu/game-of-life.git']]])
            }
        }
        /*stage('Package'){
            steps {
                sh 'mvn package'
            }
        }*/

    }
}