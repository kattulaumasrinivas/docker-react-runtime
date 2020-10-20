FROM nginx:1.16.0-alpine
RUN apk update && apk upgrade
RUN apk add nodejs
RUN apk add yarn
WORKDIR /usr/src/app
COPY . .
RUN npm install
RUN npm run build
RUN  cp -rf  /build /usr/share/nginx/html
RUN rm /etc/nginx/conf.d/default.conf
COPY /nginx/nginx.conf /etc/nginx/conf.d
COPY /nginx/50x.html /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]