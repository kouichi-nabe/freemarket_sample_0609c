# usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|sring|null: false|
|point|integer|null: false, default: 0|
|sum_sales|integer|null: false, default: 0|
|email|sring|null: false|
|password|string|null: false|
|password_confirmation|string|null: false||



### Association
- has_many :user_reviews, dependent::destory
- has_many :likes, dependent::destory
- has_many :comments, dependent::destory
- has_many :items
- has_many :messages
- has_one :profile
- has_one :address


## profilesテーブル

|Column|Type|Options|
|------|----|-------|
|first_name|sring|null: false|
|last_name|sring|null: false|
|first_name_kana|sring|null: false|
|last_name_kana|sring|null: false|
|image|string|null: false|
|postalcode|string|
|prefecture|string|
|city|string|
|street_number|string|
|building|string|
|phone_number|string|
|self_introduction|text||


### Association
- belongs_to :user


## addressesテーブル

|Column|Type|Options|
|------|----|-------|
|post_code|string|null: false|
|prefecture|integer|null: false|
|municipality|sring|null: false|
|house_number|string|null: false|
|phone_number|integer|
|building_name|string||

### Association
- belongs_to :user



## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|descripton|text|null: false|
|seller_id|references|null: false, foreign_key: true|
|buyer_id|references|null: false, foreign_key: true|
|brand|string|
|categories_id|references|null: false, foreign_key: true|
|size|string|null: false|
|condition|integer|null: false|
|price|integer|null: false|
|postage|boolean|
|shipping_method|integer|null: false|
|region|integer|null: false|
|shipping_date|integer|null: false|
|receive_completed|boolean|

### Association
- belongs_to :seller, class_name "User"
- belongs_to :buyer, class_name "User"
- belongs_to :category
- belongs_to :brand
- has_many :images, dependent::destory
- has_many :likes, dependent::destory
- has_many :comments, dependent::destory



## likesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item



## user_reviewsテーブル

|Column|Type|Options|
|------|----|-------|
|rate|integer|null: false|
|user_id|references|null: false, foreign_key: true|
|text|text||

### Association
- belongs_to :user


## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|text|text|null: false|

### Association
- belong_to :item



## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|
|text|text|null: false|

### Association
- belongs_to :user
- belongs_to :item

## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|image|string|null: false|

### Association
- belongs_to :item


## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|parent_id|references|null: false, foreign_key: true|

### Association
- has_many :items
- has_many :brands
- belongs_to :parent, class_name: :Category, optional: true
- has_many :children, class_name: :Category, foregin_key::parent_id


## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|parent_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|

### Association
- has_many :items
- belongs_to :category
- belongs_to :parent, class_name: :Brand, optional: true
- has_many :children, class_name: :Brand, foregin_key::parent_id

## sns_credentialsテーブル

|Column|Type|Options|
|------|----|-------|
|provider|string|null: false|
|uid|string|null: false|