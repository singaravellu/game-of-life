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
}