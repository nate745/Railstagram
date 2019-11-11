class PostsController < ApplicationController

    before_action :find_post, only: [:show, :edit, :update, :destroy]

    def index
        @posts = Post.all
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        if @post.valid?
            @post.save
            redirect_to @post
        else
            redirect_to new_post_path
        end
    end

    def show
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def post_params
        params.require(:post).permit(:image_url, :title, :user_id)
    end

    def find_post
        @post = Post.find(params[:id])
    end

end
