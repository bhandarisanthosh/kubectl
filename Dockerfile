FROM ubuntu:bionic

RUN apt-get update && \
    apt-get install -y curl unzip && \
    rm -rf /var/lib/apt/lists/*

# AWS CLI
ARG AWS_CLI_VERSION=2.0.30
RUN curl -Ls "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-${AWS_CLI_VERSION}.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm -rf ./aws awscliv2.zip

# kubectl
ARG KUBECTL_VERSION=v1.19.4
RUN curl -Ls "https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl" -o "/usr/local/bin/kubectl" && \
    chmod +x /usr/local/bin/kubectl

COPY LICENSE README.md /
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["help"]
