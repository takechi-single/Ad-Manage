# アプリ名
Ad-Manage

# 概要
広告を出稿することは、媒体・費用・広告費用対効果の管理が大変になります。<br>
そこで企業の広告担当者様が気軽に広告手稿の管理が出来き、尚且つROAS（広告費用対効果）を一目で確認出来きるよう作成しました。　　

# 本番環境
デプロイ先 : https://ad-manage.herokuapp.com/<br>
ID: takechi<br>
Pass: 9310

# 制作背景
■使用目的<br>
企業ので広告を出稿する際は、各商材の広告出稿を担当者が個別に管理して案件を進めて行くことも少なくありません。<br>
そこで社内の各担当者が社内で取り扱っている商材の広告出稿状況・売上状況を、気軽に社内間で共有出来るようにしました。<br>

■本アプリの使い方<br>
①ユーザー登録：初めてお使いになる方は、ヘッダー右上の「新規登録」項目から登録を行ってください。<br>
※尚、既に登録済みユーザーからログインも可能です。{メールアドレス：yamada@com, パスワード：yamada1111}<br>
↓<br>
②商材登録：商材一覧画面右上の「商材登録」項目から、商材登録を行ってください。<br>
↓<br>
③広告プラン作成：商材一覧画面の作成したい商材の「プラン作成」項目から、プラン作成を行ってください。<br>
↓<br>
④売上入力：材一覧画面の作成したい商材の「売上入力」項目から、売上入力を行ってください。<br>
↓<br>
上記一連作業により、各商材の下記広告出稿状況・売上状況画面に遷移でき進捗状況が確認できます。<br>
☆確認後、ログアウト処理をお願いします。<br>

<広告出稿状況画面>
![DEMO画像（広告出稿画面）](https://i.gyazo.com/e64cd1824440862d743c91429e23adb7.jpg)

<売上状況画面>
![DEMO画像（商材詳細）](https://i.gyazo.com/04ba41e5234b4639b496f4bad79112cf.jpg)

# 工夫した点
・広告手稿状況や売上を一目で把握出来るように、ー画面内で納めて、スクロールはできない使用にこだわりました。<br>
・グラフを状況確認画面に用いることで、各媒体に掛けた費用を簡単に可視化出来るようにしました。<br>
・どれだけ広告費用が売上に貢献しているかを瞬時に把握出来るよう、ROAS（広告費用対効果）をパーセントで表示しました。<br>
・ROASは広告費用と売上を入力することで、自動更新出来るようにしました。<br>
・担当者以外は商材・広告出稿・売上の修正・削除はできない仕様にしました。<br>

# 使用技術(開発環境)				
■バックエンド<br>
・Ruby,Ruby on rails,Javascript

■本番環境<br>
・heroku

■データベース<br>
・mysql2

■ソース管理<br>
・GitHub,GitHubDesktop

■テスト<br>
・RSpec

■エディタ<br>
・VSCode	

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
| out_date     | date   | null: false |
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


