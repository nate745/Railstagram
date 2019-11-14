class Post < ApplicationRecord
    belongs_to :user
    has_many :comments
    has_many :post_tags
    has_many :tags, through: :post_tags

    accepts_nested_attributes_for :comments

    validates :title, presence:true
    validates :image_url, presence:true
end
