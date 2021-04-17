#テーブル設計

##users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| name       | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| profile    | text   | null: false |

### Association

- has_many :items
- has_many :buys

##items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| item_name        | text       | null: false                    |
| item_manual      | text       | null: false                    |
| cutegory         | string     | null: false                    |
| item_joutai      | string     | null: false                    |
| send_money_hutan | string     | null: false                    |
| send_tiiki       | string     | null: false                    |
| send_nissuu      | string     | null: false                    |
| kakaku           | string     | null: false                    |
| user             | references | null: false, foreign_key: true |
| buy              | references | null: false, foreign_key: true |

### Association

- belong_to :users
- belong_to :items

##buys テーブル

| Column            | Type       | Options                        |
| ------------------| ---------- | ------------------------------ |
| user_item_name    | string     | unique: true                   |
| user              | references | null: false, foreign_key: true |
| item              | references | null: false, foreign_key: true |
| send              | references | null: false, foreign_key: true |

### Association

- belong_to :users
- has_one   :items
- belong_to :sends

##sends テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| yuubin_number  | string     | null: false                    |
| from_town      | string     | null: false                    |
| from_mura      | string     | null: false                    |
| banti          | string     | null: false                    |
| tatemono_name  | string     | null: false                    |
| tell_number    | string     | null: false                    |
| buy            | references | null: false, foreign_key: true |


### Association

- has_one  :buys
