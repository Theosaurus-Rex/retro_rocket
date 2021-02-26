FactoryBot.define do
  factory :listing do
    listing_title { "MyString" }
    listing_description { "MyText" }
    user { nil }
    price { "" }
    condition { "MyString" }
    category { nil }
  end
end
