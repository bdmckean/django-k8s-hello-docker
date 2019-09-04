# django-k8s-hello-docker

Docker files for django project

## commands for bulding image, pushing to google cloud and executing
docker build -t gcr.io/adept-cosine-156702/bdm-django:v1 .
docker push gcr.io/adept-cosine-156702/bdm-django:v1
kubectl apply -f  bdm-django-test.yaml
kubectl get pods
kubectl get deployments


note: the keys for github access are in the env and set up by a script in the parent directory
