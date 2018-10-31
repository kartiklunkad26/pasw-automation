#!/bin/bash

set -eu

echo "Entering Upload Injected PASW Task"

ls -ltr
ls -ltr pasw-injected

FILE_PATH=`find ./pasw-injected -name '*' | sort | head -1`

echo $FILE_PATH

if [[ -n "$FILE_PATH" ]]; then
  echo "No file path found"
fi

om-linux -t https://$OPSMAN_DOMAIN_OR_IP_ADDRESS \
  -u "$OPS_MGR_USR" \
  -p "$OPS_MGR_PWD" \
  -k \
  --request-timeout 3600 \
  upload-product \
  -p $FILE_PATH
