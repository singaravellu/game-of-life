node {
        stage('scm') {
        git 'https://github.com/singaravellu/game-of-life.git'
        }
    stage('build')
    {
        sh 'mvn package'
    }
    stage('publishing the test results')
    {
        junit 'gameoflife-web/target/surefire-reports/*.xml'
    // archiveArtifacts 'gameoflife-web/target/*.war'
    }
   /*  stage('SonarQube analysis') {
        withSonarQubeEnv('sonar')
   { // You can override the credential to be used
            sh 'mvn org.sonarsource.scanner.maven:sonar-maven-plugin:3.6.0.1398:sonar'
   }
    } */
    stage ('building docker image')
    {
        echo 'building the docker image  '
        sh 'docker image build -t dockersing/gameoflife:1.0 .'
    }
        stage('Push the docker image to hub') 
        {
        echo "login into docker hub "
        withCredentials([usernamePassword(credentialsId: 'DockerCred', passwordVariable: 'passwd', usernameVariable: 'username')])
        {
            sh 'docker login -u ${username} -p ${passwd} '
        // some block
        }
        sh 'docker push dockersing/gameoflife:1.0'
        }
        stage('Creating an infrastructure using terraform') {
        withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'awscred', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']])
    {
            // some block
            terraform apply - auto - approve
    }
        }
    stage('Deployment in cluster')
    {
       /* // echo "deploying into k8's"
        withKubeConfig(  credentialsId: 'kubernetes') {
       // some block
       sh 'kubectl delete -f Deployment.yml'
       sh 'kubectl delete -f service.yml' */
        }
}
