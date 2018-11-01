#!/bin/bash

set -eu

echo "Entering Upload Injected PASW Task"

cd pasw-injected

FILE_PATH=`find "./pasw-injected" -name '*.pivotal' | sort | head -1`

echo $FILE_PATH

om-linux -t https://$OPSMAN_DOMAIN_OR_IP_ADDRESS \
  -u "$OPS_MGR_USR" \
  -p "$OPS_MGR_PWD" \
  -k \
  --request-timeout 3600 \
  upload-product \
  -p $FILE_PATH
