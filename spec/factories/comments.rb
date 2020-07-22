FactoryBot.define do
  factory :comment do
    username { "MyString" }
    comment { "MyText" }
    post_id { 1 }
  end
end
