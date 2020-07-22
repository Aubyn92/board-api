class Comment < ApplicationRecord
    validates :username, presence: true
    validates :comment, presence: true
end
