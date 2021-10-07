FactoryBot.define do
  factory :item do
    name                 {Faker::Name.name}
    price                {1000}
    exp                  {"いろはにほへと"}
    category_id          {2}
    status_id            {2}
    fee_id               {2}
    prefecture_id        {2}
    days_id              {2}
    # association          :user <-あるとエラーが出る

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
