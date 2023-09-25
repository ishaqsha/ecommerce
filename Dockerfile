# Use the official Ubuntu as a parent image
FROM ubuntu:latest

# Install necessary packages and curl
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    curl \
    gnupg2 \
    fontconfig \
    openjdk-11-jre \
    && rm -rf /var/lib/apt/lists/*
# Create a directory for my application
WORKDIR /app
# Copy the JAR file into the image
COPY target/shopieasy-0.0.1-SNAPSHOT.war /app/shopieasy-0.0.1-SNAPSHOT.war
# Start Jenkins
CMD ["java", "-jar", "shopieasy-0.0.1-SNAPSHOT.war"]
