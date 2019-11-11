---
title: Mirroring
weight: 30
disableToc: false
---

Meuse is able to mirror `crates.io`. Crates files will be downloaded from `crates.io` and cached by Meuse it its crate store.

## Create a crates.io mirror

[This article](https://gmjosack.github.io/posts/dissecting-cratesio-minimum-mirror/) is a good start to understand how it's possible to mirror `crates.io`.

First, you should fork the [crates.io-index](https://github.com/rust-lang/crates.io-index) Github project.

Once it's done, you should clone it: `git clone git@github.com:mcorbin/crates.io-index.git`

Then, edit the `config.json` file in the repository, and replace the `dl` and `api` keys by the Meuse URLs. For example:

```json
{
    "dl": "http://localhost:8855/api/v1/mirror",
    "api": "http://localhost:8855"
}
```

Then, edit your `~/.cargo/config` file, and add your mirror in it:

```
[registries.mirror]
index = "https://github.com/mcorbin/crates.io-index"
```

Your mirror is now ready. You should now be able to use it in your `Cargo.toml` files, for example with:

```
libc = { version = "0.2.64", registry = "mirror" }
```

Here, the crate `libc` will be downloaded from Meuse.

## How it works

When Meuse receives requests on `/api/v1/mirror` to download crates, it will check if the crate file already exists in its store. If the file exists, Meuse will return it to the client.

If not, the request is forwarded to `crates.io`, Meuse will download the crate file, cache it in its store and then return it to the client.

![Cargo mirroring schema](/cargo_mirror1.jpg)


