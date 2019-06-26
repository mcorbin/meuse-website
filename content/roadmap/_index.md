---
title: Roadmap
weight: 10
disableToc: false
---

## Roadmap

This is what I plan to do:

- More unit and integration tests. Currently, not everything is covered (especially Cargo commands).
- Fix [https://github.com/mcorbin/meuse/issues/3](https://github.com/mcorbin/meuse/issues/3).
- Refactor the test suite.
- New API calls:
  - Update an user.
  - Update user state (`active` or `inactive`).
  - Update a category description.
- HTTPS support for the HTTP server.
- TLS support for the PostgreSQL client.
- A tool to automatically import crates from `crates.io`, and maybe mirror `crates.io` in Meuse.
- A rework of the categories. For example, should we be able to delete categories (even if a crate already belongs to this category) ?
- A CLI.
