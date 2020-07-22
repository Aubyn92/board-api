class Comment < ApplicationRecord
    validates :username, presence: true
    validates :comment, presence: true
    belongs_to :post_comments
    belong_to :user
    belongs_to :post
end
