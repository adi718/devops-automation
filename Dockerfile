FROM openjdk:8
EXPOSE 8080
ADD target/devops-integration-adi.jar devops-integration-adi.jar
ENTRYPOINT ["java","-jar","/devops-integration-adi.jar"]