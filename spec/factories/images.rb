FactoryBot.define do

  factory :image do
    image   {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/image.jpg'))}
    item_id {1}
  end
end 
