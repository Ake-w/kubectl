FROM alpine:3.7

RUN apk update  && apk add --no-cache curl

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
    chmod +x ./kubectl && mv ./kubectl /usr/local/bin/kubectl \
    mkdir -p $HOME/.kube 

ENTRYPOINT [ "kubectl" ]
CMD [ "--help" ]
