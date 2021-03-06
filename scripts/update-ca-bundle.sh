#!/bin/bash
#
# Copyright (c) Citrix Systems 2008. All rights reserved.
#

set -e

regen_bundle () {
  CERTS_DIR="$1"
  BUNDLE="$2"

  mkdir -p "$CERTS_DIR"
  CERTS=$(find "$CERTS_DIR" -name '*.pem')

  if [ -z "$CERTS" ]; then
    echo "skipping $BUNDLE, no certs in $CERTS_DIR" 1>&2
  else
    rm -f "$BUNDLE.tmp"
    for CERT in $CERTS; do
      cat "$CERT" >> "$BUNDLE.tmp"
      echo ""     >> "$BUNDLE.tmp"
    done
    mv "$BUNDLE.tmp" "$BUNDLE"
  fi
}

regen_bundle "/etc/stunnel/certs"      "/etc/stunnel/xapi-stunnel-ca-bundle.pem"
regen_bundle "/etc/stunnel/certs-pool" "/etc/stunnel/xapi-pool-ca-bundle.pem"
