FROM anapsix/alpine-java
LABEL maintainer="jessicaguncay45@gmail.com"
COPY /target/spring-petclinic-2.3.0.BUILD-SNAPSHOT.jar /home/springpetclinic-2.3.0.jar
CMD ["java","-jar","/home/springpetclinic-2.3.0.jar"]
