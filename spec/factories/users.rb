FactoryBot.define do

  factory :user do
    id                    {"1"}
    nickname              {"yamamoto"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    first_name            {"浩輝"}
    family_name           {"山本"}
    first_name_kana       {"ヒロキ"}
    family_name_kana      {"ヤマモト"}
    phone_number          {"08012345678"}
    birthday              {"1988,8,19"}
  end

end