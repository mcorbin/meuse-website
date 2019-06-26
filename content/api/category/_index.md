---
title: Category
weight: 15
disableToc: false
---

## Categories

**Create a new category**

- **POST** /api/v1/meuse/category

| Field | Type | Description |
| ------ | ----------- | ----------- |
| description | string | The description of the category. |
| name    | string | The category name. |


```
 curl --header "Content-Type: application/json"  --request POST \
-H "Authorization: HhqLVFVvTzi+sY0ewvjnVwWnbPmdTOTOZoDJniBVDoJoDWxxU1tvqa0sASWGGorMjJY=" \
--data '{"description":"email category","name":"email"}' \
 localhost:8855/api/v1/meuse/category

{"ok":true}
```
