## users テーブル
| Column             | Type   | Options                        |
| ------------------ | ------ | -----------                    |
| nickname           | string | null: false                    |
| email              | string | null: false, unique: true      |
| encrypted_password | string | null: false                    |
| birthday           | date   | null: false                    |
| family_name_c      | string | null: false                    |
| first_name_c       | string | null: false                    |
| family_name_k      | string | null: false                    |
| first_name_k       | string | null: false                    |
### Association
- has_many :items
- has_many :buys

## items テーブル
| Column         | Type       | Options                        |
| -------------- | -----------| ------------------------------ |
| name           | string     | null: false                    |
| price          | integer    | null: false                    |   
| exp            | text       | null: false                    |
| category_id    | integer    | null: false                    |
| status_id      | integer    | null: false                    |
| fee_id         | integer    | null: false                    |
| prefecture_id  | integer    | null: false                    |
| days_id        | integer    | null: false                    |
| user           | references | null: false, foreign_key: true |
### Association
- belongs_to :user
- has_one :buy

## buy テーブル
| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |
### Association
- belongs_to :item
- belongs_to :user
- has_one :shipment


## shipment テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_num      | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| house_num     | string     | null: false                    |
| building      | string     |                                |
| tel           | string     | null: false                    |
| buy           | references | null: false, foreign_key: true |
### Association
- belongs_to :buy