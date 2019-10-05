FactoryBot.define do

  factory :item do
    id                    {Faker::Number.number(1)}
    name                  {"test"} 
    description           {"テスト用です"}
    price                 {1000}
    condition             {"新品、未使用"}
    shipping_charge       {"送料込み(出品者負担)"}
    delivery_method       {"らくらくメルカリ便"}
    delivery_source_area  {"北海道"}
    delivery_days         {"1~2日で発送"}
    brand_id              {1}
    size_id               {Faker::Number.number(1)}
    category_id           {Faker::Number.number(1)}
    user_id               {Faker::Number.number(1)}
    item_status           {1}
    images                {[FactoryBot.build(:image)]}
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
  end

end