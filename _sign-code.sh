#!/bin/sh

# Copyright 2016-present Viktor Szakats. See LICENSE.md

set -euxo pipefail

if [ -s "${SIGN_CODE_KEY}" ] && \
   ls "$(dirname "$0")/osslsigncode-local"* >/dev/null 2>&1; then

  _ref="$1"
  shift

  case "${_OS}" in
    bsd|mac) unixts="$(TZ=UTC stat -f '%m' "${_ref}")";;
    *)       unixts="$(TZ=UTC stat --format '%Y' "${_ref}")";;
  esac

  # Add code signature
  for file in "$@"; do
    echo "Code signing: '${file}'"
    # Requires: osslsigncode 2.2+
    # -ts 'https://freetsa.org/tsr'
    "$(dirname "$0")/osslsigncode-local" sign \
      -h sha512 \
      -in "${file}" -out "${file}-signed" \
      -st "${unixts}" \
      -pkcs12 "${SIGN_CODE_KEY}" -readpass /dev/stdin <<EOF
${SIGN_CODE_KEY_PASS:-}
EOF
  # # Create a detached code signature:
  # "$(dirname "$0")/osslsigncode-local" extract-signature \
  #   -in  "${file}-signed" \
  #   -out "${file}.p7"
    cp -f "${file}-signed" "${file}"
    rm -f "${file}-signed"
  done
fi
