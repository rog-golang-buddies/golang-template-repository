# GoReleaser

## What

[GoReleaser](https://goreleaser.com/) builds Go binaries for several platforms. The goal is to simplify the build, release and publish steps while providing variant customization options for all steps.

## Why

Simplifies the build and packing process of your app's Go binaries.

## How

The entire release process can be customized through a `.goreleaser.yml` file. Once you set it up, every time you want to create a new release, all you need to do is create a git tag that conforms to [semantic versioning](https://goreleaser.com/limitations/semver/) and run `goreleaser release`.


## CI setup

!!! summary

    No configuration required.

GoReleaser is configured to run on the `main` branch and is executed via the release Github workflow in `.github/workflows/release.yml`.


!!! info

    Binaries are only created if a tag exists. This is controlled via [semantic-release](semantic-release.md).

## Local setup

The [quickstart](https://goreleaser.com/quick-start/) provides detailed steps to run GoReleaser locally.
