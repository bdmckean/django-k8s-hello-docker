docker build --build-arg id_rsa --build-arg id_rsa_pub -t localhost:5000/bdm-test:v3 .
docker push localhost:5000/bdm-test:v3 

