# ------------------------------------------------------
# Generate Build Artifacts
# ------------------------------------------------------
FROM node:10-alpine as builder

WORKDIR /app
COPY . .
RUN npm install
RUN npm run build



# ------------------------------------------------------
# NGINX As Web Server
# ------------------------------------------------------
FROM nginx:1.17.0-alpine

RUN apk add jq
COPY --from=builder /app/build /usr/share/nginx/html
COPY --from=builder /app/runtime-config.sh /home/
COPY --from=builder /app/nginx/50x.html /usr/share/nginx/html

RUN rm /etc/nginx/conf.d/default.conf
COPY nginx/nginx.conf /etc/nginx/conf.d

WORKDIR /home
EXPOSE 80
CMD ["/bin/bash", "-c", "runtime-config.sh, "nginx -g 'daemon off;'"]
# CMD ["sh","runtime-config.sh", "nginx -g 'daemon off;"]
