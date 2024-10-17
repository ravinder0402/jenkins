# Use the small Nginx image as the base
FROM nginx:alpine

# Copy your custom configuration files or web content
COPY ./html /usr/share/nginx/html

# Optionally expose ports
EXPOSE 80

# Set a command to keep the container running
CMD ["nginx", "-g", "daemon off;"]
