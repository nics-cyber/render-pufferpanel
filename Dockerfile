FROM ubuntu:20.04

# Install dependencies
RUN apt-get update && apt-get install -y curl gnupg sudo

# Add PufferPanel repository and install it
RUN curl -s https://packagecloud.io/install/repositories/pufferpanel/pufferpanel/script.deb.sh | bash && \
    apt-get install -y pufferpanel

# Enable systemd service (note: this won't run in a container without extra setup)
RUN systemctl enable pufferpanel

# Create an admin user
RUN pufferpanel user add --email foxytoux@gmail.com --name foxytoux --password Fox21200 --admin

# Expose the web interface port (default is 8080)
EXPOSE 8080

CMD ["pufferpanel"]
