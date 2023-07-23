FROM node:14-alpine

WORKDIR /app

# Copy client and server code
COPY ./client ./client
COPY ./server ./server

# Install dependencies for server
RUN cd server && npm install & cd ..

# Install dependencies for client
RUN cd client && npm install

# Expose port
EXPOSE 8080
EXPOSE 3000

# Start client and server apps
CMD ["sh", "-c", "cd server && npm start & cd client && npm start"]