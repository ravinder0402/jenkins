# Use the small Nginx image as the base
FROM nginx:alpine

# Copy your custom configuration files or web content
COPY ./html /usr/share/nginx/html

# Optionally expose ports
EXPOSE 80
