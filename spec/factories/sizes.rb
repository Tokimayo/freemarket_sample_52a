FactoryBot.define do

  factory :size do
    id                    {Faker::Number.number(1)}
    name                  {"S"}
    category_flag         {1}
  end
end 
