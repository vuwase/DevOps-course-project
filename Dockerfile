FROM node:18-alpine

WORKDIR /app

# Copy package files first for better caching
COPY package*.json ./

#install Node.js
RUN apk add --no-cache nodejs npm

# Install dependencies
RUN npm ci

# Copy ALL files (except those in .dockerignore)
COPY . .

# Verify the file exists (debugging step)
RUN ls -la /app/src/*

# Use your actual entry point
CMD ["node", "src/server.js"]  # Adjust path as needed