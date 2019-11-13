class CommentsController < ApplicationController

    def new
    end 

    def create
        @comment = @post.comments.build(comment_params)
        @comment.user_id = current_user.id
        if @comment.save
            flash[:success] = "You commented that post!"
            redirect_to post_path(@post)
        else
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