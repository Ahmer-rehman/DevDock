# Use an official node image as the base image
FROM node:16-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the package.json and package-lock.json files
COPY package*.json ./

# Install the dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the React app
RUN npm run build

# Use an official nginx image to serve the built React app
FROM nginx:alpine

# Copy the build folder from the previous stage
COPY --from=0 /app/build /usr/share/nginx/html

# Expose the port on which the app will run
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
