# company-devops-platform

This repository provides a DevOps security and delivery scaffold covering Linux administration, Git and GitHub workflow, CI/CD automation, SonarQube integration, and Open Policy Agent validation.

## Project Layout

- `configs/` - configuration manifests and deployment settings
- `deployments/` - environment-specific deployment manifests
- `policies/` - OPA and Conftest policy rules
- `reports/` - generated validation and quality reports
- `artifacts/` - build and deployment artifacts
- `scripts/` - automation helpers for Linux, Git, and recovery workflows
- `.github/workflows/` - GitHub Actions pipelines

## Branching Strategy

- `development` is the integration branch for active feature work.
- `staging` is used for release validation and pre-production checks.
- `production` is reserved for approved releases.

Recommended flow:

1. Commit feature work on a short-lived branch.
2. Merge into `development` after review and validation.
3. Promote to `staging` for final verification.
4. Merge into `production` for release.

## CI/CD Flow

The GitHub Actions workflows implement:

- Source checkout
- Build
- Test
- Security validation
- Deployment

The development workflow runs on pushes to `development`. A separate production workflow runs on pushes to `production` and can be wired to environment approvals.

## Linux Administration

The scripts in `scripts/linux-setup.sh` demonstrate how to create users, groups, file permissions, backups, timestamped file copies, process inspection, and archive creation on Linux.

## SonarQube

The repository includes `sonar-project.properties` for scanning shell scripts, YAML, and source files. Store quality gate outputs in `reports/sonarqube/`.

## OPA

The `policies/` directory contains separate rules for deployment, security, and container validation. Use OPA or Conftest to fail the pipeline when policies are violated.

## Local Setup Checklist

1. Create the GitHub repository `devops-cicd-security-platform`.
2. Initialize git in `company-devops-platform`.
3. Add the remote and push `development`, `staging`, and `production` branches.
4. Configure secrets such as `SONAR_TOKEN`, `KUBE_CONFIG_DATA`, and container registry credentials.

## Notes

The repository is a working scaffold. Commands that require root access, a Linux host, SonarQube, or GitHub authentication are documented in scripts and workflow files, but they must be executed in the appropriate environment.
