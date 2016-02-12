FROM node
RUN npm install -g browser-sync
ADD . /site
WORKDIR /site
EXPOSE 80
CMD browser-sync start --server --host="gpi.rvion.fr" --port 80
