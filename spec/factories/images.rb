FactoryBot.define do

  factory :image do
    image   {File.open("#{Rails.root}/spec/fixtures/image.jpg")}
    item_id {1}
  end
end 
