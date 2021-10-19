FactoryBot.define do
  factory :shipment_address do
    post_num       {"123-4567"}
    prefecture_id  {23}
    city           {"名古屋"}
    house_num      {"1-23"}
    building       {"桜高"}
    tel            {"09012345678"}
    token          {"tok_abcdefghijk00000000000000000"}
  end
end
