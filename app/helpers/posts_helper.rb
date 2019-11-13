module PostsHelper
    def current_post
        Post.find_by(id: params[:post_id])
    end 
    
end
