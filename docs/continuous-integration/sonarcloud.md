# sonarcloud

## What
[sonarcloud](https://sonarcloud.io/) is a cloud-based code analysis service designed to detect code quality issues in 25 different programming languages, continuously ensuring the maintainability, reliability and security of your code.


## Why
Helps us to assess the quality and security of our code in an easy way. It detects code smells, bugs and vulnerabilities.

## How
A `.sonar-project.properties` file is required when you add a project in sonarcloud web ui with this two values:

``` title=".sonar-project.properties"
sonar.projectKey=rog-golang-buddies_golang-template-repository
sonar.organization=rog-golang-buddies
```

You can see the results in each PR

![sonarcloud-test](img/sonarcloud-passed.png)

## CI setup

!!! summary

    PO will need to add a github token and a sonarcloud token in github secrets, the last one is provided when register your repository in sonarcloud.


![gh-secrets](img/gh-secrets.png)


## Local setup

There is the possibility to use [SonarLint](https://www.sonarlint.org/) locally as an extension but for the moment golang is not one of the supported languages.
