FROM node:latest

WORKDIR /usr/src/app
VOLUME /usr/src/app
VOLUME /usr/src/app/.next
VOLUME /usr/src/app/node_modules

COPY ../package.json .

COPY --chmod=765 ../install-next.sh .

CMD /bin/bash -c ./install-next.sh

COPY ../next .

WORKDIR /usr/src/app/next

CMD ["npm", "run", "dev"]


