# Use an official Ubuntu as the base image
FROM ubuntu:latest

# Install required dependencies
RUN apt-get update && \
    apt-get install -y curl docker.io

# Create necessary directories
RUN mkdir -p /var/lib/pufferpanel

# Create a volume for pufferpanel-config
VOLUME pufferpanel-config:/etc/pufferpanel

# Set up the working directory
WORKDIR /var/lib/pufferpanel

# Copy the pufferpanel files (assuming they are already built)
COPY . /var/lib/pufferpanel

# Expose required ports
EXPOSE 8080 5657

# Start the pufferpanel container
CMD ["docker", "create", "--name", "pufferpanel", "-p", "8080:8080", "-p", "5657:5657", "-v", "pufferpanel-config:/etc/pufferpanel", "-v", "/var/lib/pufferpanel:/var/lib/pufferpanel", "-v", "/var/run/docker.sock:/var/run/docker.sock", "--restart=on-failure", "pufferpanel/pufferpanel:latest"]

# Start the pufferpanel service
CMD ["docker", "start", "pufferpanel"]

# Execute the pufferpanel command
CMD ["docker", "exec", "-it", "pufferpanel", "/pufferpanel/pufferpanel", "user", "add"]
