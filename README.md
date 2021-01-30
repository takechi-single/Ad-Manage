# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :item
- has_many :manages
- has_many :plans, through: :items

## items テーブル

| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| name         | string | null: false |
| text         | string | null: false |
| price        | string | null: false |
| release_date | date   | null: false |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :user, optional: true
- has_many :plan
- has_many :manages

## plans テーブル

| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| when         | date   | null: false |
| where        | string | null: false |
| price        | string | null: false |
| target_id    | date   | null: false |
| media_id     | string | null: false |
| how_much     | string | null: false |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## manages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| profit  | string     |                                |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user


