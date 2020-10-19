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
| birthday          | date       | null: false |


### Association
- has_many :products
- has_many :comments
- has_one  :credit_card
- has_one  :sending_address



## itemsテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| explanation   | text       | null: false                    |
| category_id   | integer    | null: false                    |
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



## sending_addressテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_cord     | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| home_number   | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| user_id       | references | null: false, foreign_key: true |

### Association
- belongs_to :user



## purchasesテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user_id       | date       | null: false                    |
| item_id       | integer    | null: false                    |

### Association
- belongs_to :user
- belongs_to :item