class Post < ApplicationRecord
    validates :title, presence: true  
    validates :title, length: { maximum: 35, minimum: 8 }
    # validates :image_url, presence: true
    validates :description, presence: true
    has_many :post_tags
    has_many :tags, through: :post_tags
    belongs_to :user
end
