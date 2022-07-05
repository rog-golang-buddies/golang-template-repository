# Quickstart

Provides the CI setup and local development instructions to optimally use this repository.

> 🚀 Instructions are distilled to get you started with the least amount of effort. Highly recommend reading background information for context in the provided links.


### Install developer tools

 ```bash
 pip install --user pre-commit commitizen mkdocs-material
 ```

- For background on `pre-commit` please see [pre-commit](continuous-integration/pre-commit.md) for further details.
- For background on `commitizen` please see [commitizen](continuous-integration/semantic-release.md#commitizen) for further details.
- For background on `mkdocs-material` please see [mkdocs-material](continuous-integration/mkdocs-material.md) for further details.


### Setup base release for [semantic-release](continuous-integration/semantic-release.md)

⚠️ This is a one time activity. If a tag already exists in the repository this step is not required. If no tags exist proceed to read the next section.

⚠️  Why is this required?

   Please see [Base release version](continuous-integration/semantic-release.md#base-release-version) documentation for rationale.


   ```bash
   # Within the `main` branch in your git repo
   git tag -a v0.1.0 -m "Pre-release"
   git push origin v0.1.0
   ```

### Documentation generation via [mkdocs-material](continuous-integration/mkdocs-material.md)


1. Enable `gh-pages` as per the [CI setup](continuous-integration/mkdocs-material.md#ci-setup) instructions.

2. Update `site_name` field in `./mkdocs.yml` file.

### Get template repository updates (optional)

Setup an additional remote to periodically get latest template repository updates.

```bash
git remote add template https://github.com/rog-golang-buddies/golang-template-repository.git
# Update
git fetch template
git merge template/[branch to merge]
```
