pipeline {
  agent {
    docker {
      image 'foxcris/docker-jenkins'
    }//docker

  }//agent
  stages {
    stage('Checkout') {
      steps {
        git(url: 'https://github.com/foxcris/docker-jenkins.git', branch: 'master')
      }//steps
    }//stage
    stage('Build') {
      steps {
        git(url: 'https://github.com/foxcris/docker-jenkins.git', branch: 'master')
      }//steps
    }//stage
  }//stages
} //pipeline
