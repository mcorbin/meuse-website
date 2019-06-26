---
title: Token
weight: 5
disableToc: false
---

## Tokens

**Create a new token**

- **POST** /api/v1/meuse/user

| Field | Type | Description |
| ------ | ----------- | ----------- |
| name    | string | The name of the token. |
| password | string | The user password. |
| user    | string | The user name. |
| validity | int | The token will be valid for `validity` days. |

```
curl --header "Content-Type: application/json" --request POST \
--data '{"name":"test_token","validity":10,"user":"root_user","password":"do_not_use_this_password"}' \
localhost:8855/api/v1/meuse/token

{"token":"HhqLVFVvTzi+sY0ewvjnVwWnbPmdTOTOZoDJniBVDoJoDWxxU1tvqa0sASWGGorMjJY="}
```

**Delete a token**

- **DELETE** /api/v1/meuse/token

| Field | Type | Description |
| ------ | ----------- | ----------- |
| name    | string | The name of the token. |
| user    | string | The user name. |

```
curl --header "Content-Type: application/json" --request DELETE \
-H "Authorization: HhqLVFVvTzi+sY0ewvjnVwWnbPmdTOTOZoDJniBVDoJoDWxxU1tvqa0sASWGGorMjJY=" \
--data '{"name":"test_token2","user":"root_user"}' \
localhost:8855/api/v1/meuse/token

{"ok":true}
```


