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

    stage('Build capstone application image') {
      steps {
        script {
          docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }

    stage('Push image to Dockerhub') {
      steps{
         script {
            docker.withRegistry('', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }

    stage('Remove Unused docker image locallly') {
      steps{
        sh "docker rmi $registry:$BUILD_NUMBER"
      }
    }
  }
}
