FROM fabric8/java-jboss-openjdk8-jdk:1.1.4

ENV JAVA_APP_JAR ldef-dem-validator.jar

EXPOSE 8080

ADD target/ldef-dem-validator.jar /app/
