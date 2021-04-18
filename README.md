#テーブル設計

##users テーブル

| Column               | Type    | Options                   |
| -------------------- | --------| --------------------------|
| nick_mame            | string  | null: false               |
| email                | string  | null: false, unique: true |
| encrypted_password   | string  | null: false               |
| first_name           | string  | null: false               |
| second_name          | string  | null: false               |
| first_name(kana)     | string  | null: false               |
| second_name(kana)    | string  | null: false               |
| birthday             | date    | null: false               |


### Association

- has_many :items
- has_many :buys

##items テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| item_name            | string     | null: false                    |
| item_manual          | text       | null: false                    |
| category_id          | integer    | null: false                    |
| item_condition_id    | integer    | null: false                    |
| send_money_burden_id | integer    | null: false                    |
| send_area_id         | integer    | null: false                    |
| send_days_id         | integer    | null: false                    |
| price                | integer    | null: false                    |
| user                 | references | null: false, foreign_key: true |

### Association

- belong_to :user
- has_one   :buy

##buys テーブル

| Column            | Type       | Options                        |
| ------------------| ---------- | ------------------------------ |
| user              | references | null: false, foreign_key: true |
| item              | references | null: false, foreign_key: true |

### Association

- belong_to :user
- belong_to :item
- has_one   :send

##sends テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| send_area_id   | integer    | null: false                    |
| city_town      | string     | null: false                    |
| address        | string     | null: false                    |
| building_name  | string     |                                |
| tell_number    | string     | null: false                    |
| buy            | references | null: false, foreign_key: true |


### Association

- belong_to :buy
