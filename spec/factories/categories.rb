FactoryBot.define do

  factory :category do
    id                    {Faker::Number.number(1)}
    name                  {"tops"} 
    size_flag             {1}
    ancestry              {1/14}
  end
end