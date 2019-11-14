class TagsController < ApplicationController

    def index
        @tags = Tag.all
    end

    def new
        @tag = Tag.new
    end

    def show
        @tag = Tag.find(params[:id])
    end

    def destroy
        @tag.delete
        redirect_to new_post_path
    end

    private
     
    def tag_params
        params.require(:tag).permit(:name)
    end
end
