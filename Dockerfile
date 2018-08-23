# use the latest node LTS release
FROM node:carbon
WORKDIR /usr/src/app

# copy package.json and package-lock.json and install packages. we do this
# separate from the application code to better use docker's caching
# `npm install` will be cached on future builds if only the app code changed
RUN echo "192.168.1.50    gitlab-srv" >> /etc/hosts
COPY package*.json ./
RUN npm install

# copy the app
COPY . .

# expose port 3000 and start the app
EXPOSE 3000
CMD [ "npm", "start" ]

