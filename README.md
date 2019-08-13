## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|first_name|string|null: false|
|family_name|string|null: false|
|first_name_kana|string|null: false|
|family_name_kana|string|null: false|
|email|string|null: false, unique: true|
|encrypted_password|string|null: false|
|avator|text|
|phone_number|integer|
|birthday|integer|
|introduction|string|

### Association
- has_one :user_addresses, dependent: destroy
- has_one :shipping_addresses, dependent: destroy
- has_many :items, dependent: destroy
- has_many :comments, dependent: destroy


## user_addressesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|postal_code|integer|
|prefectures|string|
|municipalities|string|
|street_number|string|
|building_name|string|

### Association
- belongs_to :user


## shipping_addressesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|first_name|string|null: false|
|family_name|string|null: false|
|first_name_kana|string|null: false|
|family_name_kana|string|null: false|
|postal_code|integer|null: false|
|prefectures|string|null: false|
|municipalities|string|null: false|
|street_number|string|null: false|
|building_name|string|
|phone_number|integer|

### Association
- belongs_to :user

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|description|string|null: false|
|price|integer|null: false|
|brand_id|integer|
|size|string|
|condition|string|null: false|
|shipping_charge|string|
|delivery_method|string|null: false|
|delivery_source_area|string|null: false|
|estimated_shipping_date|string|null: false|
|evaluation|string|null: false|
|sold_out_flg|boolean|null: false|
|exhibitor_user_id|integer|null: false|
|buyer_user_id|integer|

### Association
- belongs_to :user
- has_many :item_images, dependent: destroy
- has_many :comments, dependent: destroy
- has_many :categories, through: :items_categories


## item_imagesテーブル

|Column|Type|Options|
|------|----|-------|
|item|references|null: false|
|image|text|null: false|

### Association
- belongs_to :item


## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null: false|
|item|references|null: false|
|body|text|null: false|

### Association
- belongs_to :user
- belongs_to :item


## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestory_path|string|null: false|


### Association
- has_many :brands, through: :categories_brands


## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :categories, through: :categories_brands


## newsテーブル

|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|body|text|null: false|

### Association


## items_categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|item|references|null: false, foreign_key: true|
|category|references|null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :category


## categories_brandsテーブル

|Column|Type|Options|
|------|----|-------|
|category|references|null: false, foreign_key: true|
|brand|references|null: false, foreign_key: true|

### Association
- belongs_to :category
- belongs_to :brand