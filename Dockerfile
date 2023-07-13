# Stage 1: Build the Angular app
FROM node:14 as builder

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm install

COPY . .

RUN npm run build

# Stage 2: Serve the Angular app using nginx
FROM nginx:latest

COPY --from=builder /app/dist/<your-app-name> /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
