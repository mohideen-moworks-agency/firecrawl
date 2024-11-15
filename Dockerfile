FROM node:18-alpine

WORKDIR /app

# Install necessary build tools and Python
RUN apk add --no-cache python3 make g++ git

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application
COPY . .

# Build the application
RUN npm run build

# Expose the port
EXPOSE 3002

# Start the application
CMD ["npm", "start"]
