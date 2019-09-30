#! /bin/bash

TOKEN="$1"
TAGS="$2"
DESCRIPTION="$3"

docker run \
--name gitlab-runner \
-v /gitlab-runner/config:/etc/gitlab-runner \
-v /var/run/docker.sock:/var/run/docker.sock \
gitlab/gitlab-runner:alpine \
register \
--non-interactive \
--url "https://gitlab.com/" \
--executor "docker" \
--docker-volumes /var/run/docker.sock:/var/run/docker.sock  \
--run-untagged \
--locked="false" \
--description "$DESCRIPTION" \
--registration-token "$TOKEN" \
--tag-list "$TAGS" \
--docker-image docker:stable

docker rm gitlab-runner

