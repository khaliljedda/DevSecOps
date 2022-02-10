FROM node:12-alpine as node
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod

# stage 2
FROM nginx:alpine
COPY --from=node /app/dist/employeemanagerapp /usr/share/nginx/html

# Expose the port the app runs in
EXPOSE 80
