# README
## usersテーブル

| Column            | Type       | Options     |
| ----------------- | ---------- | ----------- |
| nickname          | string     | null: false |
| email             | string     | null: false |
| password          | string     | null: false |
| family_name_kanji | string     | null: false |
| first_name_kanji  | string     | null: false |
| family_name_kana  | string     | null: false |
| first_name_kana   | string     | null: false |
| birth_year        | integer    | null: false |
| birth_month       | integer    | null: false |
| birth_day         | integer    | null: false |

### Association
- has_many :products
- has_many :comments
- has_one  :credit_card
- has_one  :sending_address



## itemsテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| image         |            | ActiveStorage                  |
| item_name     | string     | null: false                    |
| explanation   | text       | null: false                    |
| category      | string     | null: false                    |
| brand         | string     | null: false                    |
| condition     | string     | null: false                    |
| area          | string     | null: false                    |
| shipment_term | string     | null: false                    |
| price         | integer    | null: false                    |
| shipment_fee  | integer    | null: false                    |
| user_id       | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :comments



## commentsテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | text       | null: false                    |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :product


## credit_cardテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| card_number      | integer    | null: false                    |
| expiration_month | integer    | null: false                    |
| expiration_year  | integer    | null: false                    |
| security_cord    | integer    | null: false                    |
| card_name        | text       | null: false                    |
| user_id          | references | null: false, foreign_key: true |


### Association
- belongs_to :user



## sending_addressテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| post_cord    | string     | null: false                    |
| prefecture   | text       | null: false                    |
| city         | text       | null: false                    |
| home_number  | text       | null: false                    |
| building     | text       | null: false                    |
| phone_number | integer    | null: false                    |
| user_id      | references | null: false, foreign_key: true |

### Association
- belongs_to :user