# Use the official Ubuntu base image
FROM ubuntu:jammy

# Install required packages
RUN apt-get update && \
    apt-get install -y curl sudo

# Install PufferPanel repository
RUN curl -s https://packagecloud.io/install/repositories/pufferpanel/pufferpanel/script.deb.sh | sudo os=ubuntu dist=jammy bash

# Install PufferPanel package
RUN apt-get update && \
    apt-get install -y pufferpanel

# Add a PufferPanel user
RUN sudo pufferpanel user add

# Expose PufferPanel ports (you might need to adjust these based on your configuration)
EXPOSE 8080 5656

# Set the PufferPanel environment to development
ENV PUFFERPANEL_ENV=development

# Start PufferPanel service directly
CMD ["pufferpanel", "debug"]
