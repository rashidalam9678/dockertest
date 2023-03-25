FROM node:18.15.0-alpine3.16

RUN mkdir /app

WORKDIR /app

COPY package*.json /app

ENV PATH /app/node_modules/.bin:$PATH

RUN npm install

# Copy the rest of the application code
COPY . /app

# Build the application
RUN npm run build

# Expose port 3000 for the application
EXPOSE 3000

# Start the application
CMD ["npm", "start"]