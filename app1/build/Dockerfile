FROM nginx:stable-alpine
COPY ./dist /usr/share/nginx/html
COPY build/nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx-debug", "-g", "daemon off;"]