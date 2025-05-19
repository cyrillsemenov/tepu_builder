# Alpine Builder Image

This container builds embedded C/C++ projects with Clang and GCC for ARM on Alpine Linux.

The environment is tested, so it is safe to use the `latest` tag.

## What's Included

- `build-base` (`binutils`, `gcc`, `make`, etc.)
- `clang19`
- `gcc-arm-none-eabi` (with `binutils-...` and `newlib-...`)
- `argp-standalone`

## Usage

Assumes a `Makefile` is present in your project root:

```bash
docker run --rm -v "$PWD":/workspace ghcr.io/cyrillsemenov/tepu_builder:latest
```

You can override `DEBUG` or `COMPILER` env vars:

```bash
docker run --rm -v "$PWD":/workspace -e DEBUG=0 -e COMPILER=gcc ghcr.io/cyrillsemenov/tepu_builder:latest
```

## Local Build

```bash
docker build -t tepu_builder .
# Or build using buildx to build for another platform
docker buildx build --platform linux/amd64 -t my-builder .
```
