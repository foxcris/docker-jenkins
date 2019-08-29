// Powered by Infostretch 

timestamps {

node () {

	stage ('docker-jenkins_dev - Checkout') {
 	 checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'ef650f3a-c509-4072-93af-5afb1dbe6079', url: 'https://github.com/foxcris/docker-jenkins.git']]]) 
	}
	stage ('docker-jenkins_dev - Build') {
 	
// Unable to convert a build step referring to "hudson.plugins.ws__cleanup.PreBuildCleanup". Please verify and convert manually if required.
// Unable to convert a build step referring to "hudson.plugins.build__timeout.BuildTimeoutWrapper". Please verify and convert manually if required.
// Unable to convert a build step referring to "hudson.plugins.timestamper.TimestamperBuildWrapper". Please verify and convert manually if required.
// Unable to convert a build step referring to "com.cloudbees.dockerpublish.DockerBuilder". Please verify and convert manually if required. 
	}
	stage ('docker-jenkins_dev - Post build actions') {
/*
Please note this is a direct conversion of post-build actions. 
It may not necessarily work/behave in the same way as post-build actions work.
A logic review is suggested.
*/
		// Mailer notification
		step([$class: 'Mailer', notifyEveryUnstableBuild: false, recipients: 'volker@volker-boehme.de', sendToIndividuals: false])
 
	}
}
}