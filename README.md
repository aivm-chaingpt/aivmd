# AIVMD (Public Releases Repository)

This repository is dedicated to hosting public releases for the AIVM CLI project. It is not intended to contain source code.

- Purpose: Publish release artifacts (binaries, checksums) and release notes.
- Source code lives in: https://github.com/aivm-chaingpt/aivm-cli
- Releases are created automatically by CI from the upstream repository.

## What you will find here

- GitHub Releases containing:
  - Prebuilt binaries for Linux and macOS (amd64/arm64)
  - SHA256 checksum file
  - Auto-generated release notes

## What you will NOT find here

- No source code
- No build scripts
- No issue tracking (please use the upstream repository)

## How releases are produced

Releases in this repository are published by the CI pipeline of the upstream `aivm-cli` project. The workflow attaches binaries and checksums and generates release notes automatically. Manual commits to this repository are generally not required.

## Filing issues / requests

Please open issues and feature requests in the upstream repository:

- Upstream: https://github.com/aivm-chaingpt/aivm-cli

## Contributions

Pull requests to this repository are not accepted because it only hosts release artifacts. To contribute to the project, submit PRs to the upstream repository instead.

