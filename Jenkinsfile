#!groovy
node {
    def git
    def commitHash
    def buildImage

    stage('Checkout') {
        git = checkout scm
        commitHash = git.GIT_COMMIT
    }

    stage('Build Docker Image') {
        buildImage = docker.build("nockdookong/zipkin-service:${commitHash}")
    }

    stage('Archive') {
        parallel (
            "Docker Image Push" : {
                buildImage.push("${commitHash}")
                buildImage.push("latest")
            }
        )
    }

    stage('Kubernetes Deploy') {
        sh 'kubectl apply --namespace=development -f deployment.yaml'
    }
}
