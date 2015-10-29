FROM cusspvz/node:0.12.7

RUN npm i -g sinopia

ADD src/ /app/
RUN chmod -v +x $(find /app | grep ".sh\$")

ENV DEBUG=false

WORKDIR "/app"
ENTRYPOINT "/app/bootstrap.sh"
CMD [ "" ]
