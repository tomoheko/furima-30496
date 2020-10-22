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
- has_many :items
- has_many :comments
- has_many :purchases



## itemsテーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| explanation      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| shipment_term_id | integer    | null: false                    |
| price            | integer    | null: false                    |
| shipment_fee_id  | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many   :comments
- has_one    :purchase


## commentsテーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item



## sending_addressテーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_cord     | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| home_number   | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| purchase      | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase



## purchasesテーブル
| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has one    :sending_address
