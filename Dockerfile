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

# Start Jenkins
CMD ["java", "-jar", "target/shopieasy-0.0.1-SNAPSHOT.war"]
