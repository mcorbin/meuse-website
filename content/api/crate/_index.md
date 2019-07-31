---
title: Crate
weight: 5
disableToc: false
---

## The Cargo/Crate API

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

## The Meuse API

### List crates

- **GET** /api/v1/meuse/crate

An optional `category` can be passed in the url (for example `/api/v1/meuse/crate?category=system`) to return only crates which belong to a category.

```
curl --header "Content-Type: application/json" \
-H "Authorization: Y1B5TGx6Fevkfc/soqX2JsSh4lrME2kHy/+s10pMnT2lCaFaOF4MD9Dnso0x77rEgYY=" \
 localhost:8855/api/v1/meuse/crate

{
  "crates": [
    {
      "id": "85f38d54-31f1-4401-b00e-92ea032806da",
      "name": "test1",
      "versions": [
        {
          "version": "0.1.0",
          "description": null,
          "yanked": false,
          "created-at": "2019-07-30T21:20:58Z",
          "updated-at": "2019-07-30T21:20:58Z"
        }
      ]
    }
  ]
}
```

### Get a crate

- **GET** /api/v1/meuse/crate/`<crate_name>`

```
curl --header "Content-Type: application/json" \
-H "Authorization: Y1B5TGx6Fevkfc/soqX2JsSh4lrME2kHy/+s10pMnT2lCaFaOF4MD9Dnso0x77rEgYY=" \
localhost:8855/api/v1/meuse/crate/test1

{
  "id": "85f38d54-31f1-4401-b00e-92ea032806da",
  "name": "test1",
  "versions": [
    {
      "version": "0.1.0",
      "description": null,
      "yanked": false,
      "created-at": "2019-07-30T21:20:58Z",
      "updated-at": "2019-07-30T21:20:58Z"
    },
    {
      "version": "0.1.1",
      "description": null,
      "yanked": false,
      "created-at": "2019-07-30T21:24:00Z",
      "updated-at": "2019-07-30T21:24:00Z"
    }
  ],
  "categories": [
    {
      "id": "4e9cbfcd-4f7e-46f1-a3ff-c9af7cc57137",
      "name": "system",
      "description": "system category"
    }
  ]
}
```
