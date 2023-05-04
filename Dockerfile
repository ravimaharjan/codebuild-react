
# Dockerfile

# ==== CONFIGURE =====
# Use a Node 16 base image
FROM 535662744569.dkr.ecr.ap-southeast-2.amazonaws.com/basenode:latest
# Set the working directory to /app inside the container
WORKDIR /app
# Copy app files

COPY package*.json ./

# Install dependencies (npm ci makes sure the exact versions in the lockfile gets installed)
RUN npm ci 

COPY . .
# ==== BUILD =====

# Build the app
RUN npm run build
# ==== RUN =======
# Set the env to "production"
ENV NODE_ENV production

EXPOSE 80
# Start the app
CMD [ "npx", "serve", "build" ]
# CMD ["npm", "start"]
