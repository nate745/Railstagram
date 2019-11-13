class CommentsController < ApplicationController
    include PostsHelper

    def new
    end 

    def create
        @comment = current_post.comments.new(comment_params)
        @comment.user = current_user
        if @comment.save
            flash[:success] = "You commented that post!"
            redirect_to post_path
        else
            p @comment.errors.full_messages
            flash[:alert] = "Check the comment form, something went horribly wrong."
            render new_comment_path
        end
    end

    def destroy
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        flash[:success] = "Comment deleted"
        redirect_to @comment
    end

private

    def comment_params
         params.require(:comment).permit(:description, :user_id, :post_id)
    end
    def find_post
        @post = Post.find(params[:id])
    end 

    
end 