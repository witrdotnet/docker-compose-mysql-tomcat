#!/bin/bash
set -e

catalina.sh run

exec "$@"
