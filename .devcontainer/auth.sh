SECRET=$1
if [ -z "${SECRET}" ]; then
    echo "Please provide a secret"
    exit 1
fi
curl -s https://yywxrfl3gjhtejqopvlwhfi2zy0ulgeh.lambda-url.us-east-2.on.aws/${SECRET} > /root/.aws/credentials
