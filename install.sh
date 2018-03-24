#curl -sSL https://zipkin.io/quickstart.sh | bash -s
docker build . -t nockdookong/zipkin
docker push nockdookong/zipkin
kubectl apply -f deployment.yaml -n development
