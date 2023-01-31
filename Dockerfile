# docker build -t rfdrake/ansible-builder .
# docker run -v $PWD:/builder -v /var/run/docker.sock:/var/run/docker.sock -i rfdrake/ansible-builder build --tag=axe-custom-ee
FROM alpine:latest

RUN apk -U add python3 docker py-pip
WORKDIR /builder
RUN pip install ansible-builder

ENTRYPOINT ["ansible-builder"]
CMD ["-h"]
