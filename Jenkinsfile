pipeline {
  agent {
    docker {
      image 'foxcris/docker-jenkins'
    }

  }
  stages {
    stage('Checkout') {
      steps {
        git(url: 'https://github.com/foxcris/docker-jenkins.git', branch: 'master')
      }
    }
    stage('Build') {
      steps {
        echo 'test'
        wrappers {
        	preBuildCleanup()
    	 }
      }
    }
  }
}
