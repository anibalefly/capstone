FROM nginx:1.19.2

# Copy static HTML pages to nginx docroot
COPY html /usr/share/nginx/html blah
