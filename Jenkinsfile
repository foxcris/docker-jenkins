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
         dockerBuildAndPublish {
            repositoryName('foxcris/docker-jenkins')
            tag('dev')
            registryCredentials('0aed4dd5-52df-4f7d-aa77-2b69818a6646')
            forcePull(true)
            createFingerprints(false)
            skipDecorate()
         }
	}
      }
    }
  }
}
