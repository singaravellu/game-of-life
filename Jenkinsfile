
def server = Artifactory.server 'Artifactory'
def uploadSpec
def password

pipeline {
    agent any
    triggers {
	   upstream(upstreamProjects: 'whoami', threshold: hudson.model.Result.SUCCESS)
	    pollSCM('* * * * *') 
    }
    // parameters{
    //      choice(name: 'branch', choices: ['master', 'feature-history', 'Three'] ,description: 'Which branch you want to build?')
    //}
    stages{
        stage('checkout'){
            steps {
                echo "${params.branch}"
                echo "${env.BUILD_URL}"
                echo "${env.BUILD_ID}"
                echo "${env.BUILD_NUMBER}"
                
                //input 'want to continue to build?'
                cleanWs()
                checkout([$class: 'GitSCM', branches: [[name: '*/master' ]],gitTool: 'jgit',extensions:  [[$class: 'CleanBeforeCheckout']],userRemoteConfigs: [[url: 'https://github.com/singaravellu/game-of-life.git']]])
                }
        }
        stage('Package'){
            steps {
                sh 'mvn package'
            }
        }
        stage('upload artifacts to jfrog'){
            steps{
                   /* groovylint-disable-next-line LineLength */
                   withCredentials([usernamePassword(credentialsId: 'jfrog', passwordVariable: 'password', usernameVariable: 'user')])
                   {

                       echo "${password}"
                       echo "${user}"
                       script{
                         uploadSpec = 
                            """
                            {
                            "files": [
                                {
                                    "pattern": "*/target/*.war",
                                     "target": "libs-snapshot-local",
                                     "sortBy": ["created"]
                                    
                                  }
                                    ]
                                }"""
                                server.upload spec: uploadSpec, failNoOp: true
                                //server.upload(uploadSpec)
                       // server.upload spec: uploadSpec , failNoOp: true
 /*                        downloadSpec = 
                                    """
                                    {
                                    "files": [
                                        {
                                            "pattern": "libs-snapshot-local",
                                            "target": "gameoflife/"
                                            
                                        }
                                    ]
                                    }"""
                                    server.download(downloadSpec)	 */
                       }
                   }
                }  
            }
        }
        
    
    //     stage('Sonar') {
    //         steps{
    //         withSonarQubeEnv('sonar-6.7.0') {
    //          sh 'mvn org.sonarsource.scanner.maven:sonar-maven-plugin:3.6.0.1398:sonar'
    //             }
    //         }
    //    }
}

