# golangci-lint

## What

[golangci-lint](https://golangci-lint.run/) is a Go linters aggregator. It runs linters in parallel, uses caching, supports yaml config, has integrations with all major IDE and has dozens of linters included.

## Why

Provides Secure Application Security Testing, error, style etc. checks for your codebase.

!!! tip

    See supported linters [here](https://golangci-lint.run/usage/linters).

## How

Linters can be configured via command-line options or  a [configuration file](https://golangci-lint.run/usage/configuration/#config-file).


## CI setup

!!! summary

    No configuration required.

`golangci-lint` will be executed via the pre-commit Github workflow in `.github/workflows/pre-commit.yml`.

## Local setup

!!! done

    This is already configured for you via [pre-commit](pre-commit.md#local-setup).

For custom configurations to modify how `golangci-lint` runs see the [configuration guide](https://golangci-lint.run/usage/configuration/).

You may want to disable linters that might be too strict (e.g: [exhaustivestruct](https://github.com/mbilski/exhaustivestruct)) or add some rules around how it should behave. This can be done via [linter configuration](https://golangci-lint.run/usage/linters/#linters-configuration).
