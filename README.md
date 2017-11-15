# gmathieu/node-browsers

This image includes Node and browsers headless testing (Firefox, Chrome).
Versions
It also includes the bare minimum to run on CircleCI 2.0 and common packages used for building/deployment (ex. `bash`, `curl`, `make`).

See `ENV` and `FROM` for specific Node and browser versions in the [Dockerfile](./Dockerfile).

## Testing locally

```sh
docker build -t gmathieu/node-browsers .
docker run --interactive --tty --cap-add=SYS_ADMIN --volume /path/to/local/repo:/percolate gmathieu/node-browsers /bin/bash
```

`--cap-add=SYS_ADMIN` is needed for Chrome to run with sandbox enabled.
Alternatively, you can launch Chrome with `--no-sandbox`.
