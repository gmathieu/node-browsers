# gmathieu/node-browsers

This image includes the latest version of Node LTS and specific versions of Firefox ESR and Chrome (see Dockerfile ARG).
It also includes the bare minimum to run on CircleCI 2.0 and common packages used for building/deployment (ex. `bash`, `curl`, `make`).

## Testing locally

```sh
docker build -t gmathieu/node-browsers .
docker run --interactive --tty --cap-add=SYS_ADMIN --volume /path/to/local/repo:/destination gmathieu/node-browsers /bin/bash
```

`--cap-add=SYS_ADMIN` is needed for Chrome to run with sandbox enabled.
Alternatively, you can launch Chrome with `--no-sandbox`.
