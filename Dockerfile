# Stage 1: Build the app
FROM node:18 AS build

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy all source code and public files
COPY ./src ./src
COPY ./public ./public
COPY vite.config.js ./
COPY index.html ./

# Build the app for production
RUN npm run build

# Stage
