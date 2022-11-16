#!/bin/bash
set -euo pipefail

for FILENAME in "${@}"
do
  FILENAME_SNIPPED="$(dirname "${FILENAME}")/$(basename "${FILENAME}" ".te")"
  echo "Handling file: ${FILENAME_SNIPPED}.mod"
  checkmodule -M -m -o "${FILENAME_SNIPPED}.mod" "${FILENAME_SNIPPED}.te"
  semodule_package -o "${FILENAME_SNIPPED}.pp" -m "${FILENAME_SNIPPED}.mod"
done
