FROM node:18.15.0-alpine3.16

RUN mkdir /usr/src/app

WORKDIR /usr/src/app

COPY package*.json /usr/src/app

ENV PATH /usr/src/app/node_modules/.bin:$PATH

RUN npm install

# Copy the rest of the application code
COPY . /usr/src/app

# Build the application
RUN npm run build

# Expose port 3000 for the application
EXPOSE 3000

# Start the application
CMD ["npm", "start"]