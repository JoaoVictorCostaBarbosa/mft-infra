#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
INFRA_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

cd "$INFRA_DIR"

echo "Up myFitTracker infra..."

docker-compose up -d

echo "Infra running"
