class User < ApplicationRecord
    has_many :posts
    has_many :comments
    has_many :posts, through: :comments
    validates :email, presence: true, uniqueness: true
    validates :username, presence: true, uniqueness: true
end
