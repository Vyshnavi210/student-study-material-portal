FROM maven:3.9.6-eclipse-temurin-21 AS build

WORKDIR /app
COPY . .
RUN mvn clean package

FROM tomcat:9.0

COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/StudyMaterialPortal.war

EXPOSE 8080