FactoryBot.define do
  factory :user do
    # email { "s@gmail.com" }
    sequence :email do |n|
      "testuser#{n}@test.com" 
    end
    username { "Sam" }
    password { "Purple1" }
  end
end
