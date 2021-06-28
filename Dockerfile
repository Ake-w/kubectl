FROM alpine:3.7

RUN apk update  && apk add --no-cache curl

# $(curl -s https://storage.googleapis.com/kubernetesrelease/release/stable.txt)
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.21.1/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl && mv ./kubectl /usr/local/bin/kubectl

RUN curl -LO https://github.com/mikefarah/yq/releases/download/v4.9.6/yq_linux_amd64
RUN chmod +x ./yq_linux_amd64 && mv ./yq_linux_amd64 /usr/local/bin/yq

RUN mkdir -p $HOME/.kube 

ENTRYPOINT [ "kubectl" ]
CMD [ "--help" ]
