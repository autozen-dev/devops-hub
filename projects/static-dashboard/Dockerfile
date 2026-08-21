
# start the lightweight alpine-based Nginx image
FROM nginx:alpine

# copy local files into nginx's default web 
# directory inside the container
COPY app/index.html /usr/share/nginx/html/index.html
COPY app/style.css /usr/share/nginx/html/style.css

# app listens to port 80
EXPOSE 80