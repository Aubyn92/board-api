FactoryBot.define do
  factory :user do
    # sequence :email do |n|
    #   "testuser#{n}@test.com"
    # end
    
    username { "Sam" }
    email { "s@gmail.com" }
    password { "Purple1" }
  end
end
