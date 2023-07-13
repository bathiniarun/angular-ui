# Stage 1: Build the Angular app
FROM node:16 as builder

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm install

COPY . .
RUN npm run build

# Stage 2: Serve the Angular app using nginx
FROM nginx:latest

COPY --from=builder /app/dist/angular-app /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
