---
title: User and role
weight: 10
disableToc: false
---

## Roles

In Meuse, an user one (and only one) role assigned to it. Only 2 roles exists, and it's not possible to create new roles:

- `admin`: An admin can do anything (except creating tokens for another user).
- `tech`: A tech cannot:
  * create users
  * delete users
  * delete tokens for another users
  * create new categories

## Users

**Create a new user**

- **POST** /api/v1/meuse/user

| Field | Type | Description |
| ------ | ----------- | ----------- |
| active    | boolean | Initial status of the user. |
| description | string | The description of the user. |
| name    | string | The user name. |
| password | string | The user password. It should have at least 8 characters. |
| role    |  string | The user role. Should be `admin` or `tech` |

```
 curl --header "Content-Type: application/json"  --request POST \
-H "Authorization: HhqLVFVvTzi+sY0ewvjnVwWnbPmdTOTOZoDJniBVDoJoDWxxU1tvqa0sASWGGorMjJY=" \
--data '{"active":true,"description":"new user","name":"newuser","password":"securepassword","role":"tech"}' \
 localhost:8855/api/v1/meuse/user

{"ok":true}
```

**Delete an user**

- **DELETE** /api/v1/meuse/user/`<user_name>`

```
 curl --header "Content-Type: application/json"  --request DELETE \
-H "Authorization: HhqLVFVvTzi+sY0ewvjnVwWnbPmdTOTOZoDJniBVDoJoDWxxU1tvqa0sASWGGorMjJY=" \
 localhost:8855/api/v1/meuse/user/newuser

{"ok":true}
```
