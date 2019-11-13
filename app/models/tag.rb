class Tag < ApplicationRecord
    has_many :post_tags
    has_many :posts, through: :post_tags

    def most_popular
        most_popular = Post.group(:tag).limit(3).count
    end 

end 
