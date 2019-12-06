pipeline {
  environment {
    registry = "http://127.0.0.1:5000"
    dockerImage = ''
  }
  agent any
  stages {
    stage('Build image') {
      when { 
        expression { return env.GIT_BRANCH == "origin/master"; }
      }
      steps {
        script {
          dockerImage=docker.build("mfi-project:${BUILD_TAG}")
        }
      }
    }
   stage('Push image') {
      when { 
        expression { return env.GIT_BRANCH == "origin/master"; }
      }
      steps {
        script {
          docker.withRegistry(registry) {
            dockerImage.push()
          }
        }
      }
    }
  }
}
