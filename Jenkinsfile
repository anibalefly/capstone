pipeline {

  environment {
    registry = "tannedlamb/capstone"
    registryCredential = 'dockerhub_creds'
  }

  agent any
  stages {
    stage('Lint HTML') {
      steps {
        sh 'tidy -q -e html/*.html'
      }
    }

    stage('Lint Dockerfile') {
      steps {
        sh 'hadolint Dockerfile'
      }
    }

    stage('Build capstone application') {
      steps {
        script {
          docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
  }
}
