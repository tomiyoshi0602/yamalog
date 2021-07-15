# アプリケーション名
yamalog

# 概要
ハイキングの記録を残し共有することができるアプリケーションです。
画像・山の名前・地域・日程・所要時間・コース名・コース詳細・感想を記録し、保存します。
山の名前か地域で投稿を検索することができ、他ユーザーの投稿詳細を参考に、ハイキングの計画を立てる参考にすることができます。
また、投稿の詳細ページで他のユーザーの投稿にいいね！のアクションと、コメントの投稿をすることで、ユーザー間でコミュニケーションをとることができます。
ユーザー詳細ページへ遷移することで、そのユーザーの全ての投稿を閲覧することができます。
						
# 本番環境(デプロイ先　テストアカウント＆ID)
https://yamalog.herokuapp.com/

### ログイン情報（テスト用）
- Eメール:test@com
- パスワード:test1234

# 制作背景(意図)						
趣味でよく行くハイキングの記録を残すとともに、他ユーザーの記録を参考にハイキングの計画を立てる際に役に立つアプリケーションが欲しいと思い、このアプリケーションを企画しました。
必須の入力項目を山の名前・地域・日程と最低限のものにし、今までにハイキングの記録をつけたことがない人でも気軽にはじめられるサービスにしました。

# 工夫したポイント
- 投稿を元にハイキングの計画を立てる際のユーザーの利便性を考え、投稿の検索が「山の名前」だけでなく「地域」でも検索できるように実装しました。その際、新規投稿時に使っていた「地域」のActiveHushを活用するために、ransackというGemを使用しました。
- ユーザー同士の気軽なコミュニケーションを創出するため、いいね！機能を中間テーブルを用いて作成しました。		
- 新規投稿作成時のユーザーの利便性を考え、投稿作成中に画像にプレビューが表示されるようにJavaScriptを使用して実装しました。

# 使用技術(開発環境)
## バックエンド
Ruby, Ruby on Rails

## フロントエンド
HTML, CSS, JavaScript

## データベース
MySQL, SequelPro

## クラウドストレージ
Amazon S3

## アプリケーションサーバ(本番環境)
heroku

## ソース管理
GitHub, GitHubDesktop

## テスト
RSpec

## エディタ
VSCode

# 課題や今後実装したい機能
- ハイキングの画像を複数枚投稿でき、その都度プレビューが表示されるように実装
- 写真にカーソルを当てると写真が全画面表示されるよう実装						
# DB設計
## usersテーブル

|Column  |Type  |Option    |
|--------|------|----------|
|name    |string|null:false|
|email   |string|null:false|
|password|string|null:false|

### Association

- has_many :posts
- has_many :comments
- has_many :likes

## postsテーブル

|Column      |Type   |Option    |
|------------|-------|----------|
|name        |string |null:false|
|area_id     |integer|null:false|
|hiking_date |date   |          |
|time        |string |          |
|route_name  |string |          |
|route_detail|text   |          |
|comment     |text   |          |

### Association

- belongs_to :user
- has_many :comments
- has_many :likes

## commentsテーブル

|Column|Type      |Option                       |
|------|----------|-----------------------------|
|text  |test      |null:false                   |
|user  |references|null:false, foreign_key: true|
|post  |references|null:false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :post

## Likesテーブル

|Column|Type      |Option                       |
|------|----------|-----------------------------|
|user  |references|null:false, foreign_key: true|
|post  |references|null:false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :post

