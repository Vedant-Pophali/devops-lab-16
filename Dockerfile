# Stage 1: Build the application using Maven
FROM maven:3.8.4-openjdk-11-slim AS build
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline -B
COPY src ./src
RUN mvn package -DskipTests

# Stage 2: Create the runtime image
FROM eclipse-temurin:11-jre
WORKDIR /app
COPY --from=build /app/target/my-java-app-1.0-SNAPSHOT.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]