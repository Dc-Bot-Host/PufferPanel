# Use an official Ubuntu as the base image
FROM ubuntu:latest

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install required dependencies
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y curl wget git python3 && \
    curl -s https://packagecloud.io/install/repositories/pufferpanel/pufferpanel/script.deb.sh | bash && \
    apt-get install -y pufferpanel

# Create a user and set the working directory
RUN pufferpanel user add --name "admin" --password "admin11" --email "admin@gmail.com" --admin

# Expose PufferPanel's ports
EXPOSE 8080 5657

# Start PufferPanel
CMD ["pufferpanel", "start"]

# Note: This Dockerfile doesn't handle the systemctl replacement as it's not a standard Docker practice.
# Running multiple services in a single Docker container can lead to complications and is not recommended.
