#テーブル設計

##users テーブル

| Column               | Type    | Options      |
| -------------------- | --------| ------------ |
| nick_mame            | string  | null: false  |
| mail                 | string  | unique: true |
| encrypted_password   | string  | null: false  |
| first_name           | string  | null: false  |
| second_name          | string  | null: false  |
| first_name(kana)     | string  | null: false  |
| second_name(kana)    | string  | null: false  |
| birthday_year        | integer | null: false  |
| birthday_moon        | integer | null: false  |
| birthday_th          | integer | null: false  |


### Association

- has_many :items
- has_many :buys

##items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| item_name        | string     | null: false                    |
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
- has_one   :buys

##buys テーブル

| Column            | Type       | Options                        |
| ------------------| ---------- | ------------------------------ |
| user              | references | null: false, foreign_key: true |
| item              | references | null: false, foreign_key: true |

### Association

- belong_to :users
- belong_to :items
- has_one   :sends

##sends テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| city_town      | string     | null: false                    |
| address        | string     | null: false                    |
| building_name  | string     | unique: true                   |
| tell_number    | string     | null: false                    |
| buy            | references | null: false, foreign_key: true |


### Association

- belong_to :buys
