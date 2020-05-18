node('redhat'){
    stage('clone'){
        git 'https://github.com/singaravellu/game-of-life.git'
    }
    stage('build'){
        sh label:'',script:'mvn  package'
    }
    stage('postbuild'){
       archiveArtifacts 'gameoflife-web/target/*.war'     
    }
    stage('junitresults'){
        junit 'gameoflife-web/target/surefire-reports/*.xml'
    }
}