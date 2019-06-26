---
title: Crate
weight: 20
disableToc: false
---

## The Crate API

You can interact with Meuse using Cargo (exactly like `crates.io`).

The commands `cargo publish`, `cargo yank`, `cargo owner`, `cargo search` should work with Meuse.

Cargo can also fetches dependencies from Meuse if you configure the `registry` option for your dependency.

### Cargo publish

- The command will fail if a category does not exist.
- An `admin` or `tech` user can publish a `new` create. In that case, the user will automatically own the crate. If an user try to publish a new `version` of a crate without being an owner, the command will fail.

### Cargo yank

Only owners of a crate can use this command.

### Cargo owner

Only owners of a crate can add or remove an owner.
