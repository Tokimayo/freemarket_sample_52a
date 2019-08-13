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
|postal_code|integer|
|prefectures|string|
|municipalities|string|
|address|integer|
|building_name|string|
|phone_number|integer|
|birthday|integer|
|introduction|string|

### Association
- has_many :items
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
- has_many :images
- has_many :comments
- has_many :l_categories, through: :items_l_categories
- has_many :m_categories, through: :items_m_categories
- has_many :s_categories, through: :items_s_categories


## imagesテーブル

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


## l_categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :brands, through: :l_categories_brands
- has_many :m_categories, through: :l_categories_m_categories


## m_categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :l_categories, through: :l_categories_m_categories
- has_many :s_categories, through: :m_categories_s_categories


## s_categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :m_categories, through: :m_categories_s_categories


## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :l_categories, through: :l_categories_brands


## newsテーブル

|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|body|text|null: false|

### Association


## items_l_categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|item|references|null: false, foreign_key: true|
|l_category|references|null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :l_category


## items_m_categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|item|references|null: false, foreign_key: true|
|m_category|references|null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :m_category


## items_s_categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|item|references|null: false, foreign_key: true|
|s_category|references|null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :s_category


## l_categories_brandsテーブル

|Column|Type|Options|
|------|----|-------|
|l_category|references|null: false, foreign_key: true|
|brand|references|null: false, foreign_key: true|

### Association
- belongs_to :large_category
- belongs_to :brand


## l_categories_m_categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|l_category|references|null: false, foreign_key: true|
|m_category|references|null: false, foreign_key: true|

### Association
- belongs_to :l_category
- belongs_to :m_category


## m_categories_s_categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|m_category|references|null: false, foreign_key: true|
|s_category|references|null: false, foreign_key: true|

### Association
- belongs_to :m_category
- belongs_to :s_category