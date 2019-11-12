class User < ApplicationRecord
    has_secure_password
    has_many :posts
    has_many :comments

    validates :email, presence: true, uniqueness: true
    validates :username, presence: true, uniqueness: true
    def received_comments
        self.posts.each do |post|
            post.comment   
        end
    end 

    
end
