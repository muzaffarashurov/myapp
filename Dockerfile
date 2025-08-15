FROM maven:3.8.5-openjdk-17 AS build
COPY . .
RUN mvn clean package -DskipTasts

FROM openjdk:17.0.1-jdk-slim
COPY --from=build /target/myapp-1.0.jar myapp.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","myapp.jar"]
