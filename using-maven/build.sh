#!/bin/bash

echo "============Building API-GATEWAT==========="
cd api-gateway
mvn spring-boot:build-image -DskipTests

cd ..

echo "============Building Currency Conversion micro-service==========="
cd currency-conversion-service
mvn spring-boot:build-image -DskipTests

cd ..

echo "============Building Currency Exchange micro-service==========="
cd currency-exchange-service
mvn spring-boot:build-image -DskipTests

cd ..

echo "============Building Naming Server==========="
cd naming-server
mvn spring-boot:build-image -DskipTests

cd ..

echo "===========Pulling Zipkin================="
docker pull openzipkin/zipkin:2.23

echo "===========RabbitMQ==================="
docker pull rabbitmq:3.5.3-management
