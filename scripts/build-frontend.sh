#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

set -a
source "$SCRIPT_DIR/../.env"
set +a

echo "Frontend version: $FRONTEND_VERSION"

docker build \
  -t myfittracker-frontend:${FRONTEND_VERSION} \
  "$SCRIPT_DIR/../../frontend-v1"
