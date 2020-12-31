# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :room_users
- has_many :rooms, through: item_users
- has_many :advertising

## items テーブル

| Column    | Type   | Options     |
| --------- | ------ | ----------- |
| name      | string | null: false |
| text      | string | null: false |
| price     | string | null: false |
| release   | string | null: false |

### Association

- has_many :item_users
- has_many :users, through: item_users
- has_many :advertising
<<<<<<< Updated upstream
- has_many :customer
=======
>>>>>>> Stashed changes

## item_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

## advertising テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| media   | string     |                                |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :item
<<<<<<< Updated upstream
- belongs_to :user

## customers テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| age      | string | null: false |
| gender   | string | null: false |

### Association

- belongs_to :item
- belongs_to :advertising
=======
- belongs_to :user
>>>>>>> Stashed changes
