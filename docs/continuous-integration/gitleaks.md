# gitleaks

## What

[gitleaks](https://github.com/zricethezav/gitleak) is a SAST tool for detecting and preventing hardcoded secrets like passwords, api keys, and tokens in git repos. Gitleaks is an easy-to-use, all-in-one solution for detecting secrets, past or present, in your code.

## Why

Raise security incidents early by detecting secret leaks and raising Github security code scanning alerts.

## How

The mechanism to detect secrets and protect (undo commit with a secret) is described [here](https://github.com/zricethezav/gitleaks#commands).

## CI setup

!!! summary

    No configuration required.


A `gitleaks detect` command is run via a gitleaks Github workflow in `.github/workflows/gitleaks.yml`.

!!! info

    The [gitleaks Github action](https://github.com/marketplace/actions/gitleaks) has a paid license restriction, therefore a custom workflow has been setup instead. It will fail the secret scan if secrets are detected and push alerts to Github security.

## Local setup

!!! done

    This is already configured for you via [pre-commit](pre-commit.md#local-setup).
