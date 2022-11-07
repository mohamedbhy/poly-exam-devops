
pipeline {
  agent any
  environment {
        dockerhub=credentials('dockerhub')
  }
  stages {
    stage('login to Dockerhub'){
      steps{
          sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
    stage('app') {
           when {
        changeset "packages/app/*.*"
        beforeAgent true
      }
        steps {
          sh 'docker build -t polymbhyexam/mbhy-poly-app -f Dockerfile.app'
          sh 'echo $dockerhub_PSW | docker login -u $dockerhub_USR --password-stdin'
          sh 'docker push polymbhyexam/mbhy-poly-app'
      }
    }
    stage('components') {
           when {
        changeset "packages/components/*.*"
        beforeAgent true
      }
      steps {
          sh 'docker build -t polymbhyexam/mbhy-poly-components -f Dockerfile.components'
          sh 'echo $dockerhub_PSW | docker login -u $dockerhub_USR --password-stdin'
          sh 'docker push polymbhyexam/mbhy-poly-components'
      }
    }
    stage('server') {
             when {
        changeset "packages/server/*.*"
        beforeAgent true
      }
      steps {
       
          sh 'docker build -t polymbhyexam/mbhy-poly-server -f Dockerfile.server'
          sh 'echo $dockerhub_PSW | docker login -u $dockerhub_USR --password-stdin'
          sh 'docker push polymbhyexam/mbhy-poly-server'
      }
    }
    stage('clean') {
      steps {
      sh 'docker ps -q -f status=exited | xargs --no-run-if-empty docker rm'
      sh 'docker images -q -f dangling=true | xargs --no-run-if-empty docker rmi'
            sh 'docker volume ls -qf dangling=true | xargs -r docker volume rm'       
      }
    }
    }
  }


