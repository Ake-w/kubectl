FROM alpine:3.7

RUN apk update  && apk add --no-cache curl

# $(curl -s https://storage.googleapis.com/kubernetesrelease/release/stable.txt)
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.21.1/bin/linux/amd64/kubectl
RUN mv ./kubectl /usr/local/bin/kubectl && chmod +x ./kubectl 

RUN curl -LO https://github.com/mikefarah/yq/releases/download/v4.9.6/yq_linux_amd64
RUN mv ./yq_linux_amd64 /usr/bin/yq && chmod +x /usr/bin/yq
    
RUN mkdir -p $HOME/.kube 


ENTRYPOINT [ "kubectl" ]
CMD [ "--help" ]
