class Comment < ApplicationRecord
    validates :commenter, presence: true
    validates :body, presence: true
    belongs_to :post
    # belongs_to :commenter
    belongs_to :user
end
