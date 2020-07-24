class Comment < ApplicationRecord
    validates :author, presence: true
    validates :body, presence: true
    belong_to :user
    belongs_to :post
end
