# SonarCloud

## What
[SonarCloud](https://sonarcloud.io/) is a cloud-based code analysis service designed to detect code quality issues in 25 different programming languages, continuously ensuring the maintainability, reliability and security of your code.


## Why
Helps us to assess the quality and security of our code in an easy way. It detects code smells, bugs and vulnerabilities.

## How
A `.sonar-project.properties` file is required when you add a project in SonarCloud web UI with these two values:

``` title=".sonar-project.properties"
sonar.projectKey=rog-golang-buddies_golang-template-repository
sonar.organization=rog-golang-buddies
```

You can check the file [here](https://github.com/rog-golang-buddies/golang-template-repository/blob/main/sonar-project.properties) and view the results in each PR as shown in the image below.

![sonarcloud-test](img/sonarcloud-passed.png)

## CI setup

The workflow that will execute the process is .github/workflows/sonarcloud.yml which is located [here](https://github.com/rog-golang-buddies/golang-template-repository/blob/main/.github/workflows/sonarcloud.yml)
!!! summary

    PO will need to add a GITHUB token and a SONAR_PROJECT_KEY name in github secrets, the SONAR_PROJECT_KEY is the key that sonarcloud provides you. Remember that SONAR_TOKEN is an organization variable, you do not need to add it.


![gh-secrets](img/gh-secrets.png)


## Local setup

There is the possibility to use [SonarLint](https://www.sonarlint.org/) locally as an extension but for the moment golang is not one of the supported languages.
