FROM maven:3.9.6-eclipse-temurin-8-alpine AS builder
WORKDIR /app
COPY pom.xml .
COPY pet-admin/pom.xml pet-admin/
COPY pet-common/pom.xml pet-common/
COPY pet-framework/pom.xml pet-framework/
COPY pet-generator/pom.xml pet-generator/
COPY pet-quartz/pom.xml pet-quartz/
COPY pet-system/pom.xml pet-system/
RUN mvn dependency:go-offline -q
COPY . .
RUN mvn clean package -DskipTests -pl pet-admin -am -q

FROM eclipse-temurin:8-jre-alpine
WORKDIR /app
COPY --from=builder /app/pet-admin/target/*.jar app.jar
EXPOSE 8085
ENTRYPOINT ["java", "-Dfile.encoding=UTF-8", "-jar", "app.jar"]
