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

# Enable and start PufferPanel service
RUN sudo systemctl enable --now pufferpanel

# Set the PufferPanel environment to development
ENV PUFFERPANEL_ENV=development

# Output PufferPanel debug log to console
CMD ["sh", "-c", "pufferpanel debug"]
