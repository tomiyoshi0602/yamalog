# テーブル設計

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

