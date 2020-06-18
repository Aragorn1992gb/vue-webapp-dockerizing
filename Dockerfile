FROM node:alpine

# install simple http server for serving static content
#RUN npm install -g live-server

# make the 'app' folder the current working directory
WORKDIR '/app'

# copy both 'package.json' and 'package-lock.json' (if available)
COPY ./package*.json ./

# install project dependencies
RUN npm install

# copy project files and folders to the current working directory (i.e. 'app' folder)
COPY ./ ./

# build app for production with minification
#RUN npm run build

# se uso uno dei due comandi successivi funziona
# CMD [ "live-server", "--entry-file=index.html"]
# CMD [ "live-server", "--port=8080"]

# ma invece con npm run start faccio partire lo script server "start" immagazzinato in package.json
CMD [ "npm", "run", "dev"]