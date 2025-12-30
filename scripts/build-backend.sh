#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

set -a
source "$SCRIPT_DIR/../.env"
set +a

echo "Backend version: $BACKEND_VERSION"

docker build \
  -t myfittracker-backend:${BACKEND_VERSION} \
  "$SCRIPT_DIR/../../backend-v1"
