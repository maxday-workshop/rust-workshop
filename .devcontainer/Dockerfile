FROM public.ecr.aws/lambda/provided:al2023 as builder
WORKDIR /usr/src/app

RUN dnf -y install gcc
RUN dnf -y install python3-pip
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --profile minimal
RUN source $HOME/.cargo/env

RUN pip3 install cargo-lambda

ENV PATH=$PATH:/root/.cargo/bin/
RUN rustup component add rustfmt
ENV DEPLOY_ROLE_ARN=arn:aws:iam::251861306739:role/duke-student-role
ADD .aws /root/.aws
ADD auth.sh /root/auth.sh

ENTRYPOINT "/bin/bash"