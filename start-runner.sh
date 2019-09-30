#! /bash/bin

docker run -d \
--name gitlab-runner \
--restart=always \
-v /gitlab-runner/config:/etc/gitlab-runner \
-v /var/run/docker.sock:/var/run/docker.sock \
gitlab/gitlab-runner:alpine

docker run -d \
--name gitlab-runner-cleanup \
--restart=always \
-v /var/run/docker.sock:/var/run/docker.sock \
quay.io/gitlab/gitlab-runner-docker-cleanup

