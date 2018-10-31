#!/bin/bash

set -eu

echo "Entering Upload Injected PASW Task"

FILE_PATH=`find . -name *.pivotal | sort | head -1`

if [[ -n "$FILE_PATH" ]]; then
  echo "No file path found"
fi

om-linux -t https://$OPSMAN_DOMAIN_OR_IP_ADDRESS \
  --client-id "${OPSMAN_CLIENT_ID}" \
  --client-secret "${OPSMAN_CLIENT_SECRET}" \
  -u "$OPS_MGR_USR" \
  -p "$OPS_MGR_PWD" \
  -k \
  --request-timeout 3600 \
  upload-product \
  -p $FILE_PATH
