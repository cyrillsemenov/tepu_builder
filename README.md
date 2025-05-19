# Alpine Builder Image

This container builds embedded C/C++ projects with Clang and GCC for ARM on Alpine Linux.

The environment is tested, so it is safe to use the `latest` tag.

## What's Included

- `build-base`: Essential build tools (`binutils`, `gcc` for the host, `make`, etc.)
- `clang`: Version 19.x of the Clang C/C++ compiler
- `gcc-arm-none-eabi`: GCC toolchain for ARM Cortex-M and Cortex-R processors (includes `binutils-arm-none-eabi` and `newlib-arm-none-eabi`)
- `argp-standalone`: A standalone version of the `argp` argument parsing library
- `git`: For version control operations

## Usage

Assumes a `Makefile` is present in your project root:

```bash
docker run --rm -v "$PWD":/workspace ghcr.io/cyrillsemenov/tepu_builder:latest
```

You can override `DEBUG` or `COMPILER` env vars:

```bash
docker run --rm -v "$PWD":/workspace -e DEBUG=0 -e COMPILER=gcc ghcr.io/cyrillsemenov/tepu_builder:latest
```

You can override options and target:

```bash
docker run --rm -v "$PWD":/workspace ghcr.io/cyrillsemenov/tepu_builder:latest --dry-run uf2
```

## Local Build

```bash
docker build -t tepu_builder .
# Or build using buildx to build for another platform
docker buildx build --platform linux/amd64 -t my-builder .
```
