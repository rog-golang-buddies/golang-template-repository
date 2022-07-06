# semantic-release

## What

[semantic-release](https://github.com/semantic-release/semantic-release) automates the whole package release workflow including determining the next version number, generating the release notes, and publishing the package.

semantic-release uses the commit messages to determine the consumer impact of changes in the codebase. Following formalized conventions for commit messages, `semantic-release` automatically determines the next semantic version number, generates a changelog and publishes the release.

## Why

Follow a well-established [commit message convention](https://github.com/angular/angular/blob/main/CONTRIBUTING.md#commit) that encourages your team to have structured commits and provides the controls via commits to automatically version your codebase & publish a release.


## How

### Commit message convention

The formalized convention is as follows for commit messages:

```
<type>(<scope>): <short summary>
  │       │             │
  │       │             └─⫸ Summary in present tense. Not capitalized. No period at the end.
  │       │
  │       └─⫸ Commit Scope: A scope MUST consist of a noun describing a section of the codebase surrounded by parenthesis
  │
  └─⫸ Commit Type: build|ci|docs|feat|fix|perf|refactor|test
```

### Example


| Commit message                                                                                                                                                                                   | Release type               |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------------------------- |
| `fix(pencil): stop graphite breaking when too much pressure applied`                                                                                                                             | Fix Release      |
| `feat(pencil): add 'graphiteWidth' option`                                                                                                                                                       | Feature Release  |
| `perf(pencil): remove graphiteWidth option`<br><br>`BREAKING CHANGE: The graphiteWidth option has been removed.`<br>`The default graphite width of 10mm is always used for performance reasons.` | Breaking Release <br /> (Note that the `BREAKING CHANGE: ` token must be in the footer of the commit) |


For a base version of `0.1.0`, the following will apply:

| Type                      | Release type example      | Notes                                                          |
|---------------------------|---------------------------|----------------------------------------------------------------|
| `fix`                     | increments to   `0.1.1`   |                                                                |
| `feat`                    | increments to   `0.1.0`   | Resets any existing patch fixes e.g:   `0.1.3` will be `0.2.0` |
| `BREAKING CHANGE` | Increments to `1.0.0`     | Can be added to any type                                                               |
| All others                | No version increment      |                                                                |


## CI setup

!!! warning

    This section covers important implications of setting up a base tag/release version (or lack of) in your repo before using `semantic-release`.

### Base release version

A semantic-release workflow is configured to run on the `main` branch and technically no further setup is required. However, the semantic-release initial version is set at `v1.0.0` (with pre-release options) instead of the generally accepted version `v0.1.0`. This may not be desirable for your project so a workaround is described below.

!!! info

    As per the semantic versioning [spec](https://semver.org/#how-should-i-deal-with-revisions-in-the-0yz-initial-development-phase), the initial development release should be `v0.1.0`. Optionally you can set it to `v0.0.0` if there is only an initial commit in the repo.


<u>In the Github repo page:</u>

1. Click on the **Create a new release** link on the right-hand panel

2. Click on **Choose a tag**, type in your base version (e.g: `v0.1.0`) and hit enter

3. Enter desired release title e.g: Pre-release

4. Tick **This is a pre-release** checkbox

5. Click the **Publish** button

If you don't want to create a release and the steps above are one too many, you can create a tag via the command line:

```bash
# Within the `main` branch in your git repo
git tag -a v0.1.0 -m "Pre-release"
git push origin v0.1.0
```

## Local setup

### Commitizen

Use [commitzen](https://commitizen-tools.github.io/commitizen/) to ease following the commit message convention described [above](semantic-release.md#how).

```
pip install -U commitizen
```

For more installtion options see [here](https://commitizen-tools.github.io/commitizen/#installation).

!!! info

    Stage some files in your repo and type `cz commit` and you're ready to go!


!!! tip

    Decide on the commit convention scope in advance. This will keep it consistent and provide a coherent semantic mapping.


## FAQ

1. I have many `feat` type commits to be added to `main` but I don't want to trigger a release

      For a Continous Deployment methodology, it is not uncommon to release small features frequently in isolation. This will undoubtedly increment your minor version but it is acceptable as it reflects the rapid changes in your project.

      Alternatively, if you wish to batch features to trigger a release here are some options:

      - **Release branch (recommended)**

        Create a release branch and merge multiple `feat` type commits to it. When the release branch is ready and merged to `main`, it will condense the numerous `feat` type commits to generate a singular increment in the release version/tag.

      - **Non-standard commit type**

        Use a custom commit type such as:

        ```bash
        # Feature no release (featnr) denotes a feature but is not release ready
        featnr(pencil): add 'graphiteWidth' option
        ```
