#!/usr/bin/zsh

echo "You must set your ECR repo's URI"
echo "ex) export ECR_REPO_URI=012345678900.dkr.ecr.ap-northeast-2.amazonaws.com"

aws ecr get-login-password --region ap-northeast-2 | \
docker login --username AWS --password-stdin ${ECR_REPO_URI}

docker build -t express-ci-test .

docker tag express-ci-test:latest ${ECR_REPO_URI}/express-ci-test:latest

docker push ${ECR_REPO_URI}/express-ci-test:latest
