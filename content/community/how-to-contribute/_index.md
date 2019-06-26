---
title: How to contribute
weight: 5
disableToc: false
---

## How to contribute

### Test the project

Try to use the project, break things, and open issues on [Github](https://github.com/mcorbin/meuse).

Also, If you have ideas for Meuse, feel free to open issues ;)

### Write code

You can open pull request on the Github project.

Meuse is written in [Clojure](https://clojure.org/). I use the [Mount](https://github.com/tolitius/mount) library for my `reloaded` workflow, you can start or stop the application from the REPL by using the `user` namespace in `dev/user.clj`.

You can launch the tests with `lein test`, and the integration tests with `lein test :integration`. You will need a running PostgreSQL database for the tests (you can launch it using Docker with the `postgres.sh` script).

`lein with-profile dev cloverage` will show you the test coverage of the project. `cloverage` does not run the integration tests, that's why the `meuse.http` namespace does not have a high score.
