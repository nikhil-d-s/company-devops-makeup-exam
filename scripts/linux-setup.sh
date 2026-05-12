#!/usr/bin/env bash
set -euo pipefail

PROJECT_DIR="company-devops-platform"

sudo mkdir -p "${PROJECT_DIR}"/{configs,deployments,policies,reports}
sudo groupadd -f developers
sudo groupadd -f operations
sudo useradd -m -s /bin/bash developer 2>/dev/null || true
sudo useradd -m -s /bin/bash tester 2>/dev/null || true
sudo useradd -m -s /bin/bash devopsadmin 2>/dev/null || true
sudo usermod -aG developers developer
sudo usermod -aG developers tester
sudo usermod -aG operations devopsadmin
sudo chown -R devopsadmin:operations "${PROJECT_DIR}"
sudo chmod -R 775 "${PROJECT_DIR}"
