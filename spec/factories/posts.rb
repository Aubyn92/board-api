FactoryBot.define do
  factory :post do
    sequence :title do |n| 
      "I love cooking no.#{n}" 
    end
    description { "My lovely wee Moroccan dish" }
    # image_url { "https://www.google.com/search?q=moroccan+dish&rlz=1C5CHFA_enAU907AU907&source=lnms&tbm=isch&sa=X&ved=2ahUKEwjz34iUjc7qAhVNVisKHTilCe8Q_AUoAXoECBAQAw&biw=705&bih=855" }
    association :user
    trait :invalid do
      title {nil}
    end
  end
end


