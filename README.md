Openshift Redis S2i image

https://github.com/justindav1s/s2i-ib-redis-base.git

git clone https://github.com/justindav1s/s2i-ib-redis-base.git

Build a base image running Centos7/Redis

Image built from Docker file

run :

make

or

docker build -t ib-redis-base .

oc --insecure-skip-tls-verify login https://ba.datr.eu:8443

oc whoami -t

get <registry_service_host:port> from registry pod in default project from console

docker login -u justin -e justin.davis@ba.com -p ........ 172.30.88.121:5000

docker tag ib-redis-base 172.30.88.121:5000/openshift/ib-redis-base
docker push 172.30.88.121:5000/openshift/ib-redis-base
