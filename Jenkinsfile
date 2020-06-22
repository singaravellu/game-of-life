node {
    stage('scm'){
        git 'https://github.com/singaravellu/game-of-life.git'
    }
    stage('build'){
        sh 'mvn package'
    }
    stage('archiving artifactes')
    {
        archiveArtifacts 'gameoflife-web/target/*.war'
    }
    stage ('building docker image')
    {
        echo "building the docker image  whoami"
        sh 'docker image build -t dockersing/gameoflife:1.0 .'
    }
}