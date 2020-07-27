class Post < ApplicationRecord
    validates :title, presence: true  
    validates :description, presence: true
    has_many :post_tags
    has_many :tags, through: :post_tags
    belongs_to :user
    has_one_attached :image
    has_many :comments
    has_many :like
end
