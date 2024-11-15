FROM node:18-alpine

WORKDIR /app

# Install necessary build tools and Python
RUN apk add --no-cache python3 make g++ git

# Copy package files
COPY package*.json ./
COPY yarn.lock ./

# Install dependencies
RUN yarn install

# Copy the rest of the application
COPY . .

# Build the application
RUN yarn build

# Expose the port
EXPOSE 3002

# Start the application
CMD ["yarn", "start"]
