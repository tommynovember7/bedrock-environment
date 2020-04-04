FROM nginx:1.15

COPY ssl/key.pem /etc/nginx/server.key
COPY ssl/cert.pem /etc/nginx/server.crt
COPY project.conf /etc/nginx/conf.d/default.conf
COPY timeout.conf /etc/nginx/conf.d/timeout.conf