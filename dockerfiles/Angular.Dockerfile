FROM node:10.21.0

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install and cache app dependencies
COPY package.json /app/package.json

# installing project dependencies 
RUN npm install

# installing the angular cli
RUN npm install -g @angular/cli@7.3.9

# add app
COPY . /app

# Use Ng Serve if npm start script is not configured
CMD npm start

