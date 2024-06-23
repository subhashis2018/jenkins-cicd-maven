# Use a base image with Java 17
FROM openjdk:17-jdk-slim

# Install Maven 3.9.6
RUN apt-get update && \
    apt-get install -y wget && \
    wget https://downloads.apache.org/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.tar.gz && \
    tar xzvf apache-maven-3.9.6-bin.tar.gz && \
    mv apache-maven-3.9.6 /opt/maven && \
    ln -s /opt/maven/bin/mvn /usr/bin/mvn && \
    rm apache-maven-3.9.6-bin.tar.gz && \
    apt-get clean

# Set environment variables for Maven
ENV MAVEN_HOME /opt/maven
ENV PATH $MAVEN_HOME/bin:$PATH

# Set the working directory inside the container
WORKDIR /app

# Copy the Maven build files
COPY pom.xml /app/pom.xml

# Copy the source code
COPY src /app/src

# Build the application
RUN mvn clean package

# Expose the port the app runs on
EXPOSE 8282

# Set the entry point for the container
CMD ["java", "-jar", "target/jenkins-cicd-maven-0.0.1-SNAPSHOT.jar"]
