FactoryBot.define do
  factory :comment do
    username { "alivia" }
    comment { "what an excellent wee post this is" }
    post_id { 1 }
  end
end
