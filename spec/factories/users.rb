FactoryBot.define do
  factory :user do
    nickname              {"TAKADA"}
    email                 {"test@email"}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    birthday              {"1997-06-13"}
    family_name_c         {"高田"}
    first_name_c          {"悠真"}
    family_name_k         {"タカダ"}
    first_name_k          {"ユウマ"}
  end
end

