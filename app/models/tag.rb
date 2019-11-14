class Tag < ApplicationRecord
    has_many :post_tags
    has_many :posts, through: :post_tags

    def count_tag
        PostTag.group(:tag_id).order('tag_id DESC').limit(3).count
    end 
    


end 
