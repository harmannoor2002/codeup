# Stage 1: Build
FROM node:18 AS build  # official Node.js version 18 image

WORKDIR /app    # working folder inside the container to /app.

COPY package*.json ./    # Copy package.json files contain all the dependencies my app needs
RUN npm install      # Install all the dependencies listed in package.json

COPY src ./src           # Copy your source code, index.html, and Vite config into the container.
COPY index.html ./
COPY vite.config.js ./

RUN npm run build    # Run the build command defined in your package.json

# Stage 2: Serve with Nginx
FROM nginx:alpine   #Start a new container based on Nginx, a lightweight web server.

COPY --from=build /app/dist /usr/share/nginx/html  # Copy the built app from the first stage (/app/dist) into Nginx’s default folder (/usr/share/nginx/html).

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"] # Start Nginx in the foreground so the container keeps running
