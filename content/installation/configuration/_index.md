---
title: Configuration
weight: 20
disableToc: false
---

## Configure Meuse

Meuse is configured through a YAML file. Here is a commented example of a Meuse configuration:

```yaml
# The PostgreSQL database configuration
database:
  # The database user
  user: "meuse"
  # The database password
  password: "meuse"
  # The database connection string
  subname: "//127.0.0.1:5432/meuse"

# The HTTP server configuration
http:
  # the IP address of the HTTP server
  address: 127.0.0.1
  # the port of the HTTP server
  port: 8855

# The logging configuration
# Meuse uses the unilog library for logging, you can check
# its doc for the configuration options:
# https://github.com/pyr/unilog/
logging:
  level: debug
  console: true
  overrides:
    com.mchange.v2.c3p0: error

# The configuration of your Git index
metadata:
  # The local path of your Git index
  path: "/home/mathieu/prog/rust/testregistry"
  # The branch which will contain the metadata files
  target: "origin/master"
  # The URL of your Git index.
  url: "https://github.com/mcorbin/testregistry"

# The crate binary files configuration
crate:
  # The local path of your crate files
  path: "/home/mathieu/prog/rust/crates"
```

## Configure Cargo

### .cargo/config

In `.cargo/config`, you should configure the URL of your registry index. For example:

```
[registries.custom]
index = "https://github.com/mcorbin/testregistry.git"
```

### Index configuration

The index should also contain a `config.json` file which should contain the URL of the Meuse API as described in the Cargo [registries documentation](https://doc.rust-lang.org/nightly/cargo/reference/registries.html)), for example:

```
{
    "dl": "http://localhost:8855/api/v1/crates",
    "api": "http://localhost:8855",
    "allowed-registries": ["https://github.com/rust-lang/crates.io-index"]
}
```
If missing, the `allowed-registries` value will be the value specified in the `metadata.url` key in Meuse configuration.

### Token configuration

You should also configure a token to be able to interact with Meuse from Cargo in the `.cargo/credentials` file:

```
[registries.custom]
token = "<your token>"
```

You can find how to create a token in the `API` documentation.

## Root user configuration

In order to use Meuse, you need to create a first `admin` user. The only way to create this user currently is by inserting it directly into the database ¯\_(ツ)_/¯

Passwords are encrypted using bcrypt. You can generate a password by running the Meuse jar with the `password` subcommand, for example:

```
java -jar meuse.jar password do_not_use_this_password
12:15:23.793 [main] INFO meuse.core - your password is: $2a$11$PN29HCYWPjcHbC4cyLSrReMb2UKNGAAWMlaxEeMNNCVGz3pk/rNee
```

Then, insert a new `admin` user using this password in the database:

```
INSERT INTO users(id, name, password, description, active, role_id)
VALUES ('f3e6888e-97f9-11e9-ae4e-ef296f05cd17', 'root_user', '$2a$11$PN29HCYWPjcHbC4cyLSrReMb2UKNGAAWMlaxEeMNNCVGz3pk/rNee', 'my root user', true, '867428a0-69ba-11e9-a674-9f6c32022150');
```
