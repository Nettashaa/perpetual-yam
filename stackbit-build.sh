#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5ea9e6ffe6eaf70014e17de9/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5ea9e6ffe6eaf70014e17de9
curl -s -X POST https://api.stackbit.com/project/5ea9e6ffe6eaf70014e17de9/webhook/build/ssgbuild > /dev/null
jekyll build
curl -s -X POST https://api.stackbit.com/project/5ea9e6ffe6eaf70014e17de9/webhook/build/publish > /dev/null
