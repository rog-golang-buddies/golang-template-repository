# pre-commit

## What

[pre-commit](https://pre-commit.com/) is a wrapper for git hook scripts that are useful for identifying simple issues before submission to code review. Git hooks are run on every commit to automatically point out issues in code such as missing semicolons, trailing whitespace, and debug statements and integrate with a variety of third-party tooling.

## Why

Eliminates the effort of initializing and managing git hooks locally. `pre-commit` also integrates with a large range of (hooks)[https://pre-commit.com/hooks.html] enabling a consistent developer experience.

## How

A `.pre-commit-config.yaml` config file is configured with common and useful hoooks. This is available at the root of your repository. Each time you make a commit the pre-commit hooks run.  If a hook supports applying auto-fixes (e.g: hook `trailing-whitespace` support fixing trailing whitespaces), it will proceed to fix it.
Any detected failures will abort the commit.

!!! tip

    See supported hooks [here](https://pre-commit.com/hooks.html).

## CI setup

!!! summary

    No configuration required.

All hooks in `.pre-commit-config.yaml` will be executed via the automatic integration provided from [pre-commit ci](https://pre-commit.ci/).

`pre-commit ci` runs automatically on pull request commits.

### Auto fixing pull requests

If tools (configured in `.pre-commit-config.yaml`) make changes to files during a pull request, pre-commit.ci will automatically fix the pull request.

pre-commit.ci will run on all pull request commits, but will not push for commits made by bots.

The impact of this means developers will need to fetch the latest changes if further work must be done on the PR branch.

## Local setup

```bash
pip install -u pre-commit
```

For more installtion options see [here](https://commitizen-tools.github.io/commitizen/#installation).

Install the hooks configured in `.pre-commit-config.yaml`:

```bash
pre-commit install
```

Running against all files instead of only stages files:

```
pre-commit run --all-files
```

## FAQ

1. Do I have to run `pre-commit install` everytime I clone a repository?

    Yes. However, you can automatically enable `pre-commit` to run when you clone a repository via [this](https://pre-commit.com/#automatically-enabling-pre-commit-on-repositories) link.
