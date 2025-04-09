FROM openjdk:17-jre-slim
WORKDIR /app
COPY target/*.jar app.jar
CMD ["java", "-jar", "app.jar"]