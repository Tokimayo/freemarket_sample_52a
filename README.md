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
|postal_code|integer|
|prefectures|string|
|municipalities|string|
|address|integer|
|building_name|string|
|phone_number|integer|
|birthday|integer|
|introduction|string|

### Association
- has_many :products
- has_many :comments


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
|address|integer|null: false|
|building_name|string|
|phone_number|integer|

### Association


## productsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, add_index|
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
- has_many :images
- has_many :comments
- has_many :large_categories, through: :products_large_categories
- has_many :middle_categories, through: :products_middle_categories
- has_many :small_categories, through: :products_small_categories


## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|product_id|integer|null: false|
|image|text|null: false|

### Association
- belongs_to :product


## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|product_id|integer|null: false|
|body|text|null: false|

### Association
- belongs_to :user
- belongs_to :product


## large_categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :brands, through: :large_categories_brands
- has_many :middle_categories, through: :large_categories_middle_categories


## middle_categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :large_categories, through: :large_categories_middle_categories
- has_many :small_categories, through: :middle_categories_small_categories


## small_categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :middle_categories, through: :middle_categories_small_categories


## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :large_categories, through: :large_categories_brands


## newsテーブル

|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|body|text|null: false|

### Association


## products_large_categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|product_id|integer|null: false, foreign_key: true|
|large_category_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :product
- belongs_to :large_category


## products_middle_categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|product_id|integer|null: false, foreign_key: true|
|middle_category_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :product
- belongs_to :middle_category


## products_small_categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|product_id|integer|null: false, foreign_key: true|
|small_category_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :product
- belongs_to :small_category


## large_categories_brandsテーブル

|Column|Type|Options|
|------|----|-------|
|large_category_id|integer|null: false, foreign_key: true|
|brand_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :large_category
- belongs_to :brand


## large_categories_middle_categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|large_category_id|integer|null: false, foreign_key: true|
|middle_category_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :large_category
- belongs_to :middle_category


## middle_categories_small_categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|middle_category_id|integer|null: false, foreign_key: true|
|small_category_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :middle_category
- belongs_to :small_category