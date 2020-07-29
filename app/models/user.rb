class User < ApplicationRecord
    validates :email, presence: true, uniqueness: true 
    has_many :posts 
    has_secure_password
    has_many :comments
end
