class Comment < ApplicationRecord
    validates :commenter, presence: true
    validates :body, presence: true
    # made "belong_to :user into belongs_to :user"
    belongs_to :post
end
