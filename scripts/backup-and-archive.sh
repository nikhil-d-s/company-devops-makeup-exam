#!/usr/bin/env bash
set -euo pipefail

PROJECT_DIR="${1:-company-devops-platform}"
BACKUP_DIR="${PROJECT_DIR}/backup"
STAMP="$(date +%Y%m%d%H%M%S)"

mkdir -p "${BACKUP_DIR}"
for file in "${PROJECT_DIR}/configs/deployment.yaml" "${PROJECT_DIR}/configs/pipeline.yaml" "${PROJECT_DIR}/configs/security.conf"; do
  base_name="$(basename "${file}")"
  case "${file}" in
    *.yaml|*.yml)
      cp "${file}" "${BACKUP_DIR}/${base_name%.*}-${STAMP}.${base_name##*.}"
      ;;
    *.conf)
      cp "${file}" "${BACKUP_DIR}/${base_name%.*}-${STAMP}.${base_name##*.}"
      ;;
    *)
      cp "${file}" "${BACKUP_DIR}/${base_name}-${STAMP}"
      ;;
  esac
done
tar -czf "${PROJECT_DIR}/company-devops-platform-${STAMP}.tar.gz" -C "$(dirname "${PROJECT_DIR}")" "$(basename "${PROJECT_DIR}")"
