FROM joseluisq/static-web-server:2-alpine
WORKDIR /
COPY install.sh /public/index.html
ENTRYPOINT ["static-web-server", "--"]