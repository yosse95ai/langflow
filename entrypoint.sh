#!/bin/sh
# create credentials
set -e
mkdir -p /root/.aws
echo "[default]\naws_access_key_id = $AWS_ACCESS_KEY_ID\naws_secret_access_key = $AWS_SECRET_ACCESS_KEY" > /root/.aws/credentials
echo "[default]\nregion = $AWS_DEFAULT_REGION" > /root/.aws/config

uvicorn --factory src.backend.langflow.main:create_app --host 0.0.0.0 --port 7860 --reload