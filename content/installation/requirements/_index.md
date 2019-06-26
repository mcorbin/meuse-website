---
title: Requirements
weight: 10
disableToc: false
---

## PostgreSQL

Meuse uses PostgreSQL. I run the tests using the version `11.4`, but Meuse may work with older versions.

Then, you should initialize the database with the SQL script available [on github](https://github.com/mcorbin/meuse/blob/master/dev/resources/sql/schema.sql).

You can also run the [postgres.sh](https://github.com/mcorbin/meuse/blob/master/postgres.sh) which will launch a PostgreSQL Docker container with the schema already configured. Of course, don't use that in production ;)

## Java

Meuse is written in [Clojure](https://clojure.org/), you will then need Java on your computer/server to be able to run the jar.

## Crate index

As described in the Rust [registries documentation](https://doc.rust-lang.org/nightly/cargo/reference/registries.html), the crates metadata are stored in a Git repository.

This repository and the `git` command should be available in the machine running Meuse. The Meuse user should also be allowed to run git commands (push for example). You should for example add your SSH key in the SSH agent.
