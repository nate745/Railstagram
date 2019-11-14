class TagsController < ApplicationController

    def index
        @tags = Tag.search(params[:search])
    end

    def show
        
    end

    private
     
    def tag_params
        params.require(:tag).permit(:name, :search)
    end
end
