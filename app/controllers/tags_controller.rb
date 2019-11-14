class TagsController < ApplicationController

    def index
        @tags = Tag.search(params[:search])
    end

    def new
        @tag = Tag.new
    end

    def show
        
    end

    def destroy
        @tag.delete
        redirect_to new_post_path
    end

    private
     
    def tag_params
        params.require(:tag).permit(:name, :search)
    end
end
