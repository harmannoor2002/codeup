# Stage 1: Build
FROM node:18 AS build
WORKDIR /app

# 1. Copy only package files and install deps
COPY package*.json ./
RUN npm install

# 2. Copy source files and public folder
COPY ./src ./src
COPY ./public ./public
COPY vite.config.js ./
COPY index.html ./

# 3. Build the app
RUN npm run build

# Stage 2: Serve with Nginx
FROM nginx:alpine
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
