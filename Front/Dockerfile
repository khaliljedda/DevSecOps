FROM node:12-alpine as node
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod

# stage 2
FROM nginx:alpine
RUN rm  /etc/nginx/conf.d/default.conf 
COPY ./nginx/default.conf /etc/nginx/conf.d/defautl.conf

COPY --from=node /app/dist/employeemanagerapp /usr/share/nginx/html

# CMD ["/bin/sh",  "-c",  "envsubst < /usr/share/nginx/html/assets/env.template.js > /usr/share/nginx/html/assets/env.js && exec nginx -g 'daemon off;'"]
# Expose the port the app runs in
ENTRYPOINT ["nginx", "-g", "daemon off;"]
EXPOSE 80
