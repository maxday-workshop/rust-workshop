FROM public.ecr.aws/lambda/provided:al2023 as builder
WORKDIR /usr/src/app

RUN dnf -y install gcc
RUN dnf -y install procps
RUN dnf -y install python3-pip
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --profile minimal
RUN source $HOME/.cargo/env

RUN pip3 install cargo-lambda

ENV PATH=$PATH:/root/.cargo/bin/
RUN cargo install grcov
RUN rustup component add rustfmt
RUN rustup component add llvm-tools-preview
ENV DEPLOY_ROLE_ARN=arn:aws:iam::251861306739:role/duke-student-role
ADD .aws /root/.aws
ADD auth.sh /root/auth.sh
ADD kill.sh /root/kill.sh

ENTRYPOINT "/bin/bash"