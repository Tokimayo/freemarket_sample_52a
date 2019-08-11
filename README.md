## usersテーブル

|Column|Type|Options|
|------|----|-------|
|first_name|string|null: false|
|family_name|string|null: false|
|first_name_kana|string|null: false|
|family_name_kana|string|null: false|
|email|string|null: false|
|encrypted_password|string|null: false|
|postal_code|integer|null: false|
|prefectures|string|null: false|
|municipalities|string|null: false|
|address|integer|null: false|
|building_name|string|
|phone_number|integer|
|birthday|integer|
|introduction|string|

### Association
- has_many :products


## productsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|image|text|null: false|
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
- has_many :categories, through: :products_categories


## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|major_divisions|string|null: false|
|middle_divisions|string|null: false|
|subdivision|string|null: false|

### Association
- has_many :products, through: :products_categories
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



## products_categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|product_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :product
- belongs_to :category


## categories_brandsテーブル

|Column|Type|Options|
|------|----|-------|
|category_id|integer|null: false, foreign_key: true|
|brand_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :category
- belongs_to :brand