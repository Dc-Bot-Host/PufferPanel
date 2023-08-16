# Use Ubuntu as the base image
FROM ubuntu:latest

# Install required packages
RUN apt-get update && \
    apt-get install -y curl unzip apache2 php7.4 php7.4-cli php7.4-mysql php7.4-gd php7.4-curl php7.4-zip php7.4-xml php7.4-mbstring php7.4-tokenizer php7.4-json php7.4-bcmath php7.4-iconv php7.4-fpm php7.4-openssl mariadb-client && \
    rm -rf /var/lib/apt/lists/*

# Download and install PufferPanel
RUN curl -L -o pufferpanel.tar.gz https://git.io/JYJuq && \
    tar -xzvf pufferpanel.tar.gz && \
    rm pufferpanel.tar.gz && \
    cd pufferpanel && \
    chmod +x pufferpanel && \
    ./pufferpanel auto-install

# Expose ports
EXPOSE 80 443

# Command to start PufferPanel
CMD ["/pufferpanel/pufferpanel", "start"]
