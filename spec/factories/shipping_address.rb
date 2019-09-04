FactoryBot.define do

  factory :shipping_address do
    user
    user_id               {"1"}
    first_name            {"浩輝"}
    family_name           {"山本"}
    first_name_kana       {"ヒロキ"}
    family_name_kana      {"ヤマモト"}
    postal_code           {"123-0045"}
    prefectures           {"東京都"}
    municipalities        {"渋谷区道玄坂"}
    street_number         {"2-25-12"}
  end

end