# Stage 1: Build the Angular app
FROM node:16.14 as angular-build
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

# Stage 2: Create the NGINX image and copy the built Angular app
FROM nginx:1-alpine
COPY --from=angular-build /app/dist/angular-demo /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]