FactoryBot.define do

  factory :user do
    id                    {Faker::Number.number(1)}
    nickname              {"yamamoto"}
    email                 {Faker::Internet.email}
    password              {"00000000"}
    password_confirmation {"00000000"}
    first_name            {"浩輝"}
    family_name           {"山本"}
    first_name_kana       {"ヒロキ"}
    family_name_kana      {"ヤマモト"}
    phone_number          {1234567890}
    birthday              {"1988,8,19"}
  end

end